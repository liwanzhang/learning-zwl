package com.letv.shop.activity.entity;

import java.io.Serializable;
import java.util.Date;

public class ActivitySkuEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//ID
	private Integer id;
	//SkuId
    private String skuId;
    //Sku名称
    private String skuName;
    //抢购ID
    private Integer rushId;
    //抢购名称
    private String rushName;
    //活动套装Id
    private String promotionId;
    //活动套装名称
    private String promotionName;
    //SKU最大可销售库存量
    private Integer maxnumSalesInventory;
    //最大抢购量
    private Integer rushMaxnum;
    //每人最大抢购量
    private Integer rushMaxnumPer;
    //手工售罄. 0:未售罄; 1:已售罄
    private Byte isFalse;    
    //套装ID
    private String createUserId;
    //套装ID
    private String createUserName;
    //套装ID
    private String updateUserId;
    //套装ID
    private String updateUserName;
    //创建时间
    private Date createAt;
    //修改时间
    private Date updateAt;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getMaxnumSalesInventory() {
		return maxnumSalesInventory;
	}
	public void setMaxnumSalesInventory(Integer maxnumSalesInventory) {
		this.maxnumSalesInventory = maxnumSalesInventory;
	}
	public Integer getRushMaxnum() {
		return rushMaxnum;
	}
	public void setRushMaxnum(Integer rushMaxnum) {
		this.rushMaxnum = rushMaxnum;
	}
	public Integer getRushMaxnumPer() {
		return rushMaxnumPer;
	}
	public void setRushMaxnumPer(Integer rushMaxnumPer) {
		this.rushMaxnumPer = rushMaxnumPer;
	}
	public Byte getIsFalse() {
		return isFalse;
	}
	public void setIsFalse(Byte isFalse) {
		this.isFalse = isFalse;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getUpdateUserName() {
		return updateUserName;
	}
	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
    
}