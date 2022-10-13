<?php

$servername = "localhost";
$hostname = "udiptapathak";
$password = "password";

$conn = mysqli_connect ($servername, $hostname, $password);

if (!$conn) die ('Conection failed: ' . mysqli_connect_error ());

mysqli_query ($conn, "use ex6");

$query = "insert into donor (name, region, phone, grp) values ('". $_POST["name"] .
    "','" .$_POST["region"] . "','" . $_POST["phone"] . "','" . $_POST["grp"] . "')";

if (mysqli_query ($conn, $query))
    echo "Your donation has been record. Thank you!";
else echo "Insertion failed: " . mysqli_error ($conn);
