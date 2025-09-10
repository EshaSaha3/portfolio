<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMessages.aspx.cs" Inherits="WebApplication1.ManageMessages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Messages</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>All Contact Messages</h2>
        <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" DataKeyNames="MessageId">
            <Columns>
                <asp:BoundField DataField="MessageId" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Date" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
