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
        //TextBox1.Text = "marco"; //TODO For Testing
        //TextBox2.Text = "marco";
        //login(Button1, EventArgs.Empty);
        //Response.Redirect("AdminActivity.aspx");
        HttpCookie cookie = Request.Cookies["LoginInfo"];
        if(cookie != null)
        {
            Session["username"] = cookie["username"];
            Session["subject"] = cookie["subject"];
            string co_ord = cookie["Co-ordinator"];
            if (co_ord.Equals("true"))
            {
                Session["Co-ordinator"] = true;
            }
            else
            {
                Session["Co-ordinator"] = false;
            }

            string username = (string)Session["username"];

            string url = "FacultyActivity.aspx?";
            url += "Username=" + username;
            Response.Redirect(url);
        }
    }

    protected void login(object sender, EventArgs e)
    {
        if (!CheckBox1.Checked)
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

                    HttpCookie cookie = new HttpCookie("LoginInfo");
                    cookie["username"] = (string)Session["username"];
                    cookie["subject"] = (string)Session["subject"];
                    bool co_ordinator = (bool)Session["Co-ordinator"];
                    if (co_ordinator)
                    {
                        cookie["Co-ordinator"] = "true";
                    }else
                    {
                        cookie["Co-ordinator"] = "false";
                    }
                    cookie.Expires = DateTime.Now.AddMinutes(10);
                    Response.Cookies.Add(cookie);

                    string url = "FacultyActivity.aspx?";
                    url += "Username=" + username;
                    Response.Redirect(url);
                }
                else //TODO Put Validator
                {
                    Label1.Text = "Incorrect Username or Password!";
                }
            }
        }else
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;
            if (username != null && password != null && username == "admin" && password == "admin")
            {
                Response.Redirect("AdminActivity.aspx");
            }
            else
            {
                Label1.Text = "Incorrect Username or Password!";
            }
        }
    }
}