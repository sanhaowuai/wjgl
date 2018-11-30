function Item(_oValue, _nIndex){
	this.value = _oValue;
	this.index = _nIndex;
}

function Hashtable() {
	this.oObjects	= null;
	this.arKeys		= null;
	this.length		= 0;

	this.init		= function(){
		this.oObjects	= {};
		this.arKeys		= [];
	}

	this.clear		= function(){
		this.oObjects	= null;
		this.arKeys		= null;
	}

	this.contains	= function(_oValue){
		return (typeof(this.oObjects[_oValue]) != "undefined");
	}

	this.containsKey= function(_oKey){
		alert("Not Realize!");
		return false;
	}

	this.get		= function(_oKey){
		var oItem = this.oObjects[_oKey];
		if(oItem == null 
			|| typeof(oItem) != "object" 
			|| oItem.constructor != Item){
			return null;
		}

		return oItem.value;
	}

	this.keys		= function(){
		var arTemp = [];
		for(var i=0; i<this.arKeys.length; i++){
			if(this.arKeys[i] == null)continue;
			
			arTemp[arTemp.length] = this.arKeys[i];
		}
		return arTemp;
	}

	this.isEmpty	= function(){
		return this.size() == 0;
	}

	this.put		= function(_oKey, _oValue){
		//1. Check Param		
		if(_oKey == null || _oValue == null){
			alert("Param not Valid["+typeof(_oKey)+"["+typeof(_oValue)+"]");
			return false;
		}

		//2.init
		if(this.oObjects == null)
			this.init();

		//3. Put in 
		var oItem = this.oObjects[_oKey];
		if(oItem == null 
			|| typeof(oItem) != "object" 
			|| oItem.constructor != Item){			
			oItem = new Item(_oValue, this.arKeys.length);
			this.arKeys[this.arKeys.length] = _oKey;
			this.oObjects[_oKey] = oItem;
			this.length++;
		}else{
			oItem.value = _oValue;
		}
		
		
		//4.Return Result
		return true;
	}

	this.putAll		= function(_oHashtable){
		var nSize = _oHashtable.size();
		var arKeys = _oHashtable.keys();
		for(var i=0; i<nSize; i++){
			this.put(arKeys[i], _oHashtable.get(arKeys[i]));			
		}		
	}

	this.remove		= function(_oKey){
		var oItem = this.oObjects[_oKey];
		if(oItem == null 
			|| typeof(oItem) != "object" 
			|| oItem.constructor !=Item)
			return null;

		var oValue = oItem.value;
		this.arKeys[oItem.index] = null;
		this.oObjects[_oKey]		= null;
		this.length--;
		return oValue;
	}

	this.size		= function(){
		return this.length;
	}
	
}

function RequestParam(){
	this.hParameters = null;

	this.init				= function(){
		if(this.hParameters != null)return;

		try{
			this.hParameters = new Hashtable();				
		}catch(e){
			
		}		
	}
	
	this.setParameter		= function(_sParameterName, _sValue){
		this.init();
		return this.hParameters.put(_sParameterName, _sValue);
	}

	this.removeParameter	= function(_sParameterName){
		if(this.hParameters == null)
			return null;

		return this.hParameters.remove(_sParameterName);
	}	

	this.toURLParameters	= function(){
		var sURLParam = "trandom="+Math.random();

		if(this.hParameters == null || this.hParameters.size()<=0)
			return sURLParam;

		var nSize = this.hParameters.size();
		var arKeys = this.hParameters.keys();
		for(var i=0; i<nSize; i++){
			var sParamName = arKeys[i];
			var sValue = this.hParameters.get(sParamName);
			try{var arIds = sValue.split(",");}catch(e){}
			if(arIds && arIds.length && arIds.length > 200){
				return null;
			}
			if(sValue.length < 500){
				//sValue = encodeURIComponent(sValue);
				sValue =sValue;
			}
			sURLParam += "&"+sParamName+"="+sValue;
		}
		return sURLParam;
	}

	this.setAllParameters	= function(_oRequestParam){
		if(_oRequestParam.hParameters == null || _oRequestParam.hParameters.size()<=0)
			return;
		this.init();
		this.hParameters.putAll(_oRequestParam.hParameters);
	}
	
}
var oRequestParam = new RequestParam();