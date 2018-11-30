var v_TableRow=function(target){
	 
	return { "name": "行", "group": "属性", "value": ""+  $(target).attr('rows') +"","field": "TableRow", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
       
		$(target).attr('rows',newValue)
        var newrow =$(target).find('tr').eq(0).clone()
        $(newrow).find('td').html('1')
        $(newrow).find('tr > td').addClass("zujian")
        var _rows=$(target).find('tr').size()
        var _temp_table=$('<table></table>')
        
        if (_rows > newValue){
        	$(target).find('tr:gt('+(newValue-1)+')').each(function(i,delete_tr){
        		$(delete_tr).find('td').each(function(j,delete_td){
        			//delete _mainObject[$(delete_td).attr('id')]
        		})
        			//delete _mainObject[$(delete_tr).attr('id')]
        	})
        	$(target).find('tr:gt('+(newValue-1)+')').remove()
        }else if (_rows < newValue){
        	var rowindex=$(target).find('tr').size()
        	for (var i=0 ;i< newValue-_rows ; i++ ){
        	
        		 var ntr=$(newrow).clone()
        		 var trid=$(target).attr('id')+'_tr_'+(rowindex+i)
        		 $(ntr).attr('id',trid)
        		 $(ntr).attr('_name',trid)
        		 $(ntr).find('td').each(function(_I,_td){
        		 	$(_td).attr('id',trid+'_td_'+_I)
        		 	$(_td).attr('_name',trid+'_td_'+_I)
        		 	$(_td).addClass('layoutTarget')
          		  
        		 })
        		 $(ntr).find('td').html('')
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
        			//delete _mainObject[$(delete_td).attr('id')]
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
        	    	$(tr).append('<td id="'+trid+'_td_'+tdsize+'" _name="'+trid+'_td_'+tdsize+'" class="layoutTarget zujian"></td>')
            		  var nodeObject_td=new Object()
      		 	      nodeObject_td.ID=trid+'_td_'+tdsize
         	          nodeObject_td.WIDTH='auto'
         	    	  nodeObject_td.HEIGHT='auto'
         	    	  nodeObject_td.NAME=trid+'_td_'+tdsize
             	    // _mainObject[trid+'_td_'+tdsize]=nodeObject_td
        	    }
        	})
        }
        }}} }
}
var tdload=function(target,data){
	 var defValue=$(target).css('border-left-style')
	 
 
		var _data= new Array()
	    _data =[
			{"value":"none","name":"是"},
			{"value":"solid","name":"否"}
		]
				
	 
	    data.push( { "name": "隐藏边框", "group": "属性", "value": ""+  defValue +"","field": "style",  "editor": { "type": 'combobox',
					"options": {
						valueField:'value',
						textField:'name',
						onChange:function(newValue,oldValue){
						 $(target).css('border-style',newValue)
						 
		},
		data:_data
	    
		}}})
        defValue=$(target).attr('valign')
		data.push( { "name": "上下位置1", "group": "属性", "value": ""+  defValue +"","field": "style",  "editor": { "type": 'combobox',
			"options": {
				valueField:'value',
				textField:'name',
				onChange:function(newValue,oldValue){
					$(target).attr('valign',newValue)
				},
				data:[
					{'value':'top','name':'上'},
					{'value':'bottom','name':'下'}
				]
			}}})
		defValue=$(target).attr('align')
		data.push( { "name": "左右位置2", "group": "属性", "value": ""+  defValue +"","field": "style",  "editor": { "type": 'combobox',
				"options": {
					valueField:'value',
					textField:'name',
					onChange:function(newValue,oldValue){
						$(target).attr('align',newValue)
					},
					data:[
						{'value':'left','name':'左'},
						{'value':'right','name':'右'}
					]
					
		}}})
				
			
  
}