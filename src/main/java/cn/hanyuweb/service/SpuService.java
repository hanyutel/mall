package cn.hanyuweb.service;

import java.util.List;

import cn.hanyuweb.bean.T_MALL_PRODUCT;
import cn.hanyuweb.bean.T_MALL_PRODUCT_IMAGE;

public interface SpuService {

	void saveSpu(T_MALL_PRODUCT product, List<String> imageName);

	List<T_MALL_PRODUCT> getProduct(T_MALL_PRODUCT product);

	T_MALL_PRODUCT getProductById(Integer id);

	List<T_MALL_PRODUCT_IMAGE> get_product_image_by_shp_id(Integer id);

	void updateSpu(T_MALL_PRODUCT product, List<String> imageName);

	void del_spu(T_MALL_PRODUCT product);

}
