const themeToggle = document.getElementById('theme-toggle');
let darkMode = false;

themeToggle.addEventListener('click', () => {
    if (!darkMode) {
        document.body.style.backgroundColor = '#121212';
        document.body.style.color = '#ffffff';
        themeToggle.textContent = '☀️';
        darkMode = true;
    } else {
        document.body.style.backgroundColor = '#ffffff';
        document.body.style.color = '#000000';
        themeToggle.textContent = '🌙';
        darkMode = false;
    }
});



// === Scroll Reveal Animation ===
const reveals = document.querySelectorAll(".reveal");

window.addEventListener("scroll", () => {
    for (let i = 0; i < reveals.length; i++) {
        let windowHeight = window.innerHeight;
        let elementTop = reveals[i].getBoundingClientRect().top;
        let elementVisible = 150;

        if (elementTop < windowHeight - elementVisible) {
            reveals[i].classList.add("active");
        }
    }
});

// Select all project cards
const cards = document.querySelectorAll(".project-card");

// Select modal elements
const modal = document.getElementById("project-modal");
const modalTitle = document.getElementById("modal-title");
const modalDesc = document.getElementById("modal-desc");
const modalTech = document.getElementById("modal-tech");
//const modalLink = document.getElementById("modal-link");
const closeModal = document.getElementById("close-modal");

// Open modal on card click
cards.forEach(card => {
    card.addEventListener("click", () => {
        modal.style.display = "flex"; // show modal
        modalTitle.textContent = card.dataset.title;
        modalDesc.textContent = card.dataset.desc;
        modalTech.textContent = card.dataset.tech;
        // modalLink.href = card.dataset.link;
    });
});

// Close modal when clicking 'X'
closeModal.addEventListener("click", () => {
    modal.style.display = "none";
});

// Close modal when clicking outside content
window.addEventListener("click", (e) => {
    if (e.target === modal) {
        modal.style.display = "none";
    }
});