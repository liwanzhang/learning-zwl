package com.letv.shop.activity.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.letv.shop.activity.entity.ActivityEntity;
import com.letv.shop.activity.entity.ActivitySkuEntity;
import com.letv.shop.activity.query.ActivityListQuery;
import com.letv.shop.modules.page.Page;
@Controller
public class ActivityManagerController {
    //抢购信息列表页
    @RequestMapping(value = "/rushBuyByQuery",method = {RequestMethod.GET, RequestMethod.POST})
    public String rushBuyByQuery(ModelMap model,ActivityListQuery query, Page<ActivityEntity> page) {
    	
        if (query==null) query = new ActivityListQuery();
        
        //设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("rush_id");
            page.setOrder(Page.DESC);
        }
        
        page = this.selectRushBuyByQuery(query, page);
        
        model.addAttribute("page",page);//返回page
        model.addAttribute("query",query);//查询条件
        
        return "/activitymanager/list";
    }
    
	public Page<ActivityEntity> selectRushBuyByQuery(ActivityListQuery query, Page<ActivityEntity> page) {
		//排序信息
		query.setOrder(page.getOrder());
		query.setOrderBy(page.getOrderBy());
		query.setLimit(page.getPageSize());
		query.setPageSet((page.getPageNo() - 1) * page.getPageSize());
				
		ActivityEntity act1 = new ActivityEntity();
		ActivityEntity act2 = new ActivityEntity();
		ActivityEntity act3 = new ActivityEntity();
		
		act1.setRushId(9110);
		act2.setRushId(9112);
		act3.setRushId(9113);
		
		act1.setRushName("乐视蓝牙音箱SMART");
		act2.setRushName("乐视蓝牙音箱SMART");
		act3.setRushName("乐视蓝牙音箱SMART");
		
		act1.setRushType(Byte.valueOf("0"));
		act2.setRushType(Byte.valueOf("1"));
		act3.setRushType(Byte.valueOf("2"));
		
		
		act1.setRushStarttime(new Date());
		act2.setRushStarttime(new Date());
		act3.setRushStarttime(new Date());
		
		act1.setRushEndtime(new Date());
		act2.setRushEndtime(new Date());
		act3.setRushEndtime(new Date());
		
		act1.setPromotionId("QGTZ20160823001");
		act2.setPromotionId("QGTZ20160823001");
		act3.setPromotionId("QGTZ20160823001");
		
		act1.setPromotionName("乐1s 太子妃版（抢购套装）");
		act2.setPromotionName("乐1s 太子妃版（抢购套装）");
		act3.setPromotionName("乐1s 太子妃版（抢购套装）");
		
		ActivitySkuEntity sku1 = new ActivitySkuEntity();
		ActivitySkuEntity sku2 = new ActivitySkuEntity();
		ActivitySkuEntity sku3 = new ActivitySkuEntity();
		
		sku1.setIsFalse(Byte.valueOf("0"));
		sku2.setIsFalse(Byte.valueOf("1"));
		sku3.setIsFalse(Byte.valueOf("0"));
		
		sku1.setSkuId("400600000061");
		sku2.setSkuId("400600000061");
		sku3.setSkuId("400600000061");
		
		sku1.setSkuName("乐视蓝牙音箱SMART 黄色");
		sku2.setSkuName("乐视蓝牙音箱SMART 黄色");
		sku3.setSkuName("乐视蓝牙音箱SMART 黄色");
		
		List<ActivitySkuEntity> skus = new ArrayList<ActivitySkuEntity>();
		skus.add(sku1);
		skus.add(sku2);
		skus.add(sku3);
		
		act1.setSkus(skus);
		act2.setSkus(skus);
		act3.setSkus(skus);
		
		List<ActivityEntity> result = new ArrayList<ActivityEntity>();
		result.add(act1);
		result.add(act2);
		result.add(act3);
		
		
		page.setResult(result);
		page.setTotalCount(1);
		
		return page;
	}
}
