using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuestionPaperActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = (DataTable)Session["SelectedMcqs"];
            GridView2.DataSource = (DataTable)Session["SelectedQuestions"];
            GridView1.DataBind();
            GridView2.DataBind();
        }
    }

    public static byte[] StrToByteArray(string str)
    {
        UTF8Encoding encoding = new UTF8Encoding();
        return encoding.GetBytes(str);
    }

    public static string ByteArrayToStr(byte[] barr)
    {
        UTF8Encoding encoding = new UTF8Encoding();
        return encoding.GetString(barr, 0, barr.Length);
    }


    protected void addQP(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["SelectedMcqs"];
        BinaryFormatter bformatter = new BinaryFormatter();
        MemoryStream stream = new MemoryStream();
        bformatter.Serialize(stream, dt);
        byte[] b = stream.ToArray();
        string mcqs = Convert.ToBase64String(b);

        DataTable dt2 = (DataTable)Session["SelectedQuestions"];
        BinaryFormatter bformatter2 = new BinaryFormatter();
        MemoryStream stream2 = new MemoryStream();
        bformatter2.Serialize(stream2, dt2);
        byte[] b2 = stream2.ToArray();
        string questions = Convert.ToBase64String(b2);
        stream.Close();
        stream2.Close();
        dt.Clear();
        dt2.Clear();
        string subject = (string)Session["subject"];
        string username = (string)Session["username"];
        string addedOn = DateTime.Now.ToString();
        string qpName = TextBox1.Text;
        string id = Guid.NewGuid().ToString();
        DateTime examDate =DateTime.ParseExact(TextBox2.Text, "d/M/yyyy", CultureInfo.InvariantCulture);
        string duration = TextBox3.Text;
        string marks = ((decimal)Session["TotalMarks"]).ToString();

        //DataBase Connection for adding Question Paper
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(localdb)\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False";
        string query = "INSERT INTO QuestionPapers VALUES (@mcqs,@questions,@subject,@addedBy,@addedOn,@qpName,@id,@examDate,@duration,@marks)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@mcqs", mcqs);
        cmd.Parameters.AddWithValue("@questions", questions);
        cmd.Parameters.AddWithValue("@subject", subject);
        cmd.Parameters.AddWithValue("@addedBy", username);
        cmd.Parameters.AddWithValue("@addedOn", Convert.ToDateTime(addedOn));
        cmd.Parameters.AddWithValue("@qpName", qpName);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@examDate", examDate);
        cmd.Parameters.AddWithValue("@duration", Convert.ToInt32(duration));
        cmd.Parameters.AddWithValue("@marks", Convert.ToDecimal(marks));
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "Question Paper Added Successfully";
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