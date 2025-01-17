// Upload Bereich
const uploadArea = document.getElementById('upload-area');
const fileInput = document.getElementById('file-upload');

uploadArea.addEventListener('dragover', (e) => {
    e.preventDefault();
    uploadArea.classList.add('dragover');
});

uploadArea.addEventListener('dragleave', () => {
    uploadArea.classList.remove('dragover');
});

uploadArea.addEventListener('drop', (e) => {
    e.preventDefault();
    uploadArea.classList.remove('dragover');
    const files = e.dataTransfer.files;
    handleFiles(files);
});

function triggerUpload() {
    fileInput.click();
}

fileInput.addEventListener('change', (e) => {
    const files = e.target.files;
    handleFiles(files);
});

function handleFiles(files) {
    console.log('Files hochgeladen:', files);
    // Hier kannst du die Dateien verarbeiten (z.B. hochladen)
}

// Download Bereich
const downloadArea = document.getElementById('download-area');

downloadArea.addEventListener('dragover', (e) => {
    e.preventDefault();
    downloadArea.classList.add('dragover');
});

downloadArea.addEventListener('dragleave', () => {
    downloadArea.classList.remove('dragover');
});

downloadArea.addEventListener('drop', (e) => {
    e.preventDefault();
    downloadArea.classList.remove('dragover');
    const files = e.dataTransfer.files;
    console.log('Files zum Download:', files);
    // Hier kannst du die Dateien zum Download vorbereiten
});

function triggerDownload() {
    alert('Download-Funktion wurde ausgelöst');
    // Hier kannst du die Logik zum Herunterladen implementieren
}
