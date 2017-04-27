<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<form action="/saveEvent">
		<table>
			<tr>
				<td align="right">客户代码：</td>
				<td><input type="text" name="event.submitUser.userId"
					value="${event.submitUser.userId }" /></td>
				<td align="right">客户电话：</td>
				<td><input class="inpname_" type="text" id="submitTel"
					name="event.submitTel" value="${event.submitTel }" /></td>
			</tr>
		</table>
		<input id="btn_submit" name="btn_submit" type="submit" class="btn btn-primary" value="提交"/>&nbsp;
	</form>
</body>
</html>