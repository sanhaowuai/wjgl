
function calculateRow(objIdStr)
{
	var tbody = $("#"+objIdStr+" tbody tr");
	$.each(tbody,function(i,tr){
		if(i>=2)
		{
			$(tr).find("SPAN:first-child").text(i-1);
		}

	})


}


function addRow(objIdStr)
{

	//最后一个tr
	var lastTR = $("#"+objIdStr+" tr:last-child");

	var selectedObj = $("#"+objIdStr+" tr:nth-child(2)").clone();

	var trArr = document.getElementById(objIdStr).getElementsByTagName("TR");
	
	var trInnerHTML ;
	

	for(var i=0;i<trArr.length;i++)
	{

		if(trArr[i].style.display.toLowerCase()=="none")
		{
			trInnerHTML = trArr[i].innerHTML;
			break;
		}
	}
	if(trInnerHTML=="" || trInnerHTML.length==0)
	{
		return;
	}

	lastTR.after("<tr>"+trInnerHTML+"</tr>");

	calculateRow(objIdStr);
}


function addRowYt(objIdStr,ids,titles,chryxms)
{
	
	for(var j=0;j<ids.length;j++){
		//最后一个tr
		var lastTR = $("#"+objIdStr+" tr:last-child");
		var trInnerHTML='';
		
		var len = '${len}';
		var index=j;
		if(len!=null&&len!='0'){
			index = j+parseInt(j+len);
		}
		
		trInnerHTML+='<td style="text-align: center; width: 13%" id="tdNew" class="tdFirst"  align="left"><span id="sort'+index+'" class="sort"></span></td>';
		trInnerHTML+='<td style="display:none" id="tdNew" class="tdFirst"  align="left"><a href="#" class="meettopicid" id="meettopicid'+index+'">'+ids[j]+'</a></td>';
		trInnerHTML+='<td style="display:none" id="tdNew" class="tdFirst"  align="left"><a href="#" class="emp" id="emp'+ids[j]+'"></a></td>';
		trInnerHTML+='<td style="display:none" id="tdNew" class="tdFirst"  align="left"><a href="#" class="dept" id="dept'+ids[j]+'"></a></td>';
		trInnerHTML+='<td style="display:none" id="tdNew" class="tdFirst"  align="left"><a href="#" class="cluster" id="cluster'+ids[j]+'"></a></td>';
		trInnerHTML+='<td style="text-align: center; width: 22%" id="tdNew" class="tdFirst"  align="center"><a href="javascript:detail('+ids[j]+')" id="topictitle'+index+'" class="topictitle">'+titles[j]+'</a></td>';
		trInnerHTML+='<td style="text-align: center; width: 22%" id="tdNew" class="tdFirst"  align="left"><input type="text" style="width:80px" id="tlxry'+ids[j]+'" class="tlxry" value="'+chryxms[j]+'"/>';
		trInnerHTML+='<a href="#" onclick="chooseTopicEmp(\'MEETTOPIC\',\'ATTENDER\','+ids[j]+','+index+')">&nbsp;<img src="'+hosturl+'/resources/themes/img/group.gif" border="0" align="absbottom">&nbsp;</a></td>';
		trInnerHTML+='<td style="text-align: center; width: 12%" id="tdNew" class="tdFirst"  align="center"><input type="text" id="kssj'+index+'" name="kssj"  readonly="readonly" class="Wdate input text easyui-validatebox-disable kssj" style="width:50px"  onclick="WdatePicker({dateFmt:\'H:mm\'})" data-options="required:true"/></td>';
		trInnerHTML+='<td style="text-align: center; width: 18%" id="tdNew" class="tdFirst"  align="center"><a href="#" onclick="movePrev(\'tableId\',this)">上移</a>&nbsp;&nbsp;<a href="#" onclick="moveNext(\'tableId\',this)">下移</a></td>';
		trInnerHTML+='<td style="text-align: center; width: 12%" id="tdNew" class="tdFirst"  align="center"><a href="#" onclick="deleteRow(\'tableId\',this)">删除</a></td>';
		if(trInnerHTML=="" || trInnerHTML.length==0)
		{
			return;
		}
		lastTR.after("<tr>"+trInnerHTML+"</tr>");
		calculateRow(objIdStr);
	}

}

function getSelectObj(objIdStr)
{
	var selObj = $("#"+objIdStr+" input[@checked]");
	
	if(selObj.html()!=null)
	{
		return selObj;
	}
	else
	{
		alert("请选择要操作的行");
		return null;
	}
}

function deleteRow(objIdStr,tdObj)
{
	var selObj = $(tdObj);
//	if(selObj)
//	{
		selObj.parent().parent().remove();
	//tdObj.parentElement.parentElement.remove();
		calculateRow(objIdStr);
//	}

	
}


function movePrev(objIdStr,tdObj)
{


	var selObj = $(tdObj);
	//if(!selObj) return;
	if(parseInt(selObj.parent().parent()[0].rowIndex)<=2)
	{
		alert("已经到顶,不能再上移了");
		return;
	}
	var preObj = selObj.parent().parent().prev();
	var selectedObjClone = selObj.parent().parent().clone();

	var selectedObj = selObj.parent().parent();

	preObj.before(selectedObjClone);
	selectedObj.remove();

	//var radioObj = selectedObjClone.find("td:first-child input[@type='radio']");
	//radioObj.attr("checked","true");


	calculateRow(objIdStr);
}



function moveNext(objIdStr,tdObj)
{


	var selObj = $(tdObj);


//	if(!selObj) return;




	if(parseInt(selObj.parent().parent()[0].rowIndex)+1>=$("#"+objIdStr+" tbody tr").size())
	{
		alert("已经到底,不能再下移了");
		return;
	}

	var nextObj = selObj.parent().parent().next();
	var selectedObjClone = selObj.parent().parent().clone();

	var selectedObj = selObj.parent().parent();

	nextObj.after(selectedObjClone);
	selectedObj.remove();
	

	//var radioObj = selectedObjClone.find("td:first-child input[@type='radio']");
	//radioObj.attr("checked","true");

	calculateRow(objIdStr);
}


