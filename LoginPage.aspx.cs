using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = "marco"; //TODO For Testing
        TextBox2.Text = "marco";
        //login(Button1, EventArgs.Empty);
        //Response.Redirect("AdminActivity.aspx");
    }

    protected void login(object sender, EventArgs e)
    {
        string username = TextBox1.Text;
        string password = TextBox2.Text;

        using (SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True"))
        {
            SqlCommand cmd = new SqlCommand("select * from Faculty where Username like @username and Password = @password", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            con.Open();

            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            con.Close();

            bool loginSuccessful = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));

            if (loginSuccessful)
            {
                Session["username"] = username;
                Session["subject"] = ds.Tables[0].Rows[0]["Subject"];
                Session["Co-ordinator"] = ds.Tables[0].Rows[0]["Co_ordinator"];
                Response.Redirect("FacultyActivity.aspx");
            }
            else //TODO Put Validator
            {
                TextBox1.Text = "Please Try Again!";
            }
        }
    }
}