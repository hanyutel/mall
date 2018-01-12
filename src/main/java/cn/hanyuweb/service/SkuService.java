package cn.hanyuweb.service;

import java.util.List;

import cn.hanyuweb.bean.MODEL_T_SKU_ATTR_VALUE;
import cn.hanyuweb.bean.T_MALL_SKU;
import cn.hanyuweb.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuService {

	List<T_MALL_SKU> get_spu_by_pp_id(int pp_id, int class_2_id);

	void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> list);

}
