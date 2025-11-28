document.addEventListener("DOMContentLoaded", function () {

    const savedMode = localStorage.getItem("mode");
    if (savedMode === "dark") {
        document.body.classList.add("dark");
        document.body.classList.remove("light");
    } else {
        document.body.classList.add("light");
        document.body.classList.remove("dark");
    }
//load sidebar
    const sidebarContainer = document.getElementById('sidebar-container');
    if (sidebarContainer) {
        fetch('/public/sidebar.html')
            .then(res => res.text())
            .then(html => {
            document.getElementById('sidebar-container').innerHTML = html;
            
            // Replace login/register with user info if logged in
            const user = JSON.parse(localStorage.getItem("user"));
            const authLinks = document.querySelector("#authLinks");

            if (authLinks) {
                if (user && user.name) {
                    authLinks.innerHTML = `
                    <div class="nav-link text-white">Hello, ${user.name}</div>
                    <a href="#" class="nav-link text-white" id="logoutBtn">Logout</a>
                    <div id="modeToggle" title="Toggle Dark Mode" class="mt-3" style="cursor: pointer; width: 24px; height: 24px; background-color: #ccc; border-radius: 50%;"></div>
                    `;

                    // Add logout functionality
                    document.getElementById("logoutBtn").addEventListener("click", () => {
                    localStorage.removeItem("user");
                    localStorage.removeItem("token");
                    window.location.href = "home.html";
                    });
                } else {
                    authLinks.innerHTML = `
                    <a href="login.html" class="nav-link text-white">Login</a>
                    <a href="signup.html" class="nav-link text-white">Register</a>
                    <div id="modeToggle" title="Toggle Dark Mode" class="mt-3" style="cursor: pointer; width: 24px; height: 24px; background-color: #ccc; border-radius: 50%;"></div>
                    `;
                }
            }

        });
    }
    //load dropdown
    fetch('/dropdown.html')
        .then(res => res.text())
        .then(dropdownHTML => {
        document.getElementById('dropdown-container').innerHTML = dropdownHTML;

        const dropdownContainer = document.getElementById('dropdown-container');
        if (dropdownContainer) {
            dropdownContainer.innerHTML = dropdownHTML;
        }

        //dropdown toggle
        const dropdownBtn = document.getElementById("productsDropdownBtn");
        const dropdownMenu = document.getElementById("productsDropdown");

        if (dropdownBtn && dropdownMenu) {
            dropdownBtn.addEventListener("click", function (e) {
            e.preventDefault();
            dropdownMenu.classList.toggle("show-dropdown");
            });

            document.addEventListener("click", function (e) {
            if (!dropdownBtn.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.classList.remove("show-dropdown");
            }
            });
        }

        //dark mode toggle
        const modeToggle = document.getElementById("modeToggle");
        if (modeToggle) {
            modeToggle.addEventListener("click", function () {
                if (document.body.classList.contains("dark")) {
                    document.body.classList.remove("dark");
                    document.body.classList.add("light");
                    localStorage.setItem("mode", "light"); // save preference
                } else {
                    document.body.classList.remove("light");
                    document.body.classList.add("dark");
                    localStorage.setItem("mode", "dark"); // save preference
                }
            });
        }

        //shared popup (only when the modal exists on the page)
        const modal = document.getElementById("Modal");
        if (modal) {
            const closeButton = modal.querySelector(".close-button");
            const listContainer = document.getElementById("List");
            const modalTitle = document.getElementById("modal-title");

            if (closeButton) {
                closeButton.addEventListener("click", () => {
                    modal.classList.add("d-none");
                });
            }

            window.addEventListener("click", (e) => {
                if (e.target === modal) {
                modal.classList.add("d-none");
                }
            });
        }
    });
});
