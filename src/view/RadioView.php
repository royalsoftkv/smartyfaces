<?php 

class RadioView extends CommonView {
	
	public $selected;
	public $required;
	public $action;
	public $disabled;
	public $check;
	public $confirm;
	
	public $radio;
	
	function submit(){
		$str=($this->is_checked() ? "You selected " : "You did not selected")." radio";
        $str.= " [".$this->selected."]";
		SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, $str);
	}
	
	function is_checked(){
		if($this->check) {
			if($this->selected=="Y") {
				return true;
			} else if ($this->selected=="N") {
				return false;
			} else {
				return false;
			}
		} else {
			if($this->selected) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	function reset() {
		if($this->check) {
			$this->selected="N";
		} else {
			$this->selected=false;
		}
	}
	
	function action() {
		if($this->is_checked()) {
			jQuery::addMessage("You checked me ");
		} else {
			jQuery::addMessage("You unchecked me ");
		}
	}
	
	function submit2() {
		if($this->radio>0) {
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "You submitted radio ".$this->radio);
		} else {
			SmartyFacesMessages::addGlobalMessage(SmartyFacesMessages::INFO, "You did not submit radio ");
		}
	}

    function execAction() {
        SmartyFacesMessages::addGlobalSuccess("Radio input clicked!");
    }
}


