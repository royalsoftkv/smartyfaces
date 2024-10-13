<?php 

class MySqlDateConverter {
	
	static function toString($value) {
		return date("d.m.Y",is_numeric($value) ? $value : @strtotime($value));
	}
	
	static function toObject(&$formData,$id) {
		if(!empty($formData[$id])) {
			$formData[$id]=strtotime($formData[$id]);
		}
	}
	
	
}


?>