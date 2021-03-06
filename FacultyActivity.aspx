﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyActivity.aspx.cs" Inherits="FacultyActivity" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:panel runat="server" SkinID="loginHeader">
        <asp:Label runat="server" ForeColor="White" Font-Size="XX-Large" ID="UsernameLabel"></asp:Label>
    </asp:panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:panel runat="server" SkinID="logout">
        <asp:LinkButton runat="server" ForeColor="White" OnClick="logout">Logout</asp:LinkButton>
    </asp:panel>
    <br /><br />
    <div>
        <asp:Button ID="Button3" runat="server" Text="Set Question Paper" OnClick="setQuestionPaper" OnClientClick="return confirm('Are you sure?')" Visible="false"/>
        <asp:Button ID="Button4" runat="server" Text="Delete Selected" OnClick="delete" OnClientClick="return confirm('Are you sure?')"/>
        <br /><br />
    </div>
    <div id="row1" style="display:flex; flex-direction:row; justify-content: space-around; border:1px solid white;"">
            <div id="addMCQ" style="display:flex; flex-direction:column;">
                <br /><br />
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Question"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Question is required" ControlToValidate="TextBox1" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Option A"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="OptionA is required" ControlToValidate="TextBox2" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox3" runat="server" placeholder="Option B"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="OptionB is required" ControlToValidate="TextBox3" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox4" runat="server" placeholder="Option C"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="OptionC is required" ControlToValidate="TextBox4" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Option D"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="OptionD is required" ControlToValidate="TextBox5" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox6" runat="server" placeholder="Answer"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Answer is required" ControlToValidate="TextBox6" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Option" ValidationExpression="[a-d]|[A-D]" ControlToValidate="TextBox6" ForeColor="White" ValidationGroup="MCQ"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="TextBox7" runat="server" placeholder="Marks"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Mark is required" ControlToValidate="TextBox7" ForeColor="White" ValidationGroup="MCQ"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter mark between 0 and 99.9" Type="Double" MinimumValue="0" MaximumValue="99.9" ControlToValidate="TextBox7" ForeColor="White" ValidationGroup="MCQ"></asp:RangeValidator>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Add MCQ" OnClick="addMCQ" ValidationGroup="MCQ"/>
                <asp:Button ID="Button6" runat="server" Text="Update" OnClick="update" Visible="false" ValidationGroup="MCQ"/>
                <br /><br />
                <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
                <br /><br />
                <asp:button ID="Button7" runat="server" text="Show Added MCQs" OnClick="showMcqs"/>
                <br /><br />
                <asp:Button ID="Button5" runat="server" Text="Update" OnClick="showUpdate" Visible="false"/>
                <div style="width: 100%; height: 300px; overflow: scroll">
                    <asp:Gridview runat="server" ID="GridView1" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="myCheckBox" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                        <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
                        <RowStyle ForeColor="Black" BackColor="White" />
                    </asp:Gridview>
                </div>
            </div>
            <div  id="addQuestion" style="display:flex; flex-direction:column;">
                <br /><br />
                <asp:TextBox ID="TextBox8" runat="server" placeholder="Question"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Question is required" ControlToValidate="TextBox8" ValidationGroup="Question" ForeColor="White"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBox9" runat="server" placeholder="Marks"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Mark is required" ControlToValidate="TextBox9" ValidationGroup="Question" ForeColor="White"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Enter mark between 0 and 99.9" Type="Double" MinimumValue="0" MaximumValue="99.9" ControlToValidate="TextBox9" ValidationGroup="Question" ForeColor="White"></asp:RangeValidator>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Add Question" OnClick="addQuestion" ValidationGroup="Question"/>
                <br /><br />
                <asp:Label ID="Label2" runat="server" ForeColor="White"></asp:Label>
                <asp:button ID="Button10" runat="server" text="Show Added Questions" OnClick="showQuestions"/>
                <asp:Button ID="Button9" runat="server" Text="Update" Visible="false" OnClick="updateQ" ValidationGroup="Question"/>
                <br /><br />
                <asp:Button ID="Button8" runat="server" Text="Update" OnClick="showQUpdate" Visible="false"/>
                <div style="width: 100%; height: 300px; overflow: scroll">
                    <asp:Gridview runat="server" ID="GridView2" CellPadding="4" ForeColor="#333333" Width="200" BorderColor="Black">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="myCheckBox" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                        <AlternatingRowStyle BackColor="#BFE4FF" ForeColor="Black"  />
                        <RowStyle ForeColor="Black" BackColor="White" />
                    </asp:Gridview>
                </div>
            </div>
    </div>
</asp:Content>