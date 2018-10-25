<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <%--<div class="loginDiv" style="border:1px solid white;">--%>
    <asp:panel runat="server">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="login"/>
            <br /><br />
            <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminLogin.aspx">Administrator?</asp:HyperLink>--%>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Administrator"/>
        <%--</div>--%>
    </asp:panel>
</asp:Content>