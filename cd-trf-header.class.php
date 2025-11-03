<?php
require_once('table.class.php');
class cd_trf_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $document_date;
	var $cd_purchase_order_header_id;
	var $warehouse_id;
	var $store_id;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>