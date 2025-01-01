using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

using System.Linq;

public partial class MainMaster : MasterPage
{
    mailbody md= new mailbody();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Request.Cookies["Login_Id"] != null && Request.Cookies["@UserPassword"] != null)
            if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
            {
                limenu_myAccount.Visible = false;
                limenu_userProfile.Visible = true;
                username.InnerText = Session["Emp_FirstName"].ToString();
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
            FaceBookConnect.API_Key = "265028490791890";
            FaceBookConnect.API_Secret = "80071fdb7f5a0ee83a49534d66ba0023";
            //if (!IsPostBack)
            //{
                if (Request.QueryString["error"] == "access_denied")
                {
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('User has denied access.');", true);
                    return;
                }

                string code = Request.QueryString["code"];
                if (!string.IsNullOrEmpty(code))
                {
                    string data = FaceBookConnect.Fetch(code, "me?fields=id,name,email");
                    FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                    faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);
                    pnlFaceBookUser.Visible = true;
                    lblId.Text = faceBookUser.Id;
                    lblUserName.Text = faceBookUser.UserName;
                    lblName.Text = faceBookUser.Name;
                    lblEmail.Text = faceBookUser.Email;
                    ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                    //btnLogin.Enabled = false;
                }
            }
        //}
    }
    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string PictureUrl { get; set; }
        public string Email { get; set; }
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
                //MessageBox.PopUp(sender, "Invalid Login Id Or Password !!! Please try Again....", "Error!!");
                // MessageBox.ShowUp(sender, "Invalid Login Id Or Password !!! Please try Again.");
                //lblmsglogin.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Login Id Or Password !!! Please try Again')", true);
                //lblmsglogin.Text = "Invalid Login Id Or Password !!! Please try Again";
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
    protected void btnRegistationSave_Click(object sender, EventArgs e)
    {
        try
        {
            md.RegistationSave(txtFirstName.Text, txtLastName.Text, txtEmailId.Text, txtPhoneNumber.Text, txtPassword.Text, txtDateOfBirth.Text, txtCountry.Text);
            md.Mailto_RegisteredUser(txtEmailId.Text, txtFirstName.Text, txtLastName.Text, txtPassword.Text);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Thank you for Registering.');", true);
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