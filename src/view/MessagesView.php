<?php

class MessagesView {
	
	public $name;
	public $style;
	public $class;
	public $styled = true;
	public $customClasses;

	function submit1() {
		SmartyFacesMessages::addMessage(SmartyFacesMessages::SUCCESS, "name", "Hello ".$this->name);
	}
	
	function submit2() {
		SmartyFacesMessages::addError(null,"Hello ".$this->name);
	}
	
	function submitSuccess() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::SUCCESS, "Success message");
	}
	
	function submitInfo() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "Info message");
	}
	
	function submitWarning() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::WARNING, "Warning message");
	}
	
	function submitError() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::ERROR, "Error message");
	}
	
	function submitMultiple(){
		$this->submitWarning();
		$this->submitError();
	}
	
	function getCustomClasses() {
		if($this->customClasses) {
			return array(
				SmartyFacesMessages::ERROR=>"msg-danger",
				SmartyFacesMessages::INFO=>"msg-info",
				SmartyFacesMessages::SUCCESS=>"msg-success",
				SmartyFacesMessages::WARNING=>"msg-warning"
			);
		} else {
			return array();
		}
	}
	
	
	function sendFlash() {
		SmartyFacesMessages::addFlashMessage(SmartyFacesMessages::INFO, "This is flash message");
		SmartyFaces::reload();
	}
	
}
