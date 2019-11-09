<?php 

class InputtextView {
	
	public $name;
	public $text;
	public $required;
	public $size;
	public $type;
	public $disabled;
	public $attachMessage; 
	public $placeholder='Enter text here...';
	public $block=false;
	public $readonly = false;
	
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
	
	function change() {
		$this->text="You changed text: ".$this->name. " and action data is ".SmartyFacesContext::$actionData;
	}
	

}


?>
