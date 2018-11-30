var setting = {
	check: {
		enable: true,
		chkStyle: "radio",
		radioType: "all"
	},
	view : {
		dblClickExpand : false
	},
	async : {
		enable : true,
		url : treePath,
		autoParam : [ "id" ]
	},
	callback : {
		beforeExpand: beforeExpand,
		onExpand: onExpand,
		onClick : onClick,
		onCheck: onCheck
	},
	view : {
		selectedMulti : false
	}
};  
var curExpandNode = null;
function beforeExpand(treeId, treeNode) {
	var pNode = curExpandNode ? curExpandNode.getParentNode():null;
	var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
	var zTree = $.fn.zTree.getZTreeObj(zTreeObj);
	for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
		if (treeNode !== treeNodeP.children[i]) {
			zTree.expandNode(treeNodeP.children[i], false);
		}
	}
	while (pNode) {
		if (pNode === treeNode) {
			break;
		}
		pNode = pNode.getParentNode();
	}
	if (!pNode) {
		singlePath(treeNode);
	}
}
function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(zTreeObj);
	zTree.expandNode(treeNode, null, null, null, true);
}
 
function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(zTreeObj),
	nodes = zTree.getCheckedNodes(true),value='',id='';
	for (var i = 0, l = nodes.length; i < l; i++) {
		value += nodes[i].name + ",";
		id += nodes[i].id + ",";
	}
	if (value.length > 0)
		value = value.substring(0, value.length - 1);
	if (id.length > 0)
		id = id.substring(0, id.length - 1);
	$("#" + hidObj).attr("value", id);
	$("#" + valueObj).attr("value", value);
	hideMenu();
} 
function singlePath(newNode) {
	if (newNode === curExpandNode) return;
	if (curExpandNode && curExpandNode.open==true) {
		var zTree = $.fn.zTree.getZTreeObj(zTreeObj);
		if (newNode.parentTId === curExpandNode.parentTId) {
			zTree.expandNode(curExpandNode, false);
		} else {
			var newParents = [];
			while (newNode) {
				newNode = newNode.getParentNode();
				if (newNode === curExpandNode) {
					newParents = null;
					break;
				} else if (newNode) {
					newParents.push(newNode);
				}
			}
			if (newParents!=null) {
				var oldNode = curExpandNode;
				var oldParents = [];
				while (oldNode) {
					oldNode = oldNode.getParentNode();
					if (oldNode) {
						oldParents.push(oldNode);
					}
				}
				if (newParents.length>0) {
					zTree.expandNode(oldParents[Math.abs(oldParents.length-newParents.length)-1], false);
				} else {
					zTree.expandNode(oldParents[oldParents.length-1], false);
				}
			}
		}
	}
	curExpandNode = newNode;
}

function onExpand(event, treeId, treeNode) {
	curExpandNode = treeNode;
}

$.fn.zTree.init($("#"+zTreeObj), setting);
function showMenu() {
	var pidObj = $("#" + valueObj);
	var pidOffset = $("#" + valueObj).offset();
	$("#menuContent").css({
		left : pidOffset.left + "px",
		top : pidOffset.top + pidObj.outerHeight() + "px"
	}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
			event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}