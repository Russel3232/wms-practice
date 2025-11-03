<?php
require_once('table.class.php');
class bin_location extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $warehouse_id;
	var $zone_id;
	var $weight_capacity;
	var $cbm_capacity;
	var $capacity;
	var $on_hold_flag;
	var $disposition;
	var $suggestion_flag;
	var $location_index;
	var $all_items_flag;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $active_flag;
	var $staging_flag;
	var $pallet_slot;
	var $pick_phase_flag;

}

?>