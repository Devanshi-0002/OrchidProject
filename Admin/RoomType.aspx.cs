using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_RoomType : System.Web.UI.Page
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
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_RoomType");
            cmd.CommandType = CommandType.StoredProcedure;
            if (txtroomname.Text != "")
            {
                cmd.Parameters.AddWithValue("@Room_type", txtroomname.Text);

                x = Dataacces.Dataconnection.ExecuteQuery(cmd);

                if (x > 0)
                {
                    MessageBox.ShowUp(sender, "Room Type Save Successful....");
                   // ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Record Save Successfully.');", true);
                    txtroomname.Text = "";
                }
                else
                {
                    MessageBox.PopUp(sender, " Room Type Save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Fill the Room Name....", "Error!!");
            }

        }
        catch (Exception ex) { throw ex;/* new Exception("Error: In ExecuteNonquery");*/ }
    }
    protected void btnBoarding_placesave_Click(object sender, EventArgs e)
    {
        try
        {
            int y = 0;
            SqlCommand cmd = new SqlCommand("Insert_boarding_Point");
            cmd.CommandType = CommandType.StoredProcedure;
            if (txtBoarding_place.Text != "")
            {
                cmd.Parameters.AddWithValue("@Boarding_place", txtBoarding_place.Text);

                y = Dataacces.Dataconnection.ExecuteQuery(cmd);

                if (y > 0)
                {
                    MessageBox.ShowUp(sender, "Boarding Place save Successful....");
                    //ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Record Save Successfully.');", true);
                    txtBoarding_place.Text = "";

                }
                else
                {
                    MessageBox.PopUp(sender, " Boarding Place save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Fill the Boarding Place....", "Error!!");
            }
        }
        catch (Exception ex) { throw ex;/* new Exception("Error: In ExecuteNonquery");*/ }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtroomname.Text = "";
    }
    protected void btnBoarding_placereset_Click(object sender, EventArgs e)
    {
        txtBoarding_place.Text = "";
    }

    private void BindData()
    {
       
    }
} 



