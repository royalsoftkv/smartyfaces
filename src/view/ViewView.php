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
		if(isset($_SESSION['log'])) {
			$_SESSION['log']=!$_SESSION['log'];
		} else{
			$_SESSION['log']=true;
		}
		SmartyFaces::reload();
	}
	
	static function log() {
		if(isset($_SESSION['log'])) {
			return $_SESSION['log'];
		} else{
			return false;
		}
	}
	
	static function isCompressState() {
		return isset($_SESSION['compress_state']);
	}
	
	function toggleCompressState() {
		if(isset($_SESSION['compress_state']) && $_SESSION['compress_state']) {
			$_SESSION['compress_state']=false;
		} else {
			$_SESSION['compress_state']=true;
		}
		SmartyFaces::clearSession();
	}
	
	
}


?>