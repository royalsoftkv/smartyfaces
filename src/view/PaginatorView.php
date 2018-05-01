<?php 

class PaginatorView {
	
	public $countries;
	public $immediate=true;
	
	function __construct(){
		$this->countries = new CountryDataModel();
	}
	
}


?>