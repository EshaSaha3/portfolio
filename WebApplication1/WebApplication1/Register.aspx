<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style>
        /* ===== Body Styling ===== */
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* ===== Form Container ===== */
        .register-box {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            width: 320px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            text-align: center;
        }

        /* ===== Title ===== */
        .register-box h2 {
            margin-bottom: 20px;
            color: #00ffcc;
        }

        /* ===== Input Fields ===== */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
            background: #2c2c2c;
            color: #fff;
            font-size: 14px;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #aaa;
        }

        /* ===== Register Button ===== */
        input[type="submit"], .aspNetButton {
            width: 100%;
            padding: 10px;
            background: teal;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            margin-top: 10px;
        }

        input[type="submit"]:hover, .aspNetButton:hover {
            background: darkcyan;
        }

        /* ===== Success Message ===== */
        .message {
            color: lightgreen;
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        /* ===== Alternate Option (Already have account) ===== */
        .alt-option {
            margin-top: 15px;
            font-size: 14px;
            color: #ccc;
        }

        .alt-option a {
            color: #00ffcc;
            text-decoration: none;
            font-weight: bold;
        }

        .alt-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-box">
            <h2>Create Account</h2>

            <!-- Username Field -->
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" placeholder="Enter Username"></asp:TextBox>

            <!-- Password Field -->
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

            <!-- Register Button -->
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="aspNetButton" OnClick="btnRegister_Click" />

            <!-- Success Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <!-- Already Have Account -->
            <div class="alt-option">
                <span>Already have an account? </span>
                <a href="Login.aspx">Login here</a>
            </div>
        </div>
    </form>
</body>
</html>
