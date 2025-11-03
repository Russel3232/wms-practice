<?php
require_once('table.class.php');
class cycle_count_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $document_date;
	var $warehouse_id;
	var $reference;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $cycle_count_type_code;
	var $date_from;
	var $date_to;
	var $overall_inventory;

}

?>