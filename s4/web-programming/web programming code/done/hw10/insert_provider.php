
<?php
include 'config.php';

if(isset($_POST['provider'])) {
    $company = $_POST['company'];
    $bulstat = $_POST['bulstat'];
    $town_id = $_POST['town_id'];
    $phone = $_POST['phone'];
    $year_registered = $_POST['year_registered'];
    $contact = $_POST['contact'];

    $sql = "INSERT INTO providers (company, bulstat, address, phone, year_registered, contact) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sisiss", $company, $bulstat, $town_id, $phone, $year_registered, $contact);
    
    if ($stmt->execute()) {
        echo "Успешно въвеждане!";
    } else {
        echo "Грешка. " . $sql . "<br>" . $conn->error;
    }
    echo "<a href='index.php'>Начало</a>"; 


    $stmt->close();
    $conn->close();
}
?>

