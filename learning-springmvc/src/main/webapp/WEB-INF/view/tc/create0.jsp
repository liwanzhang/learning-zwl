<%@ page import="com.letv.shop.rush.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="MY_DOMAIN_CHILD" value='<%=Constants.MY_DOMAIN_CHILD%>'/>
<c:set var="ctx" value="${pageContext.request.contextPath}${MY_DOMAIN_CHILD}"/>
<%
    StringBuffer sb = new StringBuffer();
    sb.append(request.getContextPath());
    sb.append(Constants.MY_DOMAIN_CHILD);
    String path = sb.toString();
%>
<c:choose>
    <c:when test="${rushBuy.rushId==null || rushBuy.rushId==0}">
	   <c:set var="op" value='create'/>
	</c:when>
	<c:otherwise>
	   <c:set var="op" value='edit'/>
	</c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${rushBuy.rushType!=null && rushBuy.rushType==2}">
       <c:set var="suiteType" value='2'/>
    </c:when>
    <c:otherwise>
       <c:set var="suiteType" value='5'/>
    </c:otherwise>
</c:choose>
<c:set var="promotionName_" value='${rushBuy.promotionName}'/>

<div class="page-header">
    <span class="h4">
        <i class="ace-icon fa fa-angle-double-right"></i>
        <c:choose><c:when test="${rushBuy.rushId==null || rushBuy.rushId==0}">新增</c:when><c:otherwise>编辑</c:otherwise></c:choose>活动
    </span>
</div>
<div class="row">
    <div class="col-sm-12">
        <tags:showFieldError commandName="rushBuy"></tags:showFieldError>
     <form:form method="post" action="${ctx}/activityManager/${op}" modelAttribute="rushBuy" id="inputForm" cssClass="form-horizontal" role="form">

         <!-- 选择套装 -->
         <form:hidden path="promotionId"></form:hidden>
	     <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="promotionName"> 套装名称： </label>
             <form:input path="promotionName" id="promotionName" readOnly="true"  class="col-xs-10 col-sm-4 required" style="height:30px;"/>
             &nbsp;&nbsp; &nbsp;&nbsp;
             <c:if test="${promotionName_ == null || promotionName_ == ''}">
                 <a href="${ctx}/tc/getSuite/20/1/${suiteType}" data-toggle="modal" data-target="#suiteListModal" id="getSuite" class="btn btn-white btn-primary btn-sm">选择</a>
             </c:if>            
         </div>
         <div class="form-group col-sm-12">
             <hr/>
         </div>       
        <div style="clear:both;"></div>         
        <div class="clearfix form-actions">
            <div class="col-md-offset-4 col-md-9">
                <input id="btn_submit" name="btn_submit" type="submit" class="btn btn-primary" value="提交"/>&nbsp; &nbsp; &nbsp;
                <a href="#" class="btn btn-link" id = "CloseFaceBox">取消</a>
            </div>
        </div>
    </form:form>
    </div>
</div>
<script src="${ctx}/static/jquery/1.7.2/jquery.min.js"></script>
<script src="${ctx}/static/jquery-validation/1.9.0/jquery.validate.min.js"></script>
<script src="${ctx}/static/jquery.form.js"></script>
<script>
	var op = $("#op").val();
	if(op == "edit"){
		$("#advanceType").attr("disabled","disabled");
		$("#advanceAmount").attr("disabled","disabled");
		$("#advanceRatio").attr("disabled","disabled");
		$("#isOffset").attr("disabled","disabled");
		$("#offsetType").attr("disabled","disabled");
		$("#offsetAmount").attr("disabled","disabled");
		$("#offsetRatio").attr("disabled","disabled");
	}else{
		$("#advanceRatio").attr("disabled","disabled");
		$("#offsetRatio").attr("disabled","disabled");
	}
	$("#checkCodeDiv").show();
	$("#rushTypeHelp").hide();
	$("#downPayment").hide();
	if ($("#rushType").val() == "1") {
		//$("#checkCode").val("0");
		//$("#checkCode").attr("disabled","disabled");
		$("#isAdvanceConfiguration").val("0");
		$("#isAdvanceConfiguration").attr("disabled","disabled");
		$("#rushTypeHelp").show();
	}else if($("#rushType").val() == "2"){
		$("#checkCodeDiv").hide();
	}else if($("#rushType").val() == "3"){
		$("#downPayment").show();
		$("#noDownPayment").hide();
	}
	if ($("#amtType").val() == "0") {
		$("#isNeedAmt").val("0");
		$("#isNeedAmt").attr("disabled","disabled");
	}
	if ($("#isOffset").val() == "0") {
		$("#offsetDIV").hide();
	}
	
	
	jQuery.validator.methods.compareDate = function(value, element, param) {
	    var startDate = jQuery(param).val();
	    var date1 = startDate;
	    var date2 = value;
	    return date1 <= date2;
	};
	jQuery.validator.methods.compareDateLess = function(value, element, param) {
	    var startDate = jQuery(param).val();
	    var date1 = startDate;
	    var date2 = value;
	    return date1 >= date2;
	};

    var options = {
        dataType:"json",
        success:function (result) {
            if(null!=result && result.status==1){
                alert("保存成功");
                window.location.reload();
                $(document).trigger('close.facebox');
            }else{
                alert("保存失败：\n"+result.message);
            }   
        }};

    $(document).ready(function() {
   		$("#inputForm").validate({
               rules:{
               	rushName: "required",
               	rushName:{
                       maxlength:100
                   },
                   amtStarttime:{
                       required: true,
                       compareDateLess: "#amtEndtime"
                   },
                   amtEndtime: {
                       required: true,
                       compareDate: "#amtStarttime"
                   },
                   rushStarttime:{
                       required: true,
                       compareDate: "#amtEndtime"
                   },
                   rushEndtime: {
                       required: true,
                       compareDate: "#rushStarttime"
                   },
                   advanceStartTime:{
                       required: true,
                       compareDate: "#amtEndtime"
                   },
                   advanceEndTime: {
                       required: true,
                       compareDate: "#advanceStartTime"
                   },
                   balanceStartTime:{
                       required: true,
                       compareDate: "#advanceEndTime"
                   },
                   balanceEndTime: {
                       required: true,
                       compareDate: "#balanceStartTime"
                   },
                   advanceAmount: {
                       required: true,
                       min:0.01
                   },
                   advanceRatio: {
                       required: true,
                       min:0.01
                   },
                   offsetAmount: {
                       required: true,
                       min:0.01
                   },
                   offsetRatio: {
                       required: true,
                       min:0.01	
                   }
               },
               messages:{
               	   amtStarttime:{
                       required: "设置提醒开始时间不能为空",
                       compareDateLess: "设置提醒开始时间不能大于设置提醒结束时间!"
                   },
                   amtEndtime:{
                       required: "设置提醒结束时间不能为空",
                       compareDate: "设置提醒结束时间不能小于设置提醒开始时间!"
                   },
                   rushStarttime:{
                       required: "抢购开始时间不能为空",
                       compareDate: "抢购开始时间不能小于设置提醒结束时间!"
                   },
                   rushEndtime:{
                       required: "抢购最迟结束时间不能为空",
                       compareDate: "抢购最迟结束时间不能小于抢购开始时间!"
                   },
                   advanceStartTime:{
                       required: "预付定金开始时间不能为空",
                       compareDate: "预付定金开始时间不能小于设置提醒结束时间!"
                   },
                   advanceEndTime: {
                       required: "预付定金结束时间不能为空",
                       compareDate: "预付定金结束时间不能小于预付定金开始时间!"
                   },
                   balanceStartTime:{
                       required: "尾款支付开始时间不能为空",
                       compareDate: "尾款支付开始时间不能小于预付定金结束时间!"
                   },
                   balanceEndTime: {
                   	   required: "尾款支付结束时间不能为空",
                       compareDate: "尾款支付结束时间不能小于尾款支付开始时间!"
                   },
                   advanceAmount: {
                       required: "定金金额不能为空",
                       min:"请输入不小于 {0} 的数值"
                   },
                   advanceRatio: {
                       required: "定金比例不能为空",
                       min:"请输入不小于 {0} 的数值,且不要添加%"
                   },
                   offsetAmount: {
                       required: "定金直降金额不能为空",
                       min:"请输入不小于 {0} 的数值"
                   },
                   offsetRatio: {
                       required: "定金直降比例不能为空",
                       min:"请输入不小于 {0} 的数值,且不要添加%"
                   }
               },
               submitHandler:function(){
               	if(op == "edit"){
               		$("#advanceType").removeAttr("disabled");
               		$("#advanceAmount").removeAttr("disabled");
               		$("#advanceRatio").removeAttr("disabled");
               		$("#isOffset").removeAttr("disabled");
               		$("#offsetType").removeAttr("disabled");
               		$("#offsetAmount").removeAttr("disabled");
               		$("#offsetRatio").removeAttr("disabled");
               	}
               	$("#isAdvanceConfiguration").removeAttr("disabled");
               	$("#isNeedAmt").removeAttr("disabled");
               	$("#checkCode").removeAttr("disabled");
               	$("#inputForm").ajaxSubmit(options);
           	}
           });
    	
        
        
        $("#rushType").change(function(){
        	if ($(this).val() == "2") {
        		$("#getSuite").attr("href","<%=path%>/activityManager/getSuite/20/1/2"); 
        	}else{
        		$("#getSuite").attr("href","<%=path%>/activityManager/getSuite/20/1/5"); 
        	}
        	
        	$("#downPayment").hide();
        	$("#noDownPayment").show();
        	$("#rushTypeHelp").show();
        	$("#checkCodeDiv").show();
        	if ($(this).val() == "1") {
        		//$("#checkCode").val("0");
        		//$("#checkCode").attr("disabled","disabled");
        		$("#isAdvanceConfiguration").val("0");
        		$("#isAdvanceConfiguration").attr("disabled","disabled");
        		$("#helpBlock").html("秒杀活动的套装中只能有一个选配码！");
        	}else if($(this).val() == "2"){
        		$("#checkCodeDiv").hide();
        	}else if($(this).val() == "3"){
        		$("#checkCode").removeAttr("disabled");
        		$("#helpBlock").html("套装类型必须为抢购套装！");
        		$("#downPayment").show();
        		$("#noDownPayment").hide();
        	}else{
        		$("#checkCode").removeAttr("disabled");
        		$("#isAdvanceConfiguration").removeAttr("disabled");
        		$("#rushTypeHelp").hide();
        	}
        	
        	if($(this).val() != "3"){
        		$("#advanceAmount").val("0.00");
        		$("#advanceRatio").val("0.00");
        		$("#offsetAmount").val("0.00");
        		$("#offsetRatio").val("0.00");
        		//$("#relevanceRushId").val("");
        		//$("#relevanceSuiteNo").val("");
        		$("#rushDescribe").val("");
        	}
        });
        
        $("#amtType").change(function(){
        	if ($(this).val() == "0") {
        		$("#isNeedAmt").val("0");
        		$("#isNeedAmt").attr("disabled","disabled");
        	}else{
        		$("#isNeedAmt").removeAttr("disabled");
        	}
        });
        
        $("#isOffset").change(function(){
        	if ($(this).val() == "0") {
        		$("#offsetDIV").hide();
        	}else{
        		$("#offsetDIV").show();
        	}
        });
        
        $("#advanceType").change(function(){
        	if ($(this).val() == "0") {
        		$("span.error[for='advanceRatio']").remove();
        		$("#advanceRatio").val("0.00");
        		$("#advanceAmount").removeAttr("disabled");
        		$("#advanceRatio").attr("disabled","disabled");
        	}else{
        		$("span.error[for='advanceAmount']").remove();
        		$("#advanceAmount").val("0.00");
        		$("#advanceAmount").attr("disabled","disabled");
        		$("#advanceRatio").removeAttr("disabled");
        	}
        });
        
        $("#offsetType").change(function(){
        	if ($(this).val() == "0") {
        		$("span.error[for='offsetRatio']").remove();
        		$("#offsetRatio").val("0.00");
        		$("#offsetAmount").removeAttr("disabled");
        		$("#offsetRatio").attr("disabled","disabled");
        	}else{
        		$("span.error[for='offsetAmount']").remove();
        		$("#offsetAmount").val("0.00");
        		$("#offsetAmount").attr("disabled","disabled");
        		$("#offsetRatio").removeAttr("disabled");
        	}
        });
        
        $("#getSuite").click(function(){
        	$("#suiteListModalContent").html("");
        });

    });
    
    $(document).bind('reveal.facebox', function () {
        $('#CloseFaceBox').click(function () { $(document).trigger('close.facebox'); });
    });
    
</script>
