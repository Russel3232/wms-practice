<?php
 
header('Content-Type: application/json');

$attachment_id = $_POST['attachment_id'];
$path = $_POST['path'];

require 'db.class.php';

$db = new db();
$db = $db->connect();
$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
$qry = $db->prepare("DELETE from transfer_order_attachments WHERE id = :id");
$good = $qry->execute([  
    ":id" => $attachment_id
]);

if($good){

    if(@unlink($path)){
        print_r(json_encode([
            "Success" => true,
            "Message" => "File was deleted successfuly"
        ]));
    }
    else{
        print_r(json_encode([
            "Success" => false,
            "Message" => "File was not deleted"
        ]));
    }
    

}

