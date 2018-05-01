<?php 

class RadioTestView {
	
	public $options=array("a","b","c");
	
	public $value = "b";
	
	public function out() {
		echo print_r($_POST,true);
	}
	
}

?>