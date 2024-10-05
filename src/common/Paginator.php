 <?php

class Paginator {
       
        var $count;
        var $pages;
        var $rows_per_page=10;
        var $start;
        var $stop;
        var $page=1;
       
        private $view;
       
        function __construct($view=null) {
                if($view!=null){
                        $this->view=$view;
                }
        }
       
       
        public function calculate(){
                $this->pages=ceil($this->count/$this->rows_per_page);
                $this->start=($this->page-1)*$this->rows_per_page+1;
                $this->stop=$this->start+$this->rows_per_page-1;
                if($this->stop>$this->count) $this->stop=$this->count;
        }
       
        public function first(){
                if($this->page>1){
                        $this->page=1;
                        $this->reloadView();
                }
        }
       
        public function previous(){
                if($this->page>1){
                        $this->page--;
                        $this->reloadView();
                }
        }
       
        public function next(){
                if($this->page<$this->pages){
                        $this->page++;
                        $this->reloadView();
                }
               
        }
       
        public function last(){
                if($this->page<$this->pages){
                        $this->page=$this->pages;
                        $this->reloadView();
                }
        }
       
        public function getOffset(){
                return ($this->page-1)*$this->rows_per_page;
        }
        public function getLimit(){
                return $this->rows_per_page;
        }
       
        public function changeRowsPerPage($rows) {
                $this->rows_per_page=$rows;
                $this->first();
                $this->reloadView();
        }
       
        public function buildQuery($sql) {
                $limit=$this->getLimit();
                $offset=$this->getOffset();
                $sql=str_replace("select ","select SQL_CALC_FOUND_ROWS ",$sql);
                $sql.=" limit $offset, $limit";
                return $sql;
        }
       
        public function getCount($connection) {
                $sql="SELECT FOUND_ROWS()";
                $count=$connection->query_and_fetch_one($sql);
                $this->count=$count;
                $this->calculate();
        }
       
        private function reloadView() {
                if($this->view!=null) {
                        $this->view->reload();
                }
        }
       
}

?> 