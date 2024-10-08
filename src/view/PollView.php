<?php 

class PollView {
	
	public $out;
	public $interval=1000;
	public $enabled=true;
	public $actionData;

	function poll(){
        $out = date("r");
        if(!empty(SmartyFacesContext::$actionData)) {
            $out.=" with actionData: ".json_encode(SmartyFacesContext::$actionData);
        }
		$this->out=$out;
	}

    function getAddActionData() {
        if($this->actionData) {
            return json_encode(["a"=>1,"b"=>"ABC"]);
        }
    }
	
}

