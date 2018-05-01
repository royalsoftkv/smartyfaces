<?php 

class PollView {
	
	public $out;
	public $interval=1000;
	public $enabled=true;
	
	function poll(){
		$this->out=date("r");
	}
	
}

?>