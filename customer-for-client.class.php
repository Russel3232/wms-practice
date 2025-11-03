<?php
require_once('table.class.php');
class client_for_client extends table{
	var $client_id; //primary key should always be the first variable in every entity class
	var $for_client_id;

}

?>