<?php
require_once('table.class.php');
class item extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $active_flag;
	var $code;
	var $name;
	var $description;
	var $item_type_id;
	var $category_id;
	var $expiry_flag;
	var $reorder_quantity;
	var $quantity_per_pallet;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $label;
	var $brand_id;
	var $origin_id;
	var $sku_type_id;
	var $subcategory1_id;
	var $subcategory2_id;
	var $ax_code;
	var $fda_reference_number;
	var $validity_date;
	var $packaging_id;
	var $srp;
	var $dfp_po_cost;
	var $excise;
	var $vat;
	var $currency_id;
	var $shelf_life_in_months;
	var $user_defined_field1;
	var $user_defined_field2;
	var $user_defined_field3;
	var $user_defined_field4;
	var $user_defined_field5;

}

?>