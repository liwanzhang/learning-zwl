package com.letv.shop.rush.form.query;

/**
 * 查询父类
 */
public class AbstractQuery {

    private int pageSet;
    
    private int limit;
    
    private String orderBy;
    
    private String order;

    public int getPageSet() {
        return pageSet;
    }

    public void setPageSet(int pageSet) {
        this.pageSet = pageSet;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
}
