<?php 

class EditorView {
	
	public $data;
	
	function __construct() {
		$this->data['required']=false;
		$this->data['rendered']=true;
		$this->data['config']='';
		$this->data['editortype']="ckeditor";
	}
	
	function submit() {
        if(empty($this->data['editor'])) {
            SmartyFacesMessages::addGlobalWarning("You did not enter text");
        } else {
            $msg = " You submitted " .$this->data['editor'];
            SmartyFacesMessages::addGlobalSuccess($msg);
        }
	}

    function clear() {
        $this->data['editor']=null;
    }
	
	static function editorValidator($formData,$id) {
		$val=$formData[$id];
		if(strlen($val)<50) {
			SmartyFacesMessages::addError($id, "You must enter more that 50 characters");
		}
	}

	function summernoteOptions() {
        $options = [];
        if(@$this->data['customSummernote']) {
            $options['toolbar']=array(
                array("style",array("style")),
                array("font",array('bold', 'italic', 'underline', 'clear')),
                array("fontname",array('fontname')),
                array("fontsize",array('fontsize')),
                array("color",array('color')),
                array("para",array('ul', 'ol', 'paragraph')),
                array("hello",array('hello')),
                array("height",array('height')),
                array("table",array('table')),
                array("insert",array('link', 'picture', 'hr')),
                array("view",array('fullscreen', 'codeview')),
                array("help",array('help')),
            );
        }
		return $options;
	}

    function summernotePlugins() {
        if(@$this->data['customSummernote']) {
            return ['ext-hello'];
        }
        return [];
    }

    function ckEditorConfig() {
        if(@$this->data['editorconfig']) {
            return ['customConfig'=>'../../js/ckeditor_config.js'];
        } else {
            return [];
        }
    }
	
}

?>