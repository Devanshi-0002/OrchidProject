using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zenithholidays;
public partial class BlogMaster : System.Web.UI.MasterPage
{
    DbConnect m = new DbConnect();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 5);
        m.dt.Rows.Add("@tagArea", txt_search.Text);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["search"] = ds;
            string x = Session["search"].ToString();
            Response.Redirect("~/blog/Categorydetails.aspx");
            //mylist.DataSource = ds;
            //mylist.DataBind();

        }
        else
        {           
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Sorry No Matching Found');", true);//&#9786
        }
    }
    protected void btn_customized_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Customized Holiday";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_grp_hld_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Group Holidays";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_hnymoon_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "HoneyMoon";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_mice_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "MICE Tours";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_nt_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "News & Trending";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_th_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Theme Holidays";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void btn_wt_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Weekend Tours";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://zenithholidays.com/blog");
    }
    protected void home1_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://zenithholidays.com/blog");
    }
}
