<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="adminLoginDiv" style="border:1px solid white;">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="login"/>
        </div>
</asp:Content>

