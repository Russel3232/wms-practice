<?php
require_once('table.class.php');
class cd_receiving_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $warehouse_id;
	var $supplier_id;
	var $trucking_id;
	var $vehicle_type_id;
	var $document_date;
	var $plate_number;
	var $driver_name;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $status;
	var $dr_number;
	var $checker_id;
	var $arrival_datetime;
	var $start_unload_datetime;
	var $end_unload_datetime;
	var $doc_released_datetime;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;

}

?>