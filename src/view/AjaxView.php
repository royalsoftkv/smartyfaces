<?php 

class AjaxView {
	
	public $text;
	public $out;
	public $text2;
	public $out2;
	public $rendered=true;
	public $onchange;
	public $immediate=true;

    public $text3;
    public $out3;
	
	function change() {
		$actionData=SmartyFacesContext::$actionData;
		$this->out="You changed text to: ".$this->text." actionData=".$actionData;
	}
	
	function change2() {
		$actionData=SmartyFacesContext::$actionData;
		$this->out2="You changed text to: ".$this->text2." actionData=".$actionData;
	}

    function change3() {
        $this->out3="You changed text to: ".$this->text3;
    }
}


?>