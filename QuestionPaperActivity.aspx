<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionPaperActivity.aspx.cs" Inherits="QuestionPaperActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Question Paper
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Duration(minutes)"></asp:TextBox>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true"></asp:GridView>
</asp:Content>

