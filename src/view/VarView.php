<?php

class VarView {
	
	static function increment() {
		$formVars = &SmartyFacesContext::$formVars;
		$formVars['counter']++;
	}
	
	static function get_array() {
		return array("a"=>"123","b"=>"456");
	}
	
	static function addToArray() {
		$formVars = &SmartyFacesContext::$formVars;
		$formVars['array']["c"]="789";
	}
	
	static function resetArray() {
		$formVars = &SmartyFacesContext::$formVars;
		$formVars['array'] = self::get_array();
	}
}

?>