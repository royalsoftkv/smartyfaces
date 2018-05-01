<?php 

class ColumnView {
	
	public $data;
	public $rendered = true;
	
	function __construct() {
		$this->data=SampleData::loadData(10);
	}

	
	
	
}



?>