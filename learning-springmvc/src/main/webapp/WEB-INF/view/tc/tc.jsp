<%@ page import="com.letv.shop.rush.Constants"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    StringBuffer sb = new StringBuffer();
    sb.append(request.getContextPath());	
    sb.append(Constants.MY_DOMAIN_CHILD);
    String path = sb.toString();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 模态框（Modal）插件</title>
	<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="<%=path%>/static/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/static/facebox/facebox.js" type="text/javascript"></script>	
</head>
<body>

<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	开始演示模态框
</button>
<a class="btn btn-primary btn-lg" href="<%=path%>/tc/create/0"  data-toggle="modal" data-target="#activityEditModal" rel="facebox" id='create0'>新增抢购</a>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					模态框（Modal）标题
				</h4>
			</div>
			<div class="modal-body">
				在这里添加一些文本
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

	<div class="modal fade " role="dialog" aria-labelledby="activityEditModalLabel" aria-hidden="true" id="activityEditModal">
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
<script>
$(document).ready(function(){
	//facebox
    $('a[rel*=facebox]').facebox({
        loadingImage : '<%=path%>/static/facebox/loading.gif',
        closeImage   : '<%=path%>/static/facebox/closelabel.png'
    })
});
</script>

</body>
</html>