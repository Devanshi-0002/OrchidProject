using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zenithholidays;

public partial class _Default : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 4);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {           
            mylist.DataSource = ds;
            mylist.DataBind();

        }
    }
}