using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void addMCQ(object sender, EventArgs e)
    {
        string question = TextBox1.Text;
        string optA = TextBox2.Text;
        string optB = TextBox3.Text;
        string optC = TextBox4.Text;
        string optD = TextBox5.Text;
        string answer = TextBox6.Text;
        string username = (string)Session["username"];
        string subject = (string)Session["subject"];
        string marks = TextBox7.Text;

        //DataBase Connection for adding MCQs
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "INSERT INTO Mcqs VALUES (@question,@optA,@optB,@optC,@optD,@answer,@username,@subject,@marks)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@question", question);
        cmd.Parameters.AddWithValue("@optA", optA);
        cmd.Parameters.AddWithValue("@optB", optB);
        cmd.Parameters.AddWithValue("@optC", optC);
        cmd.Parameters.AddWithValue("@optD", optD);
        cmd.Parameters.AddWithValue("@answer", answer);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@subject", subject);
        cmd.Parameters.AddWithValue("@marks", Convert.ToDecimal(marks));
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "MCQ Added Successfully";
        }
        catch (Exception exception)
        {
            Label1.Text = exception.ToString(); //TODO Make it UI Friendly
        }
        finally
        {
            con.Close();
        }
    }

    protected void showMcqs(object sender, EventArgs e)
    {
        string username = (string)Session["username"];

        //DataBase Connection for displaying added MCQs of a faculty
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "SELECT question,optionA,optionB,optionC,optionD,answer,mark FROM Mcqs WHERE UserName=@username";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@username", username);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            adp.Fill(ds,"Mcqs");
        }
        catch (Exception exception)
        {
            Label1.Text = exception.ToString(); //TODO Make it UI Friendly
        }
        finally
        {
            con.Close();
            DataTable dt = ds.Tables["Mcqs"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}