using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Country : System.Web.UI.Page
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
                FillCountry(ref ddlcountry);
            }
        }
    }
    public void FillCountry(ref DropDownList ddlcont)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Fill_Country");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            ddlcont.DataSource = ds;
            ddlcont.DataTextField = "Country_Name";
            ddlcont.DataValueField = "Country_Id";
            ddlcont.DataBind();
            ddlcont.Items.Insert(0, "--Select--");
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_Country");
            cmd.CommandType = CommandType.StoredProcedure;
            if (txtcountry.Text != "")
            {
                cmd.Parameters.AddWithValue("@Country_Name", txtcountry.Text.Trim());
                cmd.Parameters.AddWithValue("@Createdby", Session["LoginRef_Id"].ToString());

                x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                if (x > 0)
                {
                    MessageBox.ShowUp(sender, "Country Save Successfully.");
                    txtcountry.Text = "";
                }
                else
                {
                    MessageBox.PopUp(sender, " Country Save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Fill the Country Name ....", "Error!!");
            }
        }
        catch (Exception ex) { throw ex; }
    }

    protected void btnsavestate_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_State");
            cmd.CommandType = CommandType.StoredProcedure;
            if (ddlcountry.SelectedItem.Text != "--Select--")
            {
                cmd.Parameters.AddWithValue("@Country_Id", ddlcountry.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@StateName", txtstate.Text);

                x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                if (x > 0)
                {
                    MessageBox.ShowUp(sender, "State Save Successfully.");
                    txtcountry.Text = "";
                }
                else
                {
                    MessageBox.PopUp(sender, " State Save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Fill all the fields ....", "Error!!");
            }
        }
        catch (Exception ex) { throw ex; }
    }
}