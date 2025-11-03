<?php 
	include("../../../config/connection.php");
    include("../../../config/checkurlaccess.php");
    include("../../../config/functions.php");

	// strip tags may not be the best method for your project to apply extra layer of security but fits needs for this tutorial 
	$search = isset($_GET['q'])?strip_tags(trim($_GET['q'])):''; 

	$whseid = isset($_GET['warehouseid'])?strtoupper($_GET['warehouseid']):'';
	$allitemsflag = isset($_GET['allitemsflag'])?$_GET['allitemsflag']:'';
	$exceptlocid = isset($_GET['exceptlocid'])?strtoupper($_GET['exceptlocid']):'';

	$multiplewhseid = isset($_GET['multiplewhse'])?strtoupper($_GET['multiplewhse']):'';


	$stagingflag = isset($_GET['stagingflag'])?$_GET['stagingflag']:'';


	

	$activeflag = isset($_GET['flag'])?$_GET['flag']:'';

	$conditionsarr = array();
	if(trim($activeflag)!=''){
		array_push($conditionsarr, "active_flag='$activeflag'"); 
	}

	if(isset($_GET['exceptlocid'])&&$exceptlocid!='NULL'){
		array_push($conditionsarr, "bin_location.id!='$exceptlocid'");
	}

	if(isset($_GET['stagingflag'])&&$stagingflag!='NULL'){
		array_push($conditionsarr, "bin_location.staging_flag='$stagingflag'");
	}


	
	
	if(isset($_GET['warehouseid'])&&$whseid!='NULL'){
		array_push($conditionsarr, "warehouse_id='$whseid'");
	}
	else if(isset($_GET['multiplewhse'])&&$multiplewhseid!='NULL'){
		array_push($conditionsarr, "warehouse_id in ($multiplewhseid)");
	}
	else{
		/**** WAREHOUSE RESTRICTION CONDITIONS ****/
		 $condition = '';
		 $adminflag = 0;
		 $getuserinfors = query("select warehouse_id, admin_flag from user where id='".USERID."'");
		 while($obj=fetch($getuserinfors)){
		 	$userwhseid = utfEncode($obj->warehouse_id);
		 	$adminflag = utfEncode($obj->admin_flag);
		 }
	    $otherwhseid = getUserAssignedLocations(USERID);
	    if($adminflag!=1){
	    	array_push($conditionsarr, "(
	    								    bin_location.warehouse_id='$userwhseid' or 
	                                        bin_location.warehouse_id in $otherwhseid
	                                     )");
	    }
	    /**** WAREHOUSE RESTRICTION CONDITIONS - END ****/
	}

	if($allitemsflag==1){
		array_push($conditionsarr, "all_items_flag=1");
	}

	$conditions = '';
	$conditions1 = '';
	if(count($conditionsarr)>0){
		$conditions = " and ".implode(" and ", $conditionsarr);
		$conditions1 = " where ".implode(" and ", $conditionsarr);
	}

	//$allitemcond = $allitemsflag==1?" and all_items_flag=1 ":'';

	$search = escapeString($search);
	// Do Prepared Query 
	if($search!=''){
		$qry = "   select id,
		                       code,
		                       description
		            from bin_location 
		            where (code like '%".$search."%' or description like '%".$search."%') $conditions
		            order by description asc
		            limit 40";
	}
	else{
		$qry = "    select id,
		                   code,
		                   description
		            from bin_location 
		            $conditions1
		            order by description asc
		            limit 50";
	}	
	
	$query = query($qry);
	$rscount = getNumRows($query);
	if($rscount>0){
		if($search==''){
				$data[] = array('id' => '', 'text' => '-');
		}
		while($obj=fetch($query)){
			$id = $obj->id;
			$code = utfEncode($obj->code);
			$desc = utfEncode($obj->description);
			$data[] = array('id' => $id, 'text' => $desc);		
		}
	}
	else{
		$data[] = array('id' => '', 'text' => 'No Results Found');
	}
	

	// return the result in json
	echo json_encode($data);

?>