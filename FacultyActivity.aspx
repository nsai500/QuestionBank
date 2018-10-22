<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyActivity.aspx.cs" Inherits="FacultyActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Button ID="Button3" runat="server" Text="Set Question Paper" OnClick="setQuestionPaper" OnClientClick="return confirm('Are you sure?')"/>
    </div>
    <div id="row1" style="display:flex; flex-direction:row; justify-content: space-around;">
            <div id="addMCQ" style="display:flex; flex-direction:column;">
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
                <asp:Gridview runat="server" ID="GridView1">
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                </asp:Gridview>
            </div>
            <div  id="addQuestion" style="display:flex; flex-direction:column;">
                <asp:TextBox ID="TextBox8" runat="server" placeholder="Question"></asp:TextBox>
                <br /><br />
                <asp:TextBox ID="TextBox9" runat="server" placeholder="Marks"></asp:TextBox>
                <br /><br />
                <asp:Button ID="Button2" runat="server" Text="Add Question" OnClick="addQuestion"/>
                <br /><br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <br /><br />
                <asp:button runat="server" text="Show Added Questions" OnClick="showQuestions"/>
                <br /><br />
                <asp:Gridview runat="server" ID="GridView2" CellPadding="4" ForeColor="#333333" Width="200">
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:CheckBox ID="myCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <headerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></headerstyle>
                    </asp:Gridview>
            </div>
    </div>
</asp:Content>

