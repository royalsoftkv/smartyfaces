<?php 

class EditorView {
	
	public $data;
	
	function __construct() {
		$this->data['required']=true;
		$this->data['rendered']=true;
		$this->data['config']='';
		$this->data['editortype']="ckeditor";
	}
	
	function submit() {
		$msg = " You submitted " .$this->data['editor'];
		SmartyFacesMessages::addGlobalMessage("info", $msg);
	}
	
	static function editorValidator($formData,$id) {
		$val=$formData[$id];
		if(strlen($val)<50) {
			SmartyFacesMessages::addError($id, "You must enter more that 50 characters");
		}
	}

	function summernoteOptions() {
		$options['toolbar']=array(
				array("style",array("style")),
				array("font",array('bold', 'italic', 'underline', 'clear')),
				array("fontname",array('fontname')),
				array("fontsize",array('fontsize')),
				array("color",array('color')),
				array("para",array('ul', 'ol', 'paragraph')),
				array("copypaste",array('cut', 'copy', 'paste')),
				array("height",array('height')),
				array("table",array('table')),
				array("insert",array('link', 'picture', 'hr')),
				array("view",array('fullscreen', 'codeview')),
				array("help",array('help')),
		);
		return $options;
	}
	
}

?>