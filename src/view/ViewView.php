<?php 

class ViewView {
	
	public $counter=0;
	
	function increment() {
		$this->counter++;
	}
	
	static function stateless() {
		if(isset($_GET['stateless'])) {
			return true;
		} else {
			return false;
		}
	}
	
	static function storestate() {
		if(!isset($_GET['storestate'])) {
			return "server";
		} else {
			return $_GET['storestate'];
		}
	}
	
	static function increment2() {
		SmartyFacesLogger::log(print_r(SmartyFacesContext::$formVars, true));
		$vars=&SmartyFacesContext::$formVars;
		$vars['counter']++;
	}
	
	static function toggleLog() {
        SFSession::toggle('log');
		SmartyFaces::reload();
	}
	
	static function log() {
         return SFSession::get('log', false);
	}
	
	static function isCompressState() {
		return SFSession::get('compress_state', false);
	}
	
	function toggleCompressState() {
        SFSession::toggle('compress_state');
		SmartyFaces::clearSession();
	}
	
	
}


?>