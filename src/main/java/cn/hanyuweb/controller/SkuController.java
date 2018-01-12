package cn.hanyuweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.hanyuweb.bean.MODEL_T_SKU_ATTR_VALUE;
import cn.hanyuweb.bean.OBJECT_T_MALL_ATTR;
import cn.hanyuweb.bean.T_MALL_SKU;
import cn.hanyuweb.service.AttrService;
import cn.hanyuweb.service.SkuService;

@Controller
public class SkuController {
	@Autowired
	private AttrService attrService;
	@Autowired
	private SkuService skuService;
	@RequestMapping("/do_sku_save")
	public ModelAndView do_sku_save(T_MALL_SKU sku,MODEL_T_SKU_ATTR_VALUE mtsav){
		skuService.save_sku(sku,mtsav.getSku_value_list());
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("title", "商品信息查询");
		mv.addObject("url", "goto_sku_add.do");
		return mv;
	}
	@RequestMapping("/get_spu_list_sku")
	@ResponseBody
	public List<T_MALL_SKU> get_spu_list_sku(int pp_id,int class_2_id){
		List<T_MALL_SKU> list=skuService.get_spu_by_pp_id(pp_id,class_2_id);
		return list;
	}
	@RequestMapping("/get_attr_list_sku")
	public String get_attr_list_sku(int class_2_id,ModelMap map){
		List<OBJECT_T_MALL_ATTR> attr_list_by_class_2_id = attrService.get_attr_list_by_class_2_id(class_2_id);
		map.put("attr_list", attr_list_by_class_2_id);
		return "sku/manager_sku_add_inner";
	}
	@RequestMapping("/goto_sku")
	public String goto_sku(){
		return "sku/manager_sku";
	}
	@RequestMapping("/goto_sku_add")
	public String goto_sku_add(){
		return "sku/manager_sku_add";
	}
}
