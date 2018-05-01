<?php

class ViewTest {
	
	public $field1;
	
	function action1() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::SUCCESS, "Success 1");
	}
	
	public $field2;
	
	function action2() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::SUCCESS, "Success 2");
	}
	
}

?>