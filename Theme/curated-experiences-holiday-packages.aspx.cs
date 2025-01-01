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
using Zenithholidays;
public partial class curated_experiences_holiday_packages : System.Web.UI.Page
{
    DbConnect dc = new DbConnect();
    mailbody md = new mailbody();
    string source = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowThemePkg();
        }
    }

    public void ShowThemePkg()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ShowPkg_ThemeWise");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@thm_id", 1016);
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('coming soon..')", true);
                //Response.Redirect(Request.RawUrl);
                //Response.Redirect("../Default.aspx");
            }
        }
        catch (Exception ex) { throw ex; }
    }

    public void ShowPkg_bygroup(string pkg_type)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ShowPkg_ThemeWise");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pkg_type", pkg_type);
            cmd.Parameters.AddWithValue("@thm_id", 1016);
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
                rpt_adventure.DataSource = null;
                rpt_adventure.DataBind();
                totalgroup.InnerText = " ";
                totalcustomized.InnerText = " ";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
            }
        }
        catch (Exception ex) { throw ex; }
    }
    public void showDeparture(string pkgcode, string Destination)//string pkgcode
    {
        dc.dt = null;
        dc.dt = new DataTable();
        dc.dt.Columns.Add("COLUMN", typeof(string));
        dc.dt.Columns.Add("VALUE", typeof(object));
        dc.dt.Rows.Add("@Destination", Destination);
        dc.dt.Rows.Add("@Pkg_code", pkgcode);
        dc.dt.Rows.Add("@p_SubOpMode", 7);
        DataSet m_ddl = new DataSet();
        dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddl);
        if (m_ddl.Tables[0].Rows.Count > 0)
        {
            lbldeparture_City.InnerText = m_ddl.Tables[0].Rows[0]["Boarding_Point"].ToString();
            lbldeparture_date.InnerText = m_ddl.Tables[0].Rows[0]["Departure_Date"].ToString();
            lbl_pkgtype.InnerText = m_ddl.Tables[0].Rows[0]["Pkg_type"].ToString();
        }
    }
    protected void lnkbtnInternationalBook_Click(object sender, EventArgs e)
    {
        LinkButton lnksender = (LinkButton)sender;
        if (lnksender.CommandArgument.ToString() != "")
        {
            string pc = lnksender.CommandArgument;
            showDeparture(lnksender.CommandArgument, lnksender.CommandName);
            if (lbl_pkgtype.InnerText == "Group")
            {
                Response.Redirect("../gitpackage-details.aspx?destination=" + pc.Trim() + "&dpCity=" + lbldeparture_City.InnerText.Trim() + "&dpDate=" + lbldeparture_date.InnerText.Trim());
            }
            else
            {
                Response.Redirect("../fitpackage-details.aspx?destination=" + pc.Trim());//+ "&dpCity=" + lbldeparture_City.InnerText.Trim() + "&dpDate=" + lbldeparture_date.InnerText.Trim()
            }
        }
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        //ShowAllPkg();
        btnAll.Focus();
    }
    protected void btn_group_Click(object sender, EventArgs e)
    {
        ShowPkg_bygroup("Group");
        btn_group.Focus();
        totalgroup.Visible = true;
        totalcustomized.Visible = false;
    }
    protected void btn_saveEnq_Click(object sender, EventArgs e)
    {

        md.savemaildetail(txt_YourName.Value, txt_emailid.Value, txt_mobileno.Value, "", txt_cityname.Value, "", "", "", "", source, "");
        //phello.InnerHtml = "Hello " + txtFastName.Text + ",";
        md.smstozenith_Quickcontact(txt_emailid.Value, txt_YourName.Value, txt_mobileno.Value, txt_emailid.Value, "");// SMS TO COMPANY
        //ml.smstocustomer_Quickcontact(txtEmail.Text, GetMailBody());// SMS TO CUSTOMER
        //Session["Enquiry_Id"] = ml.enqid;
        clearalltext();
        Response.Redirect("../thankyou.aspx");
    }
    public void clearalltext()
    {
        txt_YourName.Value = "";
        txt_emailid.Value = "";
        txt_mobileno.Value = "";
        txt_cityname.Value = "";
    }
    protected void btn_Customizable_Click(object sender, EventArgs e)
    {
        ShowPkg_bygroup("Customized");
        btn_Customizable.Focus();
        totalgroup.Visible = false;
        totalcustomized.Visible = true;
    }
}