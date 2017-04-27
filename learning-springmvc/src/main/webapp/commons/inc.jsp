<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.letv.shop.rush.Constants" %>
<c:set var="MY_DOMAIN_CHILD" value='<%=Constants.MY_DOMAIN_CHILD%>'/>
<c:set var="ctx" value="${pageContext.request.contextPath}${MY_DOMAIN_CHILD}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<%
    StringBuffer sb = new StringBuffer();
    sb.append(request.getContextPath());
    sb.append(Constants.MY_DOMAIN_CHILD);
    String path = sb.toString();
%>
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=path%>/static/ace/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/static/ace/css/font-awesome.min.css" />
<!-- text fonts -->
<!-- page -->
<link rel="stylesheet" href="<%=path%>/static/ace/css/chosen.css" />

<link rel="stylesheet" href="<%=path%>/static/ace/css/ace-fonts.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=path%>/static/ace/css/ace.min.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="<%=path%>/static/ace/css/ace-part2.min.css" />
<![endif]-->
<link rel="stylesheet" href="<%=path%>/static/ace/css/ace-skins.min.css" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="<%=path%>/static/ace/css/ace-ie.min.css" />
<![endif]-->
<link rel="stylesheet" href="<%=path%>/static/style/main.css" />
<!-- 引入my97日期时间控件-->
<script type="text/javascript" src="<%=path%>/static/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

<script src="<%=path%>/static/jquery/1.7.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path%>/static/ace/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/ace/js/bootstrap-tag.min.js"></script>
<!--
<script src="<%=path%>/static/ace/js/jquery-ui.custom.min.js"></script>
<script src="<%=path%>/static/ace/js/jquery.ui.touch-punch.min.js"></script>
-->
<!-- ace scripts -->
<script src="<%=path%>/static/ace/js/ace.min.js"></script>
<script src="<%=path%>/static/ace/js/ace-elements.min.js"></script>
<!--[if lte IE 8]>
<script src="<%=path%>/static/ace/js/excanvas.min.js"></script>
<![endif]-->

<script src="<%=path%>/static/jquery.form.js"></script>

<script src="<%=path%>/static/simpletable.js"></script>
<script src="<%=path%>/static/application.js"></script>

<link rel="stylesheet" href="<%=path%>/static/jquery-validation/1.9.0/validate.css" />

<script src="<%=path%>/static/jquery-validation/1.9.0/jquery.validate.min.js"></script>
<script src="<%=path%>/static/jquery-validation/1.9.0/messages_bs_cn.js"></script>
