<?php
require_once('table.class.php');
class bin_transfer extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $item_id;
	var $lot_number;
	var $expiry_date;
	var $uom_id;
	var $quantity;
	var $base_quantity;
	var $location_from_id;
	var $location_to_id;
	var $created_date;
	var $created_by;
	var $pallet_from;
	var $pallet_to;
	var $for_client_id;
	var $mfg_date;
	var $weight;

}

?>