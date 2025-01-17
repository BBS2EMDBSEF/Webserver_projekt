<?php
// SSH-Zugangsdaten
$raspberry_ip = '192.168.1.100';
$raspberry_user = 'pi';
$raspberry_key = '/path/to/ssh/private_key';

// Backup-Verzeichnis
$backup_dir = 'Backup/';
$timestamp = date('d_m_Y_H-i-s');
$backup_file = $backup_dir . "raspberry_backup_$timestamp.tar.gz";

// Kommando für Backup
$command = "ssh -i $raspberry_key $raspberry_user@$raspberry_ip 'sudo tar -czf - /' > $backup_file";

// Backup ausführen
$output = [];
$return_var = null;
exec($command, $output, $return_var);

if ($return_var === 0) {
    echo "Backup erfolgreich! Datei: $backup_file";
} else {
    echo "Backup fehlgeschlagen!";
}
?>
