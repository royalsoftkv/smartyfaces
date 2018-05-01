 <?php

class Sorter {
       
        public $column;
        public $asc;
        public $view;
        public $reset;
       
        function __construct($column=null,$asc=true,$view=null) {
                $this->column=$column;
                $this->asc=$asc;
                if($view!=null){
                        $this->view=$view;
                }
        }
       
        public function buildQuery($sql) {
                $column=$this->column;
                $order=($this->asc ? "asc" : "desc");
                if($column==null) return $sql;
                $sql.= " order by $column $order";
                return $sql;
        }
       
        public function text($column) {
                if($this->column==$column) {
                        return ($this->asc ? "ASC" : "DESC");
                } else {
                        return "-";
                }
        }
       
        public function icon($column) {
                if($this->column==$column) {
                        return ($this->asc ?
                                        '<span class="ui-sortable-column-icon ui-icon ui-icon-carat-2-n-s ui-icon-triangle-1-n"></span>'
                                        :
                                        '<span class="ui-sortable-column-icon ui-icon ui-icon-carat-2-n-s ui-icon-triangle-1-s"></span>');
                } else {
                        return '<span class="ui-sortable-column-icon ui-icon ui-icon-carat-2-n-s"></span>';
                }
        }
       
        public function sort($column) {
                if($this->column==$column) {
                        $this->asc=!$this->asc;
                } else {
                        $this->column=$column;
                        $this->asc=true;
                }
                $this->reloadView();
        }
       
        private function reloadView() {
                if($this->view!=null) {
                        $this->view->reload();
                }
        }
}

?> 