<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>EduDoc Register</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      background: url("backgrnd00.png") no-repeat center center;
      background-blend-mode: lighten;
      background-size: cover;
      font-family: 'Inter', sans-serif;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-container {
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(7px);
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.25); 
      padding: 2.5rem 2rem;
      width: 100%;
      max-width: 360px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .register-container:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 45px rgba(255, 255, 255, 0.5);
    }

    .register-container img {
      width: 150px;
      margin-bottom: 1rem;
      filter: drop-shadow(0 0 6px rgba(0, 132, 255, 0.8));
    }

    .register-container h2 {
      color: white;
      margin-bottom: 1.5rem;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 0.75rem;
      margin: 0.5rem 0;
      border: none;
      border-radius: 10px;
      font-size: 1rem;
      background: rgba(255, 255, 255, 0.8);
    }

    input:focus {
      outline: 2px solid #4f46e5;
      background: rgba(255, 255, 255, 0.95);
    }

    label {
      display: block;
      text-align: left;
      font-size: 0.9rem;
      color: white;
      margin: 0.5rem 0;
    }

    button {
      width: 100%;
      padding: 0.75rem;
      margin-top: 1rem;
      border: none;
      border-radius: 10px;
      font-size: 1rem;
      font-weight: bold;
      background: linear-gradient(135deg, #4f46e5, #3b82f6);
      color: white;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    button:hover {
      background: linear-gradient(135deg, #4338ca, #2563eb);
      transform: scale(1.05);
      box-shadow: 0 8px 20px rgba(59, 130, 246, 0.5); 
    }
  </style>
</head>
<body>
  <div class="register-container">
    <img src="logo4.png" alt="EduDoc Logo" />
    <h2>Register to EduDoc</h2>
    <form method="post" action="RegisterServlet">
      <input type="text" name="username" placeholder="Choose Username" required />
      <input type="password" name="password" placeholder="Choose Password" required />
      <button type="submit">Register</button>
    </form>
    <br>
    <a style="color:white;" href="login.jsp">Already have an account? Login</a>
  </div>
</body>
</html>
