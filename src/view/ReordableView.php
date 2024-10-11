<?php 

class NoDbReorderableList extends SmartyFacesReordableList {
    function saveReorder($pos_list){
        $sql="update countries set position = case ";
        $new_list=array();
        foreach($pos_list as $index=>$p) {
            $pos=$index+1;
            $id=$this->list[$p]['iso'];
            $old_pos=$this->list[$p]['position'];
            $new_list[]=$this->list[$p];
            if($old_pos!=$pos) {
                $sql.=" when iso='$id' then $pos ";
            }
        }
        $this->list=$new_list;
        $this->reloadPositions();
        $sql.=" end ";
        $dbh = new PDO('sqlite:'.SampleDataManager::$file);
        return $dbh->query($sql)->execute();
    }
}

class ReordableView {
	
	public $countries;
	
	function __construct() {
        $cdm = new CountryDataModel();
        $cdm->load();
		$this->countries=new NoDbReorderableList($cdm->list,true);
	}
	
}
