<%@ page import="com.letv.shop.rush.Constants"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="MY_DOMAIN_CHILD" value='<%=Constants.MY_DOMAIN_CHILD%>' />
<c:set var="ctx" value="${pageContext.request.contextPath}${MY_DOMAIN_CHILD}" />
<%
    StringBuffer sb = new StringBuffer();
    sb.append(request.getContextPath());	
    sb.append(Constants.MY_DOMAIN_CHILD);
    String path = sb.toString();
%>
<c:set var="_path" value='<%=path%>' />
<html>
<head>
    <jsp:include page="/commons/inc.jsp" />
    <meta http-equiv="X-UA-Compatible" content="edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=path%>/static/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/static/facebox/facebox.js" type="text/javascript"></script>
    <title>活动管理</title>
</head>

<body class="no-skin">
	<div class="main-container" id="main-container">
		<div class="content">
			<div class="page-content">
				<c:if test="${not empty message}">
					<div id="message" class="alert alert-success">
						<button data-dismiss="alert" class="close">×</button>${message}</div>
				</c:if>
                <div class="row">
				<!-- form -->
				<form:form id="queryForm" name="queryForm" modelAttribute="query"
					action="${_path}/activityManager/rushBuyByQuery" method="get"
					style="display: inline;" cssClass="form-inline">
					
					<div class="row"><!-- 按钮栏 -->
						<div class="col-sm-12 inline">
							<div class="col-sm-10 btn-toolbar">
							    <div class="col-sm-1 btn-group">
							        <button type="button" class="btn btn-white btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">新增<span class="ace-icon fa fa-caret-down icon-on-right"></span></button>
							        <ul class="dropdown-menu" style="width:50px;">
							            <li>
							                <a class="btn btn-white btn-primary btn-sm" href="<%=path%>/tc/create/0" rel="facebox" data-toggle="modal" data-target="#activityEditModal" id='create0'>新增抢购</a>
							            </li>
							            <li><a class="btn btn-white btn-primary btn-sm" href="<%=path%>/tc/create/1" rel="facebox"
										        data-toggle="modal" data-target="#activityEditModal" id='create1'>新增秒杀</a>
							            </li>
							            <li><a class="btn btn-white btn-primary btn-sm" href="<%=path%>/activityManager/create/2" rel="facebox"
										        data-toggle="modal" data-target="#activityEditModal" id='create2'>新增预售</a>
							            </li>
							            <li><a class="btn btn-white btn-primary btn-sm" href="<%=path%>/activityManager/create/3" rel="facebox"
										        data-toggle="modal" data-target="#activityEditModal" id='create3'>新增定金</a>
							            </li>							            							            							            
							        </ul>
							    </div>
							</div>
						</div>
					</div><!-- /.按钮栏 -->
				</form:form>
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
		<div class="modal-dialog" style="width: 500px;">
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
