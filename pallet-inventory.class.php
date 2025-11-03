<?php
require_once('table.class.php');
class pallet_inventory extends table{
	
	var $id; //primary key should always be the first variable in every entity class
	var $pallet_number;
	var $item_id;
	var $lot_number;
	var $expiry_date;
	var $base_quantity;
	var $created_date;
	var $created_by;
	var $stock_receipt_header_id;
	var $for_client_id;
	var $mfg_date;
	var $weight;

}

?>