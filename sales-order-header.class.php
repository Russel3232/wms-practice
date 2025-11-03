<?php
require_once('table.class.php');
class sales_order_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $client_id;
	var $client_street_address;
	var $client_district_address;
	var $client_city_address;
	var $client_region_address;
	var $client_zip_code_address;
	var $client_country_address;
	var $shipping_group_id;
	var $sales_representative_id;
	var $reference;
	var $remarks;
	var $document_date;
	var $due_date;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;
	var $for_client_id;

}

?>