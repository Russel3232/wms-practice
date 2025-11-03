<?php
require_once('table.class.php');
class item_plu extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $inventory_unit_flag;
	var $active_flag;
	var $item_id;
	var $uom_id;
	var $quantity;
	var $barcode;
	var $price;
	var $cost;
	var $length;
	var $width;
	var $height;
	var $cbm;
	var $weight;
	var $sales_order_flag;
	var $purchase_order_flag;
	var $description;
	var $minimum_order_quantity;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $whole_unit_flag;
	

}

?>