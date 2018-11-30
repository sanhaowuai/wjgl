//显示

function BOX_show(e) 
{  
    if(document.getElementById(e)==null){return;}
    BOX_layout(e);
    window.onresize = function(){BOX_layout(e);} //改变窗体重新调整位置
    window.onscroll = function(){BOX_layout(e);} //滚动窗体重新调整位置

}

//移除
function BOX_remove(e)
{   

    window.onscroll = null;
    window.onresize = null;
    document.getElementById('BOX_overlay').style.display="none";
    document.getElementById(e).style.display="none"; 

    var PopTagSelect=document.getElementsByTagName("select");//兼容ie6,显示所有select
    for(i=0;i<PopTagSelect.length;i++){
        PopTagSelect[i].style.display="";
    }
}

//调整布局
function BOX_layout(e)
{
    var a = document.getElementById(e);
    
    //判断是否新建遮掩层
    if (document.getElementById('BOX_overlay')==null)
    { 
        var overlay = document.createElement("div");
        overlay.setAttribute('id','BOX_overlay');
        a.parentNode.appendChild(overlay);
    }
 
    //取客户端左上坐标，宽，高
    var scrollLeft = (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    var scrollTop = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    var clientWidth = document.documentElement.clientWidth;
    var clientHeight = document.documentElement.clientHeight;
    var bo = document.getElementById('BOX_overlay');
    bo.style.left = scrollLeft+'px';
    bo.style.top = scrollTop+'px';
    bo.style.width = clientWidth+'px';
    bo.style.height = clientHeight+'px';
    bo.style.display="";
    
    //Popup窗口定位
    a.style.position = 'absolute';
    a.style.zIndex=98;
    a.style.display="";
    a.style.background = "#ffffff";
 
    
    document.getElementById('setting').style.display="block";
    a.style.left = ((document.documentElement.clientWidth - a.clientWidth) / 2) + "px";
    var top = (parseInt((document.documentElement.clientHeight - a.clientHeight - 200) / 2));
    top = parseInt((document.documentElement.clientHeight - a.clientHeight - 200) / 2);  
    if(top <=0)
        top = 20;

    //chrome采用body.scrollTop
  	if(document.documentElement && document.documentElement.scrollTop){
  		top += document.documentElement.scrollTop;
  	}else{
  		top += document.body.scrollTop;
  	}

  	a.style.top = top + "px";
}

 //================
 //显示
function BOX_show1(e) 
{    
    if(document.getElementById(e)==null){return;}
    BOX_layout1(e);
    window.onresize = function(){BOX_layout1(e);} //改变窗体重新调整位置
    window.onscroll = function(){BOX_layout1(e);} //滚动窗体重新调整位置 
}

//移除
function BOX_remove1(e)
{  
    window.onscroll = null;
    window.onresize = null;
    document.getElementById('BOX_overlay01').style.display="none";
    document.getElementById(e).style.display="none"; 

    var PopTagSelect=document.getElementsByTagName("select");//兼容ie6,显示所有select
    for(i=0;i<PopTagSelect.length;i++){
        PopTagSelect[i].style.display="";
    }
}

//调整布局
function BOX_layout1(e)
{ 
    var a = document.getElementById(e);
    
    //判断是否新建遮掩层
    if (document.getElementById('BOX_overlay01')==null)
    { 
        var overlay = document.createElement("div");
        overlay.setAttribute('id','BOX_overlay01');
        a.parentNode.appendChild(overlay);
    }
 
    //取客户端左上坐标，宽，高
    var scrollLeft = (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    var scrollTop = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    var clientWidth = document.documentElement.clientWidth;
    var clientHeight = document.documentElement.clientHeight;
    var bo = document.getElementById('BOX_overlay01');
    bo.style.left = scrollLeft+'px';
    bo.style.top = scrollTop+'px';
    bo.style.width = clientWidth+'px';
    bo.style.height = clientHeight+'px';
    bo.style.display="";
    
    //Popup窗口定位
    a.style.position = 'absolute';
    a.style.zIndex=100;
    a.style.display="";
    a.style.background = "#ffffff";
 
    
    document.getElementById('setting').style.display="block";
    a.style.left = ((document.documentElement.clientWidth - a.clientWidth) / 2) + "px";
    var top = (parseInt((document.documentElement.clientHeight - a.clientHeight - 200) / 2));
    top = parseInt((document.documentElement.clientHeight - a.clientHeight - 200) / 2);  
    if(top < 0)
        top = 20;
    
    //chrome采用body.scrollTop
  	if(document.documentElement && document.documentElement.scrollTop){
  		top += document.documentElement.scrollTop;
  	}else{
  		top += document.body.scrollTop;
  	}

  	a.style.top = top + "px";
}
