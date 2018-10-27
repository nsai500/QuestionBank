<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <asp:panel runat="server" SkinID="loginHeader">
        <asp:Label runat="server" Text="Question Bank Portal" ForeColor="White" Font-Size="XX-Large"></asp:Label>
    </asp:panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:panel runat="server">
            <br />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is Required" ControlToValidate="TextBox1" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required" ControlToValidate="TextBox2" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="login"/>
            <br /><br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Administrator?" ForeColor="White"/>
            <br /><br />
            <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
    </asp:panel>
</asp:Content>