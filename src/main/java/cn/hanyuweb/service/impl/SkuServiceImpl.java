package cn.hanyuweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hanyuweb.bean.MODEL_T_SKU_ATTR_VALUE;
import cn.hanyuweb.bean.T_MALL_SKU;
import cn.hanyuweb.bean.T_MALL_SKU_ATTR_VALUE;
import cn.hanyuweb.mapper.SkuMapper;
import cn.hanyuweb.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService {
	@Autowired
	SkuMapper skuMapper;
	@Override
	public List<T_MALL_SKU> get_spu_by_pp_id(int pp_id, int class_2_id) {
		
		return skuMapper.select_spu_by_pp_id(pp_id,class_2_id);
	}
	@Override
	public void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE>  list) {
		skuMapper.insert_sku(sku);
		
		skuMapper.insert_sku_attr_value(sku.getId(),sku.getShp_id(),list);
		System.out.println();
	}

}
