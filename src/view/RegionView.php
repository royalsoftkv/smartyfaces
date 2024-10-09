<?php

class RegionView {
	
	public $name;
	public $out1;
	public $out2;
	
	public $counter1=0;
	public $counter2=0;
	
	public $rendered = true;
	
	function submit(){
		$this->out1="Hi, ".$this->name." , now is time: ".date("r")." in region";
		$this->out2="Hi, ".$this->name." , now is time: ".date("r")." in view";
	}
	
	function increment1() {
		$this->counter1++;
	}
	
	function increment2() {
		$this->counter2++;
	}
	
}

