var treePath = "";
var zTreeObj = "";
var hidObj ="";
var valueObj="";  
var menuContent = "";
var setting = {};

function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(zTreeObj);
	if(treeNode.isParent){
		//zTree.expandNode(treeNode, null, null, null, true);
	}else{
		$("#" + hidObj).attr("value", treeNode.id);
		if($("#" + valueObj).length>0){
			if(hidObj=="jg"){
				var name = "";
				var parent = treeNode.getParentNode();
				var treeName = treeNode.name;
				var endStr = treeName.substr(treeName.length-1,1);
				var id = treeNode.id;
				var idStart = id.substr(0,2);
				if(parent){
					var pparent = parent.getParentNode();
					if(endStr=="区"&&idStart!='11'&&idStart!='12'&&idStart!='31'&&idStart!='50'){
						name = pparent.name+parent.name+treeName;
					}else{
						name = pparent.name+treeName;
					}
				}else{
					name = treeName;
				}
				$("#" + valueObj).val(name);
			}else{
				$("#" + valueObj).val(treeNode.name);
			}
		}else{
			var data = {"id":treeNode.id};
			if(hidObj=="yjfxxk11"){
				chosenIdParams("yjfxxk21",data);
			}else if(hidObj=="yjfx12"){
				chosenIdParams("yjfx22",data);
			}else if(hidObj=="zy"){
				chosenIdParams("zpgwmc",data);
			}else if(hidObj=="shzy"){
				chosenIdParams("szbmshgw",data);
			}else if(hidObj=="szbmshzy"){
				chosenIdParams("szbmshgw",data);
			}
			$("#" + hidObj).val(treeNode.name);
		}
		hideMenu();
	}
}

function onDblClick(event, treeId, treeNode){
	$("#" + hidObj).val(treeNode.id);
	if($("#" + valueObj).length>0){
		$("#" + valueObj).val(treeNode.name);
	}else{
		$("#" + hidObj).val(treeNode.name);
	}
	hideMenu();
}

var treeCombox;
function showMenu(config) {
	treePath = rootUrl+config.treePath;
	zTreeObj = config.hidObj+"_zTreeObj";
	hidObj =config.hidObj;
	valueObj=config.hidObj+"_NAME";
	menuContent = config.hidObj+"_MenuContent";
	setting = {
			view : {
				dblClickExpand : true,
				selectedMulti : false,
				showLine:true
			},
			async : {
				enable : true,
				url : treePath,
				autoParam : [ "id" ]
			},
			callback : {
				onClick : onClick
//				,onDblClick:onDblClick
			}
		};
	treeCombox = $.fn.zTree.init($("#"+zTreeObj), setting);
	var pidObj = $("#" + valueObj);
	var pidOffset = $("#" + valueObj).offset();
	if(!(pidObj.length>0)){
		pidObj = $("#"+hidObj);
		pidOffset = $("#"+hidObj).offset();
	}
	$("#"+menuContent).css({
		left : pidOffset.left + "px",
		top : pidOffset.top + pidObj.outerHeight() + "px"
	}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#"+menuContent).fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == menuContent || $(
			event.target).parents("#"+menuContent).length > 0)) {
		hideMenu();
	}
}
