<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="WebApplication1.AdminPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel - Manage Labs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: white;
            text-align: center;
        }
        h2 {
            color: #00ffcc;
        }
        .form-section {
            margin: 20px auto;
            padding: 20px;
            background: #1e1e1e;
            border-radius: 10px;
            width: 50%;
        }
        .form-section input, .form-section textarea {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }
        .form-section button {
            padding: 10px 20px;
            background: #00ffcc;
            color: #121212;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-section button:hover {
            background: #00ccaa;
        }
        .gridview {
            margin: 20px auto;
            width: 80%;
            border-collapse: collapse;
        }
        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #333;
        }
        .gridview th {
            background: #00ffcc;
            color: #121212;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Admin Panel - Manage Labs</h2>

        <!-- Add Lab Form -->
        <div class="form-section">
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Lab Title"></asp:TextBox><br />
            <asp:TextBox ID="txtDesc" runat="server" placeholder="Description" TextMode="MultiLine" Rows="4"></asp:TextBox><br />
            <asp:Button ID="btnAdd" runat="server" Text="Add Lab" OnClick="btnAdd_Click" />
        </div>

        <!-- Show Labs -->
        <asp:GridView ID="gvLabs" runat="server" AutoGenerateColumns="False" CssClass="gridview"
            DataKeyNames="Id" OnRowEditing="gvLabs_RowEditing" OnRowUpdating="gvLabs_RowUpdating"
            OnRowCancelingEdit="gvLabs_RowCancelingEdit" OnRowDeleting="gvLabs_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <br />

        <asp:Button ID="btnMessages" runat="server" Text="View Messages" PostBackUrl="ManageMessages.aspx" />

        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </form>
</body>
</html>
