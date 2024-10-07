<?php 

class OutputtextView extends CommonView {
	
	public $converter;
	public $rendered = true;
	public $style=false;
	
	function now() {
		return time();
	}
	
}


class OutputtextConverter {

	static function toString($value) {
		return date("d.m.Y",$value);
	}

	static function toObject(&$formData,$id) {
		if(!isset($formData[$id])) return;
		$value=$formData[$id];
		$formData[$id]=strtotime($value);
	}


}


