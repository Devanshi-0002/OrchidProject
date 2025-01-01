using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zenithholidays;
using System.Text.RegularExpressions;

public partial class Blogdetails : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    DataSet ds = new DataSet();
    string z = "";
    public void blogDetails()
    {
        
        if (Session["bno"].ToString() != "")
        {
            z = Session["bno"].ToString();
        }
        else
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Uri uri = new UriBuilder(url).Uri;
            string versionString = uri.Segments[3]; // v1/
            int version = int.Parse(Regex.Match(versionString, @"\d+").Value);
            z = version.ToString();
        }
        //else 
        //{
        //    z= Request.Url.AbsoluteUri;
        //}

        if (z!= "")
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@p_SubOpMode", 2);
            m.dt.Rows.Add("@blogNo", z);
            m.pfn_GetData("sp_blogposting", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {                
                this.MetaDescription = ds.Tables[0].Rows[0]["metacontent"].ToString();
                this.MetaKeywords =ds.Tables[0].Rows[0]["metakeyword"].ToString();
                this.Title = ds.Tables[0].Rows[0]["pagetitle"].ToString();// "Hello World";
                DataList1.DataSource = ds;                
                DataList1.DataBind();      
                ds.Clear();
                
            }
        }
        else
        {
           
            sorry.Visible = true;
            blankpage.Visible = false;
        }
    }
    public void recentPost()
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 4);   
        
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rep_rp.DataSource = ds;
            rep_rp.DataBind();
            //if (Session["category"].ToString()=="")
            //{

            //}
            ds.Clear();
        }
    }
    public void category()
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 6);        
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rep_cat.DataSource = ds;
            rep_cat.DataBind();
            ds.Clear();
        }
    }
    public void relatedPost()
    {
        string x = Session["category"].ToString();
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 3);
        m.dt.Rows.Add("@category", Session["category"].ToString());
        m.dt.Rows.Add("@blogNo",z);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            ds.Clear();
        }
    }
    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-').TrimEnd('.');
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        // GetTitle(Eval("headline"))  Eval("blogNo")
        //GetRouteUrl("RouteForArticle", new { id =Session["bno"].ToString(), Title = Session["h"].ToString() });
        if (!Page.IsPostBack)
        {
            
            //if (Page.RouteData.Values["id"].ToString() != null)
            //{
            //    string strId = Page.RouteData.Values["id"].ToString();
            //   // GetRouteUrl("RouteForArticle", new { id = strId, Title = GetTitle(ta.Text) });
            //}
                blogDetails();
                recentPost();
                category();
                relatedPost();
            
        }
    }

    protected void rep_rp_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string x = Session["bno"].ToString();
        int rowid = (e.Item.ItemIndex);
        Label lbl = (Label)rep_rp.Items[rowid].FindControl("lbl_blgNO");
        Session["bno"] = lbl.Text;
        Label hdline = (Label)rep_rp.Items[rowid].FindControl("Label2");        
        string hl = GetTitle(hdline.Text);
        Response.Redirect("~/blog/Blogdetails.aspx//"+lbl.Text+"//"+ hl); 
    }
    protected void rep_cat_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int rowid = (e.Item.ItemIndex);
        //LinkButton lbl = (LinkButton)rep_rp.Items[rowid].FindControl("LinkButton2");
        //Label lbl = (Label)rep_rp.Items[rowid].FindControl("cat");
        //string t = e.CommandArgument.ToString();
        Session["cat_dtls"] = e.CommandArgument.ToString(); ;//lbl.Text;

        Response.Redirect("~/blog/Categorydetails.aspx");
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int rowid = (e.Item.ItemIndex);
        Label lbl = (Label)Repeater1.Items[rowid].FindControl("bno");
        Label categaory = (Label)Repeater1.Items[rowid].FindControl("category");
        Session["category"] = categaory.Text;
        Session["bno"] = lbl.Text;
        Label hdline = (Label)Repeater1.Items[rowid].FindControl("headline");
        string hl = GetTitle(hdline.Text);
        Response.Redirect("~/blog/Blogdetails.aspx//"+lbl.Text+"//" + hl); 
    }
}