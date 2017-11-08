CKEDITOR.editorConfig = function( config ) {
	config.language = 'ko';
	config.uiColor = '#b22222';
	config.height = 300;
	config.toolbarCanCollapse = true; 
    config.filebrowserUploadUrl = '/yumyum/upload';
    
    config.toolbarGroups = [ { name: 'document',  groups: [ 'mode' ] }, 
                             { name: 'clipboard', groups: [ 'clipboard', 'undo' ] }, 
                             { name: 'editing',   groups: [ 'find', 'selection', 'spellchecker' ] },
                             '/',
                             { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
//                           { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
                             { name: 'links',     groups: ['links',  'insert']}, 
//                           { name: 'tools' }, 
                             { name: 'colors' },
                             { name: 'about' }		
	];
};
