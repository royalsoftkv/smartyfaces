<?php 

class UtfTest {
	
	public $string = "ђ";
	
	function getString() {
// 		$s="";
// 		$s="ђ";
		//for($i=0;$i<256;$i++) {
		//	$s.=chr($i);
		//}
// 		$this->string=$s;
	}
	
	function clear() {
		$this->string="";
	}
	
	function chars() {
		$s="";
		$l=mb_strlen($this->string);
		for($i=0;$i<$l;$i++) {
			$c=mb_substr($this->string, $i, 1);
			$o=ord($c);
			$s.=$i;
			$s.=" - ".$c;
			$s.=" - ".$o;
			$nc=chr($o);
			//$nc = @iconv('UTF-8', 'UTF-8//IGNORE', $nc);
			//$s.=" - ".json_encode(chr($o),JSON_UNESCAPED_UNICODE);
			//$s.=json_last_error();
			//$s.=" - ".chr($sc);
			$s.=" - ".$nc;
			$s.="<br/>";
		}
		return $s;
	}
	
}


?>