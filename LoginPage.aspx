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
            <br /><br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="login"/>
            <br /><br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Administrator?" ForeColor="White"/>
    </asp:panel>
</asp:Content>