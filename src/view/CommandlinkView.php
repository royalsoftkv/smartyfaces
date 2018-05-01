<?php 

class CommandlinkView {
	
	public $data;
	
	function __construct(){
		$this->data['rendered']=true;
	}
	
	function action() {
		
		$msg = " You submitted " .$this->data['name'];
		SmartyFacesMessages::addGlobalMessage("info", $msg);
		
	}
	
	
}


?>