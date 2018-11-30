
//var  RequestPathEditor = { "type": 'combobox',  "options":  { "valueField": 'requesturl',
//	    				 "textField": 'methodname',
//	    				  onChange:function(newValue,oldValue){
//	    					 $(target).find('tr:eq(1)').attr('items',newValue)
//	    					  _mainObject[$(target).attr('id')]['DATASOURCERESULT']=newValue
//	    				 },
//	    				 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
//	    				  "required": true}
// }
$.fn.extend({
	setDomOption:function(obj){
		var oldOptionString=$(this).attr('_DomOption')
		var oldOptionObj=eval('('+oldOptionString+')')
		    if (undefined==oldOptionObj){
		    	oldOptionObj={}
		    }
		    jQuery.extend(oldOptionObj,obj);
		    $(this).attr('_DomOption', JSON.stringify(oldOptionObj))
		   
	},
	getDomOption:function(){
		
		var oldOptionString=$(this).attr('_DomOption')
		return  eval('('+oldOptionString+')')
	}
	
	
})
$(document).ready(function(){

  	$('#sqleditdialog').dialog({
  	    title: 'My Dialog',
  	    width: 600,
  	    height: 400,
  	    closed: true,
  	    cache: false,
  	    modal: true,
        buttons:[{
			text:'生成后台方法',
			
			handler:function(){
			  load()
			  $('#sqleditdialog').dialog('close')
			  var  tableId=$('#pg').propertygrid('getFieldValue','id')
			       
			  	   $.each(['sql_select','sql_insert','sql_update','sql_delete'],function(i,v){
						 var obj=new Object()
						  if($('#sqltab').tabs('exists',v)){
							  obj[v]=$($('#sqltab').tabs('getTab',v).panel('options').content).textbox('getValue')
						  }
						 $('#'+tableId).setDomOption( obj)
				  })
			  var $tab = $('#_tabs').tabs('getSelected');
		      var _options=$tab.panel('options')
		    //  console.log($(this).dialog('options').sqlType)
		     // console.log($('#sqleditdialog').dialog('options').sqlType)
		      var sqlType=$('#sqleditdialog').dialog('options').sqlType
			  var prarms= {
	  	        	Sql:$('#'+tableId).getDomOption()['sql_'+sqlType],
	  	        	ywdm:_options.pageData.ywdm,
	  	        	forupdatesql:$('#'+tableId).getDomOption()['sql_select'],
	  	        	ymid:$('#mtarget').attr('saveid'),
	  	        	methodreturntype:$('#'+tableId).getDomOption().DATASOURCERESPONSETYPE,
	  	        	ResultName:$('#'+tableId).attr('name'),
	  	        	sqlType:sqlType
	  	        }
			   jQuery.extend(prarms,_options.pageData)
			   delete prarms.target
			   prarms.filepath=prarms.controllerfile
		  	   $.ajax({
	  	        dataType: "JSON",
	  	      //  contentType:'application/json;charset=UTF-8',//关键是要加上这行
	  	      //   traditional:true,//这使json格式的字符不会被转码
	  	        data:prarms,
	  	        type: "POST",
	  	        url: path+'/ymwh/createcontrollermethod',
	  	        success:function (_result) {
	  	           $('#pg').propertygrid('setFieldValue',_result)
	  	           $('#'+tableId).setDomOption(_result)
	  	           if($('#'+tableId).prop('tagName')=='TABLE'){
	  	           $('#'+tableId).find('tr:eq(1)').attr('items',_result.DATASOURCERESULT)
	  	           }else if($('#'+tableId).prop('tagName')=='SELECT'){
	  	           $('#'+tableId).attr('items',_result.DATASOURCERESULT)
	  	           $('#'+tableId).attr('requesturl',_result.DATASOURCEURL)
	  	           }else if($('#'+tableId).prop('tagName')=='DIV'){
	  	        	 if($('#'+tableId).attr("load")!=undefined){
	  	        	   $('#'+tableId).attr('load',_result.FORMLOADURL)
	  	        	 }
	  	        	 if($('#'+tableId).attr("action")!=undefined){
	  	        		 $('#'+tableId).attr('action',_result.DATASOURCEURL)
	  	        	 }
	  	           
	  	           }
	  	           
	  	           $('#tb_save').trigger('click')
		  	    }
		  	    
			})
		       }
          },{
			text:'保存',
			handler:function(){
				var  tableId=$('#pg').propertygrid('getFieldValue','id')
					 $.each(['sql_select','sql_insert','sql_update','sql_delete'],function(i,v){
						 var obj=new Object()
						  if($('#sqltab').tabs('exists',v)){
							  obj[v]=$($('#sqltab').tabs('getTab',v).panel('options').content).textbox('getValue')
						  }
						 $('#'+tableId).setDomOption( obj)
					 })
			}
          },{
			text:'取消',
			handler:function(){
				$('#sqleditdialog').dialog('close')
			}
		}],
  	    onOpen:function(){
  	    	 
  	    	var  tableId=$('#pg').propertygrid('getFieldValue','id')
  	    	 $('#sqltab').tabs('close',3)
  	    	 $('#sqltab').tabs('close',2)
  	    	 $('#sqltab').tabs('close',1)
  	    	 $('#sqltab').tabs('close',0)
  	    	 var targetDom= $('#'+tableId).getDomOption()
  	    	 var tablist=new Array()
  	    	 tablist.push('sql_'+$(this).dialog('options').sqlType)
  	    	 if('update'==$(this).dialog('options').sqlType){
  	    		 tablist.push('sql_select')
  	    	 }
  	    
  	    	 $.each(tablist,function(i,v){
  	  	    	 if(targetDom[v]!=null && targetDom[v]!='' &&  targetDom[v]!=undefined ){
  	    	    	 var option={
  	                       title: v,
  	                       content:$('<input id="tb" type="text" style="width:300px">')
  	    	    	      }
  	    	    	 $('#sqltab').tabs('add', option)
  	    	    	 $(option.content).textbox({multiline:true,fit:true}).textbox('setValue',targetDom[v])
  	    	       }
  	    		 
  	    	 })

  	    	 
  	    	 //$('#sqleditdialogInput').textbox('setValue',$('#'+tableId).getDomOption().sql_select)
  	    }
  	});
$('#pg').propertygrid({
                     method:'get',
	                 showGroup:true,
	                 scrollbarSize:0,
			         columns:[[
		              {field:'name',title:'Name',width:70,sortable:false},
		              {field:'value',title:'Value',width:200,sortable:false,
	                    formatter:function(value, row, index){
	                        var s='';
	                        s=value;
	                            if(row.name=='边框颜色' || row.name=='背景颜色'){
		                        s = '<div>';
								s += '<div style="float:right;width:18px;height:18px;background:'+value+'">&nbsp;</div>';
								s +=  value;
								s += '<div style="clear:both"></div>';
								s += '</div>';
	                          }else if(row.field=='backgroundImage'){
	                        	  s='<a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" onclick="selectImage()" group=""><span class="l-btn-left"><span class="l-btn-text">选择图片</span></span></a>'
	                          }else if(row.field=='createResult'){
	                        	  s='<a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" onclick="createResult()" group=""><span class="l-btn-left"><span class="l-btn-text">生成结果集</span></span></a>'
                              }else if(row.field=='tableColumnSelect'){
                              }else if(row.field=='editstyle'){
                              //	s='<div style="float:right;width:18px;height:18px;background:#666666" onClick="loadColumnList('button')" ><<</div>'
                                s='<a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" onclick="editstyle()" group=""><span class="l-btn-left"><span class="l-btn-text">编辑样式</span></span></a>'
                              }else if(row.field=='HANDLER'){
                                  s=' <a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" style="margin:0px 2px 0px 2px "onclick="createFormHandler(\'insert\')" group=""><span class="l-btn-left"><span class="l-btn-text">添加</span></span></a>'
                                  s+='<a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" style="margin:0px 2px 0px 2px " onclick="createFormHandler(\'delete\')" group=""><span class="l-btn-left"><span class="l-btn-text">删除</span></span></a>'
                                  s+='<a id="btn" class="easyui-linkbutton l-btn l-btn-small" href="#" style="margin:0px 2px 0px 2px " onclick="createFormHandler(\'update\')" group=""><span class="l-btn-left"><span class="l-btn-text">修改</span></span></a>'
                              }
	                        return s;
						}
		              }
		           ]] ,
		           onLoadSuccess:function(data){
		        	   propertygridisonLoadSuccess=false;
                       $('.easyui-linkbutton').linkbutton()
                  }
  })
})
//
var selectImage=function(){
	//
	var  targetId=$('#pg').propertygrid('getFieldValue','id')
	var  $target=$('#'+targetId)
	$('#bgimgPreViewDiv').css("background-image", $target.css('background-image'))
	$('#bgimgPreViewDiv').attr("background-image", $target.attr('background-image'))
    $('#bgimgPreViewDiv').css("background-repeat", $target.css('background-repeat'))
	$('#selectbgimage').dialog({
   		closed: false,
	    cache: false,
	    modal: true,
	    onOpen:function(){
	    	
	  
	    	$('#imageTree').treegrid({
	    	    url:path+'/ymwh/loadImgFile',
	    	    idField:'id',
	    	    treeField:'text',
	    	    fit:true,
	    	    columns:[[
	    	        {field:'context',title:'预览',formatter: function(value,row,index){
	    	        	return '<img width="40" height="40" src="data:image/png;base64,'+value+'"/>'
	    	        }},
	    	        {field:'text',title:'图片'}
	    	    ]],
	    	   onClickRow:function(row){
               $('#bgimgPreViewDiv').css('background-image','url('+path+'/'+row.filepath+')')
               $('#bgimgPreViewDiv').attr('background-image',''+row.filepath)
	    	}
	    	});
	     
	    	$('#bgimgrepeat').combobox({
	    		valueField:'value',
	    		textField:'text',
	    		label:'平铺方式',
	    		data:[
	    			{value:"repeat",text:"repeat"},
	    			{value:"repeat-x",text:"repeat-x"},
	    			{value:"repeat-y",text:"repeat-y"},
	    			{value:"no-repeat",text:"no-repeat"},
	    			{value:"inherit",text:"inherit"}
	    			],
	    		onChange:function(newValue, oldValue){
	    			   $('#bgimgPreViewDiv').css('background-repeat',newValue)
	    		}
	    		
	    	})
	    	$('#bgImagePreView').panel({
	    	    title:'预览',
	    	    fit:true
	    	});
	    },
	    buttons:[
	    	{
				text:'Save',
				handler:function(){
					$target.css("background-image", $('#bgimgPreViewDiv').css('background-image'))
					$target.css("background-repeat", $('#bgimgPreViewDiv').css('background-repeat'))
					$target.attr("background-image", $('#bgimgPreViewDiv').attr('background-image'))
				}
			},{
				text:'Close',
				handler:function(){
					$('#selectbgimage').dialog('close')
				}
			}
	    ]
   	
   	  
   	}
   	)
}
var editstyle=function(){
	var  targetId=$('#pg').propertygrid('getFieldValue','id')
	var  $target=$('#'+targetId)
	var getstyle
	var ret=/([a-zA-z\-][\d\D]*?):([\d\D]*?;)/gi
	var _css
	var s=""
	while(_css=ret.exec($target.attr('style'))){
		s+=_css[1]+":"+_css[2]+"\n"
	}
	
 
   	$('#rowStyleEdit').dialog({
   		closed: false,
	    cache: false,
	    modal: true,
	    onOpen:function(){

		   		CodeMirrorEditor2.setSize('height','300px');
		   		CodeMirrorEditor2.refresh()
	    	    CodeMirrorEditor2.setValue(s)
	    	    CodeMirrorEditor.refresh()
	    	   
	    },
	    buttons:[
	    	{
				text:'Save',
				handler:function(){
					 getstyle=CodeMirrorEditor2.getValue()
			    	    getstyle=getstyle.replace(/\n/g,' ')
					 
					$target.attr('style',getstyle)
					$('#rowStyleEdit').dialog('close')
					
				}
			},{
				text:'Close',
				handler:function(){
					$('#rowStyleEdit').dialog('close')
				}
			}
	    ]
   	
   	  
   	}
   	)
	//console.log(ret.exec($target.attr('style')))
 
	
}
var createResult=function(){
 
	var  SelectDataSource=$('#pg').propertygrid('getFieldValue','SelectDataSource')
	var  SelectDataDisplay=$('#pg').propertygrid('getFieldValue','SelectDataDisplay')
	var  SelectDataValue=$('#pg').propertygrid('getFieldValue','SelectDataValue')
	
	if(SelectDataSource==null ||  SelectDataDisplay==null || SelectDataValue==null){
		   $.messager.alert('提示','数据不全');
	}else{
	
	var  targetId=$('#pg').propertygrid('getFieldValue','id')
	if ($('#'+targetId).getDomOption().sql_select=='' || $('#'+targetId).getDomOption().sql_select==null ||$('#'+targetId).getDomOption().sql_select==undefined ){
		$('#'+targetId).setDomOption({sql_select:" select "+SelectDataDisplay+" , "+SelectDataValue+" from "+SelectDataSource+" "})
	}
	 $('#sqleditdialogInput').textbox('setValue', $('#'+targetId).getDomOption().sql_select)
	 $('#sqleditdialog').dialog({sqlType:"select"})
	 $('#sqleditdialog').dialog('open')
	 
	 
	}
}
var createFormHandler=function(method){
	 var targetId=$('#pg').propertygrid('getFieldValue','id')
	 var targetOption = $('#'+targetId).getDomOption()
	 $('#sqleditdialog').dialog({sqlType:method})
	 var sql=''
	if('insert'==method){
		sql='insert into ' + targetOption.tablename +' ( '
		$.each(targetOption.columns,function(i,v){
			if(i==0){ 	sql+=''+v }else{ 	sql+=','+v }
		})
		sql+=") values ("
		$.each(targetOption.columns,function(i,v){
			if(i==0){ 	sql+='#'+v+'#' }else{ 	sql+=',#'+v+'#' }
		})
		sql+=")"
		 if(targetOption.sql_insert=='' || targetOption.sql_insert==null || targetOption.sql_insert==undefined){
			 $('#'+targetId).setDomOption({'sql_insert':sql})
		 }
		
			 $('#sqleditdialog').dialog('open')
		 
//			  var  tableId=$('#pg').propertygrid('getFieldValue','id')
//			  var $tab = $('#_tabs').tabs('getSelected');
//		      var _options=$tab.panel('options')
//			  var prarms= {
//	  	        	Sql:sql,
//	  	        	ywdm:_options.pageData.ywdm,
//	  	        	ymid:$('#mtarget').attr('saveid'),
//	  	        	methodreturntype:$('#'+tableId).getDomOption().DATASOURCERESPONSETYPE,
//	  	        	ResultName:$('#'+tableId).attr('name'),
//	  	        	sqlType:'insert'
//	  	        }
//			   jQuery.extend(prarms,_options.pageData)
//			   delete prarms.target
//			   prarms.filepath=prarms.controllerfile
//		  	   $.ajax({
//	  	        dataType: "JSON",
//	  	      //  contentType:'application/json;charset=UTF-8',//关键是要加上这行
//	  	      //   traditional:true,//这使json格式的字符不会被转码
//	  	        data:prarms,
//	  	        type: "POST",
//	  	        url: path+'/ymwh/createcontrollermethod',
//	  	        success:function (_result) {
//
//	  	           $('#pg').propertygrid('setFieldValue',_result)
//	  	           $('#'+tableId).setDomOption(_result)
//	  	           if($('#'+tableId).prop('tagName')=='TABLE'){
//	  	        	   $('#'+tableId).find('tr:eq(1)').attr('items',_result.DATASOURCERESULT)
//	  	           }else if($('#'+tableId).prop('tagName')=='SELECT'){
//	  	        	   $('#'+tableId).attr('items',_result.DATASOURCERESULT)
//	  	           }
//	  	           $('#tb_save').trigger('click')
//		  	    }
//
//			})
	  		
	
	}else if('update'==method){
		sql='select '
		$.each(targetOption.columns,function(i,v){
			if(i==0){ 	sql+=''+v } else{ 	sql+=','+v }
		})
		sql+= "  from  "+ targetOption.tablename
 
		 if(targetOption.sql_select=='' || targetOption.sql_select==null || targetOption.sql_select==undefined){
			 $('#'+targetId).setDomOption({'sql_select':sql})
		 }
		sql='update  '+targetOption.tablename+' set '
		$.each(targetOption.columns,function(i,v){
			if(i==0){ 	sql+=''+v+'=#'+v+'#' } else{ 	sql+=','+v+'=#'+v+'#' }
		})
		if(targetOption.sql_update=='' || targetOption.sql_update==null || targetOption.sql_update==undefined){
			 $('#'+targetId).setDomOption({'sql_update':sql})
		}
		$('#sqleditdialog').dialog('open')
	}else if('delete'==method){
		sql="delete from  "+ targetOption.tablename
		 if(targetOption.sql_delete=='' || targetOption.sql_delete==null || targetOption.sql_delete==undefined){
			 $('#'+targetId).setDomOption({'sql_delete':sql})
		 }
		$('#sqleditdialog').dialog('open')
		
	}
	
 
}
	
var loadColumnList=function(type){
	 var tid=$('#pg').propertygrid('getFieldValue','id')
 
	 var gridHandler=function(){
		 
		 var tableId=$('#pg').propertygrid('getFieldValue','id')
		    var tabRowTotal=$('#'+tableId).find('tr:eq(0)').find('td').size()
			var appendData= $('#alreadySelect').datalist('getData')
			var _tableId=tableId
		    var panletable=$('#'+tableId)
		    $(panletable).find('td').each(function(i,dom){
		    	delete _mainObject[$(dom).attr('id')]
		    })
			$(panletable).find('td').remove()
			_mainObject[''+_tableId+'_tr_'+0+'']
			var $tr0=$('<tr class="zujian grid" id="'+_tableId+'_tr_'+0+'" _name="'+_tableId+'_tr_'+0+'" ></tr>')
	            var Object_tr=new Object()
       		Object_tr.ID=''+_tableId+'_tr_'+0+''
       	 	Object_tr.WIDTH='auto'
       		Object_tr.HEIGHT='auto'
       		Object_tr.NAME=''+_tableId+'_tr_'+0+''
       	    _mainObject[''+_tableId+'_tr_'+0+'']=Object_tr
       	var $tr0 =$(panletable).find('tr:eq(0)')
			var $tr1=$('<tr class="zujian grid" each="true" id="'+_tableId+'_tr_'+1+'" _name="'+_tableId+'_tr_'+1+'" ></tr>')
			    var Object_tr=new Object()
       		Object_tr.ID=''+_tableId+'_tr_'+1+''
       	 	Object_tr.WIDTH='auto'
       		Object_tr.HEIGHT='auto'
       		Object_tr.NAME=''+_tableId+'_tr_'+1+''
       	    _mainObject[''+_tableId+'_tr_'+1+'']=Object_tr
       	var $tr1 =$(panletable).find('tr:eq(1)')
       	    $tr1.attr('each',true)
			    $(panletable).append($tr0)
			    $(panletable).append($tr1)
			    var query_columns=""
			    var query_tablename={};
			    $.each(appendData.rows,function(i,row){
               	    var titletd=function(){
                   	    	var $td=$('<td  class="zujian grid" id="'+_tableId+'_tr_'+0+'_td_'+i+'" name="'+_tableId+'_tr_'+0+'_td_'+i+'" >'+row.title+'</td>')
                   	    	var Object_td=new Object()
                   	    	Object_td.ID=''+_tableId+'_tr_'+0+'_td_'+i+''
                   	    	Object_td.WIDTH='auto'
                   	    	Object_td.HEIGHT='auto'
                   	    	Object_td.NAME=''+_tableId+'_tr_'+0+'_td_'+i+''
                   	    	Object_td.GRID_TITLE=row.title
	                    	    _mainObject[''+_tableId+'_tr_'+0+'_td_'+i+'']=Object_td
	                    	    $tr0.append($td)
                   	    
               	     }
               	     var chtml=new ZuJianHtmlCreate()
               	     var datatd=function(){
                   	        var tdconnect;
                   	        var $td=$('<td citem="true" class="zujian grid " id="'+_tableId+'_tr_'+1+'_td_'+i+'" _name="'+_tableId+'_tr_'+1+'_td_'+i+'" > </td>')
                   	        if (row.value=='lable'){
                   	        	$td.append(chtml.panlespan().text(row.field).attr('name',row.field))
                   	        }else if (row.value=='text'){
                   	        	$td.append(chtml.input('text').attr('name',row.field))
                   	        }else if (row.value=='password'){
                   	        	$td.append(chtml.input('password').attr('name',row.field))
                   	        }else if (row.value=='checkbox'){
                   	        	$td.append(chtml.input('checkbox').attr('name',row.field))
                   	        }else if (row.value=='radio'){
                   	        	$td.append(chtml.input('radio').attr('name',row.field))
                   	        }else if (row.value=='textarea'){
                   	        	$td.append(chtml.textarea().attr('name',row.field))
                   	        } else if (row.value=='select'){
                   	        	$td.append(chtml.select().attr('name',row.field))
                   	        }
                   	        $td.children().attr('tablename',row.tablename)
                   	        query_columns=query_columns+row.tablename+"."+row.field+","
                   	        var _obj=new Object()
                   	        _obj[row.tablename]=row.tablename
                   	        jQuery.extend(query_tablename,_obj);
                   	        chtml.setName(row.field)
                   	    	var Object_td=new Object()
                   	    	Object_td.ID=''+_tableId+'_tr_'+1+'_td_'+i+''
                   	    	Object_td.WIDTH='auto'
                   	    	Object_td.HEIGHT='auto'
                   	    	Object_td.GRID_TITLE=row.title
                   	    	Object_td.GRID_FIELD=row.field
                   	    	Object_td.GRID_TYPE=row.value
                   	    	Object_td.NAME=''+_tableId+'_tr_'+1+'_td_'+i+''
	                    	    _mainObject[''+_tableId+'_tr_'+1+'_td_'+i+'']=Object_td
	                    	    $tr1.append($td)
	                    	    $td.setDomOption({'tablename':row.tablename,'column':row.field})
               	    }
               	    titletd()
               	    datatd()
			})
			  var sumstring='select\n'
			  sumstring+=query_columns
			  sumstring=sumstring.substring(0,sumstring.length-1)
			  sumstring+=' \nfrom  '
			  var tablelist=new Array()
			  $.each(query_tablename,function(k,v){
				  
				  tablelist.push(k)
				  
			  })
				var prarms= {
		  	        	StartSql:sumstring,
		  	        	statemensqllist:tablelist
		  	        }
				delete prarms.target
				prarms.filepath=prarms.controllerfile
		  	    $.ajax({
		  	        dataType: "JSON",
		  	      //  contentType:'application/json;charset=UTF-8',//关键是要加上这行
		  	      //   traditional:true,//这使json格式的字符不会被转码
		  	        data:prarms,
		  	        type: "POST",
		  	        url: path+'/ymwh/getMoRenBiaoGuanXi',
		  	        success:function (_data) {
		  	        	$(panletable).setDomOption({'sql_select':_data.result })//SQL语句写入table自定属性
		  	        	$('#sqleditdialogInput').textbox('setValue',$(panletable).getDomOption().sql_select)
		  	        	$('#sqleditdialog').dialog('open')
		  	        },
		  	        error : function (_data){
		  	           console.log(_data.responseText);
		  	        }
		  	    });
		}
	var dcardHandler=function(){
		 var dcardId=$('#pg').propertygrid('getFieldValue','id')
		 var appendData= $('#alreadySelect').datalist('getData')
		 var maintable=''
		 var columns=new Array();
		 $.each(appendData.rows,function(i,row){
			if(i==0){
				maintable=row.tablename
			}
			if(maintable==row.tablename){
				columns.push(row.field)
			}
			var chtml1=new ZuJianHtmlCreate()
			var $text= chtml1.panlespan().text(row.title).attr('name',row.title).attr('title',true)
			var chtml2=new ZuJianHtmlCreate()
			var $value
			if (row.value=='lable'){
				$value= chtml2.panlespan().text(row.field).attr('name',row.field).attr('value',true)
   	        	//$td.append(chtml.panlespan().text(row.field).attr('name',row.field))
   	        }else if (row.value=='text'){
   	        	$value=chtml2.input('text').attr('name',row.field)
   	        }else if (row.value=='password'){
   	        	$value=chtml2.input('password').attr('name',row.field)
   	        }else if (row.value=='checkbox'){
   	        	$value=chtml2.input('checkbox').attr('name',row.field)
   	        }else if (row.value=='radio'){
   	        	$value=chtml2.input('radio').attr('name',row.field)
   	        }else if (row.value=='textarea'){
   	        	$value=chtml2.textarea().attr('name',row.field)
   	        } else if (row.value=='select'){
   	        	$value=chtml2.select().attr('name',row.field)
   	        }
			var isb=$('#isbootstrap').switchbutton('options').checked
		    if(!isb){
			var chtml3=new ZuJianHtmlCreate()
			var $appendspan=chtml3.panle()
			$appendspan.append($text)
			$appendspan.append($value)
			var w=$appendspan.css('width').replace('px','')
			$appendspan.css('width',(w*1+10)+'px')
			$appendspan.css('height',$text.css('height'))
			$('#'+dcardId).append($appendspan)
		    }else{
		    	
		    	if (row.value=='text'){
		    		var Bootstrap_form=new ZuJianHtmlCreate()
		    		var $inputobj=$(Bootstrap_form.Bootstrap_form_control())
		    		console.log($inputobj.html())
		    		$inputobj.find('label').html(row.title)
		    		$inputobj.find('input').attr('name',row.field)
		    		console.log($inputobj)
		    		$('#'+dcardId).append($inputobj)
		    	}
		    	
		    	
		    }
		 })
		 $('#'+dcardId).setDomOption({'tablename':maintable})
		 $('#'+dcardId).setDomOption({'columns':columns})
	}
	var dataSourceId
	if ( type=='ywdataSource' ){
		 
		dataSourceId=$('#dlywdataSource').datalist('getSelected').VALUE
		 
		
	}else{
		
		dataSourceId=$('#pg').propertygrid('getFieldValue','SelectDataSource')
	}
    $('#selectColumn').dialog({
        title: 'My Dialog',
        width: 640,
        height: 574,
        closed: false,
        cache: false,
        href: path+'/jsp/ymbj/selectColumn.jsp?dataSourceId='+dataSourceId,
        modal: true,
        resizable:false,
        buttons:[{
			text:'Save',
			handler:function(){
				 
				if($('#'+tid).prop('tagName')=='TABLE'){
					gridHandler()
				}else{
					dcardHandler()
				}
				
			}
		},{
			text:'Close',
			handler:function(){
				$('#selectColumn').dialog('close')
			}
		}]
    });
	
	 
}

var v_name = function(target)
{
  var node=_mainObject[$(target).attr('id')]
  if(undefined==node){
	  node=new Object()
	  node['NAME']=$(target).attr('name')
  }
  
  return  { "name": "name", "group": "属性", "value": ""+  node['NAME'] +"", "field": "name","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    $(target).attr('name',newValue)
    _mainObject[$(target).attr('id')]['NAME']=newValue
  }}}}
}


 
var v_id = function(target)
{
  var node=_mainObject[$(target).attr('id')]
  if(undefined==node){
	  node=new Object()
	  node['ID']=$(target).attr('id')
  }
  return { "name": "id", "group": "属性", "value": ""+    node['ID'] +"", "field": "id"
     
  }
}
var stylevaues={
	   borderStyle:[
			{value:'none',name:'none'},
			{value:'inherit',name:'inherit'},
            {value:'solid',name:'solid'}
	   ],
       float:[
       {value:'left',name:'left'},
       {value:'right',name:'right'},
       {value:'none',name:'none'}
      ],
}
var createXjsx = function(target,obj)
{
  var node=_mainObject[$(target).attr('id')]
  if(undefined==node){
	  node=new Object()
	  node['ID']=$(target).attr('id')
  }
  if(obj.SXLB=='1'){
      return { "name": ""+obj.SXSM+"", "group": ""+obj.FENZU+"", "value": ""+   $(target).attr(obj.ZJSX) +"", "field": ""+obj.ZJSX+"","editor": {"type":""+obj.WHFS+"" ,"options": {"required":false, onChange:function(newValue,oldValue){
		    	 $(target).attr(obj.ZJSX,newValue)
	         }}}
      }
  }else if(obj.SXLB=='2') {
	  var editor={"type":""+obj.WHFS+"" ,"options": {
			"valueField": 'value', "textField": 'name',
			"data":[],
		     onChange:function(newValue,oldValue){
		     $(target).css(obj.ZJSX,newValue)
	        }}}
	        if(obj.WHFS=='combobox'){
	        	editor.options.data=stylevaues[obj.ZJSX]
	        }
	  return  { "name": ""+obj.SXSM+"", "group":  ""+obj.FENZU+"", "value": ""+$(target).css(""+obj.ZJSX+"")+"", "field": ""+obj.ZJSX+"","editor":editor}
  }
}
var v_labelfor = function(target)
{
	 
	if ( $(target).getDomOption().FOR==undefined ) {
    	$(target).setDomOption({FOR:''})
     }
	var $domlist = $(target).parent().find('INPUT,TEXTAREA');

	var datalist = new Array()
	    $domlist.each(function(i,dom){
		datalist.push({value:$(dom).attr('id'),name:$(dom).attr('name')})
	})
	var defvalue=$(target).getDomOption().FOR
	return { "name": "FOR", "group": "属性", "value": ""+    defvalue  +"", "field": "for","editor": { "type": 'combobox',
        "options":  { "valueField": 'value', "textField": 'name',
            onChange:function(newValue,oldValue){
            	$(target).setDomOption({FOR:newValue})
            	$(target).attr({"for":newValue})
            },
	        "data":datalist,
            "required": true}
       }
	}
}
var v_borderStyle=function(target){
	  return  { "name": "边框", "group": "样式", "value": ""+$(target).css('borderStyle')+"", "field": "border","editor":{"type":"combobox" ,"options": {
			"valueField": 'value', "textField": 'name',
			"data":[{value:'none',name:'none'},
		             {value:'solid',name:'solid'}
		           ],"required":true,
		          onChange:function(newValue,oldValue){
		   $(target).css('borderStyle',newValue)
	 }}}}
	}

var v_borderWidth=function(target){
	
	return { "name": "边框宽度", "group": "样式", "value": ""+  $(target).css('borderWidth') +"", "field": "borderWidth","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).css('borderWidth',newValue)
	 }}}}
}

var v_borderColor = function(target){
	return { "name": "边框颜色", "group": "样式", "field": "borderColor","value": ""+ $(target).getHexColor('borderColor') +"",
		 "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			         $(target).css('borderColor',newValue)
	            }}}
	}
}

 
var v_width=function(target){
	 
	return { "name": "宽度", "group": "样式", "value": ""+  $(target).attr('_width') +"", "field": "width","editor": {"type":"textbox" ,"options": {"required":false, onChange:function(newValue,oldValue){
		console.log("newValue")
	   console.log(newValue)
		if(newValue==""){
	    	  $(target).css('width',null)
	    	  $(target).removeAttr('_width')
	    }else{
	    	 $(target).css('width',newValue)
	    	 $(target).attr('_width',newValue)
	    }
	    }}}}
}

var v_height=function(target){
    return { "name": "高度", "group": "样式", "value": ""+  $(target).attr('_height') +"", "field": "height","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		    $(target).css('height',newValue)
		    $(target).attr('_height',newValue)
	}}} }
}
var v_style=function(target){
	return { "name": "style", "group": "样式", "value": ""+  $(target).attr('_height') +"", "field": "editstyle"}
}

var v_top=function(target){
    return  { "name": "top", "group": "样式", "value": ""+  $(target).attr('_top') +"", "field": "top","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).css('top',"10px")
        $(target).attr('_top',newValue)
    }}}}
}
var v_margin_top=function(target){
	return  { "name": "margin-top", "group": "样式", "value": ""+  $(target).attr('_margin_top')==='undefined'?'0px': $(target).attr('_margin_top') +"", "field": "top","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).css('margin-top',newValue)
		$(target).attr('_margin_top',newValue)
	}}}}
}

var v_left=function(target){
    return   { "name": "left", "group": "样式", "value": ""+  $(target).attr('_left') +"", "field": "left","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).css('left',newValue)
        $(target).attr('_left',newValue)
        }}}}}
var v_margin_left=function(target){
    	return   { "name": "margin-left", "group": "样式", "value": ""+  $(target).attr('_margin_left')==='undefined'?'0px': $(target).attr('_margin_left') +"", "field": "left","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    		$(target).css('margin-left',newValue)
    		$(target).attr('_margin_left',newValue)
    	}}}}
}
var v_position=function(target){
	return { "name": "position", "value": ""+$(target).css('position')+"", "group": "样式", "field": "position",
		"editor": { "type": 'combobox',
	                "options":  { "valueField": 'value', "textField": 'name',
	        	                 onChange:function(newValue,oldValue){
	     	                           $(target).css('position',newValue)
	                             },
						         "data":[
						             {value:'absolute',name:'absolute'},
						             {value:'relative',name:'relative'},
						             {value:'float',name:'float'},
						             {value:'static',name:'static'}
						            ],
	                             "required": true}
	             }
	       }
}

var v_class=function(target){
	var cls=new Array()
	$.each($(target).attr('class').split(" "),function(i,obj){
		cls.push(obj.replace(" ",""))
	})
	var result=new Array()
	

	$.ajax({

        type: "get",

       url: path+"/resources/js/ymbj/bootstrapClass.json",

       cache:false,

       async:false,

        dataType: "json",

         success: function(data){
        	 result=data;
        }

});
	return { "name": "class", "value": cls, "group": "样式表", "field": "class",
		"editor": { "type": 'tagbox',
			"options":  {
                data:result,
				onChange:function(newValue,oldValue){
					 $.each(oldValue,function(i,obj){
						 $(target).removeClass(obj)
					 })
					 $.each(newValue,function(i,obj){
						 $(target).addClass(obj)
					 })
                },
				valueField: 'id',
				textField: 'text',
				groupField: 'type',
				limitToList: true,
				hasDownArrow: true,
				prompt: 'Select a class'
				}
		}
	}
}
var v_Bootstrap=function(target){
	if ($(target).attr('isBootstrap')==undefined || ''==$(target).attr('isBootstrap') ){
		
		$(target).attr('isBootstrap',"1")
	}
	
	return { "name": "禁用Style", "value": ""+$(target).attr('isBootstrap')+"", "group": "样式表", "field": "isBootstrap",
		"editor": { "type": 'combobox',
	                "options": { "valueField": 'value', "textField": 'name',
	                	       onChange:function(newValue,oldValue){
	     	                       $(target).css('isBootstrap',newValue)
	                           },
	                           "data":[
	                                   {value:'1',name:'是'},
	                                   {value:'0',name:'否'}
	                                   ],
	                           "required": true}}}
}
var v_float=function(target){
	return { "name": "浮动", "value": ""+$(target).css('float')+"", "group": "样式", "field": "float",
		"editor": { "type": 'combobox',
	                "options": { "valueField": 'value', "textField": 'name',
	                	       onChange:function(newValue,oldValue){
	     	                       $(target).css('float',newValue)
	                           },
	                           "data":[
	                                   {value:'left',name:'left'},
	                                   {value:'right',name:'right'},
	                                   {value:'none',name:'none'}
	                                   ],
	                           "required": true}}}
	
	
}
var v_clear=function(target){
  return	{ "name": "清除浮动", "value": ""+$(target).css('clear')+"", "group": "样式", "field": "clear",
	    "editor": { "type": 'combobox',
	                 "options": { "valueField": 'value', "textField": 'name',
	                	           onChange:function(newValue,oldValue){
	  	                                     $(target).css('clear',newValue)
	                                        },
								 "data":[
									 {value:'all',name:'all'},
									 {value:'both',name:'both'},
									 {value:'inherit',name:'inherit'},
									 {value:'initial',name:'initial'},
									 {value:'left',name:'left'},
									 {value:'none',name:'none'},
									 {value:'right',name:'right'}
								   ],
	                              "required": true}}}
}
var v_text=function(target){
	return { "name": "text", "group": "属性", "value": ""+  $(target).text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).text(newValue)
    }}}}
}
var v_BootStrap_input_text=function(target){
	
	return { "name": "text", "group": "属性", "value": ""+  $(target).find('label').text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).find('label').text(newValue)
	}}}}
}
var v_BootStrap_check_text=function(target){
	return { "name": "text", "group": "属性", "value": ""+  $(target).find('label').find('span').text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).find('label').find('span').text(newValue)
	}}}}
}
var v_BootStrap_input_name=function(target){
	var defValue
	if ($(target).find('input').size()>0){
		defValue = $(target).find('input').attr('name')
	}else if ($(target).find('select').size()>0){
		defValue = $(target).find('select').attr('name')
	}
	return { "name": "name", "group": "属性", "value": ""+  $(target).find('input').attr('name') +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		if ($(target).find('input').size()>0){
			 $(target).find('input').attr('name',newValue)
		}else if ($(target).find('select').size()>0){
			 $(target).find('select').attr('name',newValue)
		}
		$(target).attr('name',newValue)
	}}}}
}
var v_BootStrap_input_placeholder=function(target){
	return { "name": "提示信息", "group": "属性", "value": ""+  $(target).find('input').attr('placeholder') +"","field": "placeholder",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).find('input').attr('placeholder',newValue)
	}}}}
}
var v_BootStrap_input_type=function(target){
	return { "name": "TYPE", "group": "属性", "value": ""+  $(target).find('input').attr('type') +"","field": "type",  "editor": { "type": 'combobox',
        "options": { "valueField": 'value', "textField": 'name',
	           onChange:function(newValue,oldValue){
	        	   $(target).find('input').attr('type',newValue)
                     },
			 "data":[
				 {value:'text',name:'text'},
				 {value:'password',name:'password'}
			   ],
           "required": true}}}
}
var v_BootStrap_input_sronly=function(target){
	var defValue= $(target).find('label').hasClass('sr-only')?'1':'0';
	return { "name": "隐藏说明", "group": "属性", "value": ""+  defValue +"","field": "sronly",  "editor": { "type": 'combobox',
		"options": { "valueField": 'value', "textField": 'name',
			onChange:function(newValue,oldValue){
				 if("1"==newValue){
					 $(target).find('label').addClass('sr-only')
				 }else{
					 $(target).find('label').removeClass('sr-only')
					 
				 }
			},
			"data":[
				{value:'0',name:'否'},
				{value:'1',name:'是'}
				],
				"required": true}}}
}
var v_value=function(target){
	return  { "name": "value", "group": "属性", "value": ""+  $(target).val() +"","field": "value", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).val(newValue)
    }}} }
}
var v_TextareaRow=function(target){
	return  { "name": "行", "group": "属性", "value": ""+  $(target).attr('rows') +"","field": "TextareaRow", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('rows',newValue)
    }}} }
}
var v_TextareaCol=function(target){
	return  { "name": "列", "group": "属性", "value": ""+  $(target).attr('cols') +"","field": "TextareaCol", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    $(target).attr('cols',newValue)
    }}} }
}


var v_layoutType=function(target){
	  return	{ "name": "布局类型", "value": ""+$(target).css('clear')+"", "group": "属性", "field": "clear",
		    "editor": { "type": 'combobox',
		                 "options": { "valueField": 'value', "textField": 'name',
		                	           onChange:function(newValue,oldValue){
		  	                                     
		                                        },
									 "data":[
										 {value:'query',name:'查询'},
										 {value:'view',name:'展示'}
									   ],
		                              "required": true}}}
	}
var v_overFlow=function(target){
	 return	{ "name": "overflow", "value": ""+$(target).css('overflow')+"", "group": "属性", "field": "overflow",
		    "editor": { "type": 'combobox',
		                 "options": { "valueField": 'value', "textField": 'name',
		                	           onChange:function(newValue,oldValue){
		                	        	   $(target).css('overflow',newValue)
		                                  },
									 "data":[
										 {value:'scroll',name:'scroll'},
										 {value:'hidden',name:'hidden'},
										 {value:'visible',name:'visible'}
									   ],
		                              "required": true}}}
}
var v_overFlow_x=function(target){
	return	{ "name": "overflow-x", "value": ""+$(target).css('overflow-x')+"", "group": "属性", "field": "overflow-x",
		"editor": { "type": 'combobox',
			"options": { "valueField": 'value', "textField": 'name',
				onChange:function(newValue,oldValue){
					$(target).css('overflow-x',newValue)
				},
				"data":[
				        {value:'scroll',name:'scroll'},
				        {value:'hidden',name:'hidden'},
				        {value:'visible',name:'visible'}
				        ],
				        "required": true}}}
}
var v_overFlow_y=function(target){
	return	{ "name": "overflow-y", "value": ""+$(target).css('overflow-y')+"", "group": "属性", "field": "overflow-y",
		"editor": { "type": 'combobox',
			"options": { "valueField": 'value', "textField": 'name',
				onChange:function(newValue,oldValue){
					$(target).css('overflow-y',newValue)
				},
				"data":[
				        {value:'scroll',name:'scroll'},
				        {value:'hidden',name:'hidden'},
				        {value:'visible',name:'visible'}
				        ],
				        "required": true}}}
}
var v_backgroundColor=function(target){
	return { "name": "背景颜色", "group": "背景", "field": "backgroundColor","value": ""+ $(target).getHexColor('backgroundColor') +"",
		 "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			         $(target).css('backgroundColor',newValue)
	            }}}
	}
}
var v_backgroundImage=function(target){
	return  { "name": "bgImage", "group": "背景", "value": ""+  $(target).css('background-Image') +"","field": "backgroundImage"}
}
var v_backgroundRepeat=function(target){
	 
	return	{ "name": "backgroundRepeat", "value": ""+$(target).css('backgroundRepeat')+"", "group": "背景", "field": "backgroundRepeat",
		"editor": { "type": 'combobox',
			"options": { "valueField": 'value', "textField": 'name',
				onChange:function(newValue,oldValue){
					$(target).css('backgroundRepeat',newValue)
				},
				"data":[
				        {value:'repeat',name:'repeat'},
				        {value:'no-repeat',name:'no-repeat'},
				        {value:'repeat-x',name:'repeat-x'},
				        {value:'repeat-y',name:'repeat-y'}
				        ],
				        "required": true}}}
}

var v_TableRow=function(target){
	return { "name": "行", "group": "属性", "value": ""+  $(target).attr('rows') +"","field": "TableRow", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('rows',newValue)
        var newrow =$(target).find('tr').eq(0).clone()
        $(newrow).find('tr > td').addClass("zujian")
        var _rows=$(target).find('tr').size()
        var _temp_table=$('<table></table>')
        if (_rows > newValue){
        	$(target).find('tr:gt('+(newValue-1)+')').each(function(i,delete_tr){
        		$(delete_tr).find('td').each(function(j,delete_td){
        			delete _mainObject[$(delete_td).attr('id')]
        		})
        			delete _mainObject[$(delete_tr).attr('id')]
        	})
        	$(target).find('tr:gt('+(newValue-1)+')').remove()
        }else if (_rows < newValue){
        	var rowindex=$(target).find('tr').size()
        	for (var i=0 ;i< newValue-1 ; i++ ){
        		 var ntr=$(newrow).clone()
        		 var trid=$(target).attr('id')+'_tr_'+(rowindex+i)
        		 $(ntr).attr('id',trid)
        		 $(ntr).attr('_name',trid)
        		 $(ntr).find('td').each(function(_I,_td){
        		 	$(_td).attr('id',trid+'_td_'+_I)
        		 	$(_td).attr('_name',trid+'_td_'+_I)
          		  var nodeObject_td=new Object()
        		 	  nodeObject_td.id=$(_td).attr('id')
           	          nodeObject_td._width='auto'
           	    	  nodeObject_td._height='auto'
           	    	  nodeObject_td.name=$(_td).attr('_name')
               	     _mainObject[$(_td).attr('id')]=nodeObject_td
        		 })
        		  var nodeObject_tr=new Object()
        		      nodeObject_tr.id=$(ntr).attr('id')
            	      nodeObject_tr._width='auto'
            	      nodeObject_tr._height='auto'
            	      nodeObject_tr.name=$(ntr).attr('_name')
                	 _mainObject[$(ntr).attr('id')]=nodeObject_tr
        		 $(target).append(ntr)
        	 }
        }
        }}} }
}


var v_TableCol=function(target){
	return   {"name": "列", "group": "属性", "value": ""+  $(target).attr('cols') +"","field": "TableCol", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('cols',newValue)
        var _rows=$(target).find('tr').size()
        var _cols=newValue-oldValue
        if ( _cols < 0) {
        	$(target).find('tr').each(function(i,tr){
        		$(tr).find('td').each(function(j,delete_td){
        			 
        			if(j>=newValue){
        			delete _mainObject[$(delete_td).attr('id')]
        			$(delete_td).remove()
        			}
        		})
        		//$(tr).find('td:gt('+(newValue)+')').remove()
        	})
        }else if(_cols > 0){
        	$(target).find('tr').each(function(i,tr){
        	
        	    for (var ii=0; $(tr).find('td').size()< newValue  ;ii++)	{
        	        var tdsize=$(tr).find('td').size();
        	    	var trid=$(tr).attr('id')
        	    	$(tr).append('<td id="'+trid+'_td_'+tdsize+'" _name="'+trid+'_td_'+tdsize+'" class="zujian">text</td>')
            		  var nodeObject_td=new Object()
      		 	      nodeObject_td.ID=trid+'_td_'+tdsize
         	          nodeObject_td.WIDTH='auto'
         	    	  nodeObject_td.HEIGHT='auto'
         	    	  nodeObject_td.NAME=trid+'_td_'+tdsize
             	     _mainObject[trid+'_td_'+tdsize]=nodeObject_td
        	    }
        	})
        }
        }}} }
}

var v_GridCol=function(target){
	return   {"name": "列", "group": "属性", "value": ""+  $(target).attr('cols') +"","field": "TableCol", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('cols',newValue)
        var _rows=$(target).find('tr').size()
        var _cols=newValue-oldValue
        if ( _cols < 0) {
        	$(target).find('tr').each(function(i,tr){
        		$(tr).find('td').each(function(j,delete_td){
        			 
        			if(j>=newValue){
        			delete _mainObject[$(delete_td).attr('id')]
        			$(delete_td).remove()
        			}
        		})
        		//$(tr).find('td:gt('+(newValue)+')').remove()
        	})
        }else if(_cols > 0){
        	$(target).find('tr').each(function(i,tr){
        	
        	    for (var ii=0; $(tr).find('td').size()< newValue  ;ii++)	{
        	        var tdsize=$(tr).find('td').size();
        	    	var trid=$(tr).attr('id')
        	    	$(tr).append('<td id="'+trid+'_td_'+tdsize+'" _name="'+trid+'_td_'+tdsize+'" class="grid">text</td>')
            		  var nodeObject_td=new Object()
      		 	      nodeObject_td.ID=trid+'_td_'+tdsize
         	          nodeObject_td.WIDTH='auto'
         	    	  nodeObject_td.HEIGHT='auto'
         	    	  nodeObject_td.NAME=trid+'_td_'+tdsize
             	     _mainObject[trid+'_td_'+tdsize]=nodeObject_td
        	    }
        	})
        }
        }}} }
}

var v_SelectItem=function( target ){
	 var _option=$(target).find('option')
	 var _optiontext=""
	 $(_option).each(function(i,k){
	    	if ($(k).attr('value')!=undefined ){
	    	_optiontext+=$(k).text()+","+$(k).attr('value')+'\n'
	    	}
	  })
  return { "name": "item", "group": "数据", "height":"100px", "value": ""+_optiontext+"","field": "SelectItem",
		     "editor": {  "type":"textbox",
		    	          "options": { "height":"100",  "multiline":true,
		    	           onChange:function(newValue,oldValue){
				   	      var _array=newValue.split('\n');
				   	      $(target).html('')
				   	      $.each(_array,function(i,k){
				   		    if (k!="" && k!=undefined ){
				   		      $(target).append('<option value='+k.split(',')[1]+'>'+k.split(',')[0]+'</option>')
				   		    }
				   	      })
     }}} }
}

  
    var v_GridQueryAction=function(target){
      return  { "name": "查询", "group": "动作", "value": "启用", "field": "GridQueryAction",editor:{type:'switchbutton',options:{ onText:'启用',offText:'禁用',onChange:function(checked){
	    	 
      }}}}
    }
    var v_GridUpdateAction=function(target){
  	  return  { "name": "修改", "group": "动作", "value": "启用", "field": "GridUpdateAction",editor:{type:'switchbutton',options:{ onText:'启用',offText:'禁用',onChange:function(){
	    	 
      }}}}
    }
    var v_GridAddAction=function(target){
  	  return  { "name": "添加", "group": "动作", "value": "启用", "field": "GridAddAction",editor:{type:'switchbutton',options:{ onText:'启用',offText:'禁用',onChange:function(){
	    	 
      }}}}
    }
    var v_GridDeleteAction=function(target){
  	  return  { "name": "删除", "group": "动作", "value": "启用", "field": "GridDeleteAction",editor:{type:'switchbutton',options:{ onText:'启用',offText:'禁用',onChange:function(){
	    	 
      }}}}
    }
//
    var form_method=function(target){
	    var node=_mainObject[$(target).attr('id')]
	    if(undefined==node){
	      node=new Object()
	  	  node['FORMATMETHOD']=$(target).attr('method')
	    }
		return { "name": "Method", "value": ""+node['FORMATMETHOD']+"", "group": "数据", "field": "position",
			"editor": { "type": 'combobox',
		                "options":  { "valueField": 'value',
		                	          "textField": 'name',
		        	                   onChange:function(newValue,oldValue){
		     	                           _mainObject[$(target).attr('id')]['FORMATMETHOD']=newValue
		     	                          $(target).attr('method',newValue)
		                             },
							         "data":[
							             {value:'POST',name:'POST'},
							             {value:'GET',name:'GET'}
							            ],
		                             "required": true}
		             }
     }
    }
    
    
    var form_DataSourceResponseType=function(target){
		   
	    var node=_mainObject[$(target).attr('id')]
	    var defvalue=node['LOADTYPE']==undefined?'AJAX':node['LOADTYPE']
	    if ( $(target).getDomOption().LOADTYPE==undefined ) {
	    	$(target).setDomOption({LOADTYPE:'AJAX'})
	     }
	    defvalue=$(target).getDomOption().LOADTYPE
		return { "name": "加载方式", "value": ""+defvalue+"", "group": "数据", "field": "LOADTYPE",
			"editor": { "type": 'combobox',
		                "options":  { "valueField": 'value',
		                	          "textField": 'name',
		        	                   onChange:function(newValue,oldValue){
		     	                           _mainObject[$(target).attr('id')]['LOADTYPE']=newValue
		     	                           $(target).attr('responsetype',newValue)
		     	                           $(target).setDomOption({LOADTYPE:newValue})
		     	                           
		                             },
							         "data":[
							             {value:'AJAX',name:'AJAX'},
							             {value:'HTTP',name:'HTTP'}
							            ],
		                             "required": true}
		             }
		   }
    }
    var form_SubmitType=function(target){
		   
	    var node=_mainObject[$(target).attr('id')]
	    var defvalue=node['DATASOURCERESPONSETYPE']==undefined?'HTTP':node['DATASOURCERESPONSETYPE']
	    if ( $(target).getDomOption().DATASOURCERESPONSETYPE==undefined ) {
	    	$(target).setDomOption({DATASOURCERESPONSETYPE:''})
	     }
	    defvalue=$(target).getDomOption().DATASOURCERESPONSETYPE
		return { "name": "提交方式", "value": ""+defvalue+"", "group": "数据", "field": "DATASOURCERESPONSETYPE",
			"editor": { "type": 'combobox',
		                "options":  { "valueField": 'value',
		                	          "textField": 'name',
		        	                   onChange:function(newValue,oldValue){
		     	                           _mainObject[$(target).attr('id')]['DATASOURCERESPONSETYPE']=newValue
		     	                         
		     	                           $(target).setDomOption({DATASOURCERESPONSETYPE:newValue})
		     	                           
		                             },
							         "data":[
							             {value:'AJAX',name:'AJAX'},
							             {value:'HTTP',name:'HTTP'}
							            ],
		                             "required": true}
		             }
		   }
    }
    var form_IsPage=function(target){
		   
	    var node=_mainObject[$(target).attr('id')]
	    var defvalue=node['PAGEFORM']==undefined?'0':node['PAGEFORM']
	    if ( $(target).getDomOption().PAGEFORM==undefined ) {
	    	$(target).setDomOption({PAGEFORM:'0'})
	     }
	    defvalue=$(target).getDomOption().PAGEFORM
		return { "name": "PAGEFORM", "value": ""+defvalue+"", "group": "数据", "field": "PAGEFORM",
			"editor": { "type": 'combobox',
		                "options":  { "valueField": 'value',
		                	          "textField": 'name',
		        	                   onChange:function(newValue,oldValue){
		     	                           _mainObject[$(target).attr('id')]['PAGEFORM']=newValue
		     	                           $(target).attr('pageform',newValue)
		     	                           $(target).find('[name!=""]').attr('pageform',newValue)
		     	                           $(target).setDomOption({PAGEFORM:newValue})
		     	                           
		                             },
							         "data":[
							             {value:'1',name:'是'},
							             {value:'0',name:'否'}
							            ],
		                             "required": true}
		             }
		   }
    }
    var form_handler=function(target){
	    var node=_mainObject[$(target).attr('id')]
	    
		return { "name": "生成方法", "value": ""+node['HANDLER']+"", "group": "数据", "field": "HANDLER"}
    }
    var form_action=function(target){
  	  var Change=function(newValue,oldValue){
			 
			$('.SelectDataSource_tb').find('A').linkbutton({
				onClick:function(){
					$('.combogrid-f').combogrid('grid').datagrid('reload');
				}
			})
			$('.SelectDataSource_tb').find('INPUT').textbox()
		  _mainObject[$(target).attr('id')]['DATASOURCE']= newValue

		  }
  	  var _toolbar ='<div class="SelectDataSource_tb"> '
		  _toolbar+='<input class="easyui-textbox" style="width:380px;height:32px">'
		  _toolbar+='<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="width:60px;height:32px" >查询</a>'
		  _toolbar+='</div>'
	 
    	var v_options={
		        toolbar:_toolbar,
	            panelWidth:450,
	            value:'001',
	            idField:'id',
	            textField:'comments',
	            //data:v_data,
	            url:path+'/ymwh/loadDataSource',
	            pagination: true,           //是否分页
	            rownumbers: true,           //序号
	            columns:[[
	                {field:'tablename',title:'表名',width:60},
	                {field:'comments',title:'备注',width:100},
	                {field:'url',title:'url',width:120},
	                {field:'id',title:'id',width:120}
	            ]],
                onChange:Change
	}
    	
    	
		  var node=_mainObject[$(target).attr('id')]
		        if(undefined==node){
		          node=new Object()
			  	  node['DATASOURCEURL']=$(target).attr('action')
			    }
  	  
  	if ( $(target).getDomOption().DATASOURCEURL==undefined ) {
    	$(target).setDomOption({DATASOURCEURL:$(target).attr('action')})
     }
  	var  defvalue=$(target).getDomOption().DATASOURCEURL
		     return { "name": "action", "group": "数据", "height":"100px", "value": ""+defvalue+"", "field": "DATASOURCEURL",
		         "editor":{ "type": 'combobox',  "options":  { "valueField": 'requesturl',
    				 "textField": 'methodname',
   				  onChange:function(newValue,oldValue){
   					 $(target).attr('action',newValue)
   					 $(target).setDomOption({DATASOURCEURL:newValue})
   					  _mainObject[$(target).attr('id')]['DATASOURCEURL']=newValue
   				 },
   				 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
   				  "required": true}
        }
     }
    	
  }
    
    var form_load=function(target){
    	  var Change=function(newValue,oldValue){
  			 
  			$('.SelectDataSource_tb').find('A').linkbutton({
  				onClick:function(){
  					$('.combogrid-f').combogrid('grid').datagrid('reload');
  				}
  			})
  			$('.SelectDataSource_tb').find('INPUT').textbox()
  		  _mainObject[$(target).attr('id')]['DATASOURCE']= newValue

  		  }
    	  var _toolbar ='<div class="SelectDataSource_tb"> '
  		  _toolbar+='<input class="easyui-textbox" style="width:380px;height:32px">'
  		  _toolbar+='<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="width:60px;height:32px" >查询</a>'
  		  _toolbar+='</div>'
  	 
      	var v_options={
  		        toolbar:_toolbar,
  	            panelWidth:450,
  	            value:'001',
  	            idField:'id',
  	            textField:'comments',
  	            //data:v_data,
  	            url:path+'/ymwh/loadDataSource',
  	            pagination: true,           //是否分页
  	            rownumbers: true,           //序号
  	            columns:[[
  	                {field:'tablename',title:'表名',width:60},
  	                {field:'comments',title:'备注',width:100},
  	                {field:'url',title:'url',width:120},
  	                {field:'id',title:'id',width:120}
  	            ]],
                  onChange:Change
  	}
      	
      	
  		  var node=_mainObject[$(target).attr('id')]
  		        if(undefined==node){
  		          node=new Object()
  			  	  node['DATASOURCERESULT']=$(target).attr('action')
  			    }
    	  if ( $(target).getDomOption().FORMLOADURL==undefined ) {
  	    	$(target).setDomOption({FORMLOADURL:''})
  	       }
    	  
  		     return { "name": "load", "group": "数据", "height":"100px", "value": ""+ $(target).getDomOption().FORMLOADURL+"", "field": "FORMLOADURL",
  		         "editor":{ "type": 'combobox',  "options":  { "valueField": 'requesturl',
      				 "textField": 'methodname',
     				  onChange:function(newValue,oldValue){
     					 $(target).setDomOption({FORMLOADURL:newValue})
     					  _mainObject[$(target).attr('id')]['FORMLOADURL']=newValue
     				 },
     				 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
     				  "required": true}
          }
       }
      	
    }
//
    //==========================================================
    var Validformdatatype=function(target){
    var node=_mainObject[$(target).attr('id')]
    
  	  return  { "name": "验证方式", "group": "表单验证", "value": ""+$(target).attr('datatype')+"", "field": "datatype","editor":{"type":"combobox" ,"options": {
			"valueField": '_value', "textField": '_name',
			"data":[{_value:'*',_name:'任何字符',ctipcmsg:'任何字符',nullmsg:'不可为空',errormsg:''},
		            {_value:'n',_name:'数字类型',ctipcmsg:'数字类型',nullmsg:'不可为空',errormsg:'请输入数字'},
		            {_value:'s',_name:'字符类型',ctipcmsg:'字符类型',nullmsg:'不可为空',errormsg:'请输入字符'},
		            {_value:'zh',_name:'中文字符',ctipcmsg:'中文字符',nullmsg:'不可为空',errormsg:'只能输入中文'},
		            {_value:'p',_name:'验证是否为邮政编码',ctipcmsg:'验证是否为邮政编码',nullmsg:'不可为空',errormsg:'邮政编码格式错误'},
		            {_value:'m',_name:'手机号码格式',ctipcmsg:'手机号码格式',nullmsg:'不可为空',errormsg:'手机号码格式错误'},
		            {_value:'e',_name:'email格式',ctipcmsg:'email格式',nullmsg:'不可为空',errormsg:'Email格式错误'},
		           ],"required":true,
		          onChange:function(newValue,oldValue){
		          var thisdata=$(this).combobox('options').data
		          var ndata=$.grep(thisdata,function(d,i){
		        	  return d._value==newValue
		          })
		          
		          if(newValue=='n'|| newValue=='s'){
		        	var len =  $('#pg').propertygrid('getFieldValue','validlength')
		        		newValue=newValue+len
		          }
		          $('#pg').propertygrid('setFieldValue', ndata[0])
		          $.each(['ctipcmsg','nullmsg','errormsg'],function(i,k){
		        	  $(target).attr(k,ndata[0][k])
		          })
		          $(target).attr('datatype',newValue)
	 }}}}
    }
    var ValidformNullmsg=function(target){
  	  var node=_mainObject[$(target).attr('id')]
  	  return  { "name": "为空提示", "group": "表单验证", "value": ""+$(target).attr('nullmsg')+"", "field": "nullmsg","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
  	    $(target).attr('nullmsg',newValue)
  	     
  	  }}}}
  }
    
    var ValidformErrormsg=function(target){
    	  var node=_mainObject[$(target).attr('id')]
    	  return  { "name": "错误提示", "group": "表单验证", "value": ""+$(target).attr('errormsg')+"", "field": "errormsg","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    	    $(target).attr('errormsg',newValue)
    	     
    	  }}}}
    }
    var Validformsucmsg =function(target){
    	var node=_mainObject[$(target).attr('id')]
    	return  { "name": "通过提示", "group": "表单验证", "value": ""+$(target).attr('sucmsg')+"", "field": "sucmsg","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    		$(target).attr('sucmsg',newValue)
    		
    	}}}}
    }
    var Validformctipcmsg =function(target){
    	var node=_mainObject[$(target).attr('id')]
    	return  { "name": "验证提示", "group": "表单验证", "value": ""+$(target).attr('ctipcmsg')+"", "field": "ctipcmsg","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    		$(target).attr('ctipcmsg',newValue)
    	}}}}
    }
    var ValidforLength =function(target){
    	var node=_mainObject[$(target).attr('id')]
    	return  { "name": "长度", "group": "表单验证", "value": ""+$(target).attr('validlength')+"", "field": "validlength","editor": {"type":"numtonum" ,"options": { onChange:function(newValue,oldValue){
    
    		var datatype=$('#pg').propertygrid('getFieldValue','datatype').substring(0,2)
    	    var datatype2=$('#pg').propertygrid('getFieldValue','datatype').substring(0,1)
    	    
    		if (newValue=='false'){
    	    	if(datatype=='zh'   ){
    	    		$('#pg').propertygrid('setFieldValue',{'datatype':datatype})
    	    		$(target).attr('datatype',datatype )
    	    	} else if(datatype2=='s' || datatype2=='n' ){
    	    		$('#pg').propertygrid('setFieldValue',{'datatype':datatype2})
    	    		$(target).attr('datatype',datatype2 )
    	    	}
    	    }else{
    	    	
    	    	if(datatype=='zh'   ){
    	    		$('#pg').propertygrid('setFieldValue',{'datatype':datatype+newValue})
    	    		$(target).attr('datatype',datatype+newValue )
    	    	}else if (  datatype2=='s' ||datatype=='n' ){
    	    		$('#pg').propertygrid('setFieldValue',{'datatype':datatype2+newValue})
    	    		$(target).attr('datatype',datatype2+newValue )
    	    		
    	    	}
    	    }
    		
    		$(target).attr('validlength',newValue)
  	  }}}}
    }
   