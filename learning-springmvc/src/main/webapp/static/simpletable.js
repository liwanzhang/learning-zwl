
var SimpleTable = function(formId,pageNumber,pageSize,sortColumns,orders,pageNumberKey,pageSizeKey,sortColumnsKey,ordersKey) {
	this.form = formId;
	this.pageNumber = pageNumber;
	this.pageSize = pageSize;
	this.sortColumns = sortColumns;
	this.orders = orders;
	this.pageNumberKey = pageNumberKey || 'pageNo';
	this.pageSizeKey = pageSizeKey || 'pageSize';
	this.sortColumnsKey = sortColumnsKey || 'orderBy';
	this.ordersKey = ordersKey || 'order';
	//handle sort
	_this = this;
	$("#"+formId+" .gridBody th[sortColumn]").click(function() {
		//handle click sort header
		var column = $(this).attr('sortColumn');
		if(orders == 'asc') {
			//_this.toggleSort("","");
			_this.toggleSort(column , "desc");
		}else if(orders == 'desc') {
			_this.toggleSort(column , "asc");
		}else {
			_this.toggleSort(column , "desc");
		}
	}).mouseover(function() {
		$(this).toggleClass('tableHeaderSortHover',true);
	}).mouseout(function() {
		$(this).toggleClass('tableHeaderSortHover',false);
	});
	
	// add 'desc' or 'asc' class to sorted tableHeader
	var sortInfos = SimpleTableUtils.getSortInfos(sortColumns,orders);
	//var sortInfos = orders;
	for(var i = 0; i < sortInfos.length; i++) {
		var info = sortInfos[i];
		var selector = "#"+formId+' .gridBody th[sortColumn="'+info.column+'"]';
		var order = info.order ? info.order : 'asc';
		$(selector).addClass("sort " + order.toLowerCase());
	}
	
	//handle highlight on mouseover
	$("#"+formId+" .gridBody tbody tr").mouseover(function() {
		$(this).toggleClass('highlight',true);
	}).mouseout(function() {
		$(this).toggleClass('highlight',false);
	});
	
};
SimpleTable.prototype = {
	doJump : function(pageNumber,pageSize,sortColumns,orders) {
		//alert("pageNumber:"+pageNumber+" pageSize:"+pageSize+" sortColumns:"+sortColumns+" this.form:"+this.form);
		var pair = function(k,v) {return ' <input type="hidden" name="'+k+'" value="'+v+'" />'};
		var params = pair(this.pageNumberKey,this.pageNumber)+pair(this.pageSizeKey,this.pageSize)+pair(this.sortColumnsKey,this.sortColumns)
			+ pair(this.ordersKey,this.orders);
		$('#'+this.form).append(params);
		SimpleTableUtils.fireSubmit(this.form);
	},
	togglePage : function(pageNumber) {
		this.pageNumber = pageNumber;
		this.doJump(pageNumber,null,null);
	},
	togglePageSize : function(pageSize) {
        this.pageNumber=1;//切换条数后,默认第一页
		this.pageSize = pageSize;
		this.doJump(null,pageSize,null);
	},
	toggleSort : function(sortColumns,orders) {
        this.pageNumber=1;//切换条数后,默认第一页
		this.sortColumns = sortColumns;
		this.orders = orders;
		this.doJump(null,null,sortColumns,orders);
	}
};

// static methods
var SimpleTableUtils = {
	getSortInfos : function(sortColumns,orders) {
		if(!sortColumns) return []; 
		var results = [];
		var sorts = sortColumns.split(",");
		var orderStrs = orders.split(",");
		for(var i = 0; i < sorts.length; i++) {
			//var columnAndOrder = sorts[i].split(/\s+/);
			var column = sorts[i];
			//var order = columnAndOrder.length > 1 ? columnAndOrder[1] : null;
			var order = orderStrs[i];
			var sortInfo = new Object();
			sortInfo.column = $.trim(column);
			sortInfo.order = $.trim(order);
			
			results.push(sortInfo);
		}
		return results;
	},
	getSortDirection : function(defaultSortColumns,currentColumn) {
		var infos = SimpleTableUtils.getSortInfos(defaultSortColumns);
		for(var i = 0; i < infos.length; i++) {
			var info = infos[i];
			var order = info.order ? info.order : 'asc';
			if(info.column == currentColumn) {
				return order;
			}
		}
		return null;
	},
	fireSubmit : function(form) {
		var form = document.getElementById(form);
	    if (form.fireEvent) { //for ie
	    	if(form.fireEvent('onsubmit')){
	    		form.submit();
	    	}
	    } else if (document.createEvent) { // for dom level 2
			var evt = document.createEvent("HTMLEvents");
	      	//true for can bubble, true for cancelable
	      	evt.initEvent('submit', false, true); 
	      	form.dispatchEvent(evt);
	      	if(navigator.userAgent.indexOf('Chrome') >= 0) {
	      		form.submit();
	      	}
	    }
	}
}