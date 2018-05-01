<?php 

class InplaceView {
	
	public $text = "";
	public $required;
	public $disabled;
	public $rendered=true;
	public $validator=false;
	public $type="text";
	public $submitted;
	public $ajax;
	
	function submit() {
		$this->submitted=true;
	}
	
	function clear() {
		$this->text='';
		$this->submitted=false;
	}
	
	static function textValidator($formData,$id) {
		$val=$formData[$id];
		if(strlen($val)<10) {
			SmartyFacesMessages::addError($id, "You must enter minimum 10 characters");
		}
	}
	
	function action() {
		if($this->ajax){
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "You enetered value ".$this->text);
		}
	}
	
}

?>