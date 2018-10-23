<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminActivity.aspx.cs" Inherits="AdminActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="addFaculty" style="width:50%;">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="EmployeeId"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Subject"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox4" runat="server" placeholder="UserName"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Password"></asp:TextBox>
        <br /><br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Co-ordinator" />
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Sign up Faculty" OnClick="signup"/>
        <br /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br /><br />
    </div>
    <div  style="width:50%;">
        <asp:Button ID="Button3" runat="server" Text="Populate ListBox" OnClick="populate"/>
        <br /><br />
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="displayQp"></asp:ListBox>
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>
</asp:Content>

