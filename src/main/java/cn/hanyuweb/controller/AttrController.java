package cn.hanyuweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.hanyuweb.bean.MODEL_T_MALL_ATTR;
import cn.hanyuweb.bean.OBJECT_T_MALL_ATTR;
import cn.hanyuweb.service.AttrService;

@Controller
public class AttrController {
	@Autowired
	private AttrService attrService;
	
	@RequestMapping("/do_attr_add")
	public ModelAndView do_attr_add(MODEL_T_MALL_ATTR attrs,int class_2_id,String class_2_name){
		attrService.save_attr(attrs.getAttr_list(),class_2_id);
		ModelAndView modelAndView=new ModelAndView("redirect:/goto_attr_add.do");
		modelAndView.addObject("class_2_id",class_2_id);
		modelAndView.addObject("class_2_name",class_2_name);
		return modelAndView;
	}
	@RequestMapping("/goto_attr_add")
	public String goto_attr_add(String class_2_id,String class_2_name,ModelMap map){
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		return "attr/manager_attr_add";
	}
	@RequestMapping("/goto_attr")
	public String goto_attr(){
		return "attr/manager_attr";
	}
	@RequestMapping("/select_attr_list")
	public String select_attr_list(int class_2_id,ModelMap map){
		List<OBJECT_T_MALL_ATTR> attr_list=attrService.get_attr_list_by_class_2_id(class_2_id);
		map.put("attrList", attr_list);
		return "attr/manager_attr_list";
	}
	@RequestMapping("/select_attr_list_json")
	@ResponseBody
	public List<OBJECT_T_MALL_ATTR> select_attr_list_json(int class_2_id,ModelMap map){
		List<OBJECT_T_MALL_ATTR> attr_list=attrService.get_attr_list_by_class_2_id(class_2_id);
		map.put("attrList", attr_list);
		return attr_list;
	}
}
