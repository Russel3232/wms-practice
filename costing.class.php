<?php
require_once('table.class.php');
class costing extends table{
	var $id; //primary key should always be the first variable in every entity class
	//var $supplier_id;
	var $charges_id;
	var $amount;
	var $reference;
	var $date;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $remarks;
	var $bl_number;
}

?>