<?php 

class TabsView {
	
	public $ajax=true;
	public $load=true;
	public $check;
	public $input;
	public $tab=1;
	
	function getAction() {
		if($this->ajax) {
			return "#[\$bean->action()]";
		} else {
			return null;
		}
	}
	
	function action() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "Action executed");
	}
	
	
}

?>