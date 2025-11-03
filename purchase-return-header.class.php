<?php
require_once('table.class.php');
class purchase_return_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $status;
	var $supplier_id;
	var $supplier_street_address;
	var $supplier_district_address;
	var $supplier_city_address;
	var $supplier_region_address;
	var $supplier_zip_code_address;
	var $supplier_country_address;
	var $reference;
	var $remarks;
	var $document_date;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;

}

?>