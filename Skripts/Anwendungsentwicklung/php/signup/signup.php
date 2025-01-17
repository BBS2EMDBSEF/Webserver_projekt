<?php
session_start();

// Dummy-Datenbank (für Testzwecke)
$users = [
    'user1' => 'password123',
    'user2' => 'password456'
];

// Überprüfen, ob das Formular abgeschickt wurde
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm-password'];

    // Überprüfen, ob der Benutzername bereits existiert
    if (isset($users[$username])) {
        $error = 'Benutzername bereits vergeben.';
    } elseif ($password !== $confirm_password) {
        $error = 'Die Passwörter stimmen nicht überein.';
    } else {
        // Benutzer registrieren (hier wird der Benutzer im Array hinzugefügt, in einer echten Anwendung in eine Datenbank)
        $users[$username] = $password;
        $_SESSION['logged_in'] = true;
        $_SESSION['username'] = $username;
        header('Location: file_manager.php'); // Weiterleitung zur Datei-Manager-Seite
        exit();
    }
}
?>