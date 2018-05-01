<?php 

class DemoView {
	
	public $name;
	public $text;
	public $required;
	public $size;
	public $type;
	public $disabled;
	public $attachMessage; 
	
	function __construct(){
		$this->resetAttributes();
		$this->date=time();
	}
	
	public function submit() {
		$this->text="You submitted: ".$this->name;
	}
	
	function reset() {
		$this->name=null;
		$this->text=null;
	}
	
	function resetAttributes() {
		$this->required=1;
		$this->size=null;
		$this->type='text';
		$this->disabled=0;
		$this->attachMessage=1;
	}
	
	public $date;
	public function submitDate() {
		$this->text="You submitted: ".$this->date;
	}	
	public $dateFormat="dd.mm.yy";
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

}


?>