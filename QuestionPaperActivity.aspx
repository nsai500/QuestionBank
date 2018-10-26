<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionPaperActivity.aspx.cs" Inherits="QuestionPaperActivity" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Question Paper" ForeColor="White"></asp:Label>
    <br /><br />
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Question Paper Name"></asp:TextBox>
    <br /><br />
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Exam Date(DD/MM/YYYY)"></asp:TextBox>
    <br /><br />
    <asp:TextBox ID="TextBox3" runat="server" placeholder="Duration(minutes)"></asp:TextBox>
    <br /><br />
    <asp:Button ID="Button1" runat="server" Text="Submit Question Paper" OnClick="addQP"/>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
        <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
        <RowStyle ForeColor="Black" BackColor="White" />
    </asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
        <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
        <RowStyle ForeColor="Black" BackColor="White" />
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
</asp:Content>

