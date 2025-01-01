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
public partial class holidays_in_india : System.Web.UI.Page
{
    DbConnect dc = new DbConnect();
    mailbody md = new mailbody();
    string source = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["destination"]))
            {
                destination.Text = Request.QueryString["destination"];
                ShowAllPkg(destination.Text);
                DesplaySlider(destination.Text);
                //distinationName.InnerText = destination.Text;
                //showDeparture();
            }
            else
            {
                //lblpgkid.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["source"]))
            {
                source = Request.QueryString["source"];
            }
            if (!string.IsNullOrEmpty(Request.QueryString["dfrom"]))
            {
                //string from = Request.QueryString["dfrom"];
                //string to = Request.QueryString["dto"];
                txt_from.Text = Request.QueryString["dfrom"];
                txt_to.Text = Request.QueryString["dto"];
                SearchDestination_FronTo();
            }
            DesplaySlider(destination.Text);
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
                totalNoOfPkg.InnerText = " (" + rpt_adventure.Items.Count.ToString()+ " )";

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
                totalNoOfPkg.InnerText = "0";
                Response.Redirect("Default.aspx");
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
                totalgroup.InnerText = " " + rpt_adventure.Items.Count.ToString();
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
                totalgroup.InnerText = "";
                totalcustomized.InnerText = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
            }
        }
        catch (Exception ex) { throw ex; }
    }

    public void showDeparture(string pkgcode)//string pkgcode
    {
        dc.dt = null;
        dc.dt = new DataTable();
        dc.dt.Columns.Add("COLUMN", typeof(string));
        dc.dt.Columns.Add("VALUE", typeof(object));
        dc.dt.Rows.Add("@Destination", Request.QueryString["destination"]);
        dc.dt.Rows.Add("@Pkg_code", pkgcode);
        dc.dt.Rows.Add("@p_SubOpMode", 7);
        DataSet m_ddl = new DataSet();
        dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddl);
        if (m_ddl.Tables[0].Rows.Count > 0)
        {
            lbldeparture_City.InnerText = m_ddl.Tables[0].Rows[0]["Boarding_Point"].ToString();
            lbldeparture_date.InnerText = m_ddl.Tables[0].Rows[0]["Departure_Date"].ToString();
            lbl_pkgtype.InnerText=m_ddl.Tables[0].Rows[0]["Pkg_type"].ToString();
        }
    }
    protected void lnkbtnInternationalBook_Click(object sender, EventArgs e)
    {
        LinkButton lnksender = (LinkButton)sender;
        if (lnksender.CommandArgument.ToString() != "")
        {
            string pc = lnksender.CommandArgument;
            string pn = lnksender.CommandName;
            showDeparture(lnksender.CommandArgument);
            if (lbl_pkgtype.InnerText == "Group")
            {
                Response.Redirect("gitpackage-details.aspx?destination=" + pc.Trim() + "&dpCity=" + lbldeparture_City.InnerText.Trim() + "&dpDate=" + lbldeparture_date.InnerText.Trim());
            }
            else
            {
                Response.Redirect("fitpackage-details.aspx?destination=" + pc.Trim());//+ "&dpCity=" + lbldeparture_City.InnerText.Trim() + "&dpDate=" + lbldeparture_date.InnerText.Trim()
            }
            //Response.Redirect("package-details.aspx//" + pc.ToString() + "//" + pn.ToString());
            //Response.Redirect("~/blog/Blogdetails.aspx//" + lbl.Text + "//" + hl);  
            //Response.Redirect("index.aspx?id=" + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
            //Response.Redirect("TourGV.aspx?id=" + lnksender.Text + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
        }
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        if (destination.Text != "")
        {
            ShowAllPkg(destination.Text);
            btnAll.Focus();
        }
        else
        {
            SearchDestination_FronTo();
        }
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
        md.smstozenith_Quickcontact(txt_emailid.Value, txt_YourName.Value, txt_mobileno.Value, txt_emailid.Value, "");// SMS TO COMPANY
        //ml.smstocustomer_Quickcontact(txtEmail.Text, GetMailBody());// SMS TO CUSTOMER
        //Session["Enquiry_Id"] = ml.enqid;
        clearalltext();
        Response.Redirect("thankyou.aspx");
    }
    public void clearalltext()
    {
        txt_YourName.Value = "";
        txt_emailid.Value = "";
        txt_mobileno.Value = "";
        txt_cityname.Value = "";
    }
    public void SearchDestination_FronTo()
    {
         try
         {
            SqlCommand cmd = new SqlCommand("FillAll_Destination_SearchFromTo");//ShowPkg_AdventureDetails_New
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@from", txt_from.Text);
            cmd.Parameters.AddWithValue("@to", txt_to.Text);
            DataSet dss = new DataSet();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dss = dts.RetrieveRecords(dss, cmd);
            if (dss.Tables[0].Rows.Count > 0)
            {
                rpt_adventure.DataSource = dss;
                rpt_adventure.DataBind();
                totalNoOfPkg.InnerText = " " + rpt_adventure.Items.Count.ToString();
                //totalgroup.InnerText = " " + rpt_adventure.Items.Count.ToString();
                //totalcustomized.InnerText = " " + rpt_adventure.Items.Count.ToString();
                lbl_Pkg_Group_type.InnerText = dss.Tables[0].Rows[0]["Pkg_Group_type"].ToString();
                if (lbl_Pkg_Group_type.InnerText == "Domestic")// for domestic
                {
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
                    Response.Redirect("international-holidays.aspx?destination=" +""+ "&dfrom=" + txt_from.Text + "&dto=" + txt_to.Text);
                }
            }
            else
            {
                dss = null;
                rpt_adventure.DataSource = dss;
                rpt_adventure.DataBind();
                totalgroup.InnerText = "";
                totalcustomized.InnerText = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
            }
        }
        catch (Exception ex) { throw ex; }
    }
    protected void linkbtn_search_India_Click(object sender, EventArgs e)
    {
        SearchDestination_FronTo();
    }
}