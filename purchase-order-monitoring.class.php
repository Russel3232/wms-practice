<?php
require_once('table.class.php');
class purchase_order_monitoring extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $purchase_order_header_id;
	var $date_dfp_received;
	var $date_integ_received;
	var $date_dfp_po_approved;
	var $remarks;
	var $created_date;
	var $created_by;
	var $pbi_number;
	var $type;
	var $port_of_origin;
	var $port_of_destination;
	var $eta_manila_port;
	var $ata_manila_port;
	var $container_size;
	var $bl_number;
	var $broker;
	var $storage;
	var $demurrage;
	var $other_charges;


}

?>