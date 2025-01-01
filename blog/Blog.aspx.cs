using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zenithholidays;

public partial class Blog : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    DataSet ds=new DataSet();
    public void carasoulDisplay()
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
            ds.Clear();
        }
    }
    public void newsDisplay()
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 7);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            ds.Clear();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.RedirectToRoute("Home");
        if (!Page.IsPostBack)
        {
            carasoulDisplay();
            newsDisplay();
            
        }
    }
    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-').TrimEnd('.');
    }
    protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int rowid = (e.Item.ItemIndex);
        Label lbl = (Label)Repeater1.Items[rowid].FindControl("bno");
        Label ta = (Label)Repeater1.Items[rowid].FindControl("ta");
        Label hdline = (Label)Repeater1.Items[rowid].FindControl("headline");
        Session["category"] = ta.Text;
        Session["bno"] = lbl.Text;
        string hl = GetTitle(hdline.Text);
        Response.Redirect("~/blog/Blogdetails.aspx//" + lbl.Text + "//" + hl);  
       
    }
    
    protected void mylist_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int rowid = (e.Item.ItemIndex);
        Label lbl = (Label)mylist.Items[rowid].FindControl("bno");
        Label ta = (Label)mylist.Items[rowid].FindControl("ta");
        Label hdline = (Label)mylist.Items[rowid].FindControl("headline");
        Session["category"] = ta.Text;
        Session["bno"] = lbl.Text;
        string hl= GetTitle(hdline.Text);
        
       // GetRouteUrl("RouteForArticle", new { id = lbl.Text, Title = GetTitle(ta.Text) });

        Response.Redirect("~/blog/Blogdetails.aspx//" + lbl.Text + "//" + hl);  
        //Response.Redirect("Blogdetails.aspx?id=" + lbl.Text);
        
    }
    protected void btn_details_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "HoneyMoon"; 
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void lb_wt_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Weekend Tours";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void lb_ch_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Customized Holiday";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void lb_gh_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Group Holidays";
        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void lb_th_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "Theme Holidays";
        Response.Redirect("~/blog/Categorydetails.aspx");

    }
    protected void lb_mt_Click(object sender, EventArgs e)
    {
        Session["cat_dtls"] = "MICE Tours";
        Response.Redirect("~/blog/Categorydetails.aspx");

    }
   
}  