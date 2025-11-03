<?php 
	include("../../../config/connection.php");
    include("../../../config/checkurlaccess.php");
    include("../../../config/checklogin.php");
    include("../../../config/functions.php");

	// strip tags may not be the best method for your project to apply extra layer of security but fits needs for this tutorial 
	$sourcetype = isset($_GET['sourcetype'])?escapeString($_GET['sourcetype']):'';
	$sourcenumberid = isset($_GET['sourcenumberid'])?escapeString($_GET['sourcenumberid']):'';
	$supplierid = isset($_GET['supplierid'])?escapeString($_GET['supplierid']):'';
	$exemptfreegoods = isset($_GET['exemptfreegoods'])?escapeString($_GET['exemptfreegoods']):'';
	$client = isset($_GET['client'])?escapeString($_GET['client']):''; 

	
	if(isset($_GET['client'])){
 

		if($client!=null && $client!="null" &&  strlen($client)>0){
			$clientqry = mysql_query("SELECT code from for_client where id = '$client' or code = '$client'");
			if(mysql_num_rows($clientqry)>0){
				$client = mysql_fetch_object($clientqry)->code;
			}
			
		}

	}
	

	$search = isset($_GET['q'])?strip_tags(trim($_GET['q'])):''; 
	$search = escapeString($search);

	$activeflag = isset($_GET['flag'])?$_GET['flag']:'';

	$exceptitem = isset($_GET['exceptitem'])?$_GET['exceptitem']:'';


	$condition1 = '';
	$condition2 = array();
	if(trim($activeflag)!=''){
		$condition1 .= " and item.active_flag='$activeflag'";
		array_push($condition2, "item.active_flag='$activeflag'");
	}

	if(trim($exceptitem)!=''){
		$condition1 .= " and item.id!='$exceptitem'";
		array_push($condition2, "item.id!='$exceptitem'");
	}

	if(trim($exemptfreegoods)!=''){
		$condition1 .= " and left(item.code,1) != '9' ";
		array_push($condition2, "left(item.code,1) != '9'");
	}

	if(trim($client)!=''&&trim($client)!='null'&&strlen($client)>0){
		$condition1 .= " and item.user_defined_field1 like '%{$client}%' ";
		array_push($condition2, "  item.user_defined_field1 like '%{$client}%' ");
	}


	$itemsupplieractiveflag = getInfo("company_information","item_supplier_flag","where id=1");
	if(trim($supplierid)!=''&&$itemsupplieractiveflag==1){
		$condition1 = $condition1." and item_supplier.supplier_id='$supplierid'";
		array_push($condition2, "item_supplier.supplier_id='$supplierid'");
	}

	

	if(count($condition2)>0){
		$condition2 = "where ".implode(' and ', $condition2);
	}
	else{
		$condition2 = '';
	}

	// Do Prepared Query 
	if($sourcetype=='PO'){//USED IN STOCK RECEIPT
		if($search!=''){
				$query = query("select item.id,
		                               item.code,
		                               item.name,
									   item.ax_code
					            from purchase_order_details
					            left join item on item.id=purchase_order_details.item_id
					            where purchase_order_details.purchase_order_header_id='$sourcenumberid' and
									(item.code like '%".$search."%'or item.ax_code like '%".$search."%' or item.name like '%".$search."%') 
					                  $condition1
					            group by item.id
					            order by item.name asc
					            limit 40");
		}
		else{
			$query = query("    select item.id,
		                               item.code,
		                               item.name,
									   item.ax_code
					            from purchase_order_details
					            left join item on item.id=purchase_order_details.item_id
					            where purchase_order_details.purchase_order_header_id='$sourcenumberid' 
					                  $condition1
					            group by item.id
					            order by item.name asc
					            limit 40");
		}
	}
	else if($sourcetype=='ISS'){//USED IN STOCK RECEIPT
		if($search!=''){
				$query = query("select item.id,
		                               item.code,
		                               item.name,
									   item.ax_code
					            from issuance_details
					            left join item on item.id=issuance_details.item_id
					            where issuance_details.issuance_header_id='$sourcenumberid' and
									(item.code like '%".$search."%'or item.ax_code like '%".$search."%' or item.name like '%".$search."%') 
					                  $condition1
					            group by item.id
					            order by item.name asc
					            limit 40");
		}
		else{
			$query = query("    select item.id,
		                               item.code,
		                               item.name,
									   item.ax_code
					            from issuance_details
					            left join item on item.id=issuance_details.item_id
					            where issuance_details.issuance_header_id='$sourcenumberid' 
					                  $condition1
					            group by item.id
					            order by item.name asc
					            limit 40");
		}
	}
	else{
		if($search!=''){
				$query = query("select item.id,
		                               item.code,
		                               item.name,
									   item.ax_code
					            from item 
					            left join item_supplier on item_supplier.item_id=item.id
					            where (item.code like '%".$search."%'or item.ax_code like '%".$search."%' or item.name like '%".$search."%') 
					                  $condition1
					            group by item.id
					            order by item.name asc
					            limit 40");
		}
		else{
			$query = query("select item.id,
			                       item.code,
								   item.name,
								   item.ax_code
				            from item 
				            left join item_supplier on item_supplier.item_id=item.id
				            $condition2
				            group by item.id
				            order by item.name asc
				            limit 40");
		}	
	}
	
	
	
	$rscount = getNumRows($query);
	if($rscount>0){
		if($search==''){
				$data[] = array('id' => '', 'text' => '-');
		}
		while($obj=fetch($query)){
			$id = $obj->id;
			$code = utfEncode($obj->code);
			$desc = utfEncode($obj->name);
			$mms = utfEncode($obj->ax_code);
			$data[] = [
				'id' => $id,
				'text' => "[<b>{$code}</b>] - {$desc}",
				'code' => $code,
				'name' => $desc,
				'data' => [
					'code' => $code,
					'name' => $desc
				]
			];		
		}
	}
	else{
		$data[] = array('id' => '', 'text' => 'No Results Found');
	}
	

	// return the result in json
	echo json_encode($data);

?>
