<?php
require_once('table.class.php');
class bin_location_item extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $location_id;
	var $item_id;
	var $created_date;
	var $created_by;

}

?>