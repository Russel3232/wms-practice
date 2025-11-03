<?php
require_once('table.class.php');
class client_address extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $client_id;
	var $active_flag;
	var $default_flag;
	var $street;
	var $district;
	var $city;
	var $region;
	var $zip_code;
	var $country;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;

}

?>