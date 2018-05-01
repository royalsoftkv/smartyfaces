<?php

class ListboxView {
	
	public $popup;
	public $selected_countries=array();
	public $class;
	public $style;
	public $disabled;
	
	function countries(){
		$arr=array();
		$list= SampleData::loadData(10);
		foreach($list as $item) {
			$arr[$item['iso']]=$item;
		}
		return $arr;
	}
	
	function submit() {
		$this->popup=true;
	}
	
}

?>