<?php

class CounterView {
	
	public $counter=0;
	public $start;
	public $counter2;
	
	function __construct(){
		if(isset($_GET['counter'])){
			$this->counter=$_GET['counter'];
			$this->start=$_GET['counter'];
		}
		
	}
	
	function increment() {
		session_write_close();
		sleep(10);
		session_start();
		$this->counter++;
	}
	
	function setValue() {
		$val=$_POST['sf_action_data']['value'];
		$this->counter=$val;
	}
	
	static function setValue2() {
		$val=$_POST['sf_action_data']['value'];
		$formVars = &SmartyFacesContext::$formVars;
		$formVars['counter']=$val;
	}
	
	function decrement() {
		$this->counter--;
	}
	
	function set() {
		$this->counter=$this->counter2;
	}
	
	static function sessionSize() {
		$s=print_r($_SESSION,true);
		echo strlen($s);
	}
	
	static function increment2() {
		$counter=&SmartyFacesContext::$formVars['counter'];
		$counter++;
	}
	
	static function decrement2() {
		$counter=&SmartyFacesContext::$formVars['counter'];
		$counter--;		
	}
	
	static function set2() {
		$new_val=SmartyFacesContext::$formData["c"];
		$counter=&SmartyFacesContext::$formVars['counter'];
		$setval=&SmartyFacesContext::$formVars['setval'];
		$setval=$new_val;
		$counter=$new_val;
		
	}
	
	static function addToArray() {
		$formVars = &SmartyFacesContext::$formVars;
		$formVars['array'][]=time();
	}

	function exec() {
		sleep(10);
	}
	
}

?>