<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>断点上传</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/wjgl/css/webuploader.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        .table>tbody>tr>td .file-progress.progress-striped{
            height:8px;background: #CCC;
        }
        .btn-box-sub{
            display: inline-block;
            vertical-align: top;
            margin: 0 3px;
            padding: 0;
            border: 0;
            width:60px;
            height:25px;
            text-align: center;
            line-height: 25px;
            background: #429fd7;
            font-size: 14px;
            color:#fff;
            text-decoration: none;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
        .btn-box-sub:hover{
            background: #389bd7;
            color:#fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div id="uploadfile">
    <div id="picker" >选择文件</div>
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list">
        <table class="table" border="1" style="border: 1px solid #ccc;" cellpadding="0" cellspacing="0" width="100%">
            <tr class="filelist-head">
                <th class="file-name">名称</th>
                <th class="file-size">大小</th>
                <th width="20%" class="file-pro">进度</th>
                <th class="file-status">状态</th>
                <th width="10%" class="file-manage">操作</th>
            </tr>
        </table>
    </div>
    <div id="ctlBtn" class="btn btn-default">开始上传</div>
    <div id="stopBtn" class="btn btn-default">暂停上传</div>
</div>
<!--引入JS-->
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/wjgl/js/webuploader.min.js"></script>
<script>
    var queryLikeFlag = 1;
    $(function(){
        //上传 start
        var $list = $('#thelist .table'),
            $btn = $('#ctlBtn');
        var chunkSize = 5 * 1024 * 1024;


        // HOOK 这个必须要再uploader实例化前面
        WebUploader.Uploader.register({
            'before-send-file': 'beforeSendFile',
            'before-send': 'beforeSend'
        }, {
            beforeSendFile: function (file) {
                console.log("beforeSendFile");
                // Deferred对象在钩子回掉函数中经常要用到，用来处理需要等待的异步操作。
                var task = new $.Deferred();
                // 根据文件内容来查询MD5
                uploader.md5File(file).progress(function (percentage) {   // 及时显示进度
                    /*console.log('计算md5进度:', percentage);
                    getProgressBar(file, percentage, "MD5", "MD5");*/
                }).then(function (val) { // 完成
                    console.log('md5 result:', val);
                    file.md5 = val;
                    // 模拟用户id
                    // file.uid = new Date().getTime() + "_" + Math.random() * 100;
                    //file.uid = WebUploader.Base.guid();
                    // 进行md5判断
                    /*$.post("index/checkFileMd5", {uid: file.uid, md5: file.md5},*/
                    $.post("checkFileMd5", {md5: file.md5},
                        function (data) {
                            console.log(data.status);
                            var status = data.status.value;
                            task.resolve();
                            if (status == 101) {
                                // 文件不存在，那就正常流程
                            } else if (status == 100) {
                                queryLikeFlag=1;
                                //标识100%
                                $( '#'+file.id ).find('.file-pro').text('文件已存在，无需上传！');
                                // 忽略上传过程，直接标识上传成功；
                                uploader.skipFile(file);
                                file.pass = true;
                            } else if (status == 102) {
                                // 部分已经上传到服务器了，但是差几个模块。
                                file.missChunks = data.data;
                            }
                        });
                });
                return $.when(task);
            },
            beforeSend: function (block) {
                console.log("block")
                var task = new $.Deferred();
                var file = block.file;
                var missChunks = file.missChunks;
                var blockChunk = block.chunk;
                console.log("当前分块：" + blockChunk);
                console.log("missChunks:" + missChunks);
                if (missChunks !== null && missChunks !== undefined && missChunks !== '') {
                    var flag = true;
                    for (var i = 0; i < missChunks.length; i++) {
                        if (blockChunk == missChunks[i]) {
                            console.log(file.name + ":" + blockChunk + ":还没上传，现在上传去吧。");
                            flag = false;
                            break;
                        }
                    }
                    if (flag) {
                        task.reject();
                    } else {
                        task.resolve();
                    }
                } else {
                    task.resolve();
                }
                return $.when(task);
            }
        });


        var uploader = WebUploader.create({
            formData: {
                uid: 0,
                md5: '',
                chunkSize: chunkSize
            },
            resize: false, // 不压缩image
            swf: 'wjgl/js/Uploader.swf',
            chunked: true,
            chunkSize: chunkSize, // 字节 5M分块
            threads: 3,
            //server: 'wjglindex/fileUpload',
            pick: '#picker', // 选择文件的按钮。可选
            server: 'fileUpload',
            auto: false,//设置了自动上传的情况下无法分片上传
            disableGlobalDnd: true,// 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            fileNumLimit: 1024,
            fileSizeLimit: 1024*1024 * 1024 * 1024,    // 1T 总文件大小（列表中的）
            fileSingleSizeLimit: 5*1024 * 1024 * 1024,    // 5G单个文件大小
            duplicate: false, //是否支持重复上传
            chunkRetry : 1 //如果某个分片由于网络问题出错，允许自动重传次数
            //pick: { id:'#picker', multiple:false }//单选
        });
        // 当有文件被添加进队列的时候
        uploader.on( 'fileQueued', function( file ) {
            //调整开始上传按钮状态
            $("#ctlBtn").attr("disabled",false);
            var temp = (file.size/1024/1024).toFixed(1);
            var tempStr = '';
            if(temp==0){
                tempStr = (file.size/1024).toFixed(1)+'KB';
            }else{
                tempStr = (file.size/1024/1024).toFixed(1)+'M';
            }
/*
            $list.append('<tr id="'+ file.id +'" class="file-item">'+'<td class="file-name">'+ file.name +'</td>'+ '<td width="20%" class="file-size">'+tempStr+'</td>' +'<td width="20%" class="file-pro">0%</td>'+'<td class="file-status">等待上传</td>'+'<td width="20%" class="file-manage"><a class="stop-btn btn-box-sub" href="javascript:;">暂停</a><a class="remove-this btn-box-sub" href="javascript:;">取消</a></td>'+'</tr>');
*/
            $list.append('<tr id="'+ file.id +'" class="file-item">'+'<td class="file-name">'+ file.name +'</td>'+ '<td width="20%" class="file-size">'+tempStr+'</td>' +'<td width="20%" class="file-pro">0%</td>'+'<td class="file-status">等待上传</td>'+'<td width="10%" class="file-manage"><a class="remove-this btn-box-sub" href="javascript:;">取消</a></td>'+'</tr>');
            //暂停上传的文件
            /*$list.on('click','.stop-btn',function(){
                $("#ctlBtn").attr("disabled",false);
                uploader.stop(true);
            })*/
            //删除上传的文件,取消时，只删除未上传完成的文件，已经上传的不删除
            $list.on('click','.remove-this',function(){
                queryLikeFlag=0;
                if ($(this).parents(".file-item").attr('id') == file.id) {
                    uploader.removeFile(file);
                    $(this).parents(".file-item").remove();
                    //删除后台数据
                    if(file.md5 != undefined){
                        $.ajax({
                            url : '<%=path%>/wjglindex/deleteDb',
                            type : 'POST',
                            data : {"md5":file.md5},
                            dataType:'JSON',
                            success : function(responseStr) {
                            }
                        });
                    }
                }
            })
        });

        //重复添加文件
        var timer1;
        uploader.onError = function(code){
            clearTimeout(timer1);
            timer1 = setTimeout(function(){
                //layer.msg('该文件已存在');
            },250);
        }


        // 文件上传过程中创建进度条实时显示
        uploader.on( 'uploadProgress', function( file, percentage ) {
            //$("td.file-pro").text("");
            $( '#'+file.id ).find('.file-pro').text("");
            var $li = $( '#'+file.id ).find('.file-pro'),
                $percent = $li.find('.file-progress .progress-bar');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="file-progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>' + '<div class="per">0%</div>').appendTo( $li ).find('.progress-bar');
            }

            $li.siblings('.file-status').text('上传中');
            $li.find('.per').text((percentage * 100).toFixed(2) + '%');

            $percent.css( 'width', percentage * 100 + '%' );
        });
        // 文件上传成功
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).find('.file-status').text('已上传');
            queryLikeFlag=1;
        });

        // 文件上传失败，显示上传出错
        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).find('.file-status').text('上传出错');
        });
        // 完成上传完后将视频添加到视频列表，显示状态为：转码中
        uploader.on( 'uploadComplete', function( file ) {
            // $( '#'+file.id ).find('.file-progress').fadeOut();
        });
        //当某个文件的分块在发送前触发，主要用来询问是否要添加附带参数，大文件在开起分片上传的前提下此事件可能会触发多次。
        uploader.onUploadBeforeSend = function (obj, data) {
            console.log("onUploadBeforeSend");
            var file = obj.file;
            data.md5 = file.md5 || '';
            data.uid = file.uid;
        };

        $btn.on('click', function () {

            if(uploader.getFiles().length==0){
                alert("请选择上传文件！");
                return false;
            }
            uploader.upload();
            $(this).attr("disabled",true);
            $("#stopBtn").attr("disabled",false);
        });
        //暂停上传的文件
        $("#stopBtn").on('click',function(){

            if(uploader.getFiles("progress").length==0){
                alert("请开始上传文件！");
                return false;
            }

            $("#ctlBtn").attr("disabled",false);
            uploader.stop(true);
            $(this).attr("disabled",true);
        })
        uploader.on( 'uploadFinished', function( file ) {
            //上传成功的个数，若是仅仅只是取消，则不刷新
            /*if(uploader.getFiles("complete").length>0){
                //parent.querylike();
            }*/
            if(queryLikeFlag==1){
                parent.querylike();
            }
        })
    })
</script>
</body>
</html>