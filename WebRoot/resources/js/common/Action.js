function Action(_sActionURL){
	try{
		this.oActionParam = new RequestParam();
	}catch(e){
		alert("Not include file RequestParam");
		return;
	}	

	/**
	 * 设置给交互页面传递的参数
	 * @param {String} 参数名称
	 * @param {String} 参数倄1�7
	 */
	this.setParameter		= function(_sParameterName, _sValue){
		return this.oActionParam.setParameter(_sParameterName, _sValue);
	}

	//If Self Action
	if(Action_isSelfLocation(_sActionURL)){
		/**
		 * @private
		 */
		this.sActionURL = Action_getLocationURL();
		this.oActionParam.setAllParameters(oRequestParam);		
	}else{
		/**
		 * @private
		 */
		this.sActionURL = _sActionURL;
	}

//Define Methods
	this.getActionURL		= Action_getActionURL;
	this.validateActionURL	= Action_validateActionURL;
	this.doAction			= Action_doAction;
	this.doDialogAction		= Action_doDialogAction;
	this.doModelessDialogAction = Action_doModelessDialogAction;
	this.doOpenWinAction	= Action_doOpenWinAction;
	this.doOpenWinActionX	= Action_doOpenWinActionX;
	this.inheritParameters	= Action_inheritParameters;
	this.doNoScrollDialogAction	= Action_doNoScrollDialogAction;
}
/**
 * 按照指定的方式对页面进行排序，应用在列表页面丄1�7
 * @param {String} _sOrderField 排序字段
 * @param {String} _sOrderType 排序方式(DESC|ASC)
 */
function Action_doOrderBy(_sOrderField, _sOrderType){
	var oAction = new Action();
	oAction.setParameter("orderField", _sOrderField);
	oAction.setParameter("orderType", _sOrderType);
	oAction.setParameter("currentPage", 1);
	oAction.doAction();
}


/**
 * 按照指定的方式对页面进行排序，应用在列表页面丄1�7
 * @param {String} _sOrderField 排序字段
 * @param {String} _sOrderType 排序方式(DESC|ASC)
 */
function Action_doOrderBy2(_sOrderField, _sOrderType,status){
	var oAction = new Action();
	oAction.setParameter("orderField", _sOrderField);
	oAction.setParameter("orderType", _sOrderType);
	oAction.setParameter("currentPage", 1);
	oAction.setParameter("status", status);
	oAction.doAction();
}

function Action_doOrderBy3(_sOrderField, _sOrderType,type,uopen){
	var oAction = new Action();
	oAction.setParameter("orderField", _sOrderField);
	oAction.setParameter("orderType", _sOrderType);
	oAction.setParameter("currentPage", 1);
	oAction.setParameter("type", type);
	oAction.setParameter("uopen", uopen);
	oAction.doAction();
}
function Action_doOrderBy4(_sOrderField, _sOrderType,deal){
	var oAction = new Action();
	oAction.setParameter("orderField", _sOrderField);
	oAction.setParameter("orderType", _sOrderType);
	oAction.setParameter("currentPage", 1);
	oAction.setParameter("deal", deal);
	oAction.doAction();
}
/**
 * 发出不带滚动条对话框交互的请汄1�7
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {object} _oArgs 传入对话框的参数（可以为int string array htmlelement；其它自定义对象不行＄1�7
 * @throws 如果浏览器设置了拦截，会弹出解除拦截提示
 * @return {object} 返回倄1�7
 */
function Action_doNoScrollDialogAction(_nWidth, _nHeight, _oArgs){
	//1.verify parameters
	if(!this.validateActionURL()) return;

	var nWidth	= _nWidth	|| 200;
	var nHeight = _nHeight	|| 200;

	var nLeft	= (window.screen.availWidth - nWidth)/2;
	var nTop	= (window.screen.availHeight - nHeight)/2;


	//2.Construct parameters for dialog
	var sFeatures		= "dialogHeight: "+nHeight+"px; dialogWidth: "+nWidth+"px; "
						+ "dialogTop: "+nTop+"; dialogLeft: "+nLeft+"; "
						+ "center: Yes; scroll:No;help: No; resizable: No; status: No;";
	//3.display Dialog
	var sDialogUrl = Action_ROOT_PATH + "/include/dialog_window.html";
	var sURL = this.getActionURL();
	var arArgs = new Array();
	arArgs[0] = sURL;
	arArgs[1] = window.location.href;
	arArgs[2] = _oArgs;
	try{
		var sResult = window.showModalDialog(sDialogUrl, arArgs, sFeatures);	
		return sResult;
	}catch(e){
		alert("您的IE插件已经将对话框拦截");
		return true;
	}
	
}
/**
 * 发出带有滚动条非模�1�7�对话框交互的请汄1�7
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {object} _oArgs 传入对话框的参数（可以为int string array htmlelement；其它自定义对象不行＄1�7
 * @throws 如果浏览器设置了拦截，会弹出解除拦截提示
 * @return {object} 返回倄1�7
 */
function Action_doModelessDialogAction(_nWidth, _nHeight, _oArgs, _nTop, _nLeft){
	//1.verify parameters
	if(!this.validateActionURL()) return;

	var nWidth	= _nWidth	|| 200;
	var nHeight = _nHeight	|| 200;

	var nLeft	= _nLeft || (window.screen.availWidth - nWidth)/2;
	var nTop	= _nTop || (window.screen.availHeight - nHeight)/2;

	//2.Construct parameters for dialog
	var sFeatures		= "dialogHeight: "+nHeight+"px; dialogWidth: "+nWidth+"px; "
						+ "dialogTop: "+nTop+"; dialogLeft: "+nLeft+"; "
						+ "center: Yes; scroll:Yes;help: No; resizable: No; status: No;";
	//3.display Dialog
	var sDialogUrl = Action_ROOT_PATH + "/include/dialog_window.html";
	var sURL = this.getActionURL();
	var arArgs = new Array();
	arArgs[0] = sURL;
	arArgs[1] = window.location.href;
	arArgs[2] = _oArgs;
	try{
		var sResult = window.showModelessDialog(sDialogUrl, arArgs, sFeatures);	
		return sResult;
	}catch(e){
		alert("您的IE插件已经将对话框拦截");
		return true;
	}
	
}

/**
 * 发出带有滚动条对话框交互的请汄1�7
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {object} _oArgs 传入对话框的参数（可以为int string array htmlelement；其它自定义对象不行＄1�7
 * @throws 如果浏览器设置了拦截，会弹出解除拦截提示
 * @return {object} 返回倄1�7
 */
function Action_doDialogAction(_nWidth, _nHeight, _oArgs, _nTop, _nLeft){
	//1.verify parameters
	if(!this.validateActionURL()) return;

	var nWidth	= _nWidth	|| 200;
	var nHeight = _nHeight	|| 200;

	var nLeft	= _nLeft || (window.screen.availWidth - nWidth)/2;
	var nTop	= _nTop || (window.screen.availHeight - nHeight)/2;

	//2.Construct parameters for dialog
	var sFeatures		= "dialogHeight: "+nHeight+"px; dialogWidth: "+nWidth+"px; "
						+ "dialogTop: "+nTop+"; dialogLeft: "+nLeft+"; "
						+ "center: Yes; scroll:Yes;help: No; resizable: No; status: No;";
	//3.display Dialog
	var sDialogUrl = Action_ROOT_PATH + "/include/dialog_window.html";
	var sURL = this.getActionURL();
	var arArgs = new Array();
	arArgs[0] = sURL;
	arArgs[1] = window.location.href;
	arArgs[2] = _oArgs;
	try{
		var sResult = window.showModalDialog(sDialogUrl, arArgs, sFeatures);	
		return sResult;
	}catch(e){
		alert("您的IE插件已经将对话框拦截");
		return true;
	}
}
/**
 * 发出交互请求
 * 
 */
function Action_doAction(){
	if(!this.validateActionURL()) return;
	window.location.href = this.getActionURL();
}	

/**
 * 结合设置的交互参敄1�7,获取交互地址
 */
function Action_getActionURL(){
	var sURL		= this.sActionURL;
	var nStartPose  = sURL.indexOf("?");
	if(nStartPose >= 0)
		sURL += "&";
	else
		sURL += "?";
	return sURL + this.oActionParam.toURLParameters();
}

function Action_validateActionURL(){
	return (this.oActionParam.toURLParameters() != null);
}

function Action_isSelfLocation(_sURL){
	if(_sURL == null)return true;

	var sSelfURL		= window.location.href;
	var nStartPose		= sSelfURL.indexOf("?");
	if(nStartPose >= 0)
		sSelfURL = sSelfURL.substring(0, nStartPose);
	
	nStartPose		= sSelfURL.lastIndexOf("/");
	if(nStartPose >= 0)
		sSelfURL = sSelfURL.substring(nStartPose+1);
	
	return (sSelfURL == _sURL);
}


/**
 * 获取当前页面的链接地坄1�7
 */
function Action_getLocationURL(){
	var sURL		= window.location.href;
	var nStartPose  = sURL.indexOf("?");
	if(nStartPose >= 0)
		sURL = sURL.substring(0, nStartPose);
	return sURL;
}
/**
 * 发出弹出窗口的交互请汄1�7
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 */
function Action_doOpenWinActionX(_sName, _bReplaced, _nWidth, _nHeight){
	if(!this.validateActionURL()) return;

	var nWidth	= _nWidth || (window.screen.availWidth  - 20);
	var nHeight = _nHeight || (window.screen.availHeight - 40);
	var nLeft	=(window.screen.availWidth - nWidth-10)/2;
	var nTop	= (window.screen.availHeight - nHeight-20)/2;
	var sName	= _sName || "";

	var oWin = window.open(this.getActionURL(), sName, "top="+nTop+",left="+nLeft+",fullscreen =true,menubar =no,toolbar =no,width="+nWidth+",height="+nHeight+",scrollbars=yes,location =no,titlebar=no", _bReplaced);
	if(oWin == null){
		alert("您的IE插件已经将对话框拦截");
		window.close();
	}else{
		oWin.opener =  window;
		oWin.focus();
	}
}

function Action_doOpenWinAction(_nWidth, _nHeight){
	this.doOpenWinActionX("", false, _nWidth, _nHeight);
}

/**
 * 发出不带滚动条对话框交互的请汄1�7
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {object} _oArgs 传入对话框的参数（可以为int string array htmlelement；其它自定义对象不行＄1�7
 * @throws 如果浏览器设置了拦截，会弹出解除拦截提示
 * @return {object} 返回倄1�7
 */
function Action_doNoScrollDialogAction(_nWidth, _nHeight, _oArgs){
	//1.verify parameters
	if(!this.validateActionURL()) return;

	var nWidth	= _nWidth	|| 200;
	var nHeight = _nHeight	|| 200;

	var nLeft	= (window.screen.availWidth - nWidth)/2;
	var nTop	= (window.screen.availHeight - nHeight)/2;


	//2.Construct parameters for dialog
	var sFeatures		= "dialogHeight: "+nHeight+"px; dialogWidth: "+nWidth+"px; "
						+ "dialogTop: "+nTop+"; dialogLeft: "+nLeft+"; "
						+ "center: Yes; scroll:No;help: No; resizable: No; status: No;";
	//3.display Dialog
	var sDialogUrl = Action_ROOT_PATH + "/include/dialog_window.html";
	var sURL = this.getActionURL();
	var arArgs = new Array();
	arArgs[0] = sURL;
	arArgs[1] = window.location.href;
	arArgs[2] = _oArgs;
	try{
		var sResult = window.showModalDialog(sDialogUrl, arArgs, sFeatures);	
		return sResult;
	}catch(e){
		alert("您的IE插件已经将对话框拦截");
		return true;
	}
	
}


/**@private*/
function Action_inheritParameters(){
	this.oActionParam.setAllParameters(oRequestParam);
}

//Self Action 1----refreshMe
/**
 * 刷新当前的页靄1�7
 */
function Action_refreshMe(){
	var oAction = new Action();
	oAction.doAction();
}

/**
 * 根据指定的HTML代码显示信息提示页面
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {String} _sInforHTML 信息提示页面的内宄1�7
 */
function Action_displyInfo(_nWidth, _nHeight, _sInforHTML){
	var sURL = Action_ROOT_PATH + "/include/info.html";
	var oAction = new Action(sURL);	
	var oArgs = new Object();
	oArgs.InfoHTML = _sInforHTML;
	oAction.doDialogAction(_nWidth, _nHeight, oArgs);
}

/**
 * 根据指定的HTML代码显示警告信息提示页面
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {String} _sInforHTML 信息提示页面的内宄1�7
 */
function Action_displyReports(_nWidth, _nHeight, _sInforHTML, _bInfo){
	var sURL = Action_ROOT_PATH + "include/reports.html";
	var oAction = new Action(sURL);	
	var oArgs = new Object();
	oArgs.InfoHTML = _sInforHTML;
	oArgs.IsInfo = _bInfo;
	oAction.doNoScrollDialogAction(_nWidth, _nHeight, oArgs);
}

/**
 * 根据指定的HTML代码显示警告信息提示页面 confirm
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {String} _sInforHTML 信息提示页面的内宄1�7
 */
function Action_confirmReports(_nWidth, _nHeight, _sInforHTML, _bInfo){
	var sURL = Action_ROOT_PATH + "include/reports_confirm.html";
	var oAction = new Action(sURL);	
	var oArgs = new Object();
	oArgs.InfoHTML = _sInforHTML;
	oArgs.IsInfo = _bInfo;
	var result = oAction.doNoScrollDialogAction(_nWidth, _nHeight, oArgs);
	return result;
}

/**
 * 根据指定的HTML代码显示警告信息提示页面 confirm
 * @param {int} _nWidth 对话框宽庄1�7
 * @param {int} _nHeight 对话框高庄1�7
 * @param {String} _sInforHTML 信息提示页面的内宄1�7
 */
function Action_ifReports(_nWidth, _nHeight, _sInforHTML, _bInfo){
	var sURL = Action_ROOT_PATH + "include/reports_if.html";
	var oAction = new Action(sURL);	
	var oArgs = new Object();
	oArgs.InfoHTML = _sInforHTML;
	oArgs.IsInfo = _bInfo;
	var result = oAction.doNoScrollDialogAction(_nWidth, _nHeight, oArgs);
	return result;
}

function Action_convertErrorInfo(_sErrorInfo){
	var MAX_LENGTH = 17;

	var nCarrigeCount	= 2;
	var nMaxLength		= MAX_LENGTH;
	var nNextPos		= _sErrorInfo.indexOf("\n");
	var nPrePos			= 0;
	while(nNextPos>=0){
		if((nNextPos-nPrePos)>nMaxLength){
			nMaxLength = (nNextPos-nPrePos);
		}
		nPrePos		= nNextPos;
		nNextPos	= _sErrorInfo.indexOf("\n", nNextPos+1);
		nCarrigeCount++;
	}	
	if((_sErrorInfo.length-nPrePos) > nMaxLength){
		nMaxLength = _sErrorInfo.length;
	}
	

	var nWidth = 300;
	if(nMaxLength>MAX_LENGTH){
		nWidth += (nMaxLength-MAX_LENGTH)*3;
	}
	var nHeight = 200;
	nHeight += 20*nCarrigeCount;

	var oInfo = new Object();
	oInfo.CarrigeCount	= nCarrigeCount;
	oInfo.MaxLength		= nMaxLength;
	oInfo.Width			= nWidth;
	oInfo.Height		= nHeight;
	oInfo.InfoHTML		= _sErrorInfo.replace(/\n/g, "<BR>");

	return oInfo;
}

function Action_alert(_sInforHTML, _bInfo){
	var oInfo = Action_convertErrorInfo(_sInforHTML);
	Action_displyReports(oInfo.Width, oInfo.Height, oInfo.InfoHTML, _bInfo);
}

function Action_confirm(_sInforHTML){
	var oInfo = Action_convertErrorInfo(_sInforHTML);
	var result = Action_confirmReports(oInfo.Width, oInfo.Height, oInfo.InfoHTML);
	return result;
}

function Action_if(_sInforHTML){
	var oInfo = Action_convertErrorInfo(_sInforHTML);
	var result = Action_ifReports(oInfo.Width, oInfo.Height, oInfo.InfoHTML);
	return result;
}


function Action_setRootPath(_sRootPath){
	this.Action_ROOT_PATH = _sRootPath;
}

var Action_ROOT_PATH = "../";