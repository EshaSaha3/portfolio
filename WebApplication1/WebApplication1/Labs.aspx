<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Labs.aspx.cs" Inherits="WebApplication1.Labs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab & Research Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Lab & Research Management</h2>

            <asp:Label runat="server" Text="Title:"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <br /><br />

            <asp:Label runat="server" Text="Description:"></asp:Label>
            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
            <br /><br />

            <!-- Hidden field to store LabId when editing -->
            <asp:HiddenField ID="hfLabId" runat="server" />

            <asp:Button ID="btnAdd" runat="server" Text="Add Lab" OnClick="btnAdd_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update Lab" OnClick="btnUpdate_Click" Visible="false" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
            <hr />

            <!-- GridView to show labs -->
            <asp:GridView ID="gvLabs" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                OnRowCommand="gvLabs_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditLab" CommandArgument='<%# Eval("Id") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteLab" CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
