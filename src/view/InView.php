<?php

class InView {
	
	public $counter;
	
	function __construct($args=null) {
		if($args) {
			$this->counter=$args;
		} else {
			$this->counter=1;
		}
	}
	
	function increment() {
		$this->counter++;
	}
	
}

?>