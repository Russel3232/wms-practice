<?php
require_once('table.class.php');
class client extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $client_group_id;
	var $term_id;
	var $fax;
	var $telephone;
	var $mobile;
	var $email;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;
	var $reservation_strategy;

}

?>