<?php 
	include("../../../config/connection.php");
    include("../../../config/checkurlaccess.php");
    include("../../../config/functions.php");

	// strip tags may not be the best method for your project to apply extra layer of security but fits needs for this tutorial 
	$search = isset($_GET['q'])?strip_tags(trim($_GET['q'])):''; 
	$search = escapeString($search);

	$activeflag = isset($_GET['flag'])?$_GET['flag']:'';
	$condition1 = '';
	$condition2 = '';
	if(trim($activeflag)!=''){
		$condition1 = " and active_flag='$activeflag'";
		$condition2 = "where active_flag='$activeflag'";
	}

	// Do Prepared Query 
	if($search!=''){
		$query = query("select upload_type
		            from temp_barcode_printing 
		            where (upload_type like '%".$search."%') $condition1
					group by upload_type
		            order by upload_type asc
		            limit 40");
	}
	else{
		$query = query("select upload_type
		from temp_barcode_printing 
		$condition2
		group by upload_type
		order by upload_type asc
		limit 40");
	}	
	
	
	$rscount = getNumRows($query);
	if($rscount>0){
		if($search==''){
				$data[] = array('id' => '', 'text' => '-');
		}
		while($obj=fetch($query)){
			$id = $obj->upload_type;
			$desc = utfEncode($obj->upload_type);
			$data[] = array('id' => $id, 'text' => $desc);		
		}
	}
	else{
		$data[] = array('id' => '', 'text' => 'No Results Found');
	}
	

	// return the result in json
	echo json_encode($data);

?>