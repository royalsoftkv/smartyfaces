<?php 

class FileuploadView {
	
	public $rendered=true;
	public $acceptTypes = "jpg pdf";
	public $maxSize=100000;
	public $buttonClass;
	public $immediate=true;
	public $fileClass;
	
	public $file;
	public $name;
	
	function fileUploaded(){
		$file=SmartyFaces::getUplaodFiles();
		$this->file=$file;
	}
	
	function set() {
		if($this->maxSize>1000000) {
			jQuery::addMessage("Demo upload is limited to 1MB!");
			$this->maxSize=1000000;
		}
	}
	
	
}


?>