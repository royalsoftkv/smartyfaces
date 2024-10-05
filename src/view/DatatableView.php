<?php 

class DatatableView {
	
	public $data;
	public $emptyTable;
	public $selected;
	public $responsive = true;
    public $style;
    public $class;
    public $hideColumns;
	
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

    function getVisibleColumns() {
        if($this->hideColumns) {
            return ["index", "iso", "name"];
        }
        return [];
    }
	
}

?>