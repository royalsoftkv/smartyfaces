<?php 

class CustomRequestProcessor{
	
	static function process() {
		SmartyFaces::loadAndConfigureSmarty();
		SmartyFaces::loadLanguages();
		SmartyFaces::display("custom.tpl");
	}
	
}

?>