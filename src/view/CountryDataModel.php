<?php

class CountryDataModel extends SmartyFacesDataModel {
	
	function __construct() {
		$this->resetFilter();
		$this->default_sort="iso3 asc";
		$this->asc=true;
	}
	
	function getRowKey($row) {
		return $row['iso'];
	}
	
	function query($count) {
		if($count) {
			$sql="select count(*) ";
		} else {
			$sql="select * ";
		}
		$sql.= "from countries ";
		$name=$this->getFilter("name");
		$where=false;
		if($name!==false) {
			$where=true;
			$sql.=" where lower(name) like '".strtolower(str_replace("*", "%", $name))."' ";
		}
		$numcode=$this->getFilter("numcode");
		if($numcode!==false) {
			$sql.=($where ? " and " : " where ")." numcode = '$numcode' ";
		}
		return $sql;
	}
	
	function getList($sql){
		$dbh = new PDO('sqlite:'.SampleDataManager::$file);
		return $dbh->query($sql)->fetchAll();
	}
	
	function getCount($sql){
		$dbh = new PDO('sqlite:'.SampleDataManager::$file);
		return $dbh->query($sql)->fetchColumn(0);
	}
	
	function toggleActive1($key,$row) {
 		SampleDataManager::toggleActive($key);
 		$country=SampleDataManager::findByKey($key);
 		SmartyFaces::$smarty->assign("country",$country);
 		SmartyFaces::$smarty->assign("row",$row);
	}
	
	function toggleActive2($key) {
 		SampleDataManager::toggleActive($key);
	}
	

	
	
}

