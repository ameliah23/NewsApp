<?php
$HostName = "localhost";
$DatabaseName = "id16179721_db_flutter";
$HostUser = "root";
$HostPass = "c/IImo=j7ieyiNp4";
$con = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);

	
$query = "SELECT * FROM articles";

$result = mysqli_query($con, $query);

$array = array();

while ($row  = mysqli_fetch_assoc($result)) {
    $array[] = $row;
}

$result = [
    "status" => "ok",
    "totalResults" => count($array),
    "articles" => $array
];

echo json_encode($result);
