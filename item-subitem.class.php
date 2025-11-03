<?php
require_once('table.class.php');
class item_assembly extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $item_id;
	var $component_id;
	var $component_base_quantity;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	

}

?>