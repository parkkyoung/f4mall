/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	config.language = 'ko';
	//config.uiColor = '#ff0000';
	//config.skin = 'v2';
	config.resize_enabled=false;
	config.width = '98%';
	config.enterMode=CKEDITOR.ENTER_BR;
	config.shiftEnterMode=CKEDITOR.ENTER_P;
	config.extraPlugins = 'autogrow';
	
	config.toolbar_Full=
		[
			 { name:'styles',
		    	 items:[/*'Font',*/'FontSize']
			    /*	items:['Styles','Font','FontSize']*/
		    	 /*items:['Styles']*/
			 },
			{ name:'document',
				items:['Source'/*,'-','Preview','Print'*/]
			},
			{ name:'insert',
		    	items:['Image','SpecialChar','PageBreak']
			 },
			 /*{ name:'links',
			    	items:['Link','Unlink','Anchor']
			 },*/
		     { name:'basicstyles',
		    	items:['Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat']
		     },
			
			 { name:'colors',
			    	items:['TextColor','BGColor']
			 }
			 
		 ];
	
		
		     
};
