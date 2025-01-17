<?php
// SSH-Verbindungsdaten
$host = '192.168.x.x'; // IP-Adresse des Raspberry Pi
$port = 22;            // Standard-SSH-Port
$user = 'pi';          // Standardbenutzername
$password = 'your_password'; // Dein Passwort

// Funktion zur Überprüfung der SSH-Verbindung
function checkSSHConnection($host, $port, $user, $password) {
    $connection = ssh2_connect($host, $port);
    if ($connection && ssh2_auth_password($connection, $user, $password)) {
        return $connection;  // Verbindung erfolgreich, zurückgeben der Verbindung
    }
    return false; // Verbindung fehlgeschlagen
}

// Prüfen, ob eine Verbindung zum Raspberry Pi besteht
$connection = checkSSHConnection($host, $port, $user, $password);

// Initialisiere die Nachricht
$message = "";
$error_message = "";  // Fehlernachricht-Variable

// Wenn die Verbindung erfolgreich ist
if ($connection) {
    // Dateien im Home-Verzeichnis des Raspberry Pi auflisten
    $directory = '/home/pi/';
    $files = scandir($directory); // Alle Dateien im Home-Verzeichnis

    // Datei hochladen
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['upload_file'])) {
        $upload_dir = $directory . 'uploads/';
        $upload_file = $upload_dir . basename($_FILES['upload_file']['name']);

        // Datei hochladen
        if (move_uploaded_file($_FILES['upload_file']['tmp_name'], $upload_file)) {
            $message = "Datei erfolgreich hochgeladen!";
        } else {
            $message = "Fehler: Datei konnte nicht hochgeladen werden.";
        }
    }

    // Datei löschen
    if (isset($_POST['delete_file'])) {
        $file_to_delete = $directory . $_POST['delete_file'];

        // Datei löschen
        if (unlink($file_to_delete)) {
            $message = "Datei erfolgreich gelöscht!";
        } else {
            $message = "Fehler: Datei konnte nicht gelöscht werden.";
        }
    }
} else {
    // Fehlermeldung wenn keine Verbindung möglich ist
    $error_message = "Fehler: Verbindung zum Raspberry Pi fehlgeschlagen.";
}
?>
