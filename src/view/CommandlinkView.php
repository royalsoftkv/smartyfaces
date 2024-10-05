<?php 

class CommandlinkView {
	
	public $data;
	
	function __construct(){
		$this->data['rendered']=true;
		$this->data['immediate']=true;
	}
	
	function action() {
		
		$msg = " You submitted " .$this->data['name'];
		SmartyFacesMessages::addGlobalMessage("info", $msg);
		
	}

    function clear() {
        $this->data['name']=null;
    }
	
}


?>