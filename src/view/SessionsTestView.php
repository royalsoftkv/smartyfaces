<?php

class SessionsTestView
{

	public $counter;

	function increment() {
		sleep(1);
		$this->counter++;
	}

	static function processIframe() {
		$counter = SFSession::get('iframe');
		sleep(1);
		$counter++;
		SFSession::set('iframe', $counter);
		return $counter;
	}



}