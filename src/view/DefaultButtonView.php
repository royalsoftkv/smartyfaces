<?php 

class DefaultButtonView {
	
	
	public $input1;
	public $input2;
	public $input3;
	public $input4;

	function submit1() {
		SmartyFacesMessages::addGlobalSuccess("You submitted button 1");
	}
	
	function submit2() {
		SmartyFacesMessages::addGlobalSuccess("You submitted button 2");
	}
	
	function submit3() {
		SmartyFacesMessages::addGlobalSuccess("You submitted button 3");
	}

	function submit4() {
		SmartyFacesMessages::addGlobalSuccess("You submitted button 4");
	}
}


?>