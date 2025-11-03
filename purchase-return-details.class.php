<?php
require_once('table.class.php');
class purchase_return_details extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $purchase_return_header_id;
	var $item_id;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>