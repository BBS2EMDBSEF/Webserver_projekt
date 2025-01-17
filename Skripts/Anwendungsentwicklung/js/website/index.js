document.addEventListener("DOMContentLoaded", function () {
    const menuToggle = document.getElementById("menuToggle");
    const sideNav = document.getElementById("sideNav");
    const overlay = document.createElement("div");

    overlay.className = "menu-overlay";
    document.body.appendChild(overlay);

    if (menuToggle && sideNav) {
        menuToggle.addEventListener("click", function () {
            sideNav.classList.toggle("open");
            overlay.classList.toggle("visible");
        });

        overlay.addEventListener("click", function () {
            sideNav.classList.remove("open");
            overlay.classList.remove("visible");
        });
    } else {
        console.error("menuToggle oder sideNav konnte nicht gefunden werden!");
    }
});
