<?php
require_once('table.class.php');
class warehouse extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;
	var $warehouse_type_id;
	var $auto_putaway_flag;
	var $default_location_id;
	var $street;
	var $district;
	var $city;
	var $region;
	var $zip_code;
	var $country;
	var $stock_adjustment_approver_id;
	var $rpo_default_bin_location_id;
	var $mpo_default_bin_location_id;
	var $generate_receiving_upon_dispatch;
	//var $pallet_number_series;
	//var $pallet_prefix;

}

?>