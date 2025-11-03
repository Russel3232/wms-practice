<?php
require_once('table.class.php');
class purchase_order_header extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $transaction_number;
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
	var $ship_to;
	var $warehouse_id;
	var $client_id;
	var $ship_to_street_address;
	var $ship_to_district_address;
	var $ship_to_city_address;
	var $ship_to_region_address;
	var $ship_to_zip_code_address;
	var $ship_to_country_address;
	var $ship_to_contact_person;
	var $ship_to_contact_number;
	var $terms_id;
	var $remarks;
	var $document_date;
	var $delivery_date;
	var $created_date;
	var $created_by;
	var $updated_date;
	var $updated_by;
	var $proforma_invoice;
	var $shipment_terms_id;
	var $currency_id;
	var $approved_by;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;
	var $for_client_id;

}

?>