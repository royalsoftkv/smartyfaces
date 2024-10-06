<?php 

class InplaceView extends  CommonView {
	
	public $text = "";
	public $required;
	public $disabled;
	public $rendered=true;
	public $validator=false;
	public $type="text";
	public $submitted;
	public $ajax;
	
	function submit() {
        if(empty($this->text)) {
            SmartyFacesMessages::addGlobalWarning("You did not submitted text");
        } else {
            SmartyFacesMessages::addGlobalSuccess("You submitted text: " . $this->text);
        }
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
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "You entered value ".$this->text);
		}
	}
	
}

?>