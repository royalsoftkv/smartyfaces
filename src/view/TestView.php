<?php 

class TestView {
	
	public $value;
	public $value2;
	
	public $check;
	public $visible=true;
	
	function __construct(){
		$this->date=time();
	}
	
	public function submit() {
		
	}
	
	public $date;
	
	public function hide() {
		$this->visible=false;
	}
	public function show() {
		$this->visible=true;
	}
	
}

?>