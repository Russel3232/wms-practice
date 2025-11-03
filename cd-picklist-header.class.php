<?php
require_once('table.class.php');
class cd_picklist_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $warehouse_id;
	var $cd_trf_header_id;
	var $document_date;
	var $status;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;
	var $source_type;
	var $cd_purchase_order_header_id;

}

?>