<?php

class PicklistView extends CommonView {
	
	public $available_countries;
	public $selected_countries=array();
	public $popup;
	public $required;
	public $disabled=false;
	
	function __construct() {
		$list=SampleData::loadData(20);
		foreach($list as $item) {
			$this->available_countries[$item['iso']]=$item;
		}
	}
	
	function submit(){
		$this->popup=true;
	}
	
}

