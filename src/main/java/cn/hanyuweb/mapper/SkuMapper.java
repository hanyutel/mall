package cn.hanyuweb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hanyuweb.bean.MODEL_T_SKU_ATTR_VALUE;
import cn.hanyuweb.bean.T_MALL_SKU;
import cn.hanyuweb.bean.T_MALL_SKU_ATTR_VALUE;
import cn.hanyuweb.service.SkuService;

public interface SkuMapper {

	List<T_MALL_SKU> select_spu_by_pp_id(@Param("pp_id") int pp_id,@Param("class_2_id")  int class_2_id);

	void insert_sku(T_MALL_SKU sku);

	void insert_sku_attr_value(@Param("sku_id") int id, @Param("shp_id") int shp_id, @Param("list") List<T_MALL_SKU_ATTR_VALUE> list);


}
