<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String path = request.getContextPath();
%>
<div class="row">
    <div class="col-sm-12">
     <form method="post" action="<%=path %>/" id="inputForm" class="form-horizontal" role="form">
        <div style="clear:both;"></div>         
        <div class="clearfix form-actions">
            <div class="col-md-offset-4 col-md-9">
                <input id="btn_submit" name="btn_submit" type="submit" class="btn btn-primary" value="提交"/>
                <a href="#" class="btn btn-link" id="CloseFaceBox">取消</a>
            </div>
        </div>
    </form>
    </div>
</div>