package com.letv.shop.activity.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class ActivityEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//抢购ID
    private Integer rushId;
    //抢购名称
    private String rushName;
    //抢购类型
    private Byte rushType;
    //套装ID
    private String promotionId;
    //套装ID
    private String promotionName;
    //预约开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date amtStarttime;
    //预约结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date amtEndtime;
    //抢购开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date rushStarttime;
    //抢购结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date rushEndtime;
    //是否需要提前选配置。0:不需要;1:需要
    private Byte isAdvanceConfiguration;
    //预约类型。0:不需要预约; 1:常规预约; 2:一点预约
    private Byte amtType;
    //是否需要真预约. 0:不需要; 1:需要
    private Byte isNeedAmt;
    //手工售罄. 0:未售罄; 1:已售罄
    private Byte isFalse;
    //是否需要校验绑定手机号：0是不需要，1是需要
    private Integer checkMobile;
    //是否需要验证码：0是不需要，1是需要
    private Integer checkCode;
    //状态
    private Byte status;
    //创建时间
    private Date createAt;
    //修改时间
    private Date updateAt;
    //套装ID
    private String createUserId;
    //套装ID
    private String createUserName;
    //套装ID
    private String updateUserId;
    //套装ID
    private String updateUserName;
    //套装选配码
    private String selectNo;
    //预付定金开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date advanceStartTime;
    //预付定金结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date advanceEndTime;
    //尾款支付开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date balanceStartTime;
    //尾款支付结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date balanceEndTime;
    //预付定金类型。0:金额; 1:比例
    private Byte advanceType;
    //预付定金金额
    private BigDecimal advanceAmount = new BigDecimal(0.00);
    //预付定金比例
    private BigDecimal advanceRatio = new BigDecimal(0.00);
    //是否采用定金直降方式  0:否；1：是
    private Byte isOffset;
    //直减类型 0:金额；1：比例
    private Byte offsetType;
    //直减金额
    private BigDecimal offsetAmount = new BigDecimal(0.00);
    //直减比例
    private BigDecimal offsetRatio = new BigDecimal(0.00);
    //关联活动ID
    private Integer relevanceRushId;
    //关联套装ID
    private String relevanceSuiteNo;
    //描述字段
    private String rushDescribe;
    
    private List<ActivitySkuEntity> skus;
    
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
	public Byte getRushType() {
		return rushType;
	}
	public void setRushType(Byte rushType) {
		this.rushType = rushType;
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
	public Date getAmtStarttime() {
		return amtStarttime;
	}
	public void setAmtStarttime(Date amtStarttime) {
		this.amtStarttime = amtStarttime;
	}
	public Date getAmtEndtime() {
		return amtEndtime;
	}
	public void setAmtEndtime(Date amtEndtime) {
		this.amtEndtime = amtEndtime;
	}
	public Date getRushStarttime() {
		return rushStarttime;
	}
	public void setRushStarttime(Date rushStarttime) {
		this.rushStarttime = rushStarttime;
	}
	public Date getRushEndtime() {
		return rushEndtime;
	}
	public void setRushEndtime(Date rushEndtime) {
		this.rushEndtime = rushEndtime;
	}
	public Byte getIsAdvanceConfiguration() {
		return isAdvanceConfiguration;
	}
	public void setIsAdvanceConfiguration(Byte isAdvanceConfiguration) {
		this.isAdvanceConfiguration = isAdvanceConfiguration;
	}
	public Byte getAmtType() {
		return amtType;
	}
	public void setAmtType(Byte amtType) {
		this.amtType = amtType;
	}
	public Byte getIsNeedAmt() {
		return isNeedAmt;
	}
	public void setIsNeedAmt(Byte isNeedAmt) {
		this.isNeedAmt = isNeedAmt;
	}
	public Byte getIsFalse() {
		return isFalse;
	}
	public void setIsFalse(Byte isFalse) {
		this.isFalse = isFalse;
	}
	public Integer getCheckMobile() {
		return checkMobile;
	}
	public void setCheckMobile(Integer checkMobile) {
		this.checkMobile = checkMobile;
	}
	public Integer getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(Integer checkCode) {
		this.checkCode = checkCode;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
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
	public String getSelectNo() {
		return selectNo;
	}
	public void setSelectNo(String selectNo) {
		this.selectNo = selectNo;
	}
	public Date getAdvanceStartTime() {
		return advanceStartTime;
	}
	public void setAdvanceStartTime(Date advanceStartTime) {
		this.advanceStartTime = advanceStartTime;
	}
	public Date getAdvanceEndTime() {
		return advanceEndTime;
	}
	public void setAdvanceEndTime(Date advanceEndTime) {
		this.advanceEndTime = advanceEndTime;
	}
	public Date getBalanceStartTime() {
		return balanceStartTime;
	}
	public void setBalanceStartTime(Date balanceStartTime) {
		this.balanceStartTime = balanceStartTime;
	}
	public Date getBalanceEndTime() {
		return balanceEndTime;
	}
	public void setBalanceEndTime(Date balanceEndTime) {
		this.balanceEndTime = balanceEndTime;
	}
	public Byte getAdvanceType() {
		return advanceType;
	}
	public void setAdvanceType(Byte advanceType) {
		this.advanceType = advanceType;
	}
	public BigDecimal getAdvanceAmount() {
		if(advanceAmount == null)
			return new BigDecimal(0.00);
		return advanceAmount;
	}
	public void setAdvanceAmount(BigDecimal advanceAmount) {
		this.advanceAmount = advanceAmount;
	}
	public BigDecimal getAdvanceRatio() {
		if(advanceRatio == null)
			return new BigDecimal(0.00);
		return advanceRatio;
	}
	public void setAdvanceRatio(BigDecimal advanceRatio) {
		this.advanceRatio = advanceRatio;
	}
	public Byte getIsOffset() {
		return isOffset;
	}
	public void setIsOffset(Byte isOffset) {
		this.isOffset = isOffset;
	}
	public Byte getOffsetType() {
		return offsetType;
	}
	public void setOffsetType(Byte offsetType) {
		this.offsetType = offsetType;
	}
	public BigDecimal getOffsetAmount() {
		if(offsetAmount == null)
			return new BigDecimal(0.00);
		return offsetAmount;
	}
	public void setOffsetAmount(BigDecimal offsetAmount) {
		this.offsetAmount = offsetAmount;
	}
	public BigDecimal getOffsetRatio() {
		if(offsetRatio == null)
			return new BigDecimal(0.00);
		return offsetRatio;
	}
	public void setOffsetRatio(BigDecimal offsetRatio) {
		this.offsetRatio = offsetRatio;
	}
	public Integer getRelevanceRushId() {
		if(relevanceRushId == null)
			return 0;
		return relevanceRushId;
	}
	public void setRelevanceRushId(Integer relevanceRushId) {
		this.relevanceRushId = relevanceRushId;
	}
	public String getRelevanceSuiteNo() {
		return relevanceSuiteNo;
	}
	public void setRelevanceSuiteNo(String relevanceSuiteNo) {
		this.relevanceSuiteNo = relevanceSuiteNo;
	}
	public String getRushDescribe() {
		return rushDescribe;
	}
	public void setRushDescribe(String rushDescribe) {
		this.rushDescribe = rushDescribe;
	}
	public List<ActivitySkuEntity> getSkus() {
		return skus;
	}
	public void setSkus(List<ActivitySkuEntity> skus) {
		this.skus = skus;
	}
	
}