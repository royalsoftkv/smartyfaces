<?php

class RadiogroupView{
	
	
	public $value;
	public $required;
	public $action;
	public $name;
	public $immediate;
	public $rendered=true;
	public $disabled;
	public $class;
	public $direction='horizontal';
	
	function values() {
		return array(
			array('number'=>1,'text'=>'Option 1'),
			array('number'=>2,'text'=>'Option 2'),
			array('number'=>3,'text'=>'Option 3'),
		);
	}
	
	function submit() {
		$msg = "Hey ". $this->name. "," .(($this->value==null) ? " you did not selected option" : " you selected option ".$this->value);
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::ERROR,  $msg);
	}
	
	function select() {
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::ERROR,  "You selected option ".$this->value." with click");
	}
	
	function reset() {
		$this->value=null;
	}
	
}

?>