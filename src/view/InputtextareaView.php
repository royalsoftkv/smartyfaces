<?php 

class InputtextareaView {
	
	public $value;
	public $def_value=' Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
			Praesent ipsum ipsum, pharetra et sollicit
			udin vitae, sollicitudin a turpis. Sed 
			justo purus, iaculis non porta non, sodal
			es vel augue. ';
	
	public $required;
	public $disabled;
	public $rendered =true;
	public $validator;
	
	public $rows = 5;
	public $cols = 30;
	public $style = false;
	public $custom = false;
	public $converter = false;
	
	function __construct(){
		$this->value=$this->def_value;
	}
	
	function clear() {
		$this->value='';
	}
	
	function reset() {
		$this->value=$this->def_value;
	}
	
	function submit() {
		jQuery::addMessage("You submitted: ".$this->value);
	}
	
	static function validateLength($formData,$id) {
		$val=$formData[$id];
		if(strlen($val)>50) {
			SmartyFacesMessages::addError($id, "You must enter less than 50 characters");
		}
	}
	
}

?>