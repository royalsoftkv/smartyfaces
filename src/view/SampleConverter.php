<?php 

class SampleConverter {
	
	static function toString($value) {
		return $value;
	}
	
	static function toObject(&$formData,$id) {
		if(!empty($formData[$id])) {
			$formData[$id]=str_replace(" ","",$formData[$id]);
		}
	}
	
}

?>