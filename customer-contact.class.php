<?php
require_once('table.class.php');
class client_contact extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $client_id;
	var $active_flag;
	var $default_flag;
	var $name;
	var $designation;
	var $mobile;
	var $telephone;
	var $email;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;

}

?>