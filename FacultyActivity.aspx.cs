using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string username = Request.QueryString["Username"];
            if(username == null)
            {
                username = (string)Session["username"];
            }
            UsernameLabel.Text = "Welcome " + username +"!";
        }
        bool co_ordinator = (bool)Session["Co-ordinator"];
        if (co_ordinator)
        {
            Button3.Visible = true;
            GridView1.Columns[0].Visible = true;
            GridView2.Columns[0].Visible = true;
        }
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
            Label1.Text = "Error Occurred, Please check the input!";//exception.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    protected void showMcqs(object sender, EventArgs e)
    {
        bool co_ordinator = (bool)Session["Co-ordinator"];
        if (!co_ordinator)
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
                adp.Fill(ds, "Mcqs");
            }
            catch (Exception exception)
            {
                Label1.Text = "Error Occurred, Please check the input!";
            }
            finally
            {
                con.Close();
                DataTable dt = ds.Tables["Mcqs"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }else
        {
            string subject = (string)Session["Subject"];

            //DataBase Connection for displaying added MCQs of a faculty
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
            string query = "SELECT question,optionA,optionB,optionC,optionD,answer,mark FROM Mcqs WHERE Subject=@subject";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@subject", subject);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                adp.Fill(ds, "Mcqs");
            }
            catch (Exception exception)
            {
                Label1.Text = "Error Occurred, Please check the input!";
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

    protected void addQuestion(object sender, EventArgs e)
    {
        string question = TextBox8.Text;
        string username = (string)Session["username"];
        string subject = (string)Session["subject"];
        string marks = TextBox9.Text;

        //DataBase Connection for adding Questions
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "INSERT INTO Questions VALUES (@question,@username,@subject,@marks)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@question", question);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@subject", subject);
        cmd.Parameters.AddWithValue("@marks", Convert.ToDecimal(marks));
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Label2.Text = "Question Added Successfully";
        }
        catch (Exception exception)
        {
            Label2.Text = "Error Occurred, Please check the input!";
        }
        finally
        {
            con.Close();
        }
    }

    protected void showQuestions(object sender, EventArgs e)
    {
        bool co_ordinator = (bool)Session["Co-ordinator"];
        if (!co_ordinator)
        {
            string username = (string)Session["username"];

            //DataBase Connection for displaying added Questions of a faculty
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
            string query = "SELECT question,mark FROM Questions WHERE UserName=@username";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                adp.Fill(ds, "Questions");
            }
            catch (Exception exception)
            {
                Label2.Text = "Error Occurred, Please check the input!";
            }
            finally
            {
                con.Close();
                DataTable dt = ds.Tables["Questions"];
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }else
        {
            string subject = (string)Session["Subject"];

            //DataBase Connection for displaying added Questions of a faculty
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
            string query = "SELECT question,mark FROM Questions WHERE Subject=@subject";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@subject", subject);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                adp.Fill(ds, "Questions");
            }
            catch (Exception exception)
            {
                Label2.Text = "Error Occurred, Please check the input!";
            }
            finally
            {
                con.Close();
                DataTable dt = ds.Tables["Questions"];
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }

    protected void setQuestionPaper(object sender, EventArgs e)
    {
        int count = 0;
        decimal marks = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("Question");
        dt.Columns.Add("Marks");
        foreach (GridViewRow row in GridView2.Rows)
        {
            CheckBox check = (CheckBox)row.FindControl("myCheckBox");
            if (check != null && check.Checked)
            {
                count++;
                DataRow dr = dt.NewRow();
                dr["Question"] = row.Cells[1].Text;
                dr["Marks"] = row.Cells[2].Text;
                marks += Convert.ToDecimal(row.Cells[2].Text);
                dt.Rows.Add(dr);
            }
        }
        Session["SelectedQuestions"] = dt;
        dt = new DataTable();
        dt.Columns.Add("Question");
        dt.Columns.Add("OptionA");
        dt.Columns.Add("OptionB");
        dt.Columns.Add("OptionC");
        dt.Columns.Add("OptionD");
        dt.Columns.Add("Marks");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox check = (CheckBox)row.FindControl("myCheckBox");
            if (check != null && check.Checked)
            {
                count++;
                DataRow dr = dt.NewRow();
                dr["Question"] = row.Cells[1].Text;
                dr["OptionA"] = row.Cells[2].Text;
                dr["OptionB"] = row.Cells[3].Text;
                dr["OptionC"] = row.Cells[4].Text;
                dr["OptionD"] = row.Cells[5].Text;
                dr["Marks"] = row.Cells[7].Text;
                marks += Convert.ToDecimal(row.Cells[7].Text);
                dt.Rows.Add(dr);
            }
        }
        Session["SelectedMcqs"] = dt;
        Session["TotalMarks"] = marks;
        if (count != 0)
        {
            string username = Request.QueryString["Username"];
            if (username == null)
            {
                username = (string)Session["username"];
            }
            string url = "QuestionPaperActivity.aspx?";
            url += "Username=" + username;
            Response.Redirect(url);
        }else
        {
            Response.Write(@"<script langauge='text/javascript'>alert('No Selections Made');</script>");
        }
    }

    protected void delete(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "DELETE FROM Questions WHERE question=@question";
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox check = (CheckBox)row.FindControl("myCheckBox");
                if (check != null && check.Checked)
                {
                    string question = row.Cells[1].Text;
                    cmd.Parameters.AddWithValue("@question", question);
                    cmd.ExecuteNonQuery();
                }
            }
            query = "DELETE FROM Mcqs WHERE question=@question";
            cmd = new SqlCommand(query, con);
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox check = (CheckBox)row.FindControl("myCheckBox");
                if (check != null && check.Checked)
                {
                    string question = row.Cells[1].Text;
                    cmd.Parameters.AddWithValue("@question", question);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception exception)
        {
            Label2.Text = "Error Occurred, Please check the input!";
        }
        finally
        {
            con.Close();
            Response.Redirect("FacultyActivity.aspx");
        }
    }

    protected void logout(Object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["LoginInfo"];
        if(cookie != null)
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("LoginPage.aspx");
        }else
        {
            Response.Redirect("LoginPage.aspx");
        }
    }

}