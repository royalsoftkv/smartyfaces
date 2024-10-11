<?php 

class SampleDataManager {
	
	static $file;

	static function initDB() {
		
		self::$file=dirname(dirname(dirname(__FILE__)))."/db/sample.sqlite";
		if(file_exists(self::$file)) return;
		
		$dbh = new PDO('sqlite:'.self::$file);
		require_once dirname(dirname(dirname(__FILE__)))."/src/view/SampleData.php";
		
		$rows=SampleData::getData();
		
		$dbh->query("DROP TABLE IF EXISTS countries");
		$dbh->query("CREATE TABLE countries (iso varchar(10), name varchar(100), iso3 varchar(10), numcode int, active int default 0, position int)");
		
		$position=0;
		foreach($rows as $row) {
			$position++;
			$dbh->query("INSERT INTO countries VALUES ('".$row['iso']."','".$row['name']."','".$row['iso3']."',".$row['numcode'].",1, $position)");
		}
		
		//create second table
		$dbh->query("DROP TABLE IF EXISTS countries2");
		$dbh->query("CREATE TABLE countries2 (iso varchar(10), name varchar(100), iso3 varchar(10), numcode int, active int default 0, position int)");
		
		$position=0;
		foreach($rows as $row) {
			if($position>10) continue;
			$position++;
			$dbh->query("INSERT INTO countries2 VALUES ('".$row['iso']."','".$row['name']."','".$row['iso3']."',".$row['numcode'].",1, $position)");
		}
		
	}
	
	static function getAll() {
		$dbh = new PDO('sqlite:'.self::$file);
		return $dbh->query("select * from countries")->fetchAll();
	}
	
	static function get(paginator $paginator, Sorter $sorter) {
		$dbh = new PDO('sqlite:'.self::$file);
		$sql="select count(*) from countries";
		$count=$dbh->query($sql)->fetchColumn(0);
		$paginator->count=$count;
		$limit=$paginator->getLimit();
		$offset=$paginator->getOffset();
		$col=$sorter->column;
		$ord=$sorter->asc ? "ASC" : "DESC";
		$sql="select * from countries
		order by $col $ord
		limit $offset, $limit";
		$paginator->calculate();
		return $dbh->query($sql)->fetchAll();
	}
	
	static function getSingle($sql) {
		$dbh = new PDO('sqlite:'.self::$file);
		return $dbh->query($sql)->fetchColumn(0);
	}
	
	static function execute($sql) {
		$dbh = new PDO('sqlite:'.self::$file);
		$dbh->query($sql);
	}
	
	static function toggleActive($key){
		$sql="update countries set active=case when active=1 then 0 else 1 end where iso='$key'";
		self::execute($sql);
	}
	
	static function findByKey($key){
		$dbh = new PDO('sqlite:'.self::$file);
		$sql="select * from countries c where c.iso='$key'";
		$rows=$dbh->query($sql)->fetchAll();
		return $rows[0];
	}
	
}

SampleDataManager::initDB();



