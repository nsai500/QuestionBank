<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyActivity.aspx.cs" Inherits="FacultyActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="addMCQ" style="width:50%;">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Question"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Option A"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Option B"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox4" runat="server" placeholder="Option C"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Option D"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox6" runat="server" placeholder="Answer"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="TextBox7" runat="server" placeholder="Marks"></asp:TextBox>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Add MCQ" OnClick="addMCQ"/>
        <br /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br /><br />
        <asp:button runat="server" text="Show Added MCQs" OnClick="showMcqs"/>
        <br /><br />
        <asp:gridview runat="server" ID="GridView1"></asp:gridview>
    </div>
    <div  style="width:50%;">

    </div>
</asp:Content>

