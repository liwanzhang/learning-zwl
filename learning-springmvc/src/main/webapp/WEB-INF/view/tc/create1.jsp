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
     <form:form method="post" action="${ctx}/activityManager/${op}" modelAttribute="rushBuy" id="inputForm" cssClass="form-horizontal">
     	 <input type=hidden id="op" value="${op}">
         <form:hidden path="rushId" id="rushId"></form:hidden>
         
	     <div class="form-group">
             <label class="col-sm-3 control-label no-padding-right" for="rushType" aria-describedby="helpBlock"> 活动类型： </label>
             <c:choose>
			    <c:when test="${op=='create'}">
			     <form:radiobutton path="rushType" value="0" checked="checked"/>抢购  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <form:radiobutton path="rushType" value="1"/>秒杀 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <form:radiobutton path="rushType" value="2"/>预售 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <form:radiobutton path="rushType" value="3"/>定金 
			    </c:when>
			    <c:otherwise>
			         <form:hidden path="rushType"></form:hidden>
			         <c:choose>
				         <c:when test="${rushBuy.rushType==0}"><c:set var="rushTypeName" value='抢购活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==1}"><c:set var="rushTypeName" value='秒杀活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==2}"><c:set var="rushTypeName" value='预售活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==3}"><c:set var="rushTypeName" value='预付定金活动'/></c:when>
                     </c:choose>
                     <input readOnly="true" value="${rushTypeName}" aria-describedby="helpBlock"></input>
			    </c:otherwise>
			</c:choose>
			<div id="rushTypeHelp"><span id="helpBlock" class="help-block text-center" style="color:red;">秒杀活动的套装中只能有一个选配码！</span></div>
         </div>
                 
         <div class="form-group">
             <label class="col-sm-3 control-label no-padding-right" for="rushName"> 活动规则： </label>
             <form:input path="rushName" id="rushName" placeholder="请输入..." class="col-xs-10 col-sm-2 required" />
	     </div>
         
         <div class="form-group">
             <label class="col-sm-3 control-label no-padding-right" for="rushName"> 活动名称： </label>
             <form:input path="rushName" id="rushName" placeholder="请输入..." class="col-xs-10 col-sm-2 required" style="margin-right:10px;"/>
             <p class="help-block">注：此为前台显示名称，将在活动页/详情页展示。</p>
	     </div>
	     
         <div class="form-group col-sm-6">
             <label class="col-sm-6 control-label no-padding-right" for="amtStarttime"> 设置提醒开始时间： </label>
             <div class="col-sm-6 input-daterange input-group" >
	             <input type="text" value="<fmt:formatDate value='${rushBuy.amtStarttime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
	                       onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="amtStarttime" id="amtStarttime" name="amtStarttime"  
	                       placeholder='设置提醒开始时间'  class="input-sm form-control" readOnly="true"/>
	             <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group col-sm-6" >
             <label class="col-sm-6 control-label no-padding-right" for="amtEndtime"> 设置提醒结束时间： </label>
             <div class="col-sm-6 input-daterange input-group" >
	             <input type="text" value="<fmt:formatDate value='${rushBuy.amtEndtime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
	                       onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="amtEndtime" id="amtEndtime"  name="amtEndtime" 
	                       placeholder='设置提醒结束时间'  class="input-sm form-control" readOnly="true"/>
	             <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>	     
	     
	     <div class="form-group col-sm-12">
	         <div class="col-sm-2">&nbsp;</div>
	         <p class="help-block no-margin-bottom">注：此时间段内活动页上此商品资源位上会展示为“设置开售提醒”按钮控件。</p>
	     </div>
	     
         <div class="form-group col-sm-6">
             <label class="col-sm-6 control-label no-padding-right" for="rushStarttime"> 活动开始： </label>
             <div class="col-sm-6 input-daterange input-group">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.rushStarttime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="rushStarttime" id="rushStarttime" name="rushStarttime"  
                           placeholder='设置提醒开始时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group col-sm-6">
             <label class="col-sm-6 control-label no-padding-right" for="rushEndtime"> 活动结束： </label>
             <div class="col-sm-6 input-daterange input-group">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.rushEndtime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="rushEndtime" id="rushEndtime"  name="rushEndtime" 
                           placeholder='设置提醒结束时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         
         
	     <div class="form-group col-sm-12">
	         <div class="col-sm-2">&nbsp;</div>
	         <p class="help-block no-margin-bottom">注：此时间段内活动页/详情页商品会展示按钮状态为“立即抢购”，用户可以参与抢购，且抢购时间必须晚于设置开售提醒开始时间。</p>
	     </div>         
         
         <form:hidden path="promotionId"></form:hidden>
	     <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="promotionName"> 套装名称： </label>
             <form:input path="promotionName" id="promotionName" readOnly="true"  class="col-xs-10 col-sm-2 required"/>
             &nbsp;&nbsp; &nbsp;&nbsp;
             <c:if test="${promotionName_ == null || promotionName_ == ''}">
                 <a href="${ctx}/activityManager/getSuite/20/1/${suiteType}" data-toggle="modal" data-target="#suiteListModal" id="getSuite" class="btn btn-white btn-primary btn-sm">选择</a>
             </c:if>            
         </div>
         
         <div class="form-group col-sm-12">
             <hr/>
         </div>
         <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="isAdvanceConfiguration"> 提前选配： </label>
             <form:radiobutton path="isAdvanceConfiguration" value="0" checked="checked"/>否 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="isAdvanceConfiguration" value="1"/>是
             <p class="help-block inline"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：如果设置为"是"，将在活动页设置提醒结束~抢购开始时间段内显示“提前选配置”按钮</p>
         </div>
         <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="checkMobile"> 预约手机号验证： </label>
             <form:radiobutton path="checkMobile" value="0" checked="checked"/>否 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="checkMobile" value="1"/>是
             <p class="help-block inline"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：要在预约环节校验用户预约的账号是否进行了手机号验证，如果没有，无法成功预约</p>            
         </div>
         <div class="form-group col-sm-12" id="checkCodeDiv">
             <label class="col-sm-3 control-label no-padding-right" for="checkCode"> 抢购图形校验： </label>
             <form:radiobutton path="checkCode" value="0" checked="checked"/>否 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="checkCode" value="1"/>是
             <p class="help-block inline"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：在用户进行抢购时弹出图形验证码进行验证</p>              
         </div>
         <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="amtType"> 预约类型： </label>
             <form:radiobutton path="amtType" value="0" checked="checked"/>不需要预约 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="amtType" value="1"/>常规预约&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="amtType" value="2"/>一点预约              
         </div>
	     <div class="form-group col-sm-12">
	         <div class="col-sm-2">&nbsp;</div>
	         <p class="help-block no-margin-bottom">注：用户可勾选不同的预约类型，常规预约先填写手机号再成功预约，一点预约为直接预约成功后再补填手机号</p>
	     </div>         
         
         <div class="form-group col-sm-12">
             <label class="col-sm-3 control-label no-padding-right" for="isNeedAmt"> 真预约： </label>
             <form:radiobutton path="isNeedAmt" value="0" checked="checked"/>否 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <form:radiobutton path="isNeedAmt" value="1"/>是             
         </div>                       
         <div class="form-group col-sm-12">
             <hr/>
         </div>                  
         	     
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="rushType" aria-describedby="helpBlock"> 活动类型： </label>
             <c:choose>
			    <c:when test="${op=='create'}">
	             <form:select path="rushType" id="rushType"  placeholder="活动类型">
	                 <form:option value="0" selected="selected">抢购活动</form:option>
	                 <form:option value="1">秒杀活动</form:option>
	                 <form:option value="2">预售活动</form:option>
	                 <form:option value="3">预付定金活动</form:option>
	             </form:select>
			    </c:when>
			    <c:otherwise>
			         <form:hidden path="rushType"></form:hidden>
			         <c:choose>
				         <c:when test="${rushBuy.rushType==0}"><c:set var="rushTypeName" value='抢购活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==1}"><c:set var="rushTypeName" value='秒杀活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==2}"><c:set var="rushTypeName" value='预售活动'/></c:when>
	                     <c:when test="${rushBuy.rushType==3}"><c:set var="rushTypeName" value='预付定金活动'/></c:when>
                     </c:choose>
                     <input readOnly="true" value="${rushTypeName}" aria-describedby="helpBlock"></input>
			    </c:otherwise>
			</c:choose>
			<div id="rushTypeHelp"><span id="helpBlock" class="help-block text-center" style="color:red;">秒杀活动的套装中只能有一个选配码！</span></div>
         </div>
         <form:hidden path="promotionId"></form:hidden>
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="promotionName"> 商品套装名称： </label>
             <form:input path="promotionName" id="promotionName" readOnly="true"  class="col-xs-10 col-sm-5 required"/>
             &nbsp;&nbsp; &nbsp;&nbsp;
             <%-- <c:if test="${op=='create'}"> --%>
             <c:if test="${promotionName_ == null || promotionName_ == ''}">
                 <a href="${ctx}/activityManager/getSuite/20/1/${suiteType}" data-toggle="modal" data-target="#suiteListModal" id="getSuite" >请选择</a>
             </c:if>
             <%-- </c:if> --%>
             
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="amtStarttime"> 设置提醒开始时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
	             <input type="text" value="<fmt:formatDate value='${rushBuy.amtStarttime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
	                       onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="amtStarttime" id="amtStarttime" name="amtStarttime"  
	                       placeholder='设置提醒开始时间'  class="input-sm form-control" readOnly="true"/>
	             <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="amtEndtime"> 设置提醒结束时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
	             <input type="text" value="<fmt:formatDate value='${rushBuy.amtEndtime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
	                       onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="amtEndtime" id="amtEndtime"  name="amtEndtime" 
	                       placeholder='设置提醒结束时间'  class="input-sm form-control" readOnly="true"/>
	             <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         
         <div id="noDownPayment">
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="rushStarttime"> 抢购开始时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.rushStarttime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="rushStarttime" id="rushStarttime" name="rushStarttime"  
                           placeholder='设置提醒开始时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="rushEndtime"> 抢购最迟结束时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.rushEndtime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="rushEndtime" id="rushEndtime"  name="rushEndtime" 
                           placeholder='设置提醒结束时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="isAdvanceConfiguration"> 是否需要提前选配置： </label>
             <form:select path="isAdvanceConfiguration" id="isAdvanceConfiguration"  placeholder="是否需要提前选配置">
                 <form:option value="0" selected="selected">否</form:option>
                 <form:option value="1">是</form:option>
             </form:select>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="checkMobile"> 预约是否需要手机号验证： </label>
             <form:select path="checkMobile" id="checkMobile"  placeholder="预约是否需要手机号验证">
                 <form:option value="0" selected="selected">否</form:option>
                 <form:option value="1">是</form:option>
             </form:select>
         </div>
         <div class="form-group" id="checkCodeDiv">
             <label class="col-sm-4 control-label no-padding-right" for="checkCode"> 抢购是否需要图形验证码校证： </label>
             <form:select path="checkCode" id="checkCode"  placeholder="抢购是否需要图形验证码校证">
                 <form:option value="0" selected="selected">否</form:option>
                 <form:option value="1">是</form:option>
             </form:select>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="amtType"> 预约类型： </label>
             <form:select path="amtType" id="amtType"  placeholder="预约类型">
                 <form:option value="0" selected="selected">不需要预约</form:option>
                 <form:option value="1">常规预约</form:option>
                 <form:option value="2">一点预约</form:option>
             </form:select>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="isNeedAmt"> 是否需要真预约： </label>
             <form:select path="isNeedAmt" id="isNeedAmt"  placeholder="预约类型">
                 <form:option value="0" selected="selected">不需要</form:option>
                 <form:option value="1">需要</form:option>
             </form:select>
         </div>
         </div>
         
         <div id="downPayment">
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="advanceStartTime"> 预付定金开始时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.advanceStartTime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="advanceStartTime" id="advanceStartTime" name="advanceStartTime"  
                           placeholder='预付定金开始时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="advanceEndTime"> 预付定金结束时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.advanceEndTime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="advanceEndTime" id="advanceEndTime"  name="advanceEndTime" 
                           placeholder='预付定金结束时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="balanceStartTime"> 尾款付款开始时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.balanceStartTime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="balanceStartTime" id="balanceStartTime" name="balanceStartTime"  
                           placeholder='尾款付款开始时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon"><i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="balanceEndTime"> 尾款付款结束时间： </label>
             <div class="input-daterange input-group" style="width:42%;">
                 <input type="text" value="<fmt:formatDate value='${rushBuy.balanceEndTime}'  pattern='<%=Constants.FORMAT_DATE_TIME%>'/>"
                           onclick="WdatePicker({dateFmt:'<%=Constants.FORMAT_DATE_TIME%>'})" path="balanceEndTime" id="balanceEndTime"  name="balanceEndTime" 
                           placeholder='尾款付款结束时间'  class="input-sm form-control" readOnly="true"/>
                 <div class="input-group-addon "> <i class="glyphicon glyphicon-time"></i></div>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="advanceType"> 定金金额计算方式： </label>
             <form:select path="advanceType" id="advanceType"  placeholder="定金金额计算方式">
                 <form:option value="0" selected="selected">按固定金额设置</form:option>
                 <form:option value="1">按套装销售价格比例设置</form:option>
             </form:select>
         </div>
         <div class="form-group" id="advanceAmountDIV">
             <label class="col-sm-4 control-label no-padding-right" for="advanceAmount"> 定金金额（元）： </label>
             <form:input path="advanceAmount" id="advanceAmount" placeholder="请输入..." class="col-xs-10 col-sm-5 required" />
	     </div>
	     <div class="form-group" id="advanceRatioDIV">
             <label class="col-sm-4 control-label no-padding-right" for="advanceRatio"> 定金比例（%）： </label>
             <form:input path="advanceRatio" id="advanceRatio" placeholder="请输入..." class="col-xs-10 col-sm-5 required" />
	     </div>
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="isOffset"> 是否采用定金直降方式： </label>
             <form:select path="isOffset" id="isOffset"  placeholder="是否采用定金直降方式">
                 <form:option value="0" selected="selected">否</form:option>
                 <form:option value="1">是</form:option>
             </form:select>
         </div>
         <div id="offsetDIV">
         <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="offsetType"> 定金直降金额计算方式： </label>
             <form:select path="offsetType" id="offsetType"  placeholder="定金金额计算方式">
                 <form:option value="0" selected="selected">按固定金额设置</form:option>
                 <form:option value="1">按照定金金额比例设置</form:option>
             </form:select>
         </div>
         <div class="form-group" id="offsetAmountDIV">
             <label class="col-sm-4 control-label no-padding-right" for="offsetAmount"> 定金直降金额（元）： </label>
             <form:input path="offsetAmount" id="offsetAmount" placeholder="请输入..." class="col-xs-10 col-sm-5 required" />
	     </div>
	     <div class="form-group" id="offsetRatioDIV">
             <label class="col-sm-4 control-label no-padding-right" for="offsetRatio"> 定金直降比例（%）： </label>
             <form:input path="offsetRatio" id="offsetRatio" placeholder="请输入..." class="col-xs-10 col-sm-5 required" />
	     </div>
	     </div>
	     
	     <!-- 
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="relevanceRushId"> 关联活动ID： </label>
             <form:input path="relevanceRushId" id="relevanceRushId" placeholder="请输入..." class="col-xs-10 col-sm-5" />
	     </div>
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="relevanceSuiteNo"> 关联套装ID： </label>
             <form:input path="relevanceSuiteNo" id="relevanceSuiteNo" placeholder="请输入..." class="col-xs-10 col-sm-5" />
	     </div>
	     -->
	     <div class="form-group">
             <label class="col-sm-4 control-label no-padding-right" for="rushDescribe"> 活动描述： </label>
             <form:input path="rushDescribe" id="rushDescribe" placeholder="请输入..." class="col-xs-10 col-sm-5" />
	     </div>
         
		 </div>
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
