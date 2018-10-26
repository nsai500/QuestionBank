﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminActivity.aspx.cs" Inherits="AdminActivity" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="row1" style="display:flex; flex-direction:row; justify-content: space-around; border:1px solid white;">
        <div class="addFaculty" style="display:flex; flex-direction:column;">
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
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Co-ordinator" ForeColor="White"/>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Sign up Faculty" OnClick="signup"/>
            <br /><br />
            <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
            <br /><br />
        </div>
        <div  style="display:flex; flex-direction:column;">
            <div id="row2" style="display:flex; flex-direction:row; justify-content: space-around;">
                <div style="display:flex; flex-direction:column; border:1px solid white;">
                    <asp:Label ID="Label2" runat="server" Text="Display All Papers" ForeColor="White"></asp:Label>
                    <br /><br />
                    <asp:Button ID="Button3" runat="server" Text="Show Question Papers" OnClick="populate"/>
                    <br /><br />
                </div>
                <div style="display:flex; flex-direction:column; border:1px solid white;">
                    <asp:Label ID="Label3" runat="server" Text="Select Subject Wise" ForeColor="White"></asp:Label>
                    <br /><br />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="true" OnSelectedIndexChanged="populate2" DataTextField="Subject"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$connectionStrings:cs1 %>" 
                        SelectCommand="SELECT distinct Subject FROM QuestionPapers">
                    </asp:SqlDataSource>
                    <br /><br />
                </div>
            </div>
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="displayQp" Visible="false"></asp:ListBox>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
                <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
                <RowStyle ForeColor="Black" BackColor="White" />
            </asp:GridView>
            <br /><br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
                <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
                <RowStyle ForeColor="Black" BackColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>