<?php
require_once('table.class.php');
class for_client extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $rcv_prefix;
	var $iss_prefix;
	var $rcv_number_series;
	var $iss_number_series;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;

}

?>