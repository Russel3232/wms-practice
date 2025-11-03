<?php
require_once('table.class.php');
class cd_purchase_order_details extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $cd_purchase_order_header_id;
	var $child_po_number;
	var $warehouse_id;
	var $item_id;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $unit_price;
	var $amount;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $remarks;

}

?>