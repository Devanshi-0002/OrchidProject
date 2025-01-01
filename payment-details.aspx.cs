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
using System.Web.Configuration;
using System.Net.Mail;

public partial class payment_details : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<h2>BOLT Payment Response</h2>");
        //Response.Write("Key: " + Request.Form["key"] + "<br />");
        //Response.Write("Salt: " + Request.Form["salt"] + "<br />");
        //Response.Write("Txnid: " + Request.Form["txnid"] + "<br />");
        //Response.Write("Amount: " + Request.Form["amount"] + "<br />");
        //Response.Write("Product Info: " + Request.Form["productinfo"] + "<br />");
        //Response.Write("First Name: " + Request.Form["firstname"] + "<br />");
        //Response.Write("Email: " + Request.Form["email"] + "<br />");
        //Response.Write("Myhpayid: " + Request.Form["mihpayid"] + "<br />");
        //Response.Write("Status: " + Request.Form["status"] + "<br />");
        //Response.Write("UDF5: " + Request.Form["udf5"] + "<br />");
        //Response.Write("Hash: " + Request.Form["hash"] + "<br />");
        if (!IsPostBack)
        {
            if (Session["productinfo"] == null || Session["NoOfAdult"] == null || Session["firstname"] == null || Session["email"] == null || Session["phone"] == null)
            {
                Response.Redirect("Default.aspx");
                //value="key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10"/>
            }
            else
            {
                Randomid();
                ShowPymDetails();
                SavePaymentDetails();
                MailtoUser();
            }
        }
    }

    public void Randomid()
    {
        string alphabets = "ABCDEFGHIJKLMNPQRSTUVWXYZ";
        //string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "123456789";
        string characters = numbers;
        characters += alphabets + numbers;
        int length = 8;
        string otp = string.Empty;
        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
        Session["BookingID"] = "ZLH" + otp;
    }
    public void ShowPymDetails()
    {
        lbl_pkgname.Text = Session["productinfo"].ToString();
        lbl_BookingDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
        lbl_DepartureDate.Text = Session["DepartuerDate"].ToString();
        lbl_PAXConfiguration.Text = "Adult : " + Session["NoOfAdult"].ToString() + " Child :" + Session["NoOfChild"].ToString();
        lbl_PaymentOption.Text = Session["PaymentOption"].ToString();
        lbl_customerName.Text = Session["firstname"].ToString();
        lbl_CustomerEmail.Text = Session["email"].ToString();
        lbl_CustomerPhone.Text = Session["phone"].ToString();
        lbl_BookingID.Text = Session["BookingID"].ToString().Trim();
        lbl_BookingStatus.Text = "Successful";
        //lbl_ModeofPayment.Text = "Debit card";
        lbl_amount.Text = Session["AmountForm"].ToString();
        lbl_DepartureCity.Text = Session["destination"].ToString();
        lbl_RoomConfiguration.Text = Session["TotalRoom"].ToString();
        transactionid.Text=Session["txnid"].ToString();
       //System.Collections.Hashtable data = new System.Collections.Hashtable();
       // data.Add("hash", lbl_customerName.Text);
       // data.Add("txnid", lbl_PaymentMode.Text);
       // data.Add("key", lbl_Status.Text);
       // data.Add("amount", lbl_paymentId.Text);
       // data.Add("firstname", lbl_ProductInfo.Text.Trim());
       // data.Add("email", lbl_CustomerEmail.Text.Trim());
       // data.Add("phone", lbl_CustomerPhone.Text.Trim());
       // data.Add("productinfo", lbl_amount.Text.Trim()); 
       
        
    }
    public void MailtoUser()
    {
        string fromAddress = "no-reply@zenithholidays.com";//txtEmail.Text;
        string toAddress = Session["email"].ToString().Trim();//crs@orchidglobal.net
        const string fromPassword = "3bB*e<Xde";
        string subject = "Your transaction with Zenith Leisure Holidays Limited on "+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " is successful";
        string body = "<div style='background-color: #f2f2f2;font-size:13px;font-weight:400;padding:2% 0'><div style= 'overflow-x:auto;box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1), -10px 0 10px rgba(0, 0, 0, 0.05);direction: ltr;text-align: left;color: #444;background-color: white;padding: 1.5em;border-radius: 1em;max-width: 550px;margin: 0 auto 0 auto;border-radius:10px;'><center><img style='height:90px;width:150px;' src='http://www.zenithholidays.com/images/logo.png' /></center>";
        body += "<p>Hi " + lbl_customerName.Text + ",</p><p>Your Package details as bellows:</p> ";
        body += " <table style='width: 100%; '>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Your Holidays Package Name</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_pkgname.Text.Trim() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Departure City</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_DepartureCity.Text.Trim() + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Booking Date</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + DateTime.Now.ToString("dd-MM-yyyy") +"</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Departure Date</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_DepartureDate.Text + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>PAX / Age</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + "Adult : " + Session["NoOfAdult"].ToString() + " Child :" + Session["NoOfChild"].ToString() + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Room Configuration</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_RoomConfiguration.Text + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Payment Option</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["PaymentOption"].ToString() + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Name</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["firstname"].ToString() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Email</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["email"].ToString().Trim() + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Phone</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["phone"].ToString() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Booking ID</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["BookingID"].ToString().Trim() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Booking Status</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + "Successful" + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)' > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Transaction Id </td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["txnid"].ToString() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Amount Received ( Rs)</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_amount.Text + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>No. of Infant</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_scroll_infant.Text.Trim() + "</td></tr>";
        //body += "<tr  > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Double / Tripple Sharing</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lblcurrency.Text.Trim() + " " + lbltotalcost.Text + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)' > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Single occupancy</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lblcurrency.Text.Trim() + " " + lbl_single_cost.Text.Trim() + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Per Child With Bed</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_tot_curr.Text.Trim() + " " + lbl_cwb_price.Text.Trim() + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)' > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Per Child With out Bed</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_tot_curr.Text.Trim() + " " + lbl_cwob_price.Text.Trim() + "</td></tr>";
        //body += "<tr> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Total Optional tour Cost</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_tot_curr.Text.Trim() + " " + tot_op_price.Text.Trim() + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Total Meal Cost</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_tot_curr.Text.Trim() + " " + tot_meal_price.Text.Trim() + "</td></tr>";
        body += "</table></div></div><br/><br/>";
        SmtpClient smtp = new System.Net.Mail.SmtpClient();
        {
            try
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("no-reply@zenithholidays.com", fromPassword);
                smtp.Timeout = 20000;
                MailMessage mm = new MailMessage();
                mm.Subject = subject;
                mm.To.Add(toAddress);
                mm.From = new MailAddress(fromAddress);
                mm.IsBodyHtml = true;
                //mm.CC.Add("sanjoy.bose@zenithholidays.com");
               // mm.CC.Add("anindya.roy@zenithholidays.com");
                //mm.CC.Add("paras@zenithholidays.com");
                //mm.CC.Add("neeshu@zenithholidays.com");
                //mm.CC.Add("delhi@zenithholidays.com");
                //mm.CC.Add("neeraj@orchidglobal.net");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {

            }
        }
    }
    public void SavePaymentDetails()
    {
        try
        {
            string m_sMessage = "";
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@p_SubOpMode", 1);
            m.dt.Rows.Add("@First_Name", lbl_customerName.Text);
            m.dt.Rows.Add("@Last_Name", "");
            m.dt.Rows.Add("@Destination", lbl_DepartureCity.Text);
            m.dt.Rows.Add("@Phone_number", lbl_CustomerPhone.Text);
            m.dt.Rows.Add("@Email_ID", lbl_CustomerEmail.Text);
            m.dt.Rows.Add("@City", "");
            m.dt.Rows.Add("@Travel_Date", lbl_DepartureDate.Text);
            m.dt.Rows.Add("@Adult", Session["NoOfAdult"].ToString());
            m.dt.Rows.Add("@Child", Session["NoOfChild"].ToString());
            m.dt.Rows.Add("@Details", lbl_PAXConfiguration.Text);
            m.dt.Rows.Add("@Package_name", lbl_pkgname.Text);
            m.dt.Rows.Add("@Package_amount", lbl_amount.Text);
            m.dt.Rows.Add("@Pkg_total_amount", Session["amount"].ToString());
            m.dt.Rows.Add("@Pkg_discount_amount", 0);
            m.dt.Rows.Add("@Pkg_paid_amount", lbl_amount.Text);
            m.dt.Rows.Add("@Adult1", "");
            m.dt.Rows.Add("@Adult2", "");
            m.dt.Rows.Add("@Adult3", "");
            m.dt.Rows.Add("@Adult4", "");
            m.dt.Rows.Add("@Adult5", "");
            m.dt.Rows.Add("@Adult6", "");
            m.dt.Rows.Add("@Adult7", "");
            m.dt.Rows.Add("@Adult8", "");
            m.dt.Rows.Add("@Adult9", "");
            m.dt.Rows.Add("@Adult10", "");
            m.dt.Rows.Add("@Child1", "");
            m.dt.Rows.Add("@Child2", "");
            m.dt.Rows.Add("@Child3", "");
            m.dt.Rows.Add("@Child4", "");
            m.dt.Rows.Add("@Child5", "");
            m.dt.Rows.Add("@Child6", "");
            m.dt.Rows.Add("@Child7", "");
            m.dt.Rows.Add("@Child8", "");
            m.dt.Rows.Add("@Child9", "");
            m.dt.Rows.Add("@Child10", "");
            m.dt.Rows.Add("@Total_Room", lbl_RoomConfiguration.Text);
            m.dt.Rows.Add("@Payment_Mode", lbl_PaymentOption.Text);
            m.dt.Rows.Add("@Payment_type", "");
            m.dt.Rows.Add("@Booking_Code", lbl_BookingID.Text);
            m.dt.Rows.Add("@Payment_id", transactionid.Text);
            m_sMessage = m.OperateData("sp_tbl_Online_BookingDetails", (int)Operation.Insert);
            if (m_sMessage.IndexOf("Error") != 0)
            {

            }
            else
            {
                throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
            }
        }
        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");
        }
    }
    //public void PayNow()
    //{

    //    //initialize

    //    tokenContext.setPaymentMessageSession(null);

    //    ViewData["PaymentMessage"] = null;

    //    EMedical.DataModel.UserLabTest labTest = tokenContext.getCurrentUserTest();

    //    if (labTest != null)
    //    {

    //        string firstName = labTest.PatientName;

    //        string amount = labTest.PayablePrice.ToString();

    //        string productInfo = "Lab Product Purchase Online";

    //        string email = labTest.Email;

    //        string phone = labTest.ContactNumber;

    //        RemotePost myremotepost = new RemotePost();

    //        string key = ConfigurationManager.AppSettings["MERCHANT_KEY"];

    //        string salt = ConfigurationManager.AppSettings["SALT"];

    //        var DomainName = System.Web.HttpContext.Current.Request.Url.Host;

    //        //posting all the parameters required for integration.

    //        myremotepost.Url = ConfigurationManager.AppSettings["PAYU_BASE_URL"];

    //        myremotepost.Add("key", ConfigurationManager.AppSettings["MERCHANT_KEY"]);

    //        string txnid = Generatetxnid();

    //        myremotepost.Add("txnid", txnid);

    //        myremotepost.Add("amount", amount);

    //        myremotepost.Add("productinfo", productInfo);

    //        myremotepost.Add("firstname", firstName);

    //        myremotepost.Add("phone", phone);

    //        myremotepost.Add("email", email);

    //        //myremotepost.Add("surl", "http://localhost:3677/User/Return");//Change the success url here depending upon the port number of your local system.

    //        //myremotepost.Add("furl", "http://localhost:3677/User/Return");//Change the failure url here depending upon the port number of your local system.
    //        myremotepost.Add("surl", "http://" + DomainName + "/User/Return");//Change the success url here depending upon the port number of your local system.
    //        myremotepost.Add("furl", "http://" + DomainName + "/User/Return");//Change the failure url here depending upon the port number of your local system.
    //        myremotepost.Add("service_provider", "payu_paisa");

    //        string hashString = key + "|" + txnid + "|" + amount + "|" + productInfo + "|" + firstName + "|" + email + "|||||||||||" + salt;
    //        //string hashString = "3Q5c3q|2590640|3053.00|OnlineBooking|vimallad|ladvimal@gmail.com|||||||||||mE2RxRwx";
    //        string hash = Generatehash512(hashString);
    //        myremotepost.Add("hash", hash);
    //        myremotepost.Post();
    //    }
    //}

   
}