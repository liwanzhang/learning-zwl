package com.letv.shop.activity.query;

import com.letv.shop.rush.form.query.AbstractQuery;

/**
* @Description: 列表查询条件
* @author zhangwanli
* @date 2017-02-07
*/ 
public class ActivityListQuery  extends AbstractQuery  {
	
	//8个查询维度
	private Integer rushId;
    private String rushName;
    private String promotionId;
    private String promotionName;    
    private String skuId;
    private String skuName;
    private String createUserName;    
    private Byte isFalse;

	public Integer getRushId() {
		return rushId;
	}

	public void setRushId(Integer rushId) {
		this.rushId = rushId;
	}

	public String getRushName() {
		return rushName;
	}

	public void setRushName(String rushName) {
		this.rushName = rushName;
	}

	public Byte getIsFalse() {
		return isFalse;
	}

	public void setIsFalse(Byte isFalse) {
		this.isFalse = isFalse;
	}

	public String getPromotionId() {
		return promotionId;
	}

	public void setPromotionId(String promotionId) {
		this.promotionId = promotionId;
	}

	public String getPromotionName() {
		return promotionName;
	}

	public void setPromotionName(String promotionName) {
		this.promotionName = promotionName;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSkuName() {
		return skuName;
	}

	public void setSkuName(String skuName) {
		this.skuName = skuName;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	};

}