<?php 

class CommandbuttonView {
	
	public $data;
    public $submitted2;
	
	function __construct(){
		$this->data['rendered']=true;
		$this->data['default']=false;
		$this->data['immediate']=true;
	}
	
	function action() {
		
		$msg = " You submitted " .$this->data['name'];
		SmartyFacesMessages::addGlobalMessage("info", $msg);
		
	}
	
	function submit2() {
		SmartyFacesMessages::addGlobalMessage("info", "You submitted button 2");
        $this->submitted2 = true;
	}

	function submit3() {
        SmartyFacesMessages::addGlobalMessage("warn", "You submitted warning button");
    }
	
}


