using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zenithholidays;

public partial class Categorydetails : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    DataSet ds = new DataSet();
    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-').TrimEnd('.');
    }
    public void carasoulDisplay()
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 3);
        m.dt.Rows.Add("@category", Session["cat_dtls"].ToString());
        m.pfn_GetData("sp_blogposting", ref ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rep1.DataSource = ds;
            rep1.DataBind();

        }
        else
        {
            sorry.Visible = true;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["category"] = Session["cat_dtls"].ToString();
        if ((!Page.IsPostBack))
        {
            if (Session["search"].ToString() != "")
            {
                DataSet ds1 = (DataSet)Session["search"];
                rep1.DataSource = ds1;
                rep1.DataBind();
                Session["search"] = "";
            }
            else
            {
                if (Session["cat_dtls"].ToString() != "")
                {
                    carasoulDisplay();
                   // Session["cat_dtls"] = "";
                }
                else
                {
                   
                    sorry.Visible = true;
                }
            }
        }

    }
    //protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    int rowid = (e.Item.ItemIndex);
    //    Label lbl = (Label)rep1.Items[rowid].FindControl("bno");
    //    Session["bno"] = lbl.Text;
    //    Response.Redirect("Blogdetails.aspx");
    //}

    
    protected void rep1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int rowid = (e.Item.ItemIndex);
        Label lbl = (Label)rep1.Items[rowid].FindControl("bno");
        Label headline = (Label)rep1.Items[rowid].FindControl("headline");
        Session["bno"] = lbl.Text;
        string hl = GetTitle(headline.Text);
        Response.Redirect("~/blog/Blogdetails.aspx//"+lbl.Text+"//" + hl);  
    }
}