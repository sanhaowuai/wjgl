var ZuJianHtmlCreate=function(t){
	 var key=getIdName()
     var keyName='N'+key
     key='ID'+key
	 var  nodeObject=new Object()
	 nodeObject.ID=key
	 nodeObject.WIDTH='auto'
	 nodeObject.HEIGHT='auto'
	 nodeObject.NAME=keyName
	 nodeObject.DOMTYPE=t
	 _mainObject[key]=nodeObject
	
	 
 
    this.setName=function(name){
		 nodeObject.NAME=name
		 
	}
	this.input=function(type){
		if("button"==type){
			return $('<input id="'+key+'" _width=auto _height=auto name="'+keyName+'" class="  zujian" type="'+type+'"></input>').css("float","left")
		}else{
			return $('<input id="'+key+'" _width=auto _height=auto name="'+keyName+'" class="zujian  " type="'+type+'"></input>').css("float","left")
		}
	}
	
    
	
	this.textarea=function(){
		
		return $('<textarea id="'+key+'"_width=auto _height=auto   name="'+keyName+'" class="zujian"   ></textarea>').css("float","left")
	}
	this.select=function(){
		
		return $('<select  _DomOption={}  id="'+key+'" _width=auto _height=auto  name="'+key+'"  class="zujian"  style="border:solid 1px #444444;" ><option>--请选择--</option></select> ').css("float","left")
	}
	
	this.label=function(){
		
		return $(' <label id="'+key+'" _DomOption={} class="zujian"  for=" "   > aaaa</label> ' ).css("float","left")
	}
	
	this.panle=function(){
		
		return $('<div id="'+key+'" name="'+keyName+'" class="layoutTarget"  _width=300px _height=80px style="width:300px ;height:80px;   float:left;border:dashed 1px #000"></div>')
	
	}
	this.layoutpanle1=function(){
		var _div1id=getIdName();
    	var _div1Name='N'+_div1id
    	_div1id='ID'+_div1id
        var layoutpanle=$('<div id="'+_div1id+'" _name="'+_div1Name+'" class="layoutTarget"  _width=1000px _height=800px style="width:1000px ;height:800px;  margin: 0 auto; float:left;border:dashed 1px #000"></div>')
    	    var nodeObject_div1=new Object()
                nodeObject_div1.ID=_div1id
                nodeObject_div1.WIDTH='auto'
        	    nodeObject_div1.HEIGHT='auto'
        		nodeObject_div1.NAME=_div1Name
        	    _mainObject[_div1id]=nodeObject_div1
       	var _div2id=getIdName();
       	var _div2Name='N'+_div2id
       	_div2id='ID'+_div2id
        $(layoutpanle).append('<div id="'+_div2id+'" name="'+_div2Name+'" class="layoutTarget"  _width=1000px _height=120px style="width:1000px ;overflow:inherit;height:120px ;border:dashed 1px #000"></div>')
   	    var nodeObject_div2=new Object()
            nodeObject_div2.ID=_div2id
            nodeObject_div2.WIDTH='auto'
       	    nodeObject_div2.HEIGHT='auto'
       		nodeObject_div2.NAME=_div2Name
    	    _mainObject[_div2id]=nodeObject_div2
    	    
           	var _div3id=getIdName();
           	var _div3Name='N'+_div3id
           	_div3id='ID'+_div3id
            $(layoutpanle).append('<div id="'+_div3id+'" name="'+_div3Name+'" class="layoutTarget"  _width=120px _height=100% style="width:120px ;float:left;height:100% ;border:dashed 1px #000"></div>')
    	var nodeObject_div3=new Object()
            nodeObject_div3.ID=_div3id
            nodeObject_div3.WIDTH='auto'
       	    nodeObject_div3.HEIGHT='auto'
       		nodeObject_div3.NAME=_div3Name
    	    _mainObject[_div3id]=nodeObject_div3
            
            
           	var _div4id=getIdName();
           	var _div4Name='N'+_div4id
           	_div4id='ID'+_div4id
            $(layoutpanle).append('<div id="'+_div4id+'" name="'+_div4Name+'" class="layoutTarget"  _width=876px _height=100% style="width:876px ;float:left;height:100% ;border:dashed 1px #000"></div>')
    	    var nodeObject_div4=new Object()
            nodeObject_div4.ID=_div4id
            nodeObject_div4.WIDTH='auto'
       	    nodeObject_div4.HEIGHT='auto'
       		nodeObject_div4.NAME=_div4Name
    	    _mainObject[_div4id]=nodeObject_div4
    	    return layoutpanle
	}
	
	
	   
	this.panletable=function(){
    	var _tableId=key
        var table=$('<table rows="1" cols="2" class="zujian panletable" id="table_'+_tableId+'" name="table_'+_tableId+'"  border="1" ></table>')
         var nodeObject_table=new Object()
    	     nodeObject_table.ID='table_'+_tableId
    	     nodeObject_table.WIDTH='auto'
    		 nodeObject_table.HEIGHT='auto'
    		 nodeObject_table.NAME='table_'+_tableId
        	 _mainObject['table_'+_tableId]=nodeObject_table
                for(var i=0 ;i<=1 ;i++){
                	var $tr=$('<tr   class="zujian" id="table_'+_tableId+'_tr_'+i+'" _name="table_'+_tableId+'_tr_'+i+'" ></tr>')
                	var Object_tr=new Object()
                		Object_tr.ID='table_'+_tableId+'_tr_'+i+''
                	 	Object_tr.WIDTH='auto'
                		Object_tr.HEIGHT='auto'
                		Object_tr.NAME='table_'+_tableId+'_tr_'+i+''
                	    _mainObject['table_'+_tableId+'_tr_'+i+'']=Object_tr
                	    for(var j=0 ;j<=1 ;j++){
                	    	var $td=$('<td class="zujian grid " id="table_'+_tableId+'_tr_'+i+'_td_'+j+'" _name="table_'+_tableId+'_tr_'+i+'_td_'+j+'" >text</td>')
                	    	var Object_td=new Object()
                	    	Object_td.ID='table_'+_tableId+'_tr_'+i+'_td_'+j+''
                	    	Object_td.WIDTH='auto'
                	    	Object_td.HEIGHT='auto'
                	    	Object_td.NAME='table_'+_tableId+'_tr_'+i+'_td_'+j+''
                    	    _mainObject['table_'+_tableId+'_tr_'+i+'_td_'+j+'']=Object_td
                    	    $tr.append($td)
                	    }
                   $(table).append($tr)
                }
    	return table
	}
	this.gridtable=function(){
		var _tableId=key
        var grid=$('<table rows="1" _DomOption={} cols="2" class="grid table table-bordered table-condensed table-hover " id="table_'+_tableId+'" name="table_'+_tableId+'"  border="1" ></table>')
         var nodeObject_table=new Object()
    	     nodeObject_table.ID='table_'+_tableId
    	     nodeObject_table.WIDTH='auto'
    		 nodeObject_table.HEIGHT='auto'
    		 nodeObject_table.NAME='table_'+_tableId
    		 nodeObject_table.DOMTYPE='grid'
        	 _mainObject['table_'+_tableId]=nodeObject_table

            for(var i=0 ;i<=1 ;i++){
            	var $tr=$('<tr class="zujian grid" id="table_'+_tableId+'_tr_'+i+'" _name="table_'+_tableId+'_tr_'+i+'" ></tr>')
            	var Object_tr=new Object()
            		Object_tr.ID='table_'+_tableId+'_tr_'+i+''
            	 	Object_tr.WIDTH='auto'
            		Object_tr.HEIGHT='auto'
            		Object_tr.NAME='table_'+_tableId+'_tr_'+i+''
            	    _mainObject['table_'+_tableId+'_tr_'+i+'']=Object_tr
            	    for(var j=0 ;j<=1 ;j++){
            	    	var $td=$('<td class="zujian grid " id="table_'+_tableId+'_tr_'+i+'_td_'+j+'" _name="table_'+_tableId+'_tr_'+i+'_td_'+j+'" >text</td>')
            	    	var Object_td=new Object()
            	    	Object_td.ID='table_'+_tableId+'_tr_'+i+'_td_'+j+''
            	    	Object_td.WIDTH='auto'
            	    	Object_td.HEIGHT='auto'
            	    	Object_td.NAME='table_'+_tableId+'_tr_'+i+'_td_'+j+''
                	    _mainObject['table_'+_tableId+'_tr_'+i+'_td_'+j+'']=Object_td
                	    $tr.append($td)
            	    }
               $(grid).append($tr)
            }
		return grid
	}
	
	this.panlespan=function(){
		return $('<span id="'+key+'" name="'+keyName+'" class="layoutTarget"  _width=80px  _height=25px style="width:80px ;height:25px;   float:left;border:dashed 1px #000"></span>')
	}
	
	
	this.dataform=function(){
		
		
		return $('<form _DomOption={} id="'+key+'" load="" action="" method=""  dataform="true" name="'+keyName+'" class="dataform layoutTarget"  _width=300px _height=80px style="width:300px ;height:80px;   float:left;border:dashed 1px #000"></form>')
	}
	this.dcard=function(){
		return $('<div id="'+key+'" action="" method=""  dcard="true" single=true name="'+keyName+'" class="dcard layoutTarget"  _width=300px _height=80px style=" width:300px ;height:80px;   float:left;border:dashed 1px #000"></div>')
	}
	
	function getIdName(){
			return Math.round(Math.random()*100000000)
	}
	
	this.inconDialog=function(){
		var DialogString='<div id="'+key+'" name="弹出" class="childrendom layoutTarget " _width="364px" _height="238px" style="width: 364px; height: 238px; float: none; border: 0px dashed rgb(0, 0, 0); position: absolute; left: 347px; top: 210px; overflow-y: visible; background-color: rgb(255, 255, 255);" _top="undefined">'
			DialogString+='  <div     _width="300px" _height="26px" style="width: 100%; height: 26px; float: left; border: 0px dashed rgb(0, 0, 0); margin-left: 0px; background-color: rgb(240, 15, 255);" _margin_left="0px"> '
			DialogString+='     <span     class="incon_dialog_close"   _width="82px" _height="17px" style="width: 82px; height: 17px; float: right; border: 1px dashed rgb(0, 0, 0);">关闭</span> '
			DialogString+='  </div> '
			DialogString+='</div> '
		return $(DialogString)
	}
	this.Bootstrap_form_control=function(){
		 
		var html='<div id="'+key+'"  class="zujian form-group">';
		html+='<label for="'+key+'_"> text </label>';
		html+='<input type="text" class="form-control"  id="'+key+'_" placeholder=" "/>';
		html+='</div>';
		return html
	}
	this.Bootstrap_form_control_checkbox=function(){
		var html=' <div id="'+key+'"  class="zujian checkbox">';
		html+='<label>';
		html+='      <input type="checkbox"/><span>text</span> ';
		html+='</label>';
		html+=' </div>';
		 
		return html
	}
	this.Bootstrap_form_control_radio=function(){
		var html=' <div id="'+key+'"  class="zujian radio">';
		html+='<label>';
		html+='      <input type="radio"/><span>text</span> ';
		html+='</label>';
		html+=' </div>';
		 
		return html
	}
	this.Bootstrap_form_control_textarea=function(){
		 
		var html= $('<textarea id="'+key+'"_width=auto _height=auto   name="'+keyName+'" class="form-control zujian"   ></textarea>')

		return html
	}
	this.Bootstrap_form_control_select=function(){
		 var key2=getIdName()
	     var keyName='N'+key2
	     key2='ID'+key2
		 var  nodeObject=new Object()
		 nodeObject.ID=key2
		 nodeObject.WIDTH='auto'
		 nodeObject.HEIGHT='auto'
		 nodeObject.NAME=keyName
		 nodeObject.DOMTYPE=t
		 _mainObject[key2]=nodeObject
		 
		var html='<div  id="'+key+'" class="form-group zujian select ">';
			html+=' <label for="'+key2+'">Disabled select menu</label>';
			html+='   <select  _DomOption={} id="'+key2+'" name="'+keyName+'" class="form-control zujian ">';
			html+='   </select>';
			html+='</div>';
	 
		
		return html
	}
	this.Bootstrap_form_control_submit=function(){
		var html=' <button  id="'+key+'"  type="submit" class="zujian submit btn btn-default">Submit</button>';
		
		return html
	}
}