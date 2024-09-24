<?php 

class DatatableView {
	
	public $data;
	public $emptyTable;
	public $selected;
	public $responsive;
	
	function __construct(){
		$this->data=SampleData::loadData(10);
	}
	
	function countries() {
		if($this->emptyTable) {
			return array();
		} else {
			return $this->data;
		}
	}
	
	function getRowClass($row){
		if(@$row['iso']=="DZ"){
			return "red";
		} else {
			return "";
		}
	}
	
}

?>