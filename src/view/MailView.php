<?php

class MailView {
	
	
	public $to;
	public $debug = true;
	public $type='text';
	public $bcc;
	public $bcc_email;
	public $cc;
	public $cc_email;
	
	function __construct(){
		$this->to=uniqid()."@mailinator.com";
		$this->bcc_email=uniqid()."@mailinator.com";
		$this->cc_email=uniqid()."@mailinator.com";
	}
	
	function getBcc() {
		if($this->bcc){
			return $this->bcc_email;
		} else {
			return null;
		}
	}
	
	function getCc() {
		if($this->cc){
			return $this->cc_email;
		} else {
			return null;
		}
	}
	
}

?>