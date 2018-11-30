/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

	config.language = 'zh-cn'; //配置语言
	config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;
	config.width = '100%'; //宽度
	config.height = '280'; //高度
	//config.toolbarCanCollapse = true;//工具栏是否可以被收缩
	//config.toolbarStartupExpanded = true;//工具栏默认是否展开
	config.resize_enabled = true; // 取消 “拖拽以改变尺寸”功能
	config.resize_maxHeight = '350'; //改变大小的最大高度 
	config.resize_maxWidth = '100%'; //改变大小的最大宽度
	config.resize_minHeight = '200'; //改变大小的最小高度
	config.resize_minWidth = '100%'; //改变大小的最小宽度
	
	config.toolbar_None = [
	];

	config.toolbar_Simple = [
        ['Source','-','Bold','Italic']
    ];

	config.toolbar_Basic = [
	    ['Source'],
	    ['Bold','Italic','Underline','-','TextColor','BGColor'],
	    ['Image','Flash'],
	    ['Styles','Format','Font','FontSize']
	];
	
	config.toolbar_Full = [
   		['Source','-','NewPage','Preview','Print'],
		['Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo'],
		['Find','Replace','-','SelectAll','RemoveFormat'],
		['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
		['ShowBlocks','Maximize'],
		'/',
		['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl'],
		['Link','Unlink','Anchor'],
		['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		'/',
		['Styles','Format','Font','FontSize'],
		['TextColor','BGColor']
	];
	
};
