<?php 

class LinkView {
	
	public $disabled;
	
	static function action() {
        $counter = SFSession::get('LinkViewCounter', 0);
        $counter++;
        SFSession::set('LinkViewCounter', $counter);
		SmartyFaces::reload();
	}

    static function counter() {
        return SFSession::get('LinkViewCounter', 0);
    }
	
	static function clear() {
        SFSession::delete('LinkViewCounter');
		SmartyFaces::reload();
	}
	
	static function actionWithParams(){
		$params=$_POST['params'];
		$msg="Action parameters are: " . print_r($params,true);
		jQuery::addMessage($msg);
		jQuery::getResponse();
		exit();
	}
	
}


?>