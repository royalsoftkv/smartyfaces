<?php 

class DemoFunctions {
	
	public $filter=false;
	
	function dofilter(){
		
	}

	function components() {
		return self::getComponents($this->filter);
	}
	
	static function getPluginsDir() {
		$reflector = new ReflectionClass('SmartyFaces');
		$folder=dirname($reflector->getFileName()).DIRECTORY_SEPARATOR."smarty_plugins";
		return $folder;		
	}
	
	static function getComponents($filter=false) {
		if(strlen($filter)==0) $filter=false;
		$folder=self::getPluginsDir();
		$files=FileUtils::getFilesFromDir($folder);
		usort($files, function($file1,$file2) {
			$name1= basename($file1,".php");
			$name2= basename($file2,".php");
			$name1=str_replace("block", "", $name1);
			$name1=str_replace("function", "", $name1);
			$name2=str_replace("block", "", $name2);
			$name2=str_replace("function", "", $name2);
			return strcmp($name1, $name2);
		});
		$list=array();
		foreach ($files as $file) {
			$name= basename($file,".php");
			$arr=explode(".", $name);
			$tag=$arr[1];
			if(!in_array($tag,$list)) {
				if($filter===false or ($filter!==false and strpos($tag, $filter)!==false)) {
					$list[]=$tag;
				}
			}
		}
		return $list;
	}
	
	static function getFileType($file) {
		$arr=explode(".", basename($file));
		return $arr[0];
	}
	
	static function getAttributes($tag) {
		$file=self::getTagFile($tag);
		$type=self::getFileType($file);
		$fn='smarty_'.$type.'_'.$tag;
		require_once $file;
		if($type=="function") {
			$attributes = $fn(null,null);
		} else {
			$param=false;
			$attributes = $fn(null,null,null,$param);
		}
		$list=array();
		foreach($attributes as $name=>$attr) {
			$attr['name']=$name;
			$list[]=$attr;
		}
		return $list;
	}

	
	static function getAttributesOld($tag) {
		$file=self::getTagFile($tag);
		$arr = file($file);
		$start=null;
		foreach($arr as $row=>$line) {
			$line=trim($line);
			if($line=='$attributes=array(') {
				$start=$row;
				continue;
			}
			if($start!=null and $line==");") {
				$stop=$row;
				break;
			}
		}
		$arr2=array_slice($arr, $start, $stop-$start+1);
		$str=implode(PHP_EOL, $arr2);
		eval($str);
		$list=array();
		foreach($attributes as $name=>$attr) {
			$attr['name']=$name;
			$list[]=$attr;
		}
		return $list;
	}
	
	static function getTagFile($tag) {
		$folder=self::getPluginsDir();
		$files=FileUtils::getFilesFromDir($folder);
		foreach ($files as $file) {
			$name= basename($file,".php");
			$arr=explode(".", $name);
			if($arr[1]==$tag){
				$type=self::getFileType($file);
				if($type=="block" and file_exists($folder."/function.$tag.php")) {
					return $folder."/function.$tag.php";
				}
				return $file;
			}
		}
	}
	
	static function getClassNameSource($class) {
		$file=__DIR__."/".$class.".php";
		if(!file_exists($file)) return "";
		return htmlspecialchars(file_get_contents($file));
	}
	
	static function getClassSource($tag) {
		$name=str_replace("sf_", "", $tag);
		$class=strtoupper(substr($name,0,1)).substr($name, 1)."View";
		$file=__DIR__."/".$class.".php";
		if(!file_exists($file)) return "";
		return htmlspecialchars(file_get_contents($file));
	}
	
	static function tagExists($tag) {
		return file_exists(dirname(dirname(__DIR__))."/view/demo/components/$tag.tpl");
	}
	
	static function getSkin() {
		if(isset($_SESSION['skin'])) {
			return $_SESSION['skin'];
		}
		return "bootstrap";
	}
	
	static function changeSkin($skin) {
		$_SESSION['skin']=$skin;
		SmartyFaces::reload();
	}
	
}


?>