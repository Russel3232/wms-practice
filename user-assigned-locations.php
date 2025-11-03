<?php 
	include("../../../config/connection.php");
    include("../../../config/checkurlaccess.php");
    include("../../../config/functions.php");

	// strip tags may not be the best method for your project to apply extra layer of security but fits needs for this tutorial 
	$search = isset($_GET['q'])?strip_tags(trim($_GET['q'])):''; 
	$search = escapeString($search);


	$useraccadminflag = 0;
	$getuserinfors = query("select warehouse_id, admin_flag from user where id='".USERID."'");
    while($obj=fetch($getuserinfors)){
        $userdefaultloc = utfEncode($obj->warehouse_id);
        $useraccadminflag = utfEncode($obj->admin_flag);
    }
    $userotherloc = getUserAssignedLocations(USERID);


    $activeflag = isset($_GET['flag'])?$_GET['flag']:'';
	$condition1 = '';
	$condition2 = '';
	if(trim($activeflag)!=''){
		$condition1 = " and active_flag='$activeflag'";
		$condition2 = "where active_flag='$activeflag'";
	}


	// Do Prepared Query 
	if($search!=''){
		$query = query("select id,
		                       code,
		                       description,
		                       warehouse_type_id
		            from warehouse 
		            where (code like '%".$search."%' or description like '%".$search."%') 
		            order by description asc
		            limit 40");
	}
	else{
		$query = query("select id,
		                   code,
		                   description,
		                   warehouse_type_id
		            from warehouse 
		            order by description asc
		            limit 50");
	}	
	
	
	$rscount = getNumRows($query);
	if($rscount>0){
		if($search==''){
				$data[] = array('id' => '', 'text' => '-');
		}
		while($obj=fetch($query)){
			$id = $obj->id;
			$code = utfEncode($obj->code);
			$desc = utfEncode($obj->description);
			$type = utfEncode($obj->warehouse_type_id);
			$data[] = array('id' => $id, 'text' => $code.' - '.$desc, 'type' => $type);		
		}
	}
	else{
		$data[] = array('id' => '', 'text' => 'No Results Found');
	}
	

	// return the result in json
	echo json_encode($data);

?>