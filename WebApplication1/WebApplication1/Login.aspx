<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - My Portfolio</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            width: 320px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            text-align: center;
        }
        .login-box h2 {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
        }
        input[type="submit"], .aspNetButton {
            width: 100%;
            padding: 10px;
            background: teal;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover, .aspNetButton:hover {
            background: darkcyan;
        }
        .remember {
            margin: 10px 0;
            font-size: 14px;
            text-align: left;
        }
        .welcome-back {
            color: lightgreen;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <!-- Welcome Back Message -->
            <asp:Label ID="lblWelcomeBack" runat="server" CssClass="welcome-back"></asp:Label>

            <h2>Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

            <div class="remember">
                <asp:CheckBox ID="chkRemember" runat="server" Text=" Remember Me" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="aspNetButton" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
    

</html>
