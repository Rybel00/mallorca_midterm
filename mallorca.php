<?php

$conn = mysqli_connect("localhost", "root", "", "midterm_exam");
if (!$conn){
    die("Failed to log in. Try again later");
}

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM doctors WHERE email = '$email' AND password = '$password'";
$result = (mysqli_query($conn, $sql));

if (mysqli_num_rows($result) > 0) {
    echo "Logged In Succesfully!!!!";
    exit(); 

} else {

    echo "Log in failed.";
    exit();
}

mysqli_close($conn);
?>