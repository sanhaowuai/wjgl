/*************************************************
Validator v1.05
code by 我佛山人
wfsr@msn.com
*************************************************/
Validator = {
	TimeToTime :/^(([0-1]?[0-9]|2[0-3]):([0-5][0-9]))-(([0-1]?[0-9]|2[0-3]):([0-5][0-9]))$/,
	Require : /.+/,
	Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
	Phone : /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
	Mobile : /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/,	
	Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
	IdCard : "this.IsIdCard(value)",
	Currency : /^\d+(\.\d+)?$/,
	Number : /^\d+$/,
	floatNumber : /^0.\d{1,4}$/,
	Zip : /^[1-9]\d{5}$/,
	QQ : /^[1-9]\d{4,8}$/,
	Integer : /^[-\+]?\d+$/,
	Double : /^[-\+]?\d+(\.\d+)?$/,
	English : /^[A-Za-z]+$/,
	Chinese : /^[\u0391-\uFFE5]+$/,
	Id : /^[A-Za-z0-9]+$/,
	Username : /^[a-z]\w{4,16}$/i,
	NotNumBegin : /[^0-9](.)*/,
	UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
	oto100 : /^(?:0|[1-9][0-9]?|100)$/,
	ototo100 : /^(?:0|[1-9][0-9]?|100)-(?:0|[1-9][0-9]?|100)$/,  
	ototo999 : /^(?:0|[1-9]|[1-9][0-9]|[1-9][0-9][0-9]?|999)-(?:0|[1-9]|[1-9][0-9]|[1-9][0-9][0-9]?|999)$/,  
	qujian :  /^([[\(][\d]*\,[\d]*[)\]])|([[\(](\d+%)*\,(\d+%)*[)\]])$/,  
	kzm: /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
	IsSafe : function(str){
		return !this.UnSafe.test(str);
	},
	SafeString : "this.IsSafe(trim_my(value))",
	PhoneMobile : "this.Execpm(trim_my(value))",
	Filter : "this.DoFilter(trim_my(value), getAttribute('accept'))",
	Limit : "this.limit(trim_my(value).length,getAttribute('min'), getAttribute('max'))",
	LimitB : "this.limit(this.LenB(trim_my(value)), getAttribute('min'), getAttribute('max'))",
	Date : "this.IsDate(trim_my(value), getAttribute('min'), getAttribute('format'))",
	Repeat : "trim_my(value) == document.getElementsByName(getAttribute('to'))[0].trim_my(value)",
	Range : "getAttribute('min') <= parseFloat(trim_my(value)) && parseFloat(trim_my(value)) <= getAttribute('max')",
	//Range : "getAttribute('min') < (value|0) && (value|0) < getAttribute('max')",
	Compare : "this.compare(trim_my(value),getAttribute('operator'),getAttribute('to'))",
	CompareTo : "this.compareto(trim_my(value),getAttribute('operator'),document.getElementsByName(getAttribute('to'))[0].trim_my(value),document.getElementsByName(getAttribute('to'))[0])",
	CompareToType : "this.comparetype(trim_my(value),getAttribute('operator'),document.getElementsByName(getAttribute('to'))[0].trim_my(value),getAttribute('totype'),document.getElementsByName(getAttribute('to'))[0])",
	Custom : "this.Exec(trim_my(value), getAttribute('regexp'))",	
	Group : "this.MustChecked(getAttribute('name'), getAttribute('min'), getAttribute('max'))",
	ErrorItem : [document.forms[0]],
	ErrorMessage : ["提示：\t\t\t\t"],
	Validate : function(theForm, mode){
		var obj = theForm || event.srcElement;
		var count = obj.elements.length;
		this.ErrorMessage.length = 1;
		this.ErrorItem.length = 1;
		this.ErrorItem[0] = obj;
		for(var i=0;i<count;i++){
			with(obj.elements[i]){
				var _dataType = getAttribute("dataType");
				if(typeof(_dataType) == "object" || typeof(this[_dataType]) == "undefined") continue;
				this.ClearState(obj.elements[i]);
				if(getAttribute("require") == "false" && value == "") continue;
				switch(_dataType){
					case "PhoneMobile" :
					case "IdCard" :
					case "Date" :
					case "Repeat" :
					case "Range" :
					case "Compare" :
					case "CompareTo" :
					case "CompareToType" :
					case "Custom" :
					case "Group" : 
					case "Limit" :
					case "LimitB" :
					case "SafeString" :
					case "Filter" :
						if(!eval(this[_dataType])) {
							this.AddError(i, getAttribute("msg"));
						}
						break;
					default :
						if(!this[_dataType].test(value)){
							this.AddError(i, getAttribute("msg"));
						}
						break;
				}
			}
		}
		if(this.ErrorMessage.length > 1){
			mode = mode || 1;
			var errCount = this.ErrorItem.length;
			switch(mode){
				case 2 :
					for(var i=1;i<errCount;i++)
					this.ErrorItem[i].style.color = "red";
				case 1 :
					alert(this.ErrorMessage.join("\n"));
					this.ErrorItem[1].focus();
					break;
				case 3 :
					for(var i=1;i<errCount;i++){
						try{
							var span = document.createElement("SPAN");
							span.id = "__ErrorMessagePanel";
							span.style.color = "red";
							this.ErrorItem[i].parentNode.appendChild(span);
							span.innerHTML =this.ErrorMessage[i].replace(/\d+:/,"");
						}catch(e){
							alert(e.description);
						}
					}
					this.ErrorItem[1].focus();
					break;
				default :
					alert(this.ErrorMessage.join("\n"));
					break;
			}
			return false;
		}
		return true;
	},
	limit : function(len,min, max){
		min = min || 0;
		max = max || Number.MAX_VALUE;
		return min <= len && len <= max;
	},
	LenB : function(str){
		return str.replace(/[^\x00-\xff]/g,"**").length;
	},
	ClearState : function(elem){
		with(elem){
			if(style.color == "red")
			style.color = "";
			var lastNode = parentNode.childNodes[parentNode.childNodes.length-1];
			if(lastNode.id == "__ErrorMessagePanel")
			parentNode.removeChild(lastNode);
		}
	},
	ClearForm : function(FormName){
    	for(var i=0;i<document.getElementById(FormName).elements.length;i++){
    		Validator.ClearState(document.getElementById(FormName).elements[i]);
    	}
	},
	AddError : function(index, str){
		this.ErrorItem[this.ErrorItem.length] = this.ErrorItem[0].elements[index];
		this.ErrorMessage[this.ErrorMessage.length] = this.ErrorMessage.length + ":" + str;
	},
	Exec : function(op, reg){
		return new RegExp(reg,"g").test(op);
	},
	Execpm : function(op){
		if(this['Phone'].test(op) || this['Mobile'].test(op)){	
			return true;
		}
		return false;
	},
	compare : function(op1,operator,op2){
		if(op1=="" && op2=="") return true;
		if(op1.length < op2.length){
			return false;
		}
		switch (operator) {
			case "NotEqual":
				return (op1 != op2);
			case "GreaterThan":
				return (op1 > op2);
			case "GreaterThanEqual":
				return (op1 >= op2);
			case "LessThan":
				return (op1 < op2);
			case "LessThanEqual":
				return (op1 <= op2);
			default:
				return (op1 == op2); 
		}
	},
	compareto : function(op1,operator,op2,objop2){
		if(op1=="" && op2=="") return true;	
			
		var rtn = false;	
		switch (operator) {
			case "NotEqual":
				rtn = (op1 != op2);
				break;
			case "GreaterThan":
				rtn = (op1 > op2);
				break;
			case "GreaterThanEqual":
				rtn = (op1 >= op2);
				break;
			case "LessThan":
				rtn = (op1 < op2);
				break;
			case "LessThanEqual":
				rtn = (op1 <= op2);
				break;
			default:
				rtn = (op1 == op2); 
				break;
		}
		if(op1.length < op2.length){
			rtn = false;
		}
		if(!rtn){
			this.ErrorItem[this.ErrorItem.length] = objop2;
			this.ErrorMessage[this.ErrorItem.length-1]="";
		}
		return rtn;
		
	},
	comparetype : function(op1,operator,op2,type,objop2){
		if(op1=="" && op2=="") return true;		
		if(!this[type].test(op1) || !this[type].test(op2)){
			this.ErrorItem[this.ErrorItem.length] = objop2;
			this.ErrorMessage[this.ErrorItem.length]="";
			return false;
		}		
		var rtn = false;	
		switch (operator) {
			case "NotEqual":
				rtn = (op1 != op2);
				break;
			case "GreaterThan":
				rtn = (op1 > op2);
				break;
			case "GreaterThanEqual":
				rtn = (op1 >= op2);
				break;
			case "LessThan":
				rtn = (op1 < op2);
				break;
			case "LessThanEqual":
				rtn = (op1 <= op2);
				break;
			default:
				rtn = (op1 == op2); 
				break;
		}
		if(op1.length < op2.length){
			rtn = false;
		}
		if(!rtn){
			this.ErrorItem[this.ErrorItem.length] = objop2;
			this.ErrorMessage[this.ErrorItem.length-1]="";
		}
		return rtn;
	},
	MustChecked : function(name, min, max){
		var groups = document.getElementsByName(name);
		var hasChecked = 0;
		min = min || 1;
		max = max || groups.length;
		for(var i=groups.length-1;i>=0;i--)
		if(groups[i].checked) hasChecked++;
		return min <= hasChecked && hasChecked <= max;
	},
	DoFilter : function(input, filter){
		return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, filter.split(/\s*,\s*/).join("|")), "gi").test(input);
	},
	IsIdCard : function(number){
		var date, Ai;
		var verify = "10X98765432";
		var Wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
		var area = ['','','','','','','','','','','','北京','天津','河北','山西','内蒙古','','','','','','辽宁','吉林','黑龙江','','','','','','','','上海','江苏','浙江','安微','福建','江西','山东','','','','河南','湖北','湖南','广东','广西','海南','','','','重庆','四川','贵州','云南','西藏','','','','','','','陕西','甘肃','青海','宁夏','新疆','','','','','','台湾','','','','','','','','','','香港','澳门','','','','','','','','','国外'];
		var re = number.match(/^(\d{2})\d{4}(((\d{2})(\d{2})(\d{2})(\d{3}))|((\d{4})(\d{2})(\d{2})(\d{3}[x\d])))$/i);
		if(re == null) return false;
		if(re[1] >= area.length || area[re[1]] == "") return false;
		if(re[2].length == 12){
			Ai = number.substr(0, 17);
			date = [re[9], re[10], re[11]].join("-");
		}else{
			Ai = number.substr(0, 6) + "19" + number.substr(6);
			date = ["19" + re[4], re[5], re[6]].join("-");
		}
		if(!this.IsDate(date, "ymd")) return false;
		var sum = 0;
		for(var i = 0;i<=16;i++){
			sum += Ai.charAt(i) * Wi[i];
		}
		Ai += verify.charAt(sum%11);
		return (number.length ==15 || number.length == 18 && number == Ai);
	},
	IsDate : function(op, formatString){
		formatString = formatString || "ymd";
		var m, year, month, day;
		switch(formatString){
			case "ymd" :
				m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})$"));
				if(m == null ) return false;
				day = m[6];
				month = m[5]*1;
				year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
				break;
			case "dmy" :
					m = op.match(new RegExp("^(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
					if(m == null ) return false;
					day = m[1];
					month = m[3]*1;
					year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
					break;
			default :
				break;
		}
		if(!parseInt(month)) return false;
		month = month==0 ?12:month;
		var date = new Date(year, month-1, day);
		return (typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth()+1) && day == date.getDate());
		function GetFullYear(y){return ((y<30 ? "20" : "19") + y)|0;}
	}
}
function trim_my(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}