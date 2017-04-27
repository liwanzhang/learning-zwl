<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<title>test</title>
	<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="<%=path%>/static/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/static/facebox/facebox.js" type="text/javascript"></script>	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<form method="post" action="<%=path%>/test/create" id="inputForm" class="form-horizontal" role="form">
					<input name="t.id" type="text">
					<input name="ok" type="radio" value="${t.ok }">
					<input name="status" type="radio" value="${t.status }">
					<input name="a.age" type="text">
					<div class="clearfix form-actions">
						<div class="col-md-offset-4 col-md-9">
							<input id="btn_submit" name="btn_submit" type="submit"
								class="btn btn-primary" value="提交" /> <a href="#"
								class="btn btn-link" id="CloseFaceBox">取消</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('a[rel*=facebox]').facebox({
				loadingImage : '<%=path%>/static/facebox/loading.gif',
                closeImage   : '<%=path%>/static/facebox/closelabel.png'
    })
});
$(document).bind('reveal.facebox', function () {
	console.log("trigger1");
    $('#CloseFaceBox').click(function () { 
    	console.log("trigger2");
    	var ok = $(document).trigger('close.facebox'); 
    	console.log(ok);
    	console.log("trigger3");
    });
});
</script>
</body>
</html>