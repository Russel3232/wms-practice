<?php
require_once('table.class.php');
class cd_purchase_order_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
	var $type;
	var $status;
	var $reference;
	var $supplier_id;
	var $supplier_street_address;
	var $supplier_district_address;
	var $supplier_city_address;
	var $supplier_region_address;
	var $supplier_zip_code_address;
	var $supplier_country_address;
	var $supplier_contact_person;
	var $supplier_contact_number;
	var $document_date;
	var $delivery_date;
	var $warehouse_id;
	var $ship_to_street_address;
	var $ship_to_district_address;
	var $ship_to_city_address;
	var $ship_to_region_address;
	var $ship_to_zip_code_address;
	var $ship_to_country_address;
	var $ship_to_contact_person;
	var $ship_to_contact_number;
	var $remarks;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $cancelled_date;
	var $cancelled_by;
	var $document_expiry_date;
	var $store_id;

}

?>