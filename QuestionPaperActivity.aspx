<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionPaperActivity.aspx.cs" Inherits="QuestionPaperActivity" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:panel runat="server" SkinID="loginHeader">
        <asp:Label runat="server" ForeColor="White" Font-Size="XX-Large" ID="UsernameLabel"></asp:Label>
    </asp:panel>
    <asp:panel runat="server" SkinID="logout">
        <asp:HyperLink runat="server" NavigateUrl="FacultyActivity.aspx" ForeColor="White">Back</asp:HyperLink>
        <asp:HyperLink runat="server" NavigateUrl="LoginPage.aspx" ForeColor="White">Logout</asp:HyperLink>
    </asp:panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Question Paper" ForeColor="White"></asp:Label>
    <br /><br />
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Question Paper Name"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Question Paper Name is Required" ControlToValidate="TextBox1" ForeColor="White"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Exam Date(DD/MM/YYYY)"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Exam Date is Required" ControlToValidate="TextBox2" ForeColor="White"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Date in DD/MM/YYYY" ControlToValidate="TextBox2" ValidationExpression="[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]" ForeColor="White"></asp:RegularExpressionValidator>
    <br />
    <asp:TextBox ID="TextBox3" runat="server" placeholder="Duration(minutes)"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Duration is Required" ControlToValidate="TextBox3" ForeColor="White"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid duration" ControlToValidate="TextBox3" ValidationExpression="[0-9]+" ForeColor="White"></asp:RegularExpressionValidator>
    <br />
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

