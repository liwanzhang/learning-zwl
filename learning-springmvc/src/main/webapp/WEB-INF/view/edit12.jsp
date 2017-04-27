<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<form class="form-horizontal" id="formBean1Form" method="post"> 
		<div class="control-group">
			<label class="control-label" for="code">FB1编号</label>
			<div class="controls">
				<input type="hidden" id="formBean1.id" name="formBean1.id"
					value="${formBean2.formBean1.id }" /> <input type="text"
					id="formBean1.code" name="formBean1.code"
					value="${formBean2.formBean1.code }" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">FB1名称</label>
			<div class="controls">
				<input type="text" id="formBean1.name" name="formBean1.name"
					value="${formBean2.formBean1.name }">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">FB2编号</label>
			<div class="controls">
				<input type="hidden" id="formBean2.id" name="formBean2.id"
					value="${formBean2.id }" /> <input type="text" id="formBean2.code"
					name="formBean2.code" value="${formBean2.code }">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name">FB2名称</label>
			<div class="controls">
				<input type="text" id="formBean2.name" name="formBean2.name"
					value="${formBean2.name }">
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<button type="submit" class="btn"
					onclick="this.form.action='${ctx}/demo/formbean/save12'">提交</button>
			</div>
		</div>
	</form>
</body>
</html>