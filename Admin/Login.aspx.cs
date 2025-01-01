using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["Login_Id"] != null && Request.Cookies["@UserPassword"] != null)
            {
               // username.Value = Request.Cookies["Login_Id"].Value.ToString();
                //password.Value = Request.Cookies["LoginName"].Value.ToString();
               // password.Value = Request.Cookies["password"].Value.ToString();
            }
            else
            {
                if (Request.QueryString["Login_Id"] != null && Request.QueryString["@UserPassword"] != null)
                {
                    //username.Value = Request.QueryString["Login_Id"].ToString();
                    //password.Value = Request.QueryString["Password"].ToString();
                }
                else
                {
                    Session.Abandon();
                    Session.Clear();
                    Session.RemoveAll();
                    Session["Login_Id"] = "";
                    Session["@UserPassword"] = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
                    Response.Cache.SetNoStore();
                    Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                    Response.Expires = -1500;
                    Response.CacheControl = "no-cache";
                    Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                }
            }
        }
    }
    BE_Login proplogin = new BE_Login();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
       
            proplogin.LoginId = txtLoginId.Value;
            proplogin.UserPassword = txtPassword.Value.Trim();
            DataSet dtlogin = DAL_Login.ValidateLogin(proplogin);
            if (dtlogin.Tables[0].Rows.Count > 0)
            {
                Session["User_Category_Id"] = dtlogin.Tables[0].Rows[0]["User_Category_Id"].ToString();
                Session["Login_Id"] = dtlogin.Tables[0].Rows[0]["Login_Id"].ToString();
                Session["LoginRef_Id"] = dtlogin.Tables[0].Rows[0]["LoginRef_Id"].ToString();
                Session["UserPassword"] = dtlogin.Tables[0].Rows[0]["UserPassword"].ToString();
                Session["zone"] = dtlogin.Tables[0].Rows[0]["Zone"].ToString();
                Session["ReportingHd"] = dtlogin.Tables[0].Rows[0]["ReportingHd"].ToString();
                Session["Emp_Name"] = dtlogin.Tables[0].Rows[0]["Emp_Name"].ToString();
                Session["Updated_date"] = dtlogin.Tables[0].Rows[0]["Updated_date"].ToString();
                Response.Redirect("Default.aspx");

            }
            else
            {
                //MessageBox.PopUp(sender, "Invalid Login Id Or Password !!! Please try Again....", "Error!!");
               // MessageBox.ShowUp(sender, "Invalid Login Id Or Password !!! Please try Again.");
                //lblmsglogin.Visible = true;
               // lblmsglogin.Text = "Invalid Login Id Or Password !!! Please try Again";
               // clear();
                //pnlLogin_ModalPopupExtender.Show();
                //ddlFinancialYear.SelectedValue = "LIVE";
            }
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
        //Response.Redirect("Default.aspx");

    }
}