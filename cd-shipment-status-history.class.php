<?php
require_once('table.class.php');
class cd_shipment_status_history extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $cd_shipment_header_id;
	var $status;
	var $created_date;
	var $created_by;
	var $remarks;
	var $date_returned;
	var $date_transmitted;
	var $date_received;
	var $received_by;

}

?>