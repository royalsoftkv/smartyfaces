<?php 

class DatepickerView {
	
	public $name;
	public $text;
	public $required;
	public $disabled;
	public $onchange;
	public $style;
	public $attachMessage = true;
	public $action;
	public $rendered = true;
    public $time;
    public $block;
    public $useValidator;
    public $class;
    public $native;
	
	public function submit() {
		$this->text="You submitted: ".$this->name;
	}
	
	function reset() {
		$this->name=null;
		$this->text=null;
	}
	

	public $date;
	public function submitDate() {
        if(empty($this->date)) {
            SmartyFacesMessages::addGlobalWarning("You dis not submitted date");
        } else {
            SmartyFacesMessages::addGlobalSuccess("You submitted: ".$this->date);
        }

	}
    public function clearDate() {
        $this->date=null;
    }
	public $useConverter = false;
	static function dateValidator($formData,$id) {
		$val=strtotime($formData[$id]);
		if($val<time()) {
			SmartyFacesMessages::addError($id, "Date must be in future");
		}
	}
	function executeAction() {
		SmartyFacesMessages::addMessage(SmartyFacesMessages::INFO, null, "Datepicker action: You entered date ". $this->date);
	}

}


?>