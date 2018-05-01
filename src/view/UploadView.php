<?php 

class UploadView {
	
	public $uploaded;
	public $files;
	
	public $acceptTypes = "gif png jpg";
	public $maxSize = 1000;
	
	public function upload() {
		$this->files=SmartyFaces::getUplaodFiles();
		$this->uploaded=true;
	}
	
	function isImage(){
		if($this->files['type']=="image/png") return true;
	}
}

?>