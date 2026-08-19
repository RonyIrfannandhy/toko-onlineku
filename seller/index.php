<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register Admin - StyleHeaven</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style/login.css">
    <style>
        /* Style pembungkus layout halaman */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { 
            display: flex; 
            flex-direction: column; 
            min-height: 100vh; 
            font-family: 'Poppins', sans-serif; 
            background-color: #f4f6f9; 
        }
        
        /* CSS Navbar Seller */
        .seller-navbar { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 15px 40px; 
            background-color: #1a1a1a; 
            color: #ffffff; 
        }
        .seller-navbar .logo a { 
            color: #ffffff; 
            font-size: 20px; 
            font-weight: 700; 
            text-decoration: none; 
            letter-spacing: 1px; 
        }
        .seller-navbar .logo span { 
            font-size: 13px; 
            font-weight: 300; 
            color: #bbb; 
            margin-left: 8px; 
        }
        .seller-navbar .nav-links a { 
            color: #ccc; 
            text-decoration: none; 
            margin-left: 20px; 
            font-size: 14px; 
            transition: color 0.3s; 
        }
        .seller-navbar .nav-links a:hover { color: #ffffff; }

        /* Container Utama */
        .content-wrapper { 
            flex: 1; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            padding: 40px 20px; 
        }

        /* Footer */
        footer { 
            background-color: #1a1a1a; 
            color: #888888; 
            text-align: center; 
            padding: 20px; 
            font-size: 13px; 
            margin-top: auto; 
        }
    </style>
</head>
<body>

    <!-- Navbar Admin / Seller -->
    <header class="seller-navbar">
        <div class="logo">
            <a href="../index.php">YOSHI MEAT <span>| Seller Center</span></a>
        </div>
        <nav class="nav-links">
            <a href="../index.php"><i class="fas fa-store"></i> Kembali ke Toko Utama</a>
        </nav>
    </header>

    <!-- Form Login & Register -->
    <main class="content-wrapper">
        <div class="main-container">
            <div class="form-container">
                
                <div class="login-section">
                    <h2>Login Admin</h2>
                    <form action="login.php" method="post">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" placeholder="Masukkan username" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" placeholder="Masukkan password" required>
                        </div>
                        <button type="submit">Login</button>
                    </form>
                </div>

                <div class="register-section">
                    <h2>Register Admin</h2>
                    <form action="register.php" method="post">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" placeholder="Buat username" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" placeholder="Buat password" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirm_password" placeholder="Ulangi password" required>
                        </div>
                        <button type="submit">Register</button>
                    </form>
                </div>

            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2026 YOSHI MEAT - DAGING BERKUALITAS, BELANJA LEBIH MUDAH.</p>
    </footer>

</body>
</html>