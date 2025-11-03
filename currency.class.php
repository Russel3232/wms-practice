<?php
require_once('table.class.php');
class currency extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $exchange_rate;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;

}

?>