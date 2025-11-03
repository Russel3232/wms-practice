<?php
	include('../../../config/connection.php');
	include('../../../config/functions.php');




	$page = 1;	// The current page
	$sortname = '';	// Sort column
	$sortorder = '';	// Sort order
	$qtype = '';	// Search column
	$query = '';	// Search string

	// Get posted data
	if (isset($_POST['page'])) {
		$page = mysql_real_escape_string($_POST['page']);
	}
	if (isset($_POST['sortname'])) {
		$sortname = mysql_real_escape_string($_POST['sortname']);
	}
	if (isset($_POST['sortorder'])) {
		$sortorder = mysql_real_escape_string($_POST['sortorder']);
	}
	if (isset($_POST['qtype'])) {
		$qtype = mysql_real_escape_string($_POST['qtype']);
	}
	if (isset($_POST['query'])) {
		$query = mysql_real_escape_string($_POST['query']);
	}
	if (isset($_POST['rp'])) {
		$rp = mysql_real_escape_string($_POST['rp']);
	}

	$customqry =	"select item.code as item_code, 
							item.name as item_name,
							temp_barcode_printing.lot_number,
							ifnull(date_format(temp_barcode_printing.mfg_date,'%m/%d/%Y'),'N/A') as mfg_date,
							ifnull(date_format(temp_barcode_printing.expiry_date,'%m/%d/%Y'),'N/A') as expiry_date,
							temp_barcode_printing.quantity,
							temp_barcode_printing.net_weight as weight,
							unit_of_measure.code as uom_code,
							temp_barcode_printing.box_number,
							temp_barcode_printing.id as rowid,
							'N/A' as rcvdate,
							warehouse.code as warehouse,
							bin_location.code as bin,
							temp_barcode_printing.upload_type
						from temp_barcode_printing 
						left join item on item.id=temp_barcode_printing.item_id
						left join unit_of_measure on unit_of_measure.id=temp_barcode_printing.uom_id
						left join bin_location on bin_location.id=temp_barcode_printing.location_id
						left join warehouse on warehouse.id=bin_location.warehouse_id";

	// Setup sort and search SQL using posted data
	$whse = isset($_GET['warehouse']) ? $_GET['warehouse'] :'';
	$uploadtype = isset($_GET['uploadtype']) ? $_GET['uploadtype'] :'';
	$binlocation = isset($_GET['binlocation']) ? $_GET['binlocation'] :'';
	$item = isset($_GET['item']) ? $_GET['item'] :'';

	$sortSql = "order by $sortname $sortorder";
	$filter = [];

	if($whse!=''&&strtolower($whse)!='null'){
		$filter[] = "bin_location.warehouse_id='$whse'";
	}

	if($uploadtype!=''&&strtolower($uploadtype)!='null'){
		$filter[] = "temp_barcode_printing.upload_type='$uploadtype'";
	}

	if($binlocation!=''&&strtolower($binlocation)!='null'){
		$filter[] = "temp_barcode_printing.location_id='$binlocation'";
	}
	if($item!=''&&strtolower($item)!='null'){
		$filter[] = "temp_barcode_printing.item_id='$item'";
	}
	
	if($qtype != ''&&$query!=''){
		$filter[] = "$qtype like '%$query%'";
	}

	$searchSql = "";
	if(count($filter)> 0){
		$searchSql = " where ".implode(" and ", $filter);
	}

	


	// Get total count of records
	$sql = "$customqry $searchSql";
	$result = mysql_query($sql);
	$row = mysql_fetch_array($result);
	$total = mysql_num_rows($result);

	
	// Setup paging SQL
	$pageStart = ($page-1)*$rp;
	$limitSql = "limit $pageStart, $rp";

	// Return JSON data
	$data = array();
	$data['page'] = $page;
	$data['total'] = $total;
	$data['rows'] = array();
	$sql = "$customqry
			$searchSql
			$sortSql
			$limitSql";
	// echo $sql;exit;
	$results = mysql_query($sql);
	$line = 1;
	//$hidebtn = (userAccess(USERID,'.edittranstypebtn')==false)?'':'hidden';
	while ($obj = mysql_fetch_object($results)) {
		$id = utfEncode($obj->rowid);
		$itemcode = utfEncode($obj->item_code);
		$itemname = utfEncode($obj->item_name);
		$lot = utfEncode($obj->lot_number);
		$expiry = utfEncode($obj->expiry_date);
		$mfg = utfEncode($obj->mfg_date);
		$qty = utfEncode($obj->quantity);
		$weight = utfEncode($obj->weight);
		$uom = utfEncode($obj->uom_code);
		$box = utfEncode($obj->box_number);
		$warehouse = utfEncode($obj->warehouse);
		$bin = utfEncode($obj->bin);
		$type = utfEncode($obj->upload_type);

		$data['rows'][] = array(
									'id' => $id,
									'cell' => array(
													 $id, 
													 $warehouse,
													 $bin,
													 $itemcode,
													 $itemname,
													 $lot,
													 $expiry,
													 $mfg,
													 $uom,
													 $qty,
													 $weight,
													 $box,
													 $type
													 
													),
									'rowAttr'=>array(
													   'rowid'=>$id
													)
								);
		$line++;
	}
	echo json_encode($data);
?>