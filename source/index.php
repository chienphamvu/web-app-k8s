<?php
$servername = getenv('HOST_IP');
$username = "root";
$password = "root";
$dbname = "mysql";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>

<h2><?php echo "Connected successfully!!! Hello"; ?></h2>

<?php
$conn->close();
?>