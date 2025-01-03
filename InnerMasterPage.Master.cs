﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class InnerMasterPage : System.Web.UI.MasterPage
{
    mailbody md = new mailbody();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
        {
            limenu_myAccount.Visible = false;
            limenu_userProfile.Visible = true;
            username.InnerText = Session["Emp_FirstName"].ToString();
        }
        else
        {
            limenu_myAccount.Visible = true;
            limenu_userProfile.Visible = false;
        }
    }
    BE_Login proplogin = new BE_Login();
    protected void lbtn_signin_Click(object sender, EventArgs e)
    {
        try
        {
            proplogin.Emailid = useremailid.Value.TrimStart();// and mobile no
            //proplogin.Mobileno = useremailid.Value.TrimStart();
            proplogin.UserPassword = userPassword.Value.TrimStart();
            DataSet dtlogin = DAL_Login.Validate_OnlineUserLogin(proplogin);
            if (dtlogin.Tables[0].Rows.Count > 0)
            {
                Session["Login_Id"] = dtlogin.Tables[0].Rows[0]["Login_Id"].ToString();
                Session["Emailid"] = dtlogin.Tables[0].Rows[0]["Emailid"].ToString();
                Session["Phone_no"] = dtlogin.Tables[0].Rows[0]["Phone_no"].ToString();
                Session["UserPassword"] = dtlogin.Tables[0].Rows[0]["UserPassword"].ToString();
                Session["Emp_FirstName"] = dtlogin.Tables[0].Rows[0]["Emp_FirstName"].ToString();
                Session["Emp_LastName"] = dtlogin.Tables[0].Rows[0]["Emp_LastName"].ToString();
                Session["Country"] = dtlogin.Tables[0].Rows[0]["Country"].ToString();
                Session["DOB"] = dtlogin.Tables[0].Rows[0]["DOB"].ToString();
                //Response.Redirect("Default.aspx");
                limenu_myAccount.Visible = false;
                limenu_userProfile.Visible = true;
                username.InnerText = dtlogin.Tables[0].Rows[0]["Emp_FirstName"].ToString();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something is wrong please try again..')", true);
            }
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
        //Response.Redirect("Default.aspx");

    }
    protected void btnRegistationSave_Click(object sender, EventArgs e)
    {
        try
        {
            md.RegistationSave(txtFirstName.Text, txtLastName.Text, txtEmailId.Text, txtPhoneNumber.Text, txtPassword.Text, txtDateOfBirth.Text, txtCountry.Text);
            md.Mailto_RegisteredUser(txtEmailId.Text, txtFirstName.Text, txtLastName.Text, txtPassword.Text);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Thank you for registering.');", true);
            txtFirstName.Text = txtLastName.Text = txtEmailId.Text = txtPhoneNumber.Text = txtPassword.Text = txtCountry.Text = "";
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
    }
 protected void lnk_Forgetpassword_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Account is already Activated please check your Registered Email id. Email has been sent from no-reply@zenithholidays.com')", true);
    }
}
