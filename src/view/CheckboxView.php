<?php 

class CheckboxView {
	
	public $checked = false;
	public $required = false;
	public $attachMessage = true;
	public $immediate;
	public $class;
	public $disabled;
	public $check;
	public $rendered=true;
	
	public $name;
	public $value2 = true;
	public $block=false;
	public $confirm;
	
	function submit() {
		jQuery::addMessage("Hello, ".$this->name.", you are ".($this->is_checked() ? "" : "not")." agree with terms!");
	}
	
	function is_checked(){
		if($this->check) {
			if($this->checked=="Y") {
				return true;
			} else if ($this->checked=="N") {
				return false;
			} else {
				return false;
			}
		} else {
			if($this->checked) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	function action() {
		if($this->is_checked()) {
			jQuery::addMessage("You checked me ");
		} else {
			jQuery::addMessage("You unchecked me ");
		}
	} 
	
	function get_class() {
		return ($this->class ? "my-class" : "");
	}
	
	function submit2() {
		ob_start();
		ini_set("xdebug.overload_var_dump", "off");
		var_dump($this->value2);
		$s=ob_get_clean();
		$str = "You submitted ".$s;
		jQuery::addMessage($str);
	}
	
}

?>