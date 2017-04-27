function disableSubmit(finalResult,submitButtonId) {
	if(finalResult) {
		document.getElementById(submitButtonId).disabled = true;
		return finalResult;
	}else {
		return finalResult;
	}
}

function batchDelete(action,checkboxName,form){
    if (!hasOneChecked(checkboxName)){
            alert('请选择要操作的对象!');
            return;
    }
    if (confirm('确定执行[删除]操作?')){
        form.action = action;
        form.submit();
    }
}
function doDelete(obj,action){
    if (confirm('确定执行[删除]操作?')){
    	$.ajax({
            dataType :"json",
            url: action,
            success:function(data){
            	if(null!=data && data.status==1){
                    alert("删除成功");
                    obj.parentNode.parentNode.parentNode.parentNode.deleteRow(obj.parentNode.parentNode.rowIndex);
            	}else{
                    alert("删除失败\n"+data.message);
            	}
            }
		});
    }
}

function hasOneChecked(name){
    var items = document.getElementsByName(name);
    if (items.length > 0) {
        for (var i = 0; i < items.length; i++){
            if (items[i].checked == true){
                return true;
            }
        }
    } else {
        if (items.checked == true) {
            return true;
        }
    }
    return false;
}
//jquery获取复选框值
function getCheckedValues(name){
    var chk_value=[] ;
    $("input[name="+name+"]:checked").each(function(){
        chk_value.push($(this).val());
    });
    return chk_value;
}

function setAllCheckboxState(name,state) {
	var elms = document.getElementsByName(name);
	for(var i = 0; i < elms.length; i++) {
		elms[i].checked = state;
	}
}

function getReferenceForm(elm) {
	while(elm && elm.tagName != 'BODY') {
		if(elm.tagName == 'FORM') return elm;
		elm = elm.parentNode;
	}
	return null;
}

//取小数个数
function forDight(data,count){
    data = Math.round(data*Math.pow(10,count))/Math.pow(10,count);
    return data;
}