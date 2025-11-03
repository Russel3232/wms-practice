<?php
require_once('table.class.php');
class cd_shipment_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $document_date;
	var $warehouse_id;
	var $cd_load_plan_header_id;
	var $dr_number;
	var $arrival_datetime;
	var $start_loading_datetime;
	var $finished_loading_datetime;
	var $trucking_id;
	var $plate_number;
	var $vehicle_type_id;
	var $driver_name;
	var $dispatcher_id;
	var $seal_number;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>