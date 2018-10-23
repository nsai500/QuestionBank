<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionPaperActivity.aspx.cs" Inherits="QuestionPaperActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Question Paper
    <br /><br />
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Question Paper Name"></asp:TextBox>
    <br /><br />
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Exam Date(DD/MM/YYYY)"></asp:TextBox>
    <br /><br />
    <asp:TextBox ID="TextBox3" runat="server" placeholder="Duration(minutes)"></asp:TextBox>
    <br /><br />
    <asp:Button ID="Button1" runat="server" Text="Submit Question Paper" OnClick="addQP"/>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true"></asp:GridView>
    <asp:gridview runat="server" ID="gv3"></asp:gridview>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

