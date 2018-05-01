<?php 

class ReordableView {
	
	public $countries;
	
	function __construct() {
		$this->countries=new SmartyFacesReordableList(Country::all(array("order"=>"position")),true);
	}
	
}

?>