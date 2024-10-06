<?php 

class ImageView {
	
	const DEF_WIDTH=null;
	const DEF_HEIGHT=null;
	
	public $width = self::DEF_WIDTH;
	public $height = self::DEF_HEIGHT;
	
	public $base64=false;
	public $class=false;
	public $responsive=false;
	public $rendered=true;
	public $timestamp=false;
    public $style;
	
	function path() {
		return dirname(dirname(dirname(__FILE__)))."/public/img/tara.jpg";
	}
	
	function path2() {
		return dirname(dirname(dirname(__FILE__)))."/public/img/tara2.jpg";
	}
	
	function reset() {
		$this->width=self::DEF_WIDTH;
		$this->height=self::DEF_HEIGHT;
	}
	
	function data() {
		if($this->base64) {
			return "data:image/jpg;base64,".base64_encode(file_get_contents($this->path2()));
		} else {
			return null;
		}
	}

}


?>