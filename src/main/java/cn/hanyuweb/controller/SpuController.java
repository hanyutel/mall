package cn.hanyuweb.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.hanyuweb.bean.T_MALL_PRODUCT;
import cn.hanyuweb.bean.T_MALL_PRODUCT_IMAGE;
import cn.hanyuweb.service.SpuService;
import cn.hanyuweb.utils.MyUploadUtil;

@Controller
public class SpuController {
	@Autowired
	private SpuService spuService;

	@RequestMapping("/do_spu_del")
	public ModelAndView do_spu_del(T_MALL_PRODUCT product){
		
		spuService.del_spu(product);
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("title", "商品信息查询");
		mv.addObject("url", "goto_spu_list.do");
		return mv;
	}
	@RequestMapping("/do_spu_update")
	public ModelAndView do_spu_update(T_MALL_PRODUCT product,@RequestParam("files") MultipartFile[] files){
		
		List<String> imageName=MyUploadUtil.uploadImages(files);
		spuService.updateSpu(product,imageName);
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("title", "商品信息查询");
		mv.addObject("url", "goto_spu_list.do");
		return mv;
	}
	@RequestMapping("/goto_spu_update/{id}")
	public String goto_spu_update(@PathVariable("id") Integer id,Map<String,Object> map){
		T_MALL_PRODUCT product=spuService.getProductById(id);
		List<T_MALL_PRODUCT_IMAGE> product_images=spuService.get_product_image_by_shp_id(id);
		map.put("product", product);
		map.put("product_images", product_images);
		return "spu/manager_spu_update";
	}
	@RequestMapping("/get_spu_list")
	public String get_spu_list(T_MALL_PRODUCT product,Map<String,Object> map){
		List<T_MALL_PRODUCT> product_list=spuService.getProduct(product);
		map.put("productList", product_list);
		return "spu/manager_spu_list_view";
	}
	@RequestMapping("/save_spu")
	public ModelAndView save_spu(T_MALL_PRODUCT product,@RequestParam("files") MultipartFile[] files){
		
		//上传图片，返回图片名
		List<String> imageName=MyUploadUtil.uploadImages(files);
		//插入商品表和图片表
		spuService.saveSpu(product,imageName);
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("title", "商品信息添加");
		mv.addObject("url", "goto_spu_add.do");
		return mv;
	}
	@RequestMapping("/goto_spu")
	public String goto_spu(){
		return "spu/manager_spu";
	}
	@RequestMapping("/goto_spu_add")
	public String goto_spu_add(){
		return "spu/manager_spu_add";
	}
	
	@RequestMapping("/goto_spu_list")
	public String goto_spu_list(){
		return "spu/manager_spu_list";
	}
	
}
