<?php

header("Content-Type:application/json");

require 'db.class.php';

$db = new db();
$db = $db->connect();
$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
$qry = $db->prepare("SELECT * FROM transfer_order_attachments where transfer_order_header_id = :asset");
$good = $qry->execute([ 
    ":asset" => $_POST['asset']
]);
$ret = [];

for ($i=0; $asset = $qry->fetch(PDO::FETCH_OBJ); $i++) {
    $ret[] = $asset;
}

print_r(json_encode($ret));
