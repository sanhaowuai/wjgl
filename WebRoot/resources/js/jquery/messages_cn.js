/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: CN
 */
var cnmsg = {
	required: "必填",
	remote: "重复了,请修正",
	email: "电子邮件格式不合法",
	url: "请输入合法的网址",
	date: "请输入合法的日期",
	dateISO: "日期 格式不合法(例2010-01-01).",
	number: "数字不合法",
	digits: "输入整数",
	creditcard: "请输入合法的信用卡号",
	equalTo: "请再次输入",
	accept: "文件类型不合法",
	maxlength: jQuery.validator.format("长度最多是 {0} "),
	minlength: jQuery.validator.format("长度最少是 {0} "),
	rangelength: jQuery.validator.format("长度介于 {0} 和 {1} 之间"),
	range: jQuery.validator.format("介于 {0} 和 {1} 之间"),
	max: jQuery.validator.format("最大为 {0} "),
	min: jQuery.validator.format("最小为 {0} ")
};

jQuery.extend(jQuery.validator.messages, cnmsg);