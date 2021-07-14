var VAADIN_DIR_URL = typeof CKEDITOR.vaadinDirUrl !== 'undefined'? CKEDITOR.vaadinDirUrl : "../../../";
  
// Loads magnoliaFileBrowser replacing CKEditor file browser. This is added to the custom config below at config.extraPlugins
CKEDITOR.plugins.addExternal('magnoliaFileBrowser', VAADIN_DIR_URL + 'js/filebrowser/');
  
CKEDITOR.editorConfig = function( config ) {
  
 removePlugins = [];
  
 removePlugins.push("justify");
 removePlugins.push("image");
 removePlugins.push("enterkey");
 removePlugins.push("indent");
 removePlugins.push("list");
 removePlugins.push("sourcearea");
 removePlugins.push("table");
 removePlugins.push("tabletools");
 removePlugins.push("colorbutton");
 removePlugins.push("colordialog");
 removePlugins.push("font");
 removePlugins.push("fontSize");
 removePlugins.push("elementspath");
 removePlugins.push("filebrowser");
  
 config.removePlugins = removePlugins.join(",");
 config.extraPlugins = "magnolialink,magnoliaexpand,magnoliaFileBrowser";
  
 config.baseFloatZIndex = 150;
 config.resize_enabled = false;
 config.toolbar = "Magnolia";
 config.toolbar_Magnolia = [
   {name: "basicstyles", items: ["Bold", "Italic", "Underline", "SpecialChar"]},
   {name: "links",       items: ["Link", "InternalLink", "DamLink", "Unlink" ]},
   {name: "undo",        items: [ "Undo", "Redo" ] }, 
 ];
};