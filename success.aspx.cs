using System;
using System.Data;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public partial class success : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            string[] merc_hash_vars_seq;
            string merc_hash_string = string.Empty;
            string merc_hash = string.Empty;
            string order_id = string.Empty;
            string hash_seq = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";

            if (Request.Form["status"] == "success")
            {
                merc_hash_vars_seq = hash_seq.Split('|');
                Array.Reverse(merc_hash_vars_seq);
                merc_hash_string = ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];
                //Check for presence of additionalCharges and include in hash
                if (Request.Form["additionalCharges"] != null)
                    merc_hash_string = Request.Form["additionalCharges"] + "|" + ConfigurationManager.AppSettings["SALT"] + "|" + Request.Form["status"];

                foreach (string merc_hash_var in merc_hash_vars_seq)
                {
                    merc_hash_string += "|";
                    merc_hash_string = merc_hash_string + (Request.Form[merc_hash_var] != null ? Request.Form[merc_hash_var] : "");

                }
                //Calculate response hash to verify	
                merc_hash = Generatehash512(merc_hash_string).ToLower();


                //Comapre status and hash. Hash verification is mandatory.
                if (merc_hash != Request.Form["hash"])
                {
                    Response.Write("<h2>Hash value did not match</h2>");

                }
                else
                {
                    order_id = Request.Form["txnid"];
                    //Response.Write("<h2>Payment Response-</h2><br />");

                    foreach (string strKey in Request.Form)
                    {
                        if (strKey == "txnid")
                        {
                            //Response.Write(Request.Form[strKey].ToString());
                            txt_transectionid.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "status")
                        {
                            txt_status.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "amount")
                        {
                            txt_amount.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "net_amount_debit")
                        {
                            txt_amount.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "email") 
                        {
                            txt_email.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "phone") 
                        {
                            txt_mobile.Text = Request.Form[strKey].ToString();
                        }
                        if (strKey == "firstname") 
                        {
                            txt_name.Text = Request.Form[strKey].ToString();
                        }
                        //Response.Write(strKey);
                        //Response.Write("=");
                        //Response.Write(Request.Form[strKey].ToString());
                        //Response.Write("<br />");
                    }
                    if (VerifyPayment(order_id, Request.Form["mihpayid"].ToString()))
                    {
                        //SaveTransactionID(txt_status.Text);
                        //Response.Write(payment_successful.InnerText);
                    }
                    else
                    {
                        //SaveTransactionID("Failed");
                        Response.Write("<h2>Payment Verification Failed...</h2><br />");
                    }
                    //Hash value did not matched
                    validUser();
                }

            }
        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }

    //This function is used to double check payment
    public Boolean VerifyPayment(string txnid, string mihpayid)
    {
        string command = "verify_payment";
        string hashstr = ConfigurationManager.AppSettings["MERCHANT_KEY"] + "|" + command + "|" + txnid + "|" + ConfigurationManager.AppSettings["SALT"];

        string hash = Generatehash512(hashstr);

        ServicePointManager.SecurityProtocol = ServicePointManager.SecurityProtocol = (SecurityProtocolType)768 | (SecurityProtocolType)3072;

        var request = (HttpWebRequest)WebRequest.Create(ConfigurationManager.AppSettings["PAYU_VERIFY_URL"]);

        var postData = "key=" + Uri.EscapeDataString(ConfigurationManager.AppSettings["MERCHANT_KEY"]);
        postData += "&hash=" + Uri.EscapeDataString(hash);
        postData += "&var1=" + Uri.EscapeDataString(txnid);
        postData += "&command=" + Uri.EscapeDataString(command);
        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        if (responseString.Contains("\"mihpayid\":\"" + mihpayid + "\"") && responseString.Contains("\"status\":\"success\""))
            return true;
        else
            return false;
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
    public void validUser()
    {
        try
        {
            DataSet dtlogin = DAL_Login.Validate_LoginAfterPayment(txt_email.Text,txt_mobile.Text,txt_name.Text);
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
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
        //Response.Redirect("Default.aspx");
    }
    //public void SaveTransactionID(string tstatus)
    //{
    //    try
    //    {
    //        string m_sMessage1 = "";
    //        m.dt = null;
    //        m.dt = new DataTable();
    //        m.dt.Columns.Add("COLUMN", typeof(string));
    //        m.dt.Columns.Add("VALUE", typeof(object));
    //        m.dt.Rows.Add("@p_SubOpMode", 1);
    //        m.dt.Rows.Add("@Transaction_Id", txt_transectionid.Text);
    //        m.dt.Rows.Add("@Pay_Status", txt_status.Text);
    //        m.dt.Rows.Add("@Paid_Amounts", txt_amount.Text);
    //        m_sMessage1 = m.OperateData("sp_Estudy_Registration", (int)Operation.Update);
    //        if (m_sMessage1.IndexOf("Error") != 0)
    //        {
    //            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration Submitted Sucessfully')", true);
    //        }
    //        else
    //        {
    //            throw new Exception(m_sMessage1.Substring(5, m_sMessage1.Length - 5));
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}
}