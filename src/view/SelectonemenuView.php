<?php

class SelectonemenuView extends CommonView {
	
	public $country;
	public $countries;
	
	public $required;
	public $noselect = true;
	public $attachMessage = true;
	public $disabled;
	public $action;
	public $rendered=true;
	public $immediate = true;
	public $style;
	public $block=false;
	public $autocomplete=false;
	public $option_class;
	public $free_input = false;
	
	function __construct(){
		$this->countries = SampleData::loadData(100);
	}
	
	function submit() {
		
		if($this->free_input) {
			$country = $this->country;
		} else {
			$country=$this->find_country($this->country);
			$country=$country['name'];
		}
		if($country==null) {
			$m="You did not select country";
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, $m);
			return;
		} else {
			$m="You selected country ".$country;
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, $m);
			return;
		}
	
	}
	
	function change() {
		$country=$this->find_country($this->country);
		if($country==null) {
			$m="You did not select country";
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, $m);
			return;
		} else {
			$m="You selected country ".$country['name'];
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, $m);
			return;
		}
	}
	
	function find_country($iso) {
		foreach($this->countries as $country) {
			if($country['iso']==$iso) {
				return $country;
			}
		}
		return null;
	}
	
	function array1() {
		return array("A","B","C");
	}
	
	function array2() {
		return array("A"=>"Item1","B"=>"Item2","C"=>"Item3");
	}
	
}

?>
