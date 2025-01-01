using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;
using Orchidholidays;
using System.Net.Mail;
public partial class paynow : System.Web.UI.Page
{
    public string action1 = string.Empty;
    public string hash1 = string.Empty;
    public string txnid1 = string.Empty;
    DbConnect m = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
            {
                limenu_myAccount.Visible = false;
                limenu_userProfile.Visible = true;
                username.InnerText = firstname.Text = Session["Emp_FirstName"].ToString();
                email.Text = Session["Emailid"].ToString();
                phone.Text = Session["Phone_no"].ToString();
                submit.Text = "Pay Now";  
            }
            else
            {
                limenu_myAccount.Visible = true;
                limenu_userProfile.Visible = false;
                username.InnerText = firstname.Text = "";
                phone.Text = "";
                email.Text = "";           

            }
            if (Session["amount"] != "0" && Session["user_firstname"] != "" && Session["user_phone"] != "")
            {
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
                    // Required - Response callback url to be used by Payment Gateway to post back payment status. 
                    // surl - for success tranction, furl - for failure transaction, curl - for cancel transaction.
                    surl.Text = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath + "success";
                    furl.Text = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath + "Failed";
                    //curl.Text = furl.Text.ToString();
                    // Contains information of integration type. Consult to PayU for more details.
                    //udf5.Text = "PayUBiz_ASP.NET_Kit";
                    //Not mandatory but fixed code can be passed to Payment Gateway to show default payment 
                    //option tab. e.g. NB, CC, DC, CASH, EMI. Refer PDF for more details.
                    //pg.Text = "CC";
                }
                catch (Exception ex)
                {
                    Response.Write("<span style='color:red'>" + ex.Message + "</span>");
                }
                if (Session["user_firstname"].ToString() != "")
                {
                    amount.Text = Session["amount"].ToString();
                    firstname.Text = Session["user_firstname"].ToString();
                    lastname.Text = Session["user_lastname"].ToString();
                    email.Text = Session["useremail"].ToString();
                    phone.Text = Session["user_phone"].ToString();
                    productinfo.Text = Session["packagename"].ToString();
                    //surl.Text = "http://localhost:9197/success.aspx";
                    //furl.Text = "http://localhost:9197/Failed.aspx";
                    txt_traveldate.Text = Session["TravelDate"].ToString();
                    txt_totalrooms.Text = Session["TotalRoom"].ToString();
                    txt_adult.Text = Session["Adults"].ToString();
                    txt_child.Text = Session["Childs"].ToString();
                    txt_infant.Text = Session["Infants"].ToString();
                    txt_PackageDuration.Text = Session["packageDuration"].ToString();
                    //Session["totalPaxs"] = lblpackagename.Text;
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }

            }
            else
            {
                Response.Redirect("../index.aspx");
            }
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (Session["amount"] != "0" && Session["user_firstname"] != "" && Session["user_phone"] != "")
        {
            try
            {
                string[] hashVarsSeq;
                string hash_string = string.Empty;
                if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating random txnid
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
                        string.IsNullOrEmpty(Request.Form["lastname"]) ||
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

                                hash_string = hash_string + (Request.Form[hash_var] != null ? Request.Form[hash_var].Trim() : "");// isset if else
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
                    data.Add("productinfo", productinfo.Text.Trim());
                    data.Add("surl", surl.Text.Trim());
                    data.Add("furl", furl.Text.Trim());
                    //data.Add("lastname", lastname.Text.Trim());
                    //data.Add("curl", curl.Text.Trim());
                    //data.Add("address1", address1.Text.Trim());
                    //data.Add("address2", address2.Text.Trim());
                    //data.Add("city", city.Text.Trim());
                    //data.Add("state", state.Text.Trim());
                    //data.Add("country", country.Text.Trim());
                    //data.Add("zipcode", zipcode.Text.Trim());
                    //data.Add("udf1", udf1.Text.Trim());
                    //data.Add("udf2", udf2.Text.Trim());
                    //data.Add("udf3", udf3.Text.Trim());
                    //data.Add("udf4", udf4.Text.Trim());
                    //data.Add("udf5", udf5.Text.Trim());
                    //data.Add("pg", pg.Text.Trim());
                    string strForm = PreparePOSTForm(action1, data);
                    Page.Controls.Add(new LiteralControl(strForm));
                    //SaveRegistration();
                    //MailtoStudent();
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
        else
        {
            Response.Redirect("index.aspx");
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
}