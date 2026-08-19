<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<link rel="stylesheet" href="style/header.css">

<header>
    <div class="top-header">
        <div class="logo"><a href="index.php">YOSHI MEAT</a></div>
        <div class="menu-toggle" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </div>
    </div>
    
    <nav>
        <a href="men.php">FILLET</a>
        <a href="women.php">SLICE</a>
        <a href="kids.php">DADU</a>
        <a href="new.php">NEW</a>
        <a href="looklist.php">LOOKS</a>
    </nav>
    
    <div class="actions">
        <div class="search">
            <form action="search.php" method="get" class="search-form">
                <input placeholder="Search" type="text" name="search">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <!-- Tombol Menuju Seller Center -->
        <a href="seller/" class="seller-btn" title="Seller Center" style="display: inline-flex; align-items: center; gap: 5px; font-size: 14px; font-weight: 600; color: inherit; text-decoration: none; margin-right: 5px;">
            <i class="fas fa-store"></i> Seller
        </a>

        <?php if (isset($_SESSION['username'])): ?>
            <a href="cart.php">
                <i class="fas fa-shopping-bag" style="font-size: 20px;"></i>
            </a>
            <a onclick="toggleDropdown()" style="cursor: pointer;"><i class="bi bi-person-circle" style="font-size: 20px;"></i></a>
            
            <div class="dropdown-menu" id="dropdownMenu">
                <a><i class="bi bi-person-check"></i> <?= ucwords(htmlspecialchars($_SESSION['username'])); ?></a>
                <a href="order_history.php">Order History</a>
                <a href="logout.php" class="logout-btn">Logout</a>
            </div>
        <?php else: ?>
            <a id="loginButton" style="cursor: pointer;">Login</a>
        <?php endif; ?>
    </div>
</header>

<!-- Modal Login Customer -->
<div id="loginPanel" class="login-panel">
    <div class="login-container">
        <span class="close-btn" id="closeLogin">&times;</span>
        <h2>Login</h2>
        <form action="login.php" method="post">
            <input type="text" placeholder="Username" name="username" required>
            <input type="password" placeholder="Password" name="password" required>
            <button type="submit">Login</button>
            <p>Don't have an account? <a id="registerButton" style="cursor: pointer;">Register</a></p>
        </form>
    </div>
</div>

<!-- Modal Register Customer -->
<div id="registerPanel" class="login-panel">
    <div class="login-container">
        <span class="close-btn" id="closeRegister">&times;</span>
        <h2>Register</h2>
        <form action="register.php" method="post">
            <input type="text" placeholder="Username" name="username" required>
            <input type="password" placeholder="Password" name="password" required>
            <input type="password" placeholder="Confirm Password" name="confirm_password" required>
            <button type="submit">Register</button>
        </form>
    </div>
</div>