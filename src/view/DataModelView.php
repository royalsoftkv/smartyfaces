<?php 

class DataModelView {
	
	public $paginator;
	public $sorter;
	
	function __construct(){
		$this->countries = new CountryDataModel();
	}
	
	public $countries;
	
	
}

?>