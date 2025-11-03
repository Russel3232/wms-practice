<?php
require_once('table.class.php');
class picklist_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $document_date;
	var $warehouse_id;
	var $picklist_type_code;
	var $picking_group_id;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>