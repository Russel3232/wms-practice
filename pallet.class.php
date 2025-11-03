<?php
require_once('table.class.php');
class pallet extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $pallet_number;
	var $reference_number;
	var $warehouse_id;
	var $location_id;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $remarks;

}

?>