using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Theme : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login_Id"] == null || Session["LoginRef_Id"] == null || Session["UserPassword"] == null || Session["User_Category_Id"] == null || Session["ReportingHd"] == null)
            {
                Response.Redirect("Login.aspx");
                Session.Clear();
                Session.RemoveAll();
            }
            else
            {

            }
        }
    }
    protected void btnsavetheme_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_theme");
            cmd.CommandType = CommandType.StoredProcedure;
            if (txttheme.Text != "")
            {
                cmd.Parameters.AddWithValue("@Theme_type", txttheme.Text);
                x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                if (x > 0)
                {
                    ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Record Save Successfully.');", true);
                    txttheme.Text = "";
                }
                else
                {
                    //MessageBox.PopUp(sender, " Theme Type Save Failed....", "Error!!");
                }
            }
            else
            {
                //MessageBox.PopUp(sender, " Please Fill the name....", "Error!!");
            }

        }
        catch (Exception ex) { throw ex;}
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txttheme.Text = "";
    }
}