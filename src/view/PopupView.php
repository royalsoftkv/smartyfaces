<?php 

class PopupView {
	
	public $popup;
	public $width="'auto'";
	public $modal=true;
	public $immediate=true;
	public $fade=true;
	public $draggable=true;
	public $popup2=false;
	public $popup3=false;
	public $class=false;
	
	function openPopup() {
		$this->popup = true;
	}
	
	function closePopup() {
		$this->popup = false;
	}
	
	
	function save() {
		$req=SmartyFacesContext::$formData['req'];
		jQuery::addMessage("You submitted: ".$req);
		$this->closePopup();
	}
	
	
}


?>