<?php
require_once('table.class.php');
class reclass_input_details extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $reclass_header_id;
	var $item_id;
	var $location_id;
	var $lot_number;
	var $expiry_date;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>