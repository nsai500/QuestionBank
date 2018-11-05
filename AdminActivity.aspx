<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminActivity.aspx.cs" Inherits="AdminActivity" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:panel runat="server" SkinID="loginHeader">
        <asp:Label runat="server" Text="Welcome Admin!" ForeColor="White" Font-Size="XX-Large"></asp:Label>
    </asp:panel>
    <asp:panel runat="server" SkinID="logout">
        <asp:HyperLink runat="server" NavigateUrl="LoginPage.aspx" ForeColor="White">Logout</asp:HyperLink>
    </asp:panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="row1" style="display:flex; flex-direction:row; justify-content: space-around; border:1px solid white;">
        <div class="addFaculty" style="display:flex; flex-direction:column;">
            <br />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="EmployeeId"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="EmployeeId is required" ControlToValidate="TextBox1" ForeColor="White" ValidationGroup="Faculty"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid Id" ValidationExpression="[0-9]+" ControlToValidate="TextBox1" ForeColor="White" ValidationGroup="Faculty"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required" ControlToValidate="TextBox2" ForeColor="White" ValidationGroup="Faculty"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Subject"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Subject is required" ControlToValidate="TextBox3" ForeColor="White" ValidationGroup="Faculty"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" placeholder="UserName"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Username is required" ControlToValidate="TextBox4" ForeColor="White" ValidationGroup="Faculty"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is required" ControlToValidate="TextBox5" ForeColor="White" ValidationGroup="Faculty"></asp:RequiredFieldValidator>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Co-ordinator" ForeColor="White"/>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Sign up Faculty" OnClick="signup" ValidationGroup="Faculty"/>
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
            <asp:Label ID="Label4" runat="server" ForeColor="White"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="White"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="White"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" ForeColor="White"></asp:Label>
            <br />
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