<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>facebox示例</title>
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
      <a class="btn btn-white btn-sm" href="<%=path%>/tanceng/facebox/tanchu" rel="facebox" id='create'>新增秒杀</a>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
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