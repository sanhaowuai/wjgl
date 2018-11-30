jsPlumb.ready(function() {  
	    jsPlumb.importDefaults({  
		    DragOptions : { cursor: 'pointer'}, // 拖动时鼠标停留在该元素上显示指针，通过 css 控制
		    PaintStyle : { strokeStyle:'#666' },// 元素的默认颜色
		    EndpointStyle : { width:20, height:16, strokeStyle:'#666' },// 连接点的默认颜色
		    Endpoint : "Rectangle",// 连接点的默认形状
		    Anchors : ["TopCenter"]// 连接点的默认位置
		});  
		var exampleDropOptions = {  
		    hoverClass:"dropHover",// 释放时指定鼠标停留在该元素上使用的 css class
		    activeClass:"dragActive"// 可拖动到的元素使用的 css class
		}; 
		var color1 = "#316b31"; 
        var exampleEndpoint1 = {               
			     endpoint:["Dot", { radius:11 }],// 设置连接点的形状为圆形  
		         paintStyle:{ fillStyle:color1 },// 设置连接点的颜色  
			     isSource:true,  // 是否可以拖动（作为连线起点）   
			     scope:"green dot",// 连接点的标识符，只有标识符相同的连接点才能连接   
			     connectorStyle:{ strokeStyle:color1, lineWidth:6 },// 连线颜色、粗细   
			     connector: ["Bezier", { curviness:63 } ],// 设置连线为贝塞尔曲线   
			     maxConnections:1,// 设置连接点最多可以连接几条线   
			     isTarget:true,  // 是否可以放置（作为连线终点）   
			     dropOptions : exampleDropOptions// 设置放置相关的css   
			  };  
	     var color2 = "rgba(229,219,61,0.5)";   
	     var exampleEndpoint2 = {   
			      endpoint:"Rectangle",   //设置连接点的形状为矩形   
			      anchor:"BottomLeft",    //设置连接点的位置，左下角   
			      paintStyle:{ fillStyle:color2, opacity:0.5 },   //设置连接点的颜色、透明度   
			      isSource:true,  //同上   
			      scope:'yellow dot', //同上   
			      connectorStyle:{ strokeStyle:color2, lineWidth:4},//同上   
			      connector : "Straight", //设置连线为直线   
			      isTarget:true,  //同上   
			      maxConnections:3,//同上   
			      dropOptions : exampleDropOptions,//同上   
			      beforeDetach:function(conn) {   //绑定一个函数，在连线前弹出确认框   
			          return confirm("Detach connection?");   
			      },   
			      onMaxConnections:function(info) {//绑定一个函数，当到达最大连接个数时弹出提示框   
			          alert("Cannot drop connection " + info.connection.id + " : maxConnections has been reached on Endpoint " + info.endpoint.id);   
			      }   
		  };
		 var anchors = [[1, 0.2, 1, 0], [0.8, 1, 0, 1], [0, 0.8, -1, 0], [0.2, 0, 0, -1] ],   
		      maxConnectionsCallback = function(info) {   
		          alert("Cannot drop connection " + info.connection.id + " : maxConnections has been reached on Endpoint " + info.endpoint.id);   
		      };   
		 var  e1 = jsPlumb.addEndpoint("state2", { anchor:"LeftMiddle" }, exampleEndpoint1);//将exampleEndpoint1类型的点绑定到id为state2的元素上   
		      e1.bind("maxConnections", maxConnectionsCallback);//也可以在加到元素上之后绑定函数 
		      jsPlumb.addEndpoint("state1", exampleEndpoint1);//将exampleEndpoint1类型的点 绑定到id为state1的元素上   
		      jsPlumb.addEndpoint("state3", exampleEndpoint2);//将exampleEndpoint2类型的点绑定到id为state3的元素上   
		      jsPlumb.addEndpoint("state1", {anchor:anchors}, exampleEndpoint2);//将exampleEndpoint2类型的点绑定到id为state1的元素上，指定活动连接点   
       
});