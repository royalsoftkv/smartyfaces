<?php 

class CommandbuttonView {
	
	public $data;
	
	function __construct(){
		$this->data['rendered']=true;
		$this->data['default']=false;
	}
	
	function action() {
		
		$msg = " You submitted " .$this->data['name'];
		SmartyFacesMessages::addGlobalMessage("info", $msg);
		
	}
	
	function submit2() {
		SmartyFacesMessages::addGlobalMessage("info", "You submitted button 2");
	}
	
	
}


?>