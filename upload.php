<?php

$srv = $_SERVER['HTTP_HOST'];
$valid_formats = array("pdf");
$max_file_size = 1024*100000; 
$path = "../attachments/transfer-order/{$_GET['asset']}/"; // Upload directory
$count = 0;
if(!is_dir($path)){
    mkdir($path);
}
require 'db.class.php';

$uploaded = [];
$message = [];

if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST"){
    $name = $_FILES['file']['name'];
	// Loop $_FILES to exeicute all files
	if ($_FILES['file']['error'] == 4) { 

    }
    if ($_FILES['file']['error'] == 0) {
        if ($_FILES['file']['size'] > $max_file_size) {
            $message[] = "$name is too large!."; 
        }
        elseif( ! in_array(pathinfo(strtolower($name), PATHINFO_EXTENSION), $valid_formats) ){
            $message[] = "$name is not a valid format"; 
        }
        else{ // No error found! Move uploaded files 
            if(move_uploaded_file($_FILES["file"]["tmp_name"], $path.$name)){  
                
                $db = new db();
                $db = $db->connect();
                $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
                $qry = $db->prepare("INSERT INTO transfer_order_attachments VALUES(DEFAULT,:asset,:name,:path,DEFAULT)");
                $good = $qry->execute([ 
                    ":asset" => $_GET['asset'],
                    ":name" => $name,
                    ":path" => $path.$name
                ]);


                if($good){

                    $uploaded[] = [
                        "name"=>$name,
                        "path"=>$path.$name,
                        "id"=>$db->lastInsertId()
                    ];
                }
                else{
                    $message[] = "ERROR ON SQL QUERY";
                }

            }
            $count++; // Number of successfully uploaded file 
        }
    }
}

header("Content-Type: application/json");

if($count>0){
	print_r(json_encode([
		"Success" => true,
		"UploadedFiles" => $uploaded,
		"Message" => "The following Files has been uploaded. "
	]));
	exit;
}

print_r(json_encode([
	"Success" => false,
	"UploadedFiles" => $uploaded,
	"Message" => "Upload Failed. The following files did not uploaded for the following reason.\r\n".implode(",",$message)
])); 
