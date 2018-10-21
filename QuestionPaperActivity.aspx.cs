using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
}