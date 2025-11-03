<?php
require_once('table.class.php');
class cd_load_plan_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $document_date;
	var $status;
	var $warehouse_id;
	var $store_id;
	var $dr_number;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>