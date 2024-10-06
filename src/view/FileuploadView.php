<?php 

class FileuploadView extends CommonView {
	
	public $rendered=true;
	public $acceptTypes = "jpg pdf png";
	public $maxSize=100000;
	public $buttonClass;
	public $immediate=true;
	public $fileClass;
	public $multipleUpload;
	
	public $files;
	public $name;

    function __construct() {
        $this->reset();
    }
	
	function fileUploaded(){
		$files=SmartyFaces::getUplaodFiles(false);
		$this->files=$files;
	}
	
	function set() {
	}

    function reset() {
        $this->acceptTypes = "jpg pdf png";
        $this->maxSize=100000;
    }
	
}


?>