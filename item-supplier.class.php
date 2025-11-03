<?php
require_once('table.class.php');
class item_supplier extends table{
	var $id;
	var $item_id; //primary key should always be the first variable in every entity class
	var $supplier_id;

}

?>