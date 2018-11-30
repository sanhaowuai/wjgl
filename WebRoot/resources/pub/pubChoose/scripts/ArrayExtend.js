/**
 * 判断数组索引位置
 * @param val 数组元素值
 */
Array.prototype.indexOf = function(val){
	for(var i=0;i<this.length;i++){
		if(this[i]==val){
			return i;
		}
	}
	return -1;
};
/**
 * 删除指定值数据元素
 * @param val 数组元素值
 */
Array.prototype.remove = function(val){
	var index = this.indexOf(val);
	if(index>-1){
		this.splice(index, 1);
	}
};
/**
 * 判断数组是否相等，数组元素为字符串
 * @param arr 数组
 */
Array.prototype.equals = function(arr){
	if(this.length==arr.length){
		var count = 0;
		for(var i=0;i<arr.length;i++){
			if(this.indexOf(arr[i])>-1){
				count++;
			}
		}
		if(count==this.length){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
};
