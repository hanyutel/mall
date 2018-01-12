package cn.hanyuweb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hanyuweb.bean.T_MALL_PRODUCT;
import cn.hanyuweb.bean.T_MALL_PRODUCT_IMAGE;
import cn.hanyuweb.mapper.SpuMapper;
import cn.hanyuweb.service.SpuService;
import cn.hanyuweb.utils.MyUploadUtil;
@Service
public class SpuServiceImpl implements SpuService {
	@Autowired
	private SpuMapper spuMapper;
	@Override
	public void saveSpu(T_MALL_PRODUCT product, List<String> imageNames) {
		product.setShp_tp(imageNames.get(0));
		//保存商品信息
		spuMapper.insert_product(product);
		Map<Object,Object> paramMap = new HashMap<Object,Object>();
		
		paramMap.put("imageNames", imageNames);
		paramMap.put("shp_id", product.getId());
		
		spuMapper.insert_product_image(paramMap);
	}
	@Override
	public List<T_MALL_PRODUCT> getProduct(T_MALL_PRODUCT product) {
		List<T_MALL_PRODUCT> list=spuMapper.select_product(product);
		return list;
	}
	@Override
	public T_MALL_PRODUCT getProductById(Integer id) {
		return spuMapper.selectProductById(id);
	}
	@Override
	public List<T_MALL_PRODUCT_IMAGE> get_product_image_by_shp_id(Integer id) {
		return spuMapper.select_product_image_by_shp_id(id);
	}
	@Override
	public void updateSpu(T_MALL_PRODUCT product, List<String> imageNames) {
		if(imageNames.size()!=0){
			product.setShp_tp(imageNames.get(0));
			//保存商品信息
			spuMapper.update_product(product);
			Map<Object,Object> paramMap = new HashMap<Object,Object>();
			
			paramMap.put("imageNames", imageNames);
			paramMap.put("shp_id", product.getId());
//			spuMapper.delete_product_image_by_shp_id(product.getId());
			spuMapper.insert_product_image(paramMap);
		}else{
			spuMapper.update_product(product);
		}

	}
	@Override
	public void del_spu(T_MALL_PRODUCT product) {
		int shp_id=product.getId();
		List<String> shp_tp_list=spuMapper.get_spu_shp_tp_url(shp_id);
		for (String string : shp_tp_list) {
			MyUploadUtil.deleteImages(string);
		}
		spuMapper.delete_product_image_by_shp_id(shp_id);
		spuMapper.delete_product_by_shp_id(shp_id);
	}

}
