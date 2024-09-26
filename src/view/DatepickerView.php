<?php 

class DatepickerView {
	
	public $name;
	public $text;
	public $required;
	public $size;
	public $type;
	public $disabled;
	public $buttonImage;
	public $onclick;
	public $onchange;
	public $style;
	public $attachMessage = true;
	public $action;
	public $rendered = true;
	public $bootstrapIcon;

    public $time;
    public $block;
	
	function __construct(){
		$this->resetAttributes();
		$this->date=time();
		if(SmartyFaces::$skin=="bootstrap") {
			$this->dateFormat='DD.MM.YYYY';
		} else {
			$this->dateFormat='dd.mm.yy';
		}
	}
	
	public function submit() {
		$this->text="You submitted: ".$this->name;
	}
	
	function reset() {
		$this->name=null;
		$this->text=null;
	}
	
	function resetAttributes() {
		$this->required=false;
		$this->size=null;
		$this->type='text';
		$this->disabled=0;
		$this->attachMessage=1;
	}
	
	public $date;
	public $date2;
	public function submitDate() {
		$this->text="You submitted: ".$this->date;
	}	
	function resetDatepicker() {
		$this->dateFormat="dd.mm.yy";
		$this->useConverter=1;
	}
	public $useConverter = 1;
	
	static function dateValidator($formData,$id) {
		$val=$formData[$id];
		if($val<time()) {
			SmartyFacesMessages::addError($id, "Date must be in future");
		}
	}
	
	function executeAction() {
		SmartyFacesMessages::addMessage(SmartyFacesMessages::INFO, null, "Youe entered date ". $this->date);
	}

}


?>