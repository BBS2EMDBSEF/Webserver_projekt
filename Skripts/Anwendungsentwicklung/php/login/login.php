<?php
session_start();

// Dummy-Datenbank (erstellt für Testzwecke)
$users = [
    'user1' => 'password123', // Beispielbenutzer: Benutzername -> Passwort
    'user2' => 'password456'
];

// Überprüfen, ob das Formular abgeschickt wurde
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['benutzername'];
    $password = $_POST['password'];

    // Benutzernamen und Passwort überprüfen
    if (isset($users[$username]) && $users[$username] === $password) {
        // Benutzer eingeloggt
        $_SESSION['logged_in'] = true;
        $_SESSION['username'] = $username;
        header('Location: file_manager.php'); // Weiterleitung zur Datei-Manager-Seite
        exit();
    } else {
        $error = 'Ungültiger Benutzername oder Passwort.';
    }
}
?>