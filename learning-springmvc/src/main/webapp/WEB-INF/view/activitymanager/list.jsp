<%@ page import="com.letv.shop.rush.Constants"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
    StringBuffer sb = new StringBuffer();
    sb.append(request.getContextPath());	
    String path = sb.toString();
%>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动管理</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=path%>/static/ace/css/font-awesome.min.css" />
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>

<body class="no-skin">
	<div class="main-container" id="main-container">
		<div class="content">
			<div class="page-content" style="padding:8px 20px 24px;">

                <div class="row">
				<!-- form -->
				<form:form id="queryForm" name="queryForm" modelAttribute="query"
					action="/activityManager/rushBuyByQuery" method="get"
					style="display: inline;" cssClass="form-inline">

					<div class="row"><!-- 水平线 -->
					    <div class="col-sm-12">
					        <hr/>
					    </div>
					</div>
					
					<div class="row"><!-- 水平线 -->
					    <div class="col-sm-12">
					        <hr/>
					    </div>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover gridBody">
								<thead>
									<tr>
										<!-- 全选框 操作全选 
										<th class="center" width="20">
										    <label class="position-relative">  
										        <input type="checkbox" class="ace" id="selectAll" onclick="setAllCheckboxState('ids',this.checked)" /> 
										            <span class="lbl"></span>
										    </label>
										</th>-->
										
										<th sortColumn="rush_id">活动ID</th>
										<th sortColumn="rush_name">活动名称</th>
										<th>活动类型</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>商品套装编码</th>
										<th>商品套装名称</th>
										<th>商品sku详细</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.result}" var="item" varStatus="status">
										<tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">

											<td><c:out value='${item.rushId}' /></td>
											<td><c:out value='${item.rushName}' /></td>
											<td><c:choose>
													<c:when test="${item.rushType==0}">抢购</c:when>
													<c:when test="${item.rushType==1}">秒杀</c:when>
													<c:when test="${item.rushType==2}">预售</c:when>
													<c:when test="${item.rushType==3}">定金</c:when>
												</c:choose>
											</td>
											<td><fmt:formatDate value='${item.rushStarttime}'
													pattern='<%=Constants.FORMAT_DATE_TIME%>' />
											</td>
											<td><fmt:formatDate value='${item.rushEndtime}'
													pattern='<%=Constants.FORMAT_DATE_TIME%>' />
											</td>																						
											<td><c:out value='${item.promotionId}' /></td>
											<td><c:out value='${item.promotionName}' /></td>
                                            <td align="center">
                                                <a type="button" class="fa fa-plus btn collapsed" data-toggle="collapse" data-target="#sku${item.rushId}" aria-expanded="false">
                                                </a>
                                            </td>
											<td><a id="editUpdate"
												class="btn btn-white btn-primary btn-sm"
												href="<%=path%>/activityManager/edit/${item.rushId}"
												data-toggle="modal" data-target="#activityEditModal"
												rel="facebox">修改</a> <a id="setActiveSkuQuantity"
												class="btn btn-white btn-primary btn-sm"
												onclick="return rushTypeValidate(${item.rushType});"
												href="${_path}/rushSkuManager/rushSkuByQuery?rushId=${item.rushId}&rushName=${item.rushName}&promotionId=${item.promotionId}&promotionName=${item.promotionName}"
												target="_blank">复制</a>
												</td>
										</tr>
                        <tr>
                          <td colspan="4"></td>
                          <td colspan="4" class="no-padding">
                            <div id="sku${item.rushId}" aria-expanded="true" class="collapse in">
                            
                              <table class="table table-bordered">
                              
                                <thead>
                                  <tr>
                                    <th>勾选</th>
                                    <th>售罄状态</th>
                                    <th>序号ID</th>
                                    <th>商品SKU编码</th>
                                    <th>商品SKU名称</th>
                                    <th>最大抢购量</th>
                                    <th>人均抢购量</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${item.skus}" var="sku" varStatus="status">
                                        <tr>
                                            <td><input type="checkbox" name="ids" value="${sku.id}"></td>
											<td><c:choose>
													<c:when test="${sku.isFalse==0}">未售罄</c:when>
													<c:when test="${sku.isFalse==1}">已售罄</c:when>
												</c:choose>
											</td>
											<td>3011</td>                                            
                                            <td><c:out value='${sku.skuId}' /></td>
                                            <td><c:out value='${sku.skuName}' /></td>
                                            <td>100</td>
                                            <td>1</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                              </table>
                            </div>
                          </td>
                        </tr>										
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</form:form>
				</div>
				<div class="row">
				<!-- 分页begin -->
				<tags:pageToolbar page="${page}"></tags:pageToolbar>
				<!-- 分页end -->
				</div>
			</div><!-- /.page-content -->
		</div><!-- /.content -->
	</div><!-- /.main-content -->

	<div class="modal fade " role="dialog"
		aria-labelledby="activityEditModalLabel" aria-hidden="true"
		id="activityEditModal">
		<div class="modal-dialog">
			<div class="modal-content" id="activityEditModalContent"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade " role="dialog"
		aria-labelledby="suiteListModalLabel" aria-hidden="true"
		id="suiteListModal">
		<div class="modal-dialog" style="width: 900px;">
			<div class="modal-content" id="suiteListModalContent"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</body>



<script type="text/javascript">
        $(document).ready(function() {
            window.simpleTable = new SimpleTable('queryForm','${page.pageNo}','${page.pageSize}','${page.orderBy}','${page.order}');
        });
    </script>

<script>
    
$(document).ready(function(){
	
	//facebox
    $('a[rel*=facebox]').facebox({
        loadingImage : '<%=path%>/static/facebox/loading.gif',
        closeImage   : '<%=path%>/static/facebox/closelabel.png'
    })
    
    
	//全选
	$("#selectAll,input[name=ids]").click(function(){
	    var length = $("input[name=ids]:checked").length;
	    $("#selectedCount").text(length);
	 });

    $("#btn_update").click(function(){
        updateStock();
    });
    
});

$(function(){
	
    //加载数据到缓存
    $("#btn_load2cache").click(function(){
        var ids =getCheckedValues("ids");
        if(ids.length==0){
            alert('请选择要操作的对象!');
            return;
        }
        alert(ids);
        if (confirm('确定执行[加载数据到缓存]操作?')){
            $.ajax({
                dataType :"json",
                type :"POST",
                data :{"ids":ids.join(",")},
                url: "<%=path%>/activityManager/maxnum2Cache",
                success:function(data){
                    if(null!=data && data.status==1){
                        alert("加载到缓存成功");
                        //window.location.href = window.location;
                        location.reload();
                    }else{
                        alert("加载数据到缓存失败\n" + data.message);
                    }
                }
            });
        }
    });
    
    //查看缓存数据
    $("#btn_viewcache").click(function(){
        var ids =getCheckedValues("ids");
        if(ids.length==0){
            alert('请选择要操作的对象!');
            return;
        }
        $.ajax({
            dataType :"json",
            type :"POST",
            data :{"ids":ids.join(",")},
            url: "<%=path%>/activityManager/viewMaxnumCache",
            success:function(data){
                if(null!=data && data.status==1){
                    var message = "";
                    for(var i =0;i<data.result.length;i++){
                        message += data.result[i].key+"："+data.result[i].value + "\n";
                    }
                    alert("获取到的缓存数据:\n"+message);
                }else{
                    alert("获取缓存数据失败\n" + data.message);
                }
            }
        });
    });
    
    //手工售罄缓存查询
    $("#btn_view_rushsold_cache").click(function(){
        var ids = getCheckedValues("ids");
        if(ids.length==0){
            alert('请选择要操作的对象!');
            return;
        }
        $.ajax({
            dataType :"json",
            type :"POST",
            data :{"ids":ids.join(",")},
            url: "<%=path%>/activityManager/viewRushSoldCache",
            success:function(data){
                if(null!=data && data.status==1){
                    var message = "";
                    for(var i =0;i<data.result.length;i++){
                        message += data.result[i].key+"："+data.result[i].value + "\n";
                    }
                    alert("获取到的缓存数据:\n"+message);
                }else{
                    alert("获取缓存数据失败\n" + data.message);
                }
            }
        });
    });
    
});


//售罄操作(手工售罄、手工不售罄)
do_single_sold_out=function(_this,action){

	var rush_id=$(_this).attr("rush_id");   //抢购编号
	var status=$(_this).attr("status");     //状态
	var is_false=$(_this).attr("is_false"); //手工售罄标识

	// 弹出确认框
    if ( confirm("确定执行操作?") ) {
    	// 发起请求
        $.ajax({
            dataType :"json",
            url: action,
            // 服务器响应成功时的处理函数
            success:function(data) {
            	// 成功
                if (null != data && data.status == 1) {
                    alert("执行成功!");
                    //$("#queryForm").submit();
                    location.reload();
                // 失败
                } else {
                    alert("执行失败\n" + data.message);
                }
            },
            // 服务器响应失败时的处理函数
            error:function(data, status, e) { 
            	alert("执行失败\n服务器响应异常");
            }
        });
    }
	
};

/**
 * 批量 手工售罄
 */
batchDoSoldOutTrue=function(action,_checkBoxName){
	
	var _list = getCheckedValuesByRush(_checkBoxName);
	//校验
	if(_list.list.length ==0 ){
		alert("提示\n" + "请选择抢购活动！");
		return;
	}
	
	var rushIdStr="";//抢购ID '^'拼接
	
	//**************  校验begin ************** 
	//手工售罄条件必须是 status=3 && is_false=0 
    for(var i = 0; i< _list.list.length;i++){
    	
    	var _map = _list.list[i];
    	
    	var rush_id = _map.map.rush_id;
    	var is_false = _map.map.is_false;
    	var status = _map.map.status;
    	
    	if( ( is_false == 0 || is_false == '0' ) ){
    		rushIdStr+=rush_id;
    		rushIdStr+='^';
    	}
    	else{
    		alert("提示\n" + "抢购ID为"+rush_id+"已经售罄，无法再次操作手工售罄");
    		return;
    	}
    	
    } 

	//**************  校验end ************** 


	// 弹出确认框
    if ( confirm("确定执行手工售罄操作?") ) {
    	// 发起请求
        $.ajax({
            dataType :"json",
            url: action+rushIdStr+"/batchSoldOutTrue",
            // 服务器响应成功时的处理函数
            success:function(data) {
            	//操作成功
                if (null != data && data.status == 1) {
                    alert("执行成功!");
                    //$("#queryForm").submit();
                    location.reload();
                //操作失败
                }else if(null != data && data.status == 2){
                    alert("执行有异常:\n" + data.message);
                //系统异常
                }else {
                    alert("执行失败\n" + data.message);
                }
            },
            // 服务器响应失败时的处理函数
            error:function(data, status, e) { 
            	alert("执行失败\n服务器响应异常");
            }
            
        });
    	
    }//if 结束
	
};

/**
 * 批量 手工不售罄
 */
 batchDoSoldOutFalse=function(action,_checkBoxName){
	
	var _list = getCheckedValuesByRush(_checkBoxName);
	
	//校验
	if(_list.list.length ==0 ){
		alert("提示\n" + "请选择抢购活动！");
		return;
	}
	
	var rushIdStr="";//抢购ID '^'拼接
	
	//************** 校验begin **************
	//手工不售罄条件必须是 status=3 && is_false=1
	for(var i = 0; i< _list.list.length;i++){
    	var _map = _list.list[i];
    	
    	var rush_id = _map.map.rush_id;
    	var is_false = _map.map.is_false;
    	var status = _map.map.status;
    	
    	if(( is_false == 1 || is_false == '1' )){
    		rushIdStr+=rush_id;
    		rushIdStr+='^';
    	}
    	else{
    		alert("提示\n" + "抢购ID为:"+rush_id+"的记录未售罄，无法再次操作手工不售罄");
    		return;
    	}
	}
	
	//************** 校验end **************
	
	// 弹出确认框
    if ( confirm("确定执行手工不售罄操作?") ) {
    	// 发起请求
        $.ajax({ 
            dataType :"json",
            url: action+rushIdStr+"/batchSoldOutFalse",
            // 服务器响应成功时的处理函数
            success:function(data) {
            	//操作成功
                if (null != data && data.status == 1) {
                    alert("执行成功!");
                    
                    //$("#queryForm").submit();
                    
                    location.reload();
                    
                //操作失败
                }else if(null != data && data.status == 2){
                    alert("执行有异常:\n" + data.message);
                //系统异常
                }else {
                    alert("执行失败\n" + data.message);
                }
            },
            // 服务器响应失败时的处理函数
            error:function(data, status, e) { 
            	alert("执行失败\n服务器响应异常");
            }
            
        });
    	
    }//if 结束
	
};




// **************************** commont function **************************** //

/**
 * jquery获取复选框值
 * return ArrayList
 */
function getCheckedValuesByRush(name){
	
      var chk_list={};
          chk_list.list = [];
          chk_list.javaClass = "java.util.ArrayList";
     
    $("input[name="+name+"]:checked").each(function(){
            var t={};
            t.rush_id = $(this).attr("rush_id");//$(this).val();
            t.status  = $(this).attr("status");
            t.is_false= $(this).attr("is_false");
            
            var chk_map={};
            chk_map.javaClass = "java.util.HashMap";
            chk_map.map=t;
            //添加
            chk_list.list.push(chk_map);
    });
    
    return chk_list;
    
};

// **************************** commont function **************************** //

//提交
var update_stock_action = "${ctx}/operatorRushManager/setStock";
function updateStock(){
    var ids =getCheckedValues("ids");
    if(ids.length==0){
        alert('请选择要操作的对象!');
        return;
    }
    var rushMaxNum = $("#update_rushMaxNum").val();
    var parentRushId = $("#update_parentRushId").val();
    $.ajax({
        dataType :"json",
        type :"POST",
        data :{"ids":ids.join(","), "rushMaxNum": rushMaxNum, "parentRushId": parentRushId},
        url: update_stock_action,
        success:function(data){
            if(null!=data && data.status==1){
                alert("更新成功");
                window.location.href=window.location;
            }else{
                alert("更新失败\n"+data.message);
            }
        }
    });
}


function rushTypeValidate(rushType){
    if(rushType==2){
    	alert("预售类型的活动不支持设置活动sku抢购量");
    	return false; 
    }
    return true; 
}
</script>

</html>
