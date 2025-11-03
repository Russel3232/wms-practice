<?php
require_once('table.class.php');
class cd_receiving_details extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $cd_receiving_header_id;
	var $cd_purchase_order_header_id;
	var $item_id;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $lot_number;
	var $expiry_date;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $warehouse_id;
	var $invoice_number;
	var $production_date;
	var $pallet_number;

}

?>