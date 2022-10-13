<html>
    <head>
        <link rel = "stylesheet" href = "style.css">
    </head>
    <?php

    $servername = "localhost";
    $hostname = "udiptapathak";
    $password = "password";

    $conn = mysqli_connect ($servername, $hostname, $password);

    if (!$conn) die ('Conection failed: ' . mysqli_connect_error ());

    mysqli_query ($conn, "use ex6");

    $query = "select * from donor";
    $result = mysqli_query ($conn, $query);

    if (mysqli_num_rows ($result) > 0) {
        echo "<table>";
        while ($row = mysqli_fetch_assoc ($result)) {
            echo "<tr><td>" . $row["id"] . "</td><td>" . $row["name"] . "</td><td>" .
                $row["region"] . "</td><td>" . $row["phone"] . "</td><td>" . 
                $row["grp"] . "</td></tr>";
        }
        echo "</table>";
    } else echo "Empty Set";?>
</html>