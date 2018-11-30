/**
 * 全选
 * 页面调用方法如下：
 * $(document).ready(function(){
 *   $("#Id").baigoCheckall();
 * });
 * 需要控制全选的子checkBox的name必须与全选checkBOx的Id一致
 */
(function($){
	$.fn.baigoCheckall = function(){
		var thisForm = $(this);
		$(thisForm).find(":checkbox").click(function(){
			var _child   = $(this).attr("id"); //根据id设置子对象
			var _parent  = $(this).attr("name"); //根据name设置父对象
			child_check(_child); //设置子对象
			parent_check(_parent); //设置父对象
		});

		//设置父对象
		var parent_check = function(_parent){
			var _parent_num = $(thisForm).find("#" + _parent).size(); //获取父对象数量
			if(_parent_num > 0){ //如果有父对象
				var _brother_num = $(thisForm).find("input[name='"+_parent+"']").size(); //根据parent获取兄弟对象数
				var _brother_checked_num = $(thisForm).find("input[name='"+_parent+"']:checked").size(); //根据parent获取兄弟对象选中数
				if(_brother_num > 0 && _brother_checked_num < _brother_num){ //如果有兄弟对象且兄弟对象选中数小于实际数，则设置父对象未选中
					$(thisForm).find("#" + _parent).removeAttr("checked");
				} else {
					$(thisForm).find("#" + _parent).prop("checked", "checked");
				}
				var _parent_this = $(thisForm).find("#" + _parent).attr("name"); //根据该父对象的parent获取爷对象
				parent_check(_parent_this); //设置爷对象
			}
		};

		//设置子对象
		var child_check = function(_child){
			var _child_obj  = $(thisForm).find("input[name='"+_child+"']"); //获取子对象
			var _checked    = $(thisForm).find("#" + _child).prop("checked"); //获取父对象的选中状态
			if(_child_obj){ //如果有子对象
				_child_obj.each(function(){ //遍历
					var _disabled = $(this).attr("disabled");

					if(_checked){ //根据父对象的选中状态，设置子对象的选中状态
						if (_disabled){
							$(this).removeAttr("checked");
						} else {
							$(this).prop("checked", "checked");
						}
					} else {
						$(this).removeAttr("checked");
					}
					var _child_this = $(this).attr("id"); //根据该子对象的id获取孙对象
					child_check(_child_this); //设置孙对象
				});
			}
		};
	};
})(jQuery);

/**
 * 判断一组CheckBox是否有选中
 * return true; 有选中
 * return false; 无选中
 */
function isCheck(checkBoxName) {
	if ($("input[name='" + checkBoxName + "']:checked").size() == 0)
		return false;
	else
		return true;
}

/**
 * 复选框单选
 */
function checkOne(checkBoxName) {
	$("input[name='" + checkBoxName + "']").click(function() {
		$("input[name='" + checkBoxName + "']").removeAttr('checked');
		$(this).attr('checked', true);
	})
}