using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

public partial class AdminActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void signup(object sender, EventArgs e)
    {
        string employeeId = TextBox1.Text;
        string name = TextBox2.Text;
        string subject = TextBox3.Text;
        string userName = TextBox4.Text;
        string password = TextBox5.Text;

        //DataBase Connection for creating faculty login data
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "INSERT INTO Faculty VALUES (@empId,@name,@subject,@coord,@username,@password)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@empId", employeeId);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@subject", subject);
        cmd.Parameters.AddWithValue("@coord", CheckBox1.Checked);
        cmd.Parameters.AddWithValue("@username", userName);
        cmd.Parameters.AddWithValue("@password", password);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "Signed Up Successfully";
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

    protected void displayQp(object sender, EventArgs e)
    {
        string id = ListBox1.SelectedValue;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "SELECT * FROM QuestionPapers WHERE id=@id";//"SELECT QuestionPaperName,Id,Duration,Marks,ExamDate,Subject FROM QuestionPapers";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@id",id);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            adp.Fill(ds, "QuestionPapers");
        }
        catch (Exception exception)
        {
            Label1.Text = exception.ToString(); //TODO Make it UI Friendly
        }
        finally
        {
            con.Close();
            DataTable dt = ds.Tables["QuestionPapers"];
            string mcqs = dt.Rows[0]["Mcqs"].ToString();
            string questions = dt.Rows[0]["Questions"].ToString();
            Label4.Text = "Subject: " + dt.Rows[0]["Subject"].ToString();
            Label5.Text = "Exam Date: " + dt.Rows[0]["ExamDate"].ToString().Substring(0,10);
            Label6.Text = "Duration: " + dt.Rows[0]["Duration"].ToString();
            Label7.Text = "Max. Marks: " + dt.Rows[0]["marks"].ToString();
            BinaryFormatter bformatter = new BinaryFormatter();
            MemoryStream stream = new MemoryStream();

            byte[] b = Convert.FromBase64String(mcqs);
            stream = new MemoryStream(b);
            dt = (DataTable)bformatter.Deserialize(stream);
            stream.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();

            byte[] b2 = Convert.FromBase64String(questions);
            BinaryFormatter bformatter2 = new BinaryFormatter();
            MemoryStream stream2 = new MemoryStream();
            stream2 = new MemoryStream(b2);
            DataTable dt2 = (DataTable)bformatter2.Deserialize(stream2);
            stream2.Close();
            GridView2.DataSource = dt2;
            GridView2.DataBind();

        }
    }

    protected void populate(object sender, EventArgs e)
    {
        ListBox1.Visible = true;
        ListBox1.Items.Clear();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "SELECT Id,QuestionPaperName FROM QuestionPapers";
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ListBox1.Items.Add(new ListItem(reader["QuestionPaperName"].ToString(), reader["Id"].ToString()));
            }
        }
        catch (Exception exception)
        {
            Label1.Text = exception.ToString();
        }
        finally
        {
            con.Close();
        }

    }

    protected void populate2(object sender, EventArgs e)
    {
        ListBox1.Items.Clear();
        string subject = DropDownList1.SelectedValue;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "SELECT Id,QuestionPaperName FROM QuestionPapers WHERE subject=@subject";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@subject", subject);
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ListBox1.Items.Add(new ListItem(reader["QuestionPaperName"].ToString(), reader["Id"].ToString()));
            }
        }
        catch (Exception exception)
        {
            Label1.Text = exception.ToString();
        }
        finally
        {
            con.Close();
        }

    }

}