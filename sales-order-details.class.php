<?php
require_once('table.class.php');
class sales_order_details extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $sales_order_header_id;
	var $item_id;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $unit_price;
	var $amount;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;

}

?>