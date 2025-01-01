using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Data;
using System.IO;
using Zenithholidays;
public partial class checkout : System.Web.UI.Page
{
    public string action1 = string.Empty;
    public string hash1 = string.Empty;
    public string txnid1 = string.Empty;
    DbConnect m = new DbConnect();
    mailbody md = new mailbody();
    string source = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session.Abandon();
        //Session.Clear();
        //Session.RemoveAll();
        if (!Page.IsPostBack)
        {

            if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
            {
                limenu_myAccount.Visible = false;
                limenu_userProfile.Visible = true;
                Popup_DontHaveAccount.Visible = false;
                //panelShow.Visible = true;
                //panelHide.Visible = false;
                username.InnerText = firstname.Text = Session["Emp_FirstName"].ToString();
                email.Text = Session["Emailid"].ToString();
                phone.Text = Session["Phone_no"].ToString();
                submit.Text = "Pay Now";
                NowToBookonlineasaguest.Visible = false;
                IHaveAZenithAccount.Visible = false;
            }
            else
            {
                limenu_myAccount.Visible = true;
                limenu_userProfile.Visible = false;
                Popup_DontHaveAccount.Visible = true;
                //panelShow.Visible = false;
                //panelHide.Visible = true;
                username.InnerText = firstname.Text = "";
                phone.Text = "";
                email.Text = "";
                NowToBookonlineasaguest.Visible = true;
                IHaveAZenithAccount.Visible = true;

            }
            if (Session["TotalAdult"] == null || Session["TotalCost"] == null || Session["TotalRoom"] == null)
            {
                Session.Clear();
                Session.RemoveAll();
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (!string.IsNullOrEmpty(Request.QueryString["paynow"]))
                {
                    lblpgkid.Text = Request.QueryString["paynow"];
                    //string lblpgkid = Request.QueryString["Zenith"];
                    string pname = Request.QueryString["pn"];
                    //BindDatalistPkgddetailInter();
                    ShowPkgDetails();
                }
                else
                {
                    //lblpgkid.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
                }
                try
                {
                    key.Value = ConfigurationManager.AppSettings["MERCHANT_KEY"];

                    if (!IsPostBack)
                    {
                        frmError.Visible = false; // error form
                    }
                    else
                    {
                        //frmError.Visible = true;
                    }
                    if (string.IsNullOrEmpty(Request.Form["hash"]))
                    {
                        submit.Visible = true;
                    }
                    else
                    {
                        submit.Visible = false;
                    }
                    surl.Value = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath + "success";
                    furl.Value = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath + "Failed";
                }
                catch (Exception ex)
                {
                    Response.Write("<span style='color:red'>" + ex.Message + "</span>");
                }
            }
            Session["amount"] = amount.Text;
            payAmount.Text = Session["amount"].ToString();
        }
    }
    public string Generatehash512(string text)
    {
        byte[] message = Encoding.UTF8.GetBytes(text);
        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            string[] hashVarsSeq;
            string hash_string = string.Empty;
            if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating txnid
            {
                Random rnd = new Random();
                string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                txnid1 = strHash.ToString().Substring(0, 20);
            }
            else
            {
                txnid1 = Request.Form["txnid"];
            }
            if (string.IsNullOrEmpty(Request.Form["hash"])) // generating hash value
            {
                if (
                    string.IsNullOrEmpty(ConfigurationManager.AppSettings["MERCHANT_KEY"]) ||
                    string.IsNullOrEmpty(txnid1) ||
                    string.IsNullOrEmpty(Request.Form["amount"]) ||
                    string.IsNullOrEmpty(Request.Form["firstname"]) ||
                    string.IsNullOrEmpty(Request.Form["email"]) ||
                    string.IsNullOrEmpty(Request.Form["phone"]) ||
                    string.IsNullOrEmpty(Request.Form["productinfo"]) ||
                    string.IsNullOrEmpty(Request.Form["surl"]) ||
                    string.IsNullOrEmpty(Request.Form["furl"])
                    )
                {
                    //error
                    frmError.Visible = true;
                    return;
                }
                else
                {
                    frmError.Visible = false;
                    hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
                    hash_string = "";
                    foreach (string hash_var in hashVarsSeq)
                    {
                        if (hash_var == "key")
                        {
                            hash_string = hash_string + ConfigurationManager.AppSettings["MERCHANT_KEY"];
                            hash_string = hash_string + '|';
                        }
                        else if (hash_var == "txnid")
                        {
                            hash_string = hash_string + txnid1;
                            hash_string = hash_string + '|';
                        }
                        else if (hash_var == "amount")
                        {
                            hash_string = hash_string + Convert.ToDecimal(Request.Form[hash_var]).ToString("g29");
                            hash_string = hash_string + '|';
                        }
                        else
                        {
                            hash_string = hash_string + (Request.Form[hash_var] != null ? Request.Form[hash_var] : "");// isset if else
                            hash_string = hash_string + '|';
                        }
                    }
                    hash_string += ConfigurationManager.AppSettings["SALT"];// appending SALT
                    hash1 = Generatehash512(hash_string).ToLower();         //generating hash
                    action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";// setting URL
                }
            }
            else if (!string.IsNullOrEmpty(Request.Form["hash"]))
            {
                hash1 = Request.Form["hash"];
                action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";

            }
            if (!string.IsNullOrEmpty(hash1))
            {
                hash.Value = hash1;
                txnid.Value = txnid1;
                System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                data.Add("hash", hash.Value);
                data.Add("txnid", txnid.Value);
                data.Add("key", key.Value);
                string AmountForm = Convert.ToDecimal(amount.Text.Trim()).ToString("g29");// eliminating trailing zeros
                amount.Text = AmountForm;
                data.Add("amount", AmountForm);
                data.Add("firstname", firstname.Text.Trim());
                data.Add("email", email.Text.Trim());
                data.Add("phone", phone.Text.Trim());
                data.Add("productinfo", productinfo.Value.Trim());
                data.Add("surl", surl.Value.Trim());//surl.Value.Trim()
                data.Add("furl", furl.Value.Trim());//furl.Value.Trim()
                //data.Add("service_provider", service_provider.Value.Trim());
                string strForm = PreparePOSTForm(action1, data);
                Page.Controls.Add(new LiteralControl(strForm));
                Session["firstname"] = firstname.Text;
                Session["AmountForm"] = AmountForm;
                Session["email"] = email.Text;
                Session["phone"] = phone.Text;
                Session["productinfo"] = packagename.InnerText;
                Session["NoOfAdult"] = NoOfAdult.InnerText;
                Session["NoOfChild"] = NoOfChild.InnerText;
                Session["txnid"] = txnid.Value;
                //Session[""] = firstname.Text;
                //Session[""] = firstname.Text;
                //Session[""] = firstname.Text;
                //Session[""] = firstname.Text;
            }
            else
            {
                //no hash
            }
        }

        catch (Exception ex)
        {
           Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }
        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    DbConnect dc = new DbConnect();

    public void CheckPackageType()//string pkgcode
    {
        dc.dt = null;
        dc.dt = new DataTable();
        dc.dt.Columns.Add("COLUMN", typeof(string));
        dc.dt.Columns.Add("VALUE", typeof(object));
        dc.dt.Rows.Add("@Pkg_code", Request.QueryString["Zenith"]);
        dc.dt.Rows.Add("@p_SubOpMode", 10);
        DataSet m_ddl = new DataSet();
        dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddl);
        if (m_ddl.Tables[0].Rows.Count > 0)
        {
            lbl_pkgtype.InnerText = m_ddl.Tables[0].Rows[0]["Pkg_type"].ToString();
        }
    }
    protected void ShowPkgDetails()
    {
        try
        {
            CheckPackageType();
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
            if (lbl_pkgtype.InnerText == "Group")
            {
                dc.dt.Rows.Add("@HUB_StartingFrom", Session["hub"].ToString());
                dc.dt.Rows.Add("@Departure_Date", Session["departure_date"].ToString());
                dc.dt.Rows.Add("@p_SubOpMode", 2);
            }
            else
            {
                dc.dt.Rows.Add("@p_SubOpMode", 8);
            }
            DataSet ds = new DataSet();
            dc.pfn_GetData("Z_NewPkgMasterDetails", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //rpt_pkgdetails.DataSource = ds;
                //rpt_pkgdetails.DataBind();
                //Itinerary_details.InnerHtml = ds.Tables[1].Rows[0]["Pkg_details"].ToString();
                lblPkg_type.Text = ds.Tables[1].Rows[0]["Pkg_type"].ToString();
                lblpkgname.Text = ds.Tables[1].Rows[0]["Pkg_name"].ToString();
                packagename.InnerHtml = ds.Tables[1].Rows[0]["Pkg_name"].ToString();
                departure_date.InnerHtml = Session["DepartuerDate"].ToString();
                destination.InnerText = Session["destination"].ToString();
                lbl_totalRoom.InnerText = Session["TotalRoom"].ToString();

                double pkgamt = 0;
                pkgamt = Convert.ToDouble((Math.Round(Convert.ToDouble(Session["TotalCost"].ToString()), 0, MidpointRounding.AwayFromZero)).ToString());

                double tax = 0;
                tax = Convert.ToDouble((Math.Round(Convert.ToDouble((Session["TotalCost"].ToString())) * 5 / 100, 0, MidpointRounding.AwayFromZero)).ToString());
                Taxes.InnerText = Convert.ToInt32(tax).ToString();
                BasePrice.InnerText = Convert.ToInt32(pkgamt).ToString();
                //PayNow.InnerText = amount.Text = (Math.Round(Convert.ToDouble(Session["TotalCost"].ToString() + tax), 0, MidpointRounding.AwayFromZero)).ToString();
                PayNow.InnerText = amount.Text = (pkgamt + tax).ToString();
                //PayNow.InnerText = amount.Text = (Math.Round(Convert.ToDouble(Session["TotalCost"].ToString() + tax), 0, MidpointRounding.AwayFromZero)).ToString();

                //amount.Text = BasePrice.InnerText = (Math.Round(Convert.ToDouble(Session["TotalCost"].ToString()), 0, MidpointRounding.AwayFromZero)).ToString();
                    //(Session["TotalCost"].ToString());
                NoOfAdult.InnerText = Session["TotalAdult"].ToString();
                NoOfChild.InnerText = Session["TotalChilds"].ToString();
                PartialPayment_PayNow.InnerText = (Math.Round(Convert.ToDouble((Session["TotalCost"].ToString())) * 20 / 100, 0, MidpointRounding.AwayFromZero)).ToString();
                PartialPayment_PayLater.InnerText = (Convert.ToDouble(amount.Text) - Convert.ToDouble(PartialPayment_PayNow.InnerText)).ToString();
                //PayNow.InnerText = (Math.Round(Convert.ToDouble(Session["TotalCost"].ToString()), 0, MidpointRounding.AwayFromZero)).ToString();
                //Taxes.InnerText = "0"; //ds.Tables[2].Rows[0]["Per_Unit_Cost"].ToString();
                //payand & hold Amount calculation
                totalnoofAdutl.InnerText= NoOfAdult.InnerText +" Adult";
                payandhold_Amount.InnerText =(Math.Round(Convert.ToDouble((Session["TotalCost"].ToString())) * 20 / 100, 0, MidpointRounding.AwayFromZero)).ToString();
            }
            else
            {
                ds = null;
                //rpt_pkgdetails.DataSource = ds;
                //rpt_pkgdetails.DataBind();
            }
           
        }
        catch (Exception ex) { throw ex; }
    }

    protected void btnRegistationSave_Click(object sender, EventArgs e)
    {
        //var x = customRadio1.Checked = true;
        //var y = customRadio2.Checked = true;
        //var z = customRadio3.Checked = true;

       
        try
        {
            md.RegistationSave(txtFirstName.Text, txtLastName.Text, txtEmailId.Text, txtPhoneNumber.Text, txtPassword.Text, txtDateOfBirth.Text, txtCountry.Text);
            md.Mailto_RegisteredUser(txtEmailId.Text, txtFirstName.Text, txtLastName.Text, txtPassword.Text);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Thank you for registering.');", true);
            txtFirstName.Text = txtLastName.Text = txtEmailId.Text = txtPhoneNumber.Text = txtPassword.Text = txtCountry.Text = "";
            //string m_sMessage = "";
            //m.dt = null;
            //m.dt = new DataTable();
            //m.dt.Columns.Add("COLUMN", typeof(string));
            //m.dt.Columns.Add("VALUE", typeof(object));
            //m.dt.Rows.Add("@p_SubOpMode", 3);
            //m.dt.Rows.Add("@Emp_FirstName", txtFirstName.Text);
            //m.dt.Rows.Add("@Emp_LastName", txtLastName.Text);
            //m.dt.Rows.Add("@Emailid", txtEmailId.Text);
            //m.dt.Rows.Add("@Phone_no", txtPhoneNumber.Text);
            //m.dt.Rows.Add("@UserPassword", txtPassword.Text);
            //m.dt.Rows.Add("@DOB", txtDateOfBirth.Text);
            //m.dt.Rows.Add("@Country", txtCountry.Text);
            //m_sMessage = m.OperateData("Z_NewPkgMasterDetails", (int)Operation.Insert);
            //if (m_sMessage.IndexOf("Error") != 0)
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Login Successfully.');", true);
            //    txtFirstName.Text = txtLastName.Text = txtEmailId.Text = txtPhoneNumber.Text = txtPassword.Text = txtCountry.Text = "";
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Something is wrong please try again.');", true);
            //    //throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
            //}
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btn_saveEnq_Click(object sender, EventArgs e)
    {
        try
        {
           
            md.savemaildetail(txt_YourName.Text, txt_emailid.Text, txt_mobileno.Text, txt_coment.Text, txt_cityname.Text, txt_traveldate.Text, txt_noof_Adult.Value, lblPkg_type.Text, lblpkgname.Text, source, txt_noof_Child.Value);
            //phello.InnerHtml = "Hello " + txtFastName.Text + ",";
            //ml.smstozenith_Quickcontact(txtEmail.Text, txtFastName.Text, txtPhoneno.Text, txtEmail.Text, txtMoreDetails.Text);// SMS TO COMPANY
            //ml.smstocustomer_Quickcontact(txtEmail.Text, GetMailBody());// SMS TO CUSTOMER
            //Session["Enquiry_Id"] = ml.enqid;
            clearalltext();
            Response.Redirect("thankyou.aspx");
        }
        catch (Exception ex) { throw ex; }
    }
    public void clearalltext()
    {
        txt_YourName.Text = "";
        txt_emailid.Text = "";
        txt_mobileno.Text = "";
        txt_coment.Text = txt_cityname.Text = txt_traveldate.Text = "";
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
                Response.Redirect(Request.RawUrl);
                userPassword.Focus();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Login Id Or Password !!! Please try Again..')", true);
            }
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
        //Response.Redirect("Default.aspx");
        
    }
        
    protected void customRadio1_OnServerChange(object sender, EventArgs e)
    {
        payAmountVisable.Visible = true;
        remainAmountVisable.Visible = true;
        var x = Convert.ToDecimal(Session["amount"].ToString());
        var y = Convert.ToDecimal(payandhold_Amount.InnerText);
        var z = (x - y);
        if (!customRadio1.Checked) return;
        amount.Text = y.ToString();
        remainAmount.Text = z.ToString();
        if(customRadio1.Checked)
        {
            Session["PaymentOption"] = "Pay & Hold 20%";
        }
        else
        {
            Session["PaymentOption"] = "Full Payment";
        }
    }

    protected void customRadio2_OnServerChange(object sender, EventArgs e)
    {
        payAmountVisable.Visible = true;
        remainAmountVisable.Visible = true;
        var x = Convert.ToDecimal(Session["amount"].ToString());
        var y = Convert.ToDecimal(PartialPayment_PayNow.InnerText);
        var z = (x - y);
        if (!customRadio2.Checked) return;
        amount.Text = y.ToString();
        remainAmount.Text = z.ToString();
    }
    protected void customRadio3_OnServerChange(object sender, EventArgs e)
    {
        payAmountVisable.Visible = true;
        remainAmountVisable.Visible = false;
        var x = Convert.ToDecimal(Session["amount"].ToString());
        var z = x.ToString();
        if (!customRadio3.Checked) return;
        amount.Text = z;
        if (customRadio3.Checked)
        {
            Session["PaymentOption"] = "Full Payment";
        }
        else
        {
            Session["PaymentOption"] = "";
        }
    }

    protected void loginHere_OnClick(object sender, EventArgs e)
    {
      
        try
        {
            proplogin.Emailid = email.Text.TrimStart();
            //proplogin.Mobileno = useremailid.Value.TrimStart();
            proplogin.UserPassword = txtUserPassword.Text.TrimStart();
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
                Response.Redirect(Request.RawUrl);
                txtUserPassword.Focus();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Login Id Or Password !!! Please try Again..')", true);
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
protected void lnk_Forgetpassword_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Account is already Activated please check your Registered Email id. Email has been sent from no-reply@zenithholidays.com')", true);
    }
    
}