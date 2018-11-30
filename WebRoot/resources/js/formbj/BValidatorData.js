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
//	"data-bv-message":{
//		    "text":"错误信息",
//		     "data":[{
//                 "name":'非法数据提示',
//                 "attr":"data-bv-message",
//		    	 "val":"这个 $key$ 不是有效的"
//		     }]
//	},
	"data-bv-notempty":{
		   "text":"验证空值",
		     "data":[{
                 "name":'必填项',
                 "attr":"data-bv-notempty",
		    	 "val":false
		      },{
                 "name":'提示信息',
                 "attr":"data-bv-notempty-message",
		    	 "val":"$key$ 未填写"
		     }]
	},
//	"pattern":{
//		   "text":"正则",
//	       "pattern":"^[a-zA-Z0-9]+$",
//	       "data-bv-regexp-message":"$key$ 格式错误"
//	   },
	"data-bv-stringlength":{
		   "text":"字符串长度",
		   "data":[
			      {  "name":'限制长度',  "attr":"data-bv-stringlength", "val":false  },
			      {  "name":'最小长度',  "attr":"data-bv-stringlength-min", "val":"6"  },
			      {  "name":'最大长度',  "attr":"data-bv-stringlength-max", "val":"30"  },
			      {  "name":'提示信息',  "attr":"data-bv-stringlength-message", "val":"长度为 %s 到 %s之间"  }
		     ]
//	       "data-bv-stringlength":false,
//	       "data-bv-stringlength-min":"6",
//	       "data-bv-stringlength-max":"30",
//	       "data-bv-stringlength-message":"长度为 6 到 30之间"
	   },
//	"data-bv-different":{
//		   "text":"不同的",
//	       "data-bv-different":false,
//	       "data-bv-different-field":"password",
//	       "data-bv-different-message":"The username and password cannot be the same as each other"
//	   },

	"data-bv-numeric":{
		   "text":"数值",
		   "data":[
		          {  "name":'数字类型',  "attr":"data-bv-numeric", "val":false  }
	         ]
	   },

	"data-bv-between":{
		   "text":"数值范围",
		   "data-bv-between":false,
		   "data":[
			   {  "name":'限制范围',  "attr":"data-bv-between", "val":false  },
			   {  "name":'最小值',  "attr":"data-bv-between-min", "val":"0"  },
			   {  "name":'最大值',  "attr":"data-bv-between-max", "val":"100"  },
			   {  "name":'提示信息',  "attr":"data-bv-between-message", "val":"请输入%s-%s的数字"  }
			   ]
	},
//	"data-bv-remote":{
//		   "text":"远程验证",
//		   "data-bv-remote":false,
//		   "data-bv-remote-url":"remote.php",
//		   "data-bv-remote-message":"The username is not available"
//	   },
	"data-bv-date":{
		  "text":"日期验证",
		   "data":[
			      {  "name":'日期类型',  "attr":"data-bv-date", "val":false  },
			      {  "name":'日期格式',  "attr":"data-bv-date-format", "val":"YYYY/MM/DD"  },
			      {  "name":'提示信息',  "attr":"data-bv-date-message", "val":"日期格式不正确" }
		     ]
//	   ,
//	      "data-bv-date":false,
//	      "data-bv-date-format":"YYYY/MM/DD",
//	      "data-bv-date-message":"日期格式不正确"
	 },
	 "data-bv-emailaddress":{
	   "text":"Email地址验证",
	   "data":[
		      {  "name":'Email类型',  "attr":"data-bv-emailaddress", "val":false  },

		      {  "name":'提示信息',  "attr":"data-bv-emailaddress-message", "val":"请输入一个正确的Email地址" }
	     ]

	 }
	}


$.each(bvjson,function(key,value){
	$.each(value.data,function(k,v){
			var defValue
			if ($(target).find('input,textarea').size()>0){
				defValue = $(target).find('input,textarea').attr(v.attr)
			}else if ($(target).find('select').size()>0){
				defValue = $(target).find('select').attr(v.attr)
			}
			if(defValue==undefined){
				defValue=v.val
			}
			if(v.attr==key ){
				data.push({ "name": v.name, "group": "验证["+value.text+"]", "value": ""+defValue+"","field": "text",  "editor": {"type":"combobox" ,"options": {"required":true, onChange:function(newValue,oldValue){
//					if ($(target).find('input').size()>0){
//						 $(target).find('input').attr(v.attr,newValue)
//					}else if ($(target).find('select').size()>0){
//						 $(target).find('select').attr(v.attr,newValue)
//					}
						if(newValue==false || newValue==false){
							$.each(value.data,function(delkey,delval){
								if ($(target).find('input,select,textarea').size()>0){
									 $(target).find('input,select,textarea').removeAttr(delval.attr)
								}
							})
						}
						else{
							$.each(value.data,function(addkey,addval){
								if(addkey!=key){
									if ($(target).find('input,select,textarea').size()>0){
										if($(target).find('input,select,textarea').attr(addval.attr)==undefined ||$(target).find('input,select,textarea').attr(addval.attr)==''){
											$(target).find('input,select,textarea').attr(addval.attr,addval.val)
										}
									}
								}
							})
							if ($(target).find('input,select,textarea').size()>0){
								 $(target).find('input,select,textarea').attr(v.attr,newValue)
							}
						}
				    },
				    "valueField": 'value', "textField": 'name',
				    "data":[
						{value:true,name:'是'},
						{value:false,name:'否'}]
				    }}
		           })
			}else{
			data.push({ "name": v.name, "group": "验证["+value.text+"]", "value": ""+defValue+"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
				var _k
				if ($(target).find('input,textarea').size()>0){
					_k= $(target).find('input,textarea').attr(key)
				}else if ($(target).find('select').size()>0){
					_k= $(target).find('select').attr(key)
				}
				if (_k ==true || _k=="true"){
					if ($(target).find('input,textarea').size()>0){
						 $(target).find('input,textarea').attr(v.attr,newValue)
					}else if ($(target).find('select').size()>0){
						 $(target).find('select').attr(v.attr,newValue)
					}
				}
			    }}}
	           })
			}

	})
})



}
