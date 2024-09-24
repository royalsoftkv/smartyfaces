<?php

ini_set("display_errors",1);
error_reporting(E_ALL ^ E_DEPRECATED ^ E_NOTICE);

//ini_set("memory_limit","64M");

define("ROOT",dirname(__FILE__));

require dirname(__DIR__) . '/vendor/autoload.php';

//require_once ROOT."/lib/smartyfaces/SmartyFaces.php";

SmartyFaces::configure(
	array('root_path'=>dirname(ROOT),
	'server_url'=>'/',
	'force_compile'=>false,
	'load_classes'=>false,
	'default_view'=>'demo/home',
	'progressive_loading'=>true,
	'skin'=>'bootstrap',
	'mail_enabled'=>false,
	'eval_with_file'=>false,
		'mail_enabled'=>true,
		'resources_url'=>'/lib'
	)
);

SmartyFacesTrigger::set_trigger(SmartyFacesTrigger::NOT_AUTHORIZED_AJAX, function($formData) {
	
	error_log("Called trigger");
	
});

//require_once ROOT."/lib/smartyfaces/FileUtils.php";
//require_once ROOT.'/lib/php-activerecord/ActiveRecord.php';

//spl_autoload_register(function($name){
//	error_log($name);
//	static $files_map;
//	if(empty($files_map)) {
//		$files = FileUtils::getFilesFromDir(ROOT."/src");
//		foreach($files as $file) {
//			$files_map[basename($file,".php")]=$file;
//		}
//	}
//	if(isset($files_map[$name])) {
//		require_once $files_map[$name];
//	}
//});

ActiveRecord\Config::initialize(function($cfg)
{
	$cfg->set_model_directory(dirname(ROOT).'/src/model');
	$cfg->set_connections(array(
			'development' => 'sqlite://unix('.SampleDataManager::$file.')'));
});

//example for additional language loading function
SmartyFaces::$callbackFunctions[SmartyFaces::CALLBACK_LANGUAGE_LOADING_FUNCTION] = function (&$data) {
	$data['additional_translation']="Additional translation";
};
SmartyFaces::$callbackFunctions[SmartyFaces::CALLBACK_LANGUAGE_NOT_FOUND_FUNCTION] = function($val) {
	error_log("Key $val for translation not found");
};
SmartyFaces::$callbackFunctions[SmartyFaces::CALLBACK_LANGUAGE_PROCESS_TRANSLATION_FUNCTION] = function($key,&$val) {
	error_log("$key = $val");
};

SmartyFaces::startSession();

SmartyFaces::$config['compress_state']=(isset($_SESSION['compress_state']) && $_SESSION['compress_state']);

SmartyFaces::setSkin(DemoFunctions::getSkin());

SmartyFaces::processRequest();



?>
