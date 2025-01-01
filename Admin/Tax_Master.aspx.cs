using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Tax_Master : System.Web.UI.Page
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
    protected void btnsavetax_Click(object sender, EventArgs e)
    {
     try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_TaxMaster");
            if (txt_taxPercentage.Text != "".Trim())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Taxvalue", txt_taxPercentage.Text.Trim());
                cmd.Parameters.AddWithValue("@Createdby", Session["LoginRef_Id"].ToString());

                x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                if (x > 0)
                {
                    //ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Record Save Successfully.');", true);
                    MessageBox.ShowUp(sender, "Tax Save Successfully.");
                }
                else
                {
                    MessageBox.PopUp(sender, " Tax Save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Enter Tax Values....", "Error!!");
            }
           
        }
        catch (Exception ex) { throw ex;}
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        txt_taxPercentage.Text = "";
    }
}