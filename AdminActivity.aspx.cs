using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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
}