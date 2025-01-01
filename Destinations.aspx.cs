using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using Zenithholidays;

public partial class Destinations : System.Web.UI.Page
{
    DbConnect dc = new DbConnect();
    mailbody md = new mailbody();
    string source = "";
    protected void Page_Load(object sender, EventArgs e)
    
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Zenith"]))
            {
                destination.Text = Request.QueryString["Zenith"];
                ShowAllPkg(destination.Text);
                DesplaySlider(destination.Text);
                //distinationName.InnerText = destination.Text;
            }
            else
            {
                //lblpgkid.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["source"]))
            {
                source = Request.QueryString["source"];
            }
        }
    }
    public void DesplaySlider(string destination)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillAll_Destination");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Destination", destination);
            DataTable dsd = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dsd = dts.RetrieveRecordsdt(dsd, cmd);
            if (dsd.Rows.Count > 0)
            {
                rpt_sliderDestination.DataSource = dsd;
                rpt_sliderDestination.DataBind();
                //PricestartingFrom.InnerText =
            }
            else
            {
                dsd = null;
                rpt_sliderDestination.DataSource = dsd;
                rpt_sliderDestination.DataBind();
                //totalNoOfPkg.InnerText = "0";
                //lblMsg.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
            }
        }
        catch (Exception ex) { throw ex; }
    }
    public void ShowAllPkg(string destination)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Show_PackagegDetails_New");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Destination", destination);
            cmd.Parameters.AddWithValue("@Pkg_code", "");
            DataTable dsd = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dsd = dts.RetrieveRecordsdt(dsd, cmd);
            if (dsd.Rows.Count > 0)
            {
                rpt_adventure.DataSource = dsd;
                rpt_adventure.DataBind();
                totalNoOfPkg.InnerText = " " + rpt_adventure.Items.Count.ToString();

                foreach (RepeaterItem di in rpt_adventure.Items)
                {
                    Panel pnlcutleryd = (Panel)di.FindControl("pnlcutleryd");
                    Panel pnllgd = (Panel)di.FindControl("pnllgd");
                    Panel pnlbuldingd = (Panel)di.FindControl("pnlbuldingd");
                    Panel pnlcard = (Panel)di.FindControl("pnlcard");
                    Panel pnlSightseen = (Panel)di.FindControl("pnlSightseen");

                    Label lblbulding = (Label)di.FindControl("lblbulding");
                    Label lblcar = (Label)di.FindControl("lblcar");
                    Label lblcutlery = (Label)di.FindControl("lblcutlery");
                    Label lbllg = (Label)di.FindControl("lbllg");
                    Label lblSightseen = (Label)di.FindControl("lblSightseen");

                    //Panel pnlDomgroup = (Panel)di.FindControl("pnlDomgroup");
                    //Panel pnlDomcustom = (Panel)di.FindControl("pnlDomcustom");
                    //Label lblDomgroup = (Label)di.FindControl("lblDomgroup");
                    //Label lblDomcustom = (Label)di.FindControl("lblDomcustom");

                    //if (lblDomgroup.Text == "Group")
                    //{
                    //    pnlDomgroup.Visible = true;
                    //}
                    //else
                    //{
                    //    pnlDomgroup.Visible = false;
                    //}

                    //if (lblDomgroup.Text == "Customized")
                    //{
                    //    pnlDomcustom.Visible = true;
                    //}
                    //else
                    //{
                    //    pnlDomcustom.Visible = false;
                    //}

                    if (lblbulding.Text == "True")
                    {
                        pnlbuldingd.Visible = true;
                    }
                    else
                    {
                        pnlbuldingd.Visible = false; //bulding
                    }

                    if (lblcar.Text == "True")
                    {
                        pnlcard.Visible = true;
                    }
                    else
                    {
                        pnlcard.Visible = false;//car
                    }

                    if (lblcutlery.Text == "True")
                    {
                        pnlcutleryd.Visible = true;
                    }
                    else
                    {
                        pnlcutleryd.Visible = false;//cutlery
                    }

                    if (lbllg.Text == "True")
                    {
                        pnllgd.Visible = true;
                    }
                    else
                    {
                        pnllgd.Visible = false;
                    }
                    if (lblSightseen.Text == "True")
                    {
                        pnlSightseen.Visible = true;
                    }
                    else
                    {
                        pnlSightseen.Visible = false;
                    }
                }
            }
            else
            {
                dsd = null;
                rpt_adventure.DataSource = dsd;
                rpt_adventure.DataBind();
                totalNoOfPkg.InnerText ="0";
                //lblMsg.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
            }
        }
        catch (Exception ex) { throw ex; }
    }
    public void ShowPkg_bygroup(string pkg_type)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Show_PackagegDetails_NewByGroup");//ShowPkg_AdventureDetails_New
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Destination", destination.Text);
            cmd.Parameters.AddWithValue("@Pkg_type", pkg_type);
            DataTable dsd = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dsd = dts.RetrieveRecordsdt(dsd, cmd);
            if (dsd.Rows.Count > 0)
            {
                rpt_adventure.DataSource = dsd;
                rpt_adventure.DataBind();
                totalgroup.InnerText =" "+ rpt_adventure.Items.Count.ToString();
                totalcustomized.InnerText = " " + rpt_adventure.Items.Count.ToString();
                foreach (RepeaterItem di in rpt_adventure.Items)
                {
                    Panel pnlcutleryd = (Panel)di.FindControl("pnlcutleryd");
                    Panel pnllgd = (Panel)di.FindControl("pnllgd");
                    Panel pnlbuldingd = (Panel)di.FindControl("pnlbuldingd");
                    Panel pnlcard = (Panel)di.FindControl("pnlcard");
                    Panel pnlSightseen = (Panel)di.FindControl("pnlSightseen");

                    Label lblbulding = (Label)di.FindControl("lblbulding");
                    Label lblcar = (Label)di.FindControl("lblcar");
                    Label lblcutlery = (Label)di.FindControl("lblcutlery");
                    Label lbllg = (Label)di.FindControl("lbllg");
                    Label lblSightseen = (Label)di.FindControl("lblSightseen");

                    //Panel pnlDomgroup = (Panel)di.FindControl("pnlDomgroup");
                    //Panel pnlDomcustom = (Panel)di.FindControl("pnlDomcustom");
                    //Label lblDomgroup = (Label)di.FindControl("lblDomgroup");
                    //Label lblDomcustom = (Label)di.FindControl("lblDomcustom");

                    //if (lblDomgroup.Text == "Group")
                    //{
                    //    pnlDomgroup.Visible = true;
                    //}
                    //else
                    //{
                    //    pnlDomgroup.Visible = false;
                    //}

                    //if (lblDomgroup.Text == "Customized")
                    //{
                    //    pnlDomcustom.Visible = true;
                    //}
                    //else
                    //{
                    //    pnlDomcustom.Visible = false;
                    //}

                    if (lblbulding.Text == "True")
                    {
                        pnlbuldingd.Visible = true;
                    }
                    else
                    {
                        pnlbuldingd.Visible = false; //bulding
                    }

                    if (lblcar.Text == "True")
                    {
                        pnlcard.Visible = true;
                    }
                    else
                    {
                        pnlcard.Visible = false;//car
                    }

                    if (lblcutlery.Text == "True")
                    {
                        pnlcutleryd.Visible = true;
                    }
                    else
                    {
                        pnlcutleryd.Visible = false;//cutlery
                    }

                    if (lbllg.Text == "True")
                    {
                        pnllgd.Visible = true;
                    }
                    else
                    {
                        pnllgd.Visible = false;
                    }
                    if (lblSightseen.Text == "True")
                    {
                        pnlSightseen.Visible = true;
                    }
                    else
                    {
                        pnlSightseen.Visible = false;
                    }
                }
            }
            else
            {
                dsd = null;
                rpt_adventure.DataSource = dsd;
                rpt_adventure.DataBind();
                totalgroup.InnerText ="";
                totalcustomized.InnerText ="";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
            }
        }
        catch (Exception ex) { throw ex; }
    }
    protected void lnkbtnInternationalBook_Click(object sender, EventArgs e)
    {
        LinkButton lnksender = (LinkButton)sender;
        if (lnksender.CommandArgument.ToString() != "")
        {
            string pc = lnksender.CommandArgument;
            string pn = lnksender.CommandName;
            Response.Redirect("package-details.aspx?Zenith=" + pc.Trim());
            //Response.Redirect("package-details.aspx//" + pc.ToString() + "//" + pn.ToString());
            //Response.Redirect("~/blog/Blogdetails.aspx//" + lbl.Text + "//" + hl);  
            //Response.Redirect("index.aspx?id=" + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
            //Response.Redirect("TourGV.aspx?id=" + lnksender.Text + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
        }
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        ShowAllPkg(destination.Text);
        btnAll.Focus();
    }
    protected void btn_group_Click(object sender, EventArgs e)
    {
        ShowPkg_bygroup("Group");
        btn_group.Focus();
        totalgroup.Visible = true;
        totalcustomized.Visible = false;
    }
    protected void btn_Customizable_Click(object sender, EventArgs e)
    {
        ShowPkg_bygroup("Customized");
        btn_Customizable.Focus();
        totalgroup.Visible = false;
        totalcustomized.Visible = true;
    }
    protected void btn_saveEnq_Click(object sender, EventArgs e)
    {
        
        md.savemaildetail(txt_YourName.Value, txt_emailid.Value, txt_mobileno.Value, "", txt_cityname.Value, "", "", "", "", source, "");
        //phello.InnerHtml = "Hello " + txtFastName.Text + ",";
        //ml.smstozenith_Quickcontact(txtEmail.Text, txtFastName.Text, txtPhoneno.Text, txtEmail.Text, txtMoreDetails.Text);// SMS TO COMPANY
        //ml.smstocustomer_Quickcontact(txtEmail.Text, GetMailBody());// SMS TO CUSTOMER
        //Session["Enquiry_Id"] = ml.enqid;
        clearalltext();
        Response.Redirect("thankyou.aspx");
    }
    public void clearalltext()
    {
        txt_YourName.Value ="";
        txt_emailid.Value = "";
        txt_mobileno.Value ="";
        txt_cityname.Value = "";
    }
}