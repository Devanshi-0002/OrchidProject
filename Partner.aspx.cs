using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Partner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegistationSavenew_Click(object sender, EventArgs e)
    {

        MailtoUser();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Registration Successful.')", true);
        txtFirstNamen.Text = txtLastNamen.Text = txtEmailIdn.Text = txtPhoneNumbern.Text = txtCountryn.Text = "";
    }
    
    public void MailtoUser()
    {
        string fromAddress = "no-reply@zenithholidays.com";//txtEmail.Text;
        string toAddress = "paras@zenithholidays.com";//crs@orchidglobal.net
        const string fromPassword = "3bB*e<Xde";
        string subject = "Franchisee registration Details as on  " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " is successful";
        string body = "<div style='background-color: #f2f2f2;font-size:13px;font-weight:400;padding:2% 0'><div style= 'overflow-x:auto;box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1), -10px 0 10px rgba(0, 0, 0, 0.05);direction: ltr;text-align: left;color: #444;background-color: white;padding: 1.5em;border-radius: 1em;max-width: 550px;margin: 0 auto 0 auto;border-radius:10px;'><center><img style='height:90px;width:150px;' src='http://www.zenithholidays.com/images/logo.png' /></center>";
        body += "<p>Hi Zenith team,</p><p>Your Franchisee registration details as bellows:</p> ";
        body += " <table style='width: 100%; '>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>First Name</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + txtFirstNamen.Text.Trim() + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Last Name</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + txtLastNamen.Text.Trim() + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Email Id</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + txtEmailIdn.Text + "</td></tr>";
        body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Mobile Number</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + txtPhoneNumbern.Text + "</td></tr>";
        body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>City</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + txtCountryn.Text + "</td></tr>";
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
                mm.CC.Add("karan.chadha@zenithholidays.com");
                // mm.CC.Add("anindya.roy@zenithholidays.com");
                //mm.CC.Add("paras@zenithholidays.com");
                //mm.CC.Add("neeshu@zenithholidays.com");
                //mm.CC.Add("delhi@zenithholidays.com");
                mm.CC.Add("neeraj@orchidglobal.net");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {

            }
        }
    }
    
}