var down_loadfrom
plfileupload= function(param,callback) {

	//添加等待层--开始
	//var StrWait;
	//StrWait ='<div id="PleaseWait" style="display:none;">';
	//StrWait+='  <img src="'+getRootPath()+'images/common/loading.gif" />';
	
	//StrWait+='</div>';
	//StrWait+='<div id="setting"></div>';
	//$('body').append(StrWait);

	var tj=callback;

	
//=================================================================================
	
	var loadupload=function(){ 
		var downfiles = param.downfiles
		$.each(downfiles,function(i,v){

			$('#uploader_filelist').append(''
					+ '<li id="abc" class="file_delete">'
					+ '  <div class="plupload_file_name">'
					+ '    <span><a id="a_'+i+'n" href="javascript:void(0);" onclick="javascript:downfile(\''+v.xsmc+'\',\''+v.cclj+'\',\''+v.scr+'\',\''+v.ccm+'\');return false;" style="background: none;">'+v.xsmc+'</a></span>'
					+ '  </div>'
					+ '  <div class="plupload_file_action">'
					+ '    <a id="a_'+i+'" filenames="'+v.fjid+'" href="javascript:void(0);" style="display: block;" title="删除/恢复已有文件"></a>'
					+ '  </div>'
					+ '  <div class="plupload_file_status">&nbsp;</div>'
					+ '  <div class="plupload_file_size">&nbsp;</div>'
					+ '  <div class="plupload_clearer">&nbsp;</div>'
					+ '</li>');	

		 })

 
        down_loadform=$('<form>').attr({
		   action:''+param.url+'/upload/downFile',
		   method:'post',
		   name:"down_loadform",
		   id:"down_loadform"
	    })
	    down_loadform.appendTo(document.body)

   
		$('#abc').find('a[filenames]').live('click',function(){
			var bing = $(this).parent().parent();
			if($(bing).attr('class')=='file_delete'){
				$(bing).attr('class','file_change');
				$('#'+$(this).attr('id')+'n').css("text-decoration","line-through");
				$('#'+$(this).attr('id')+'n').attr('href',"javascript:void(0)");

				var del_fjs=$('<input>').attr({
					name:'del_fjs',
					type:'hidden',
					id:$(this).attr('id')+'_input',
					value:$(this).attr('filenames')
				})
				$(del_fjs).appendTo($('#'+param.formId));
			}else{    
				$('#'+$(this).attr('id')+'n').css("text-decoration","none");
				$(bing).attr('class','file_delete');
				$('#'+$(this).attr('id')+'_input').remove();
			}
		})
	}
	
//====================================================================================
	
	
	
	
	$("#uploader").pluploadQueue({
		// General settings
		runtimes : 'gears,html5,flash,silverlight,browserplus',
		url : ''+param.url+'/upload/fileUpload/'+param.savePath,
 		savePath : '', 
		max_file_size : ( param.max_file_size || '1000mb' ), //单个文件最大限制
		unique_names : true,
		chunk_size: '2mb',
		dragdrop:true,
		// Specify what files to browse for
		filters : ( param.filters|| 
		[ 
		           {title : "全部可上传类型", extensions : "jpg,jpeg,png,gif,doc,docx,xls,xlsx,ppt,pptx,txt,pdf,zip,rar,7z,mp3,mp4,wma,wmv,avi,flv,swf,mpg,mpeg"},
		           {title : "图片", extensions : "jpg,jpeg,png,gif"},
		           {title : "文档", extensions : "doc,docx,xls,xlsx,ppt,pptx,txt,pdf"},
		           {title : "压缩文件", extensions : "zip,rar,7z"},
		           {title : "多媒体", extensions : "mp3,mp4,wma,wmv,avi,flv,swf,mpg,mpeg"}
		]) ,
		// Flash settings
		flash_swf_url : ''+param.url+'/resources/js/plupload/plupload.flash.swf',
		loaduploadfiles : function(){ loadupload() },
		// Silverlight settings
		silverlight_xap_url : ''+param.url+'/resources/js/plupload/plupload.silverlight.xap'
		
	});
  
   


    $('#'+param.buttonId).click(function(e) {
        if(Validator.Validate($('#'+param.formId)[0],3)){
	        var uploader = $('#uploader').pluploadQueue();
	        if (uploader.files.length > 0){
	        //	var sl=param.max_file_length();
	        	if (uploader.files.length <=param.max_file_length-wjsl()){

	        		//请等待层
	        		BOX_show('PleaseWait');
	        		
	        		//$(this).attr('disabled','disabled');
	        		//$('#'+param.buttonId).attr('disabled','disabled');
	        		uploader.bind('StateChanged', function(result) {
	        			if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
	        				tj();
	        			}
	        		});
	        		uploader.start();
	        		BOX_remove('PleaseWait');
	        	}else{
	        		alert("超过最大上传文件数量");
	        	}
	        } else {
        		//请等待层
        		BOX_show('PleaseWait');
        		//$(this).attr('disabled','disabled');
 	        	tj();
	        	//alert('请先上传数据文件.');
 	        	BOX_remove('PleaseWait');
	        }
	        return false;
        }
    });
};


/**
 * 下载文件
 * @param XSM  显示文件名
 * @param CCLJ 路径
 * @param CCM 存储文件名
 */
function  downfile( XSMC ,CCLJ,SRC ,CCM ){
	alert(XSMC);
	$(down_loadform).html("");
	$("#down_loadform").append("<input type=hidden name=filename  value='"+XSMC+"'  />");
	$("#down_loadform").append("<input type=hidden name=inputPath  value='"+CCLJ+'/'+SRC+'/'+CCM+"'  />");
    document.down_loadform.submit();
}

var   wjsl=function(){
	return $('.file_delete').size()
}


function getRootPath(){
 var pathName = window.location.pathname.substring(1);
 var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
 return window.location.protocol + '//' + window.location.host + '/'+ webName + '/';
}




//===========================================================================================

 