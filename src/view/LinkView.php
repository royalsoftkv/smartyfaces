<?php 

class LinkView {
	
	public $disabled;
	
	static function action() {
		if(!isset($_SESSION['LinkView']['counter'])) $_SESSION['LinkView']['counter']=0;
		$_SESSION['LinkView']['counter']++;
		SmartyFaces::reload();
	}
	
	static function clear() {
		$_SESSION['LinkView']['counter']=0;
		SmartyFaces::reload();
	}
	
	static function actionWithParams(){
		$params=$_POST['params'];
		$msg="Action parameters are: " . print_r($params,true);
		jQuery::addMessage($msg);
		jQuery::getResponse();
		exit();
	}
	
}


?>