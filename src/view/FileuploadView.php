<?php 

class FileuploadView {
	
	public $rendered=true;
	public $acceptTypes = "jpg pdf png";
	public $maxSize=100000;
	public $buttonClass;
	public $immediate=true;
	public $fileClass;
	public $multipleUpload;
	
	public $files;
	public $name;
	
	function fileUploaded(){
		$files=SmartyFaces::getUplaodFiles(false);
		$this->files=$files;
	}
	
	function set() {
		if($this->maxSize>1000000) {
			jQuery::addMessage("Demo upload is limited to 1MB!");
			$this->maxSize=1000000;
		}
	}
	
	
}


?>