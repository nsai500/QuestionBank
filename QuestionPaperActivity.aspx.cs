using System;
using System.Collections.Generic;
using System.Data;
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

            DataTable dt = (DataTable)Session["SelectedMcqs"];

            BinaryFormatter bformatter = new BinaryFormatter();
            MemoryStream stream = new MemoryStream();

            bformatter.Serialize(stream, dt);
            byte[] b = stream.ToArray();
            stream.Close();

            //Now deserialise
            stream = new MemoryStream(b);
            dt = (DataTable)bformatter.Deserialize(stream);
            stream.Close();
            gv3.DataSource = dt;
            gv3.DataBind();
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

}