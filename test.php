<?php





$data = array(
	'userid' => '1',
	'password'=>'1234'
);
 
$body = json_encode($data);
print_r( $body);


$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,"http://localhost:8000/api/user/update-hash");
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Content-Length: ' . strlen($body)
));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,$body);

$response = curl_exec($ch);
curl_close($ch);

return $response;


?>