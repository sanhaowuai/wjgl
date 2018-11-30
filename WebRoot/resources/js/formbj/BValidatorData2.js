//notEmpty：非空验证；
//
//stringLength：字符串长度验证；
//
//regexp：正则表达式验证；
//
//emailAddress：邮箱地址验证（都不用我们去写邮箱的正则了~~）
//
//除此之外，在文档里面我们看到它总共有46个验证类型，我们抽几个常见的出来看看：
//
//base64：64位编码验证；
//
//between：验证输入值必须在某一个范围值以内，比如大于10小于100；
//
//creditCard：身份证验证；
//
//date：日期验证；
//
//ip：IP地址验证；
//
//numeric：数值验证；
//
//phone：电话号码验证；
//
//uri：url验证；

var loadbvjson=function(target,data){
	var bvjson={
	"data-bv-message":{
		    "text":"错误信息",
			"data-bv-message":"这个 $key$ 不是有效的"
	},
	"data-bv-notempty":{
		   "text":"验证空值",
	       "data-bv-notempty":false,
	       "data-bv-notempty-message":" $key$ 未填写"
	},
//	"pattern":{
//		   "text":"正则",
//	       "pattern":"^[a-zA-Z0-9]+$",
//	       "data-bv-regexp-message":"$key$ 格式错误"
//	   },
	"data-bv-stringlength":{
		   "text":"字符串长度",
	       "data-bv-stringlength":false,
	       "data-bv-stringlength-min":"6",
	       "data-bv-stringlength-max":"30",
	       "data-bv-stringlength-message":"长度为 6 到 30之间"
	   },
//	"data-bv-different":{
//		   "text":"不同的",
//	       "data-bv-different":false,
//	       "data-bv-different-field":"password",
//	       "data-bv-different-message":"The username and password cannot be the same as each other"
//	   },
 
	"data-bv-numeric":{
		   "text":"数值",
		   "data-bv-numeric":false,
		   "data-bv-numeric-min":"6",
	       "data-bv-numeric-max":"30",
	       "data-bv-numeric-message":"长度为 6 到 30之间"
	}
//	"data-bv-remote":{
//		   "text":"远程验证",
//		   "data-bv-remote":false,
//		   "data-bv-remote-url":"remote.php",
//		   "data-bv-remote-message":"The username is not available"
//	   },
	"data-bv-date":{
		  "text":"日期验证",
	      "data-bv-date":false,
	      "data-bv-date-format":"YYYY/MM/DD",
	      "data-bv-date-message":"日期格式不正确"
	 },
	 "data-bv-emailaddress":{
	   "text":"Email地址验证",
	   "data-bv-emailaddress":false,
	   "data-bv-emailaddress-message":"请输入一个正确的Email地址"
	 }
	}

	
$.each(bvjson,function(key,value){
	$.each(value,function(k,v){
	        if (k!='text'){
			var defValue
			if ($(target).find('input').size()>0){
				defValue = $(target).find('input').attr(k)
			}else if ($(target).find('select').size()>0){
				defValue = $(target).find('select').attr(k)
			}
			if(defValue==undefined){
				defValue=v
			}
			if(k==key ){
				data.push({ "name": k, "group": "验证["+value.text+"]", "value": ""+defValue+"","field": "text",  "editor": {"type":"combobox" ,"options": {"required":true, onChange:function(newValue,oldValue){
					if ($(target).find('input').size()>0){
						 $(target).find('input').attr(k,newValue)
					}else if ($(target).find('select').size()>0){
						 $(target).find('select').attr(k,newValue)
					}
					if(newValue==false || newValue=="false"){
						$.each(value,function(delkey,delval){
							if ($(target).find('input').size()>0){
								 $(target).find('input').removeAttr(delkey)
							}else if ($(target).find('select').size()>0){
								 $(target).find('select').removeAttr(delkey)
							}
						})
					}

				    },
				    "valueField": 'value', "textField": 'name',
				    "data":[
						{value:true,name:true},
						{value:false,name:false}]
				    }}
		           })
			}else{
			data.push({ "name": k, "group": "验证["+value.text+"]", "value": ""+defValue+"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
				var _k
				if ($(target).find('input').size()>0){
					_k= $(target).find('input').attr(key)
				}else if ($(target).find('select').size()>0){
					_k= $(target).find('select').attr(key)
				}
				if (_k ==true || _k=="true"){
					if ($(target).find('input').size()>0){
						 $(target).find('input').attr(k,newValue)
					}else if ($(target).find('select').size()>0){
						 $(target).find('select').attr(k,newValue)
					}
				}
			    }}}
	           })
			}
	     }
	})
})

	
	
}
