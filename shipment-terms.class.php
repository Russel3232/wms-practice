<?php
require_once('table.class.php');
class shipment_terms extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $shipment_type;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;

}

?>