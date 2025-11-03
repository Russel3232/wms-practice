<?php
require_once('table.class.php');
class cd_load_plan_transaction extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $cd_load_plan_header_id;
	var $cd_purchase_order_header_id;
	var $cd_trf_header_id;
	var $created_date;
	var $created_by;

}

?>