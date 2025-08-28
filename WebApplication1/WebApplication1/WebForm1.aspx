<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


        
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio</title>
    <link rel="stylesheet" href="content/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>


<!-- ===== Header ===== -->
<header>
  
    <nav class="navbar">
        <div class="logo">MyPortfolio</div>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#skills">Skills</a></li>
            <li><a href="#projects">Projects</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
         <!-- Dark/Light Toggle Button -->
  <button id="theme-toggle">🌙</button>
    </nav>
</header>

<!-- ===== Home Section ===== -->
<section id="home" class="home-section">
    <div class="home-container">
        <div class="home-img">
            <img src="images/profile.jpg" alt="Profile Photo">
        </div>
        <div class="home-text">
            <h1>I'm <span>Esha Saha</span></h1>
            <h2 class="typing-text">I am a <span id="typing"></span></h2>
            <p>Computer Science Student | Web Developer | Tech Enthusiast</p>
            <a href="#projects" class="btn">View My Work</a>
            <a href="#contact" class="btn btn-outline">Contact Me</a>
        </div>
    </div>
</section>

<!-- ===== About Section ===== -->
<section id="about" class="about-section">
    <h2>About Me</h2>
    <p>Hi, I’m <strong>Esha Saha</strong> – an aspiring engineer with a creative soul and a curious mind. I believe in balancing logic with imagination: from building apps and websites to expressing myself through writing, sketching, and performance.

I’m passionate about <strong>technology, design, and creativity</strong>. My journey has given me hands-on experience with HTML, CSS, JavaScript, Java, database systems etc, while also exploring innovative app development using Firebase. Alongside academics, I love staying fit, learning new things, and growing spiritually through meditation and reading.

Outside the technical world, I’m deeply inspired by <strong>storytelling, art, and cricket</strong> – they fuel my dreams of exploring life beyond boundaries and keep me motivated to aim higher every day.

I see myself as <strong>learner, a creator, and a dreamer</strong> – determined to grow into a strong, confident individual who blends skills with passion to make a difference.
    </p>
</section>

<!-- ===== Skills Section ===== -->
<section id="skills" class="skills-section">
  <h2>My Skills</h2>

  <!-- Technical Skills -->
  <h3>💻 Technical Skills</h3>
  <div class="skills-grid">
    <div class="skill">
      <i class="fab fa-html5"></i>
      <span>HTML</span>
    </div>
    <div class="skill">
      <i class="fab fa-css3-alt"></i>
      <span>CSS</span>
    </div>
    <div class="skill">
      <i class="fab fa-js"></i>
      <span>JavaScript</span>
    </div>
    <div class="skill">
      <i class="fas fa-code"></i>
      <span>ASP.NET</span>
    </div>
    <div class="skill">
      <i class="fas fa-laptop-code"></i>
      <span>C++</span>
    </div>
    <div class="skill">
      <i class="fab fa-java"></i>
      <span>Java</span>
    </div>
    <div class="skill">
      <i class="fas fa-database"></i>
      <span>SQL</span>
    </div>
    <div class="skill">
      <i class="fas fa-cloud"></i>
      <span>Firebase</span>
    </div>
    <div class="skill">
      <i class="fab fa-android"></i>
      <span>Android Development</span>
    </div>
    <div class="skill">
      <i class="fab fa-git-alt"></i>
      <span>Git & GitHub</span>
    </div>
  </div>

  <!-- Creative & Personal Skills -->
  <h3>🎨 Creative & Personal Skills</h3>
  <div class="creative-skills">
    <span class="badge">UI/UX Thinking</span>
    <span class="badge">Problem Solving</span>
    <span class="badge">Creative Writing</span>
    <span class="badge">Art & Sketching</span>
    <span class="badge">Dance & Acting</span>
    <span class="badge">Teamwork</span>
    <span class="badge">Adaptability</span>
    <span class="badge">Meditation & Focus</span>
  </div>
</section>

<section id="projects" class="reveal">
  <h2>My Projects</h2>
  <div class="projects-grid">
    <div class="project-card" data-title="Coffee Shop App" data-desc="Android app using Java & Firebase. Allows ordering coffee with real-time database support." data-tech="Java, Firebase, Android Studio" data-link="#">
      <h3>Coffee Shop App</h3>
      <p>Click to see more</p>
    </div>

    <div class="project-card" data-title="Garments Factory" data-desc="OOP Project simulating inventory & order management system for garments factory." data-tech="C++" data-link="#">
      <h3>Garments Factory</h3>
      <p>Click to see more</p>
    </div>

    <div class="project-card" data-title="Mini Computer" data-desc="Computer Architecture project building a mini-computer model with basic CPU operations and memory management simulation." data-tech="C++, Digital Logic" data-link="#">
      <h3>Mini Computer</h3>
      <p>Click to see more</p>
    </div>

    <div class="project-card" data-title="Digital Clock" data-desc="Digital Logic Design project creating a working digital clock using flip-flops and logic circuits to display time accurately." data-tech="Digital Logic" data-link="#">
      <h3>Digital Clock</h3>
      <p>Click to see more</p>
    </div>
  </div>
</section>

<!-- Modal Popup -->
<div id="project-modal" class="modal">
  <div class="modal-content">
    <span id="close-modal">&times;</span>
    <h3 id="modal-title"></h3>
    <p id="modal-desc"></p>
    <p><strong>Technologies:</strong> <span id="modal-tech"></span></p>
  </div>
</div>


  <!-- ===== Lab / Research Section ===== -->
<section id="labs" class="labs-section">
    <h2>Lab & Research Experiences</h2>

    <asp:Repeater ID="LabsRepeater" runat="server">
        <ItemTemplate>
            <div class="lab-card">
                <h3><%# Eval("Title") %></h3>
                <p><strong>Tool / Language:</strong> <%# Eval("Tool") %></p>
                <p><%# Eval("Description") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>





<section id="contact" class="contact-section">
  <h2>Contact Me</h2>
  <p>Email: <a href="mailto:sahaesha66@gmail.com">sahaesha66@gmail.com</a></p>
  

  <!-- Social Media -->
  <div class="social-links">
    <a href="https://www.facebook.com/share/19vwkEs6xJ/" target="_blank"><i class="fab fa-facebook-f"></i></a>
    <a href="https://www.instagram.com/_panchali_esha?igsh=MWIwYWI5a2ljMjFiaw==" target="_blank"><i class="fab fa-instagram"></i></a>
  </div>
</section>


<!-- ===== Footer ===== -->
<footer>
    <p>&copy; 2025 Your Name. All Rights Reserved.</p>
</footer>

<!-- ===== Typing Animation Script ===== -->
<script>
    const texts = ["Web Developer", "CSE Student", "Tech Enthusiast", "Problem Solver"];
    let count = 0;
    let index = 0;
    let currentText = '';
    let letter = '';

    (function type(){
        if(count === texts.length) count = 0;
        currentText = texts[count];
        letter = currentText.slice(0, ++index);

        document.getElementById('typing').textContent = letter;

        if(letter.length === currentText.length){
            count++;
            index = 0;
            setTimeout(type, 1500);
        } else {
            setTimeout(type, 100);
        }
    }());
</script>
<script src="scripts/script.js"></script>





        </div>
    </form>
</body>
</html>
