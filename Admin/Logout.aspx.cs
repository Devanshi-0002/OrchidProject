using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
       
        //if (Session["Login_Id"] != null || Session["LoginRef_Id"] != null || Session["Password"] != null || Session["User_Name"] != null)
        //{
        //    //SqlCommand command = new SqlCommand("LogOutinfo");
            //command.CommandType = CommandType.StoredProcedure;
            //command.Parameters.AddWithValue("@LoginRef_Id", Convert.ToInt32(Session["UserId"].ToString()));
            //int x = Dataacces.Dataconnect.ExecuteQuery(command);
            //Session.Clear();
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        Session["Login_Id"] = "";
        Session["LoginRef_Id"] = "";
        Session["User_Name"] = "";
        Session["Password"] = "";

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();

        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
        Response.Expires = -1500;
        Response.CacheControl = "no-cache";
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Session.RemoveAll();
            //Session.Clear();
            //ClearSession();
            //ActionResultLogout();
        //}
        //else
        //{
            //Response.Redirect("Logout.aspx");
            //Session.RemoveAll();
            //Session.Clear();
           
        //}
        
    }

    protected void ClearSession()
    {
        Response.Cookies["Login_Id"].Expires = DateTime.Now;
        Response.Cookies["LoginRef_Id"].Expires = DateTime.Now;
        Response.Cookies["Password"].Expires = DateTime.Now;
        Response.Cookies["User_Name"].Expires = DateTime.Now;
        Session.Clear();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now);
        Response.Expires = -1500;
        Response.CacheControl = "no-Cache";
    }

    public void ActionResultLogout()
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Logout.aspx");
        this.Response.Cache.SetExpires(DateTime.Now);
        this.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        this.Response.Cache.SetNoStore();
    }
}