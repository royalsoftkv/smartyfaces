<?php 

class LightDataModelView {
	
	public $paginator;
	public $sorter;
	
	function __construct(){
		//$this->paginator=new Paginator($this);
		//$this->sorter=new Sorter("name","asc",$this);
		//$this->reload();
		$this->countries = new LightCountryDataModel();
	}
	
	function reload() {
		//$this->countries=SampleDataManager::get($this->paginator,$this->sorter);
	}
	
	function countries() {
		//return SampleDataManager::get($this->paginator,$this->sorter);
	}
	
	public $countries;
	
	
}

?>