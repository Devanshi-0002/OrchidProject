using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Zenithholidays;
using System.Data;
using System.IO;

public partial class Admin_EditPackage : System.Web.UI.Page
{
    private DbConnect m = new DbConnect();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillBordingpoint(ref ddlstartingfrom);
            Filltaxvalue(ref ddltaxvalues);

            fillPkg();
            // CalendarExtender1 = DateTime.Today.ToString("dd/MM/yyyy");
            //CalendarExtender1.Format = "dd/MM/yyyy";
            //CalendarExtender2.Format = "dd/MM/yyyy";
            //GenarateEnqNo();
            //GenarateEnqNo();
        }
    }

    private void fillPkg()
    {
        try
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));

            m.dt.Rows.Add("@p_SubOpMode", 11);
            DataSet dsp = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref dsp);
            if (dsp.Tables[0].Rows.Count > 0)
            {
                ddlselectpkg.DataSource = dsp;
                ddlselectpkg.DataTextField = "Pkg_name";
                ddlselectpkg.DataValueField = "Pkg_id";
                ddlselectpkg.DataBind();
                ddlselectpkg.Items.Insert(0, "--Select--");
            }
        }
        catch (Exception ex) { throw ex; }
    }

    protected void ddlNoofdays_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlNoofdays.SelectedItem.Value != "1")
        {
            int y = 0;
            int x = Convert.ToInt32(ddlNoofdays.SelectedItem.Value);
            List<string> notes = new List<string>();
            for (int a = 1; a <= x; a++)
            {
                notes.Add("" + a);
            }
            rep1.DataSource = notes;
            rep1.DataBind();

            x = x + y;
            foreach (RepeaterItem r in rep1.Items)
            {
                if (y <= x)
                {
                    Label lblday = (Label)r.FindControl("lblday");
                    y++;
                    lblday.Text = y.ToString();
                }
            }
            y--;
        }
    }

    //public void CodeGenarate()
    //{
    //    string m_sMessage = "";
    //    m.dt = null;
    //    m.dt = new DataTable();
    //    m.dt.Columns.Add("COLUMN", typeof(string));
    //    m.dt.Columns.Add("VALUE", typeof(object));
    //    m.dt.Rows.Add("@p_SubOpMode", 1);
    //    m_sMessage = m.pfn_GetData("sp_tbl_Enquiry_details", ref eno);
    //    if (m_sMessage.IndexOf("Error") != 0)
    //    {
    //        if (eno.Tables[0].Rows[0]["enq_no"].ToString() != "")
    //        {
    //            string yr = eno.Tables[0].Rows[0]["eno"].ToString();
    //            string curr_yr = yr.Substring(4, 4);
    //            //int last_eno = Convert.ToInt32(eno.Tables[0].Rows[0]["enq_no"]);
    //            int last_eno = Convert.ToInt32(yr.Substring(8));
    //            if (DateTime.Now.Year.ToString() == curr_yr)
    //            {
    //                enq_nmbr = "ZMMS" + DateTime.Now.Year + (last_eno + 1).ToString();
    //                //enq_nmbr = "ZMMS-18-19-" + DateTime.Now.Year + (last_eno + 1).ToString();
    //            }
    //            else
    //            {
    //                enq_nmbr = "ZMMS" + DateTime.Now.Year + 1;
    //                //enq_nmbr = "ZMMS-18-19-" + DateTime.Now.Year + 1;
    //            }
    //        }
    //        else
    //        {
    //            enq_nmbr = "ZMMS" + DateTime.Now.Year + 1;
    //            //enq_nmbr = "ZMMS-18-19-" + DateTime.Now.Year + 1;
    //        }
    //    }
    //    else
    //    {
    //        throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
    //    }
    //}
    protected void updatePkgMasterNew()
    {
        try
        {
            string m_sMessage = ""; m.dt = null; m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string)); m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@p_SubOpMode", 2);
            m.dt.Rows.Add("@pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@Pkg_name", txtpackagename.Text);
            m.dt.Rows.Add("@Sub_PkgName", txt_SubPackageName.Text);
            m.dt.Rows.Add("@Title", txt_MetaTitle.Text);
            m.dt.Rows.Add("@Meta_description", txt_MetaDescription.Text);
            m.dt.Rows.Add("@Meta_keywords", txt_MetaKeywords.Text);
            m.dt.Rows.Add("@URL_Alias", txt_URLAlias.Text);
            m.dt.Rows.Add("@Pkg_validity_from", txtFromDate.Text);//.ToString("yyyy-MM-dd")
            m.dt.Rows.Add("@Pkg_validity_to", txtDurationToDate.Text);//.ToString("yyyy-MM-dd")
            m.dt.Rows.Add("@Pkg_starting_from", ddlstartingfrom.SelectedItem.Value);
            m.dt.Rows.Add("@Pkg_Taxtype_id", ddltaxvalues.SelectedValue.Trim());
            if (chkbhotel.Checked == true)
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Hotel", 1);
            }
            else
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Hotel", 0);
            }

            if (chkbFlight.Checked == true)
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Flight", 1);
            }
            else
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Flight", 0);
            }

            if (chkbTransfer.Checked == true)
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Transfer", 1);
            }
            else
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Transfer", 0);
            }
            if (chkbRestaurant.Checked == true)
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Restaurant", 1);
            }
            else
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Restaurant", 0);
            }

            if (chkSightseeing.Checked == true)
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Sightseen", 1);
            }
            else
            {
                m.dt.Rows.Add("@Pkg_Inclusion_Sightseen", 0);
            }
            //     m.dt.Rows.Add("@Pkg_type", ddlpackagetype.SelectedItem.Text.Trim());
            //    m.dt.Rows.Add("@Pkg_Group_type", ddlgroup.SelectedItem.Text.Trim());
            //    if (ddlweekend.SelectedItem.Text != "--Select--")
            {
                //       m.dt.Rows.Add("@Zone", ddlweekend.SelectedItem.Text);
            }
            //   else
            {
                //       m.dt.Rows.Add("@Zone", ddlinternational.SelectedItem.Text);
            }

            //    if (ddlDestinationdomestic.SelectedIndex > 0)
            {
                //        m.dt.Rows.Add("@pkg_destination", ddlDestinationdomestic.SelectedValue);
            }
            //     else
            {
                //         m.dt.Rows.Add("@pkg_destination", ddlDestinationInternational.SelectedValue);
            }
            m.dt.Rows.Add("@pkg_city", txtCityIncluded.Text);
            m.dt.Rows.Add("@pkg_duration", ddlNoofdays.SelectedValue.Trim());
            m.dt.Rows.Add("@pkg_overview", txtoverview.Text);
            m.dt.Rows.Add("@pkg_incl_excl", txtinclution.Text);//Inclusion
            m.dt.Rows.Add("@Pkg_exclusion", txt_Exclusion.Text);//Exclusion
            m.dt.Rows.Add("@Payment_Policy", txt_PaymentPolicy.Text);//Payment Policy
            m.dt.Rows.Add("@Cancellation_Policy", txt_CancellationPolicy.Text);//Cancelation Policy
            m.dt.Rows.Add("@pkg_Terms_Condtition", txttandc.Text);//Term & condition
            m.dt.Rows.Add("@Itinerary_Detailed", txt_ItineraryDetailed.Text);//Term & Condition
            m.dt.Rows.Add("@Heighlights", txthighlights.Text);//heighlights

            if (PkgImg1.HasFile)
            {
                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg1.FileName).ToString() + Path.GetExtension(PkgImg1.FileName).ToString();
                string path = "~/Upload_image/" + filepath;
                PkgImg1.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                m.dt.Rows.Add("@Image1", path.Trim());
            }
            else
            {
                m.dt.Rows.Add("@Image1", lbl_PkgImg1_hidden.Text);
            }
            if (PkgImg2.HasFile)
            {
                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg2.FileName).ToString() + Path.GetExtension(PkgImg2.FileName).ToString();
                string path = "~/Upload_image/" + filepath;
                PkgImg2.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                m.dt.Rows.Add("@Image2", path.Trim());
            }
            else
            {
                m.dt.Rows.Add("@Image2", lbl_PkgImg2_hidden.Text);
            }
            if (PkgImg3.HasFile)
            {
                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg3.FileName).ToString() + Path.GetExtension(PkgImg3.FileName).ToString();
                string path = "~/Upload_image/" + filepath;
                PkgImg3.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                m.dt.Rows.Add("@Image3", path.Trim());
            }
            else
            {
                m.dt.Rows.Add("@Image3", lbl_PkgImg3_hidden.Text);
            }
            if (PkgImg4.HasFile)
            {
                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg4.FileName).ToString() + Path.GetExtension(PkgImg4.FileName).ToString();
                string path = "~/Upload_image/" + filepath;
                PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                m.dt.Rows.Add("@Image4", path.Trim());
            }
            else
            {
                m.dt.Rows.Add("@Image4", lbl_PkgImg4_hidden.Text);
            }

            if (PkgImg5.HasFile)
            {
                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg5.FileName).ToString() + Path.GetExtension(PkgImg4.FileName).ToString();
                string path = "~/Upload_image/" + filepath;
                PkgImg5.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                m.dt.Rows.Add("@Image5", path.Trim());
            }
            else
            {
                m.dt.Rows.Add("@Image5", lbl_PkgImg5_hidden.Text);
            }
            m.dt.Rows.Add("@Edited_By", 1);
            string s = string.Empty;
            for (int i = 0; i < CheckBoxList1themetype.Items.Count; i++)
            {
                if (CheckBoxList1themetype.Items[i].Selected == true)
                {
                    s += CheckBoxList1themetype.Items[i].Value + ",";
                }
            }
            m.dt.Rows.Add("@Pkg_theme_id", s.ToString().Trim());
            m_sMessage = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Update);
            if (m_sMessage.IndexOf("Error") != 0)
            {
                //getpkgID();
                try
                {
                    int y = 1;
                    for (int i = 0; i < Convert.ToInt32(ddlNoofdays.SelectedItem.Value); i++)
                    {
                        Label lbl_id = (Label)rep1.Items[i].FindControl("lbl_id");
                        Label lblday = (Label)rep1.Items[i].FindControl("lblday");
                        TextBox txtdate = (TextBox)rep1.Items[i].FindControl("txtdate");
                        TextBox txttime = (TextBox)rep1.Items[i].FindControl("txttime");
                        TextBox txtflightname1 = (TextBox)rep1.Items[i].FindControl("txtflightname1");
                        TextBox txtfrom1 = (TextBox)rep1.Items[i].FindControl("txtfrom1");
                        TextBox txtdepdate1 = (TextBox)rep1.Items[i].FindControl("txtdepdate1");
                        TextBox txtstops1 = (TextBox)rep1.Items[i].FindControl("txtstops1");
                        TextBox txtto1 = (TextBox)rep1.Items[i].FindControl("txtto1");
                        TextBox txtarrival = (TextBox)rep1.Items[i].FindControl("txtarrival");
                        TextBox txtflight2 = (TextBox)rep1.Items[i].FindControl("txtflight2");
                        TextBox txtfrom2 = (TextBox)rep1.Items[i].FindControl("txtfrom2");
                        TextBox txtdepdate2 = (TextBox)rep1.Items[i].FindControl("txtdepdate2");
                        TextBox txtstops2 = (TextBox)rep1.Items[i].FindControl("txtstops2");
                        TextBox txtto2 = (TextBox)rep1.Items[i].FindControl("txtto2");
                        TextBox txtarrival2 = (TextBox)rep1.Items[i].FindControl("txtarrival2");
                        TextBox txttransfer1_1 = (TextBox)rep1.Items[i].FindControl("txttransfer1_1");
                        TextBox txttransfer2_1 = (TextBox)rep1.Items[i].FindControl("txttransfer2_1");
                        TextBox txttransfer3_1 = (TextBox)rep1.Items[i].FindControl("txttransfer3_1");
                        TextBox txttransfer4_1 = (TextBox)rep1.Items[i].FindControl("txttransfer4_1");
                        TextBox txttransfer5_1 = (TextBox)rep1.Items[i].FindControl("txttransfer5_1");
                        FileUpload hotelimg1 = (FileUpload)rep1.Items[i].FindControl("hotelimg1");
                        FileUpload hotelimg1B = (FileUpload)rep1.Items[i].FindControl("hotelimg1B");
                        FileUpload hotelimg1C = (FileUpload)rep1.Items[i].FindControl("hotelimg1C");
                        Label lbl_hotelimg1 = (Label)rep1.Items[i].FindControl("lbl_hotelimg1");
                        Label lbl_hotelimg1_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg1_hidden");
                        Label lbl_hotelimg1B = (Label)rep1.Items[i].FindControl("lbl_hotelimg1B");
                        Label lbl_hotelimg1B_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg1B_hidden");
                        Label lbl_hotelimg1C = (Label)rep1.Items[i].FindControl("lbl_hotelimg1C");
                        Label lbl_hotelimg1C_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg1C_hidden");
                        TextBox txtduration = (TextBox)rep1.Items[i].FindControl("txtduration");
                        TextBox txthotelname = (TextBox)rep1.Items[i].FindControl("txthotelname");
                        TextBox txt_RoomType = (TextBox)rep1.Items[i].FindControl("txt_RoomType");//DropDownList ddlroomtype = (DropDownList)rep1.Items[i].FindControl("ddlroomtype");
                        DropDownList ddlmealtype = (DropDownList)rep1.Items[i].FindControl("ddlmealtype");
                        DropDownList ddlhotelstar = (DropDownList)rep1.Items[i].FindControl("ddlhotelstar");
                        TextBox txtindate = (TextBox)rep1.Items[i].FindControl("txtindate");
                        TextBox txtcheckout = (TextBox)rep1.Items[i].FindControl("txtcheckout");
                        FileUpload hotelimg2 = (FileUpload)rep1.Items[i].FindControl("hotelimg2");
                        FileUpload hotelimg2B = (FileUpload)rep1.Items[i].FindControl("hotelimg2B");
                        FileUpload hotelimg2C = (FileUpload)rep1.Items[i].FindControl("hotelimg2C");
                        Label lbl_hotelimg2 = (Label)rep1.Items[i].FindControl("lbl_hotelimg2");
                        Label lbl_hotelimg2_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg2_hidden");
                        Label lbl_hotelimg2B = (Label)rep1.Items[i].FindControl("lbl_hotelimg2B");
                        Label lbl_hotelimg2B_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg2B_hidden");
                        Label lbl_hotelimg2C = (Label)rep1.Items[i].FindControl("lbl_hotelimg2C");
                        Label lbl_hotelimg2C_hidden = (Label)rep1.Items[i].FindControl("lbl_hotelimg2C_hidden");
                        TextBox txtduration2 = (TextBox)rep1.Items[i].FindControl("txtduration2");
                        TextBox txthotelname2 = (TextBox)rep1.Items[i].FindControl("txthotelname2");
                        TextBox txt_RoomType2 = (TextBox)rep1.Items[i].FindControl("txt_RoomType2");
                        // //DropDownList ddlroomtype2 = (DropDownList)rep1.Items[i].FindControl("ddlroomtype2");
                        DropDownList ddlmealtype2 = (DropDownList)rep1.Items[i].FindControl("ddlmealtype2");
                        DropDownList ddlhotelstar2 = (DropDownList)rep1.Items[i].FindControl("ddlhotelstar2");
                        TextBox txtindate2 = (TextBox)rep1.Items[i].FindControl("txtindate2");
                        TextBox txtcheckout2 = (TextBox)rep1.Items[i].FindControl("txtcheckout2");
                        TextBox txtplacename1 = (TextBox)rep1.Items[i].FindControl("txtplacename1");
                        TextBox txtss1 = (TextBox)rep1.Items[i].FindControl("txtss1");
                        TextBox txttime1 = (TextBox)rep1.Items[i].FindControl("txttime1");
                        TextBox txtplacename2 = (TextBox)rep1.Items[i].FindControl("txtplacename2");
                        TextBox txtss2 = (TextBox)rep1.Items[i].FindControl("txtss2");
                        TextBox txttime2 = (TextBox)rep1.Items[i].FindControl("txttime2");
                        TextBox txtplacename3 = (TextBox)rep1.Items[i].FindControl("txtplacename3");
                        TextBox txtss3 = (TextBox)rep1.Items[i].FindControl("txtss3");
                        TextBox txttime3 = (TextBox)rep1.Items[i].FindControl("txttime3");
                        TextBox txtplacename4 = (TextBox)rep1.Items[i].FindControl("txtplacename4");
                        TextBox txtss4 = (TextBox)rep1.Items[i].FindControl("txtss4");
                        TextBox txttime4 = (TextBox)rep1.Items[i].FindControl("txttime4");
                        TextBox txtplacename5 = (TextBox)rep1.Items[i].FindControl("txtplacename5");
                        TextBox txtss5 = (TextBox)rep1.Items[i].FindControl("txtss5");
                        TextBox txttime5 = (TextBox)rep1.Items[i].FindControl("txttime5");
                        TextBox txtmealtype1 = (TextBox)rep1.Items[i].FindControl("txtmealtype1");
                        TextBox txtmealinclude = (TextBox)rep1.Items[i].FindControl("txtmealinclude1");
                        TextBox txtmealtime = (TextBox)rep1.Items[i].FindControl("txtmealtime1");
                        TextBox txtmealtype2 = (TextBox)rep1.Items[i].FindControl("txtmealtype2");
                        TextBox txtmealinclude2 = (TextBox)rep1.Items[i].FindControl("txtmealinclude2");
                        TextBox txtmealtime2 = (TextBox)rep1.Items[i].FindControl("txtmealtime2");
                        TextBox txtmealtype3 = (TextBox)rep1.Items[i].FindControl("txtmealtype3");
                        TextBox txtmealinclude3 = (TextBox)rep1.Items[i].FindControl("txtmealinclude3");
                        TextBox txtmealtime3 = (TextBox)rep1.Items[i].FindControl("txtmealtime3");

                        if (Convert.ToInt32(ddlNoofdays.SelectedValue) >= y)
                        {
                            m_sMessage = "";
                            m.dt = null;
                            m.dt = new DataTable();
                            m.dt.Columns.Add("COLUMN", typeof(string));
                            m.dt.Columns.Add("VALUE", typeof(object));
                            m.dt.Rows.Add("@p_SubOpMode", 3);
                            m.dt.Rows.Add("@id", lbl_id.Text);
                            m.dt.Rows.Add("@pkg_id", ddlselectpkg.SelectedItem.Value);
                            //  m.dt.Rows.Add("@HUB_StartingFrom", ddlstartingfrom1.SelectedItem.Text);
                            //  m.dt.Rows.Add("@Departure_Date", ddldepDate.SelectedItem.Text);

                            if (txtdate.Text != "")
                            {
                                m.dt.Rows.Add("@pkg_date", Convert.ToDateTime(txtdate.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@pkg_date", null);
                            }
                            m.dt.Rows.Add("@pkg_time", txttime.Text);
                            m.dt.Rows.Add("@day_count", lblday.Text);
                            m.dt.Rows.Add("@Flight_Name1", txtflightname1.Text);
                            m.dt.Rows.Add("@from1", txtfrom1.Text);
                            if (txtdepdate1.Text != "")
                            {
                                m.dt.Rows.Add("@flight_datetime1", Convert.ToDateTime(txtdepdate1.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@flight_datetime1", null);
                            }
                            m.dt.Rows.Add("@stops1", txtstops1.Text);
                            m.dt.Rows.Add("@to1", txtto1.Text);
                            if (txtarrival.Text != "")
                            {
                                m.dt.Rows.Add("@to_datetime1", Convert.ToDateTime(txtarrival.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@to_datetime1", null);
                            }
                            m.dt.Rows.Add("@Flight_Name2", txtflight2.Text);
                            m.dt.Rows.Add("@from2", txtfrom2.Text);
                            if (txtdepdate2.Text != "")
                            {
                                m.dt.Rows.Add("@flight_datetime2", Convert.ToDateTime(txtdepdate2.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@flight_datetime2", null);
                            }
                            m.dt.Rows.Add("@stops2", txtstops2.Text);
                            m.dt.Rows.Add("@to2", txtto2.Text);
                            if (txtarrival2.Text != "")
                            {
                                m.dt.Rows.Add("@to_datetime2", Convert.ToDateTime(txtarrival2.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@to_datetime2", null);
                            }
                            m.dt.Rows.Add("@transfer_name1", txttransfer1_1.Text);
                            m.dt.Rows.Add("@transfer_name2", txttransfer2_1.Text);
                            m.dt.Rows.Add("@transfer_name3", txttransfer3_1.Text);
                            m.dt.Rows.Add("@transfer_name4", txttransfer4_1.Text);
                            m.dt.Rows.Add("@transfer_name5", txttransfer5_1.Text);
                            //m.dt.Rows.Add("@HUB_StartingFrom", ddlstartingfrom.SelectedItem.Text);
                            //if (txt_DepartureDate.Text != "")
                            //{
                            //    m.dt.Rows.Add("@Departure_Date", ddldepDate.SelectedItem.Text);//Convert.ToDateTime(txt_DepartureDate.Text).ToString("dd/MM/yyyy"));
                            //}

                            //  m.dt.Rows.Add("@Departure_Date", Convert.ToDateTime(txt_DepartureDate.Text));

                            if (hotelimg1.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1.FileName).ToString() + Path.GetExtension(hotelimg1.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg1.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel1img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel1img", lbl_hotelimg1_hidden.Text);
                            }
                            if (hotelimg1B.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1B.FileName).ToString() + Path.GetExtension(hotelimg1B.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg1B.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel1B_img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel1B_img", lbl_hotelimg1B_hidden.Text);
                            }
                            if (hotelimg1C.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1C.FileName).ToString() + Path.GetExtension(hotelimg1C.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg1C.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel1C_img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel1C_img", lbl_hotelimg1C_hidden.Text);
                            }
                            // m.dt.Rows.Add("@hotel1img", hotelimg1.Text);
                            m.dt.Rows.Add("@daynight1", txtduration.Text);
                            m.dt.Rows.Add("@hotel_name1", txthotelname.Text);
                            m.dt.Rows.Add("@roomtype1", txt_RoomType.Text);//  ddlroomtype
                            m.dt.Rows.Add("@meal_type1", ddlmealtype.SelectedItem.Text);
                            m.dt.Rows.Add("@rating1", ddlhotelstar.SelectedItem.Text);
                            if (txtindate.Text != "")
                            {
                                m.dt.Rows.Add("@indate1", Convert.ToDateTime(txtindate.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@indate1", null);
                            }
                            if (txtindate.Text != "")
                            {
                                m.dt.Rows.Add("@outdate1", Convert.ToDateTime(txtcheckout.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@outdate1", null);
                            }
                            if (hotelimg2.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2.FileName).ToString() + Path.GetExtension(hotelimg2.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg2.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel2img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel2img", lbl_hotelimg2_hidden.Text);
                            }
                            if (hotelimg2B.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2B.FileName).ToString() + Path.GetExtension(hotelimg2B.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg2B.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel2B_img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel2B_img", lbl_hotelimg2B_hidden.Text);
                            }
                            if (hotelimg2C.HasFile)
                            {
                                string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2C.FileName).ToString() + Path.GetExtension(hotelimg2C.FileName).ToString();
                                string path = "~/Upload_image/" + filepath;
                                hotelimg2C.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                                m.dt.Rows.Add("@hotel2C_img", path.Trim());
                            }
                            else
                            {
                                m.dt.Rows.Add("@hotel2C_img", lbl_hotelimg2C_hidden.Text);
                            }
                            //m.dt.Rows.Add("@hotel2img", hotelimg2.Text);
                            m.dt.Rows.Add("@daynight2", txtduration2.Text);
                            m.dt.Rows.Add("@hotel_name2", txthotelname2.Text);
                            m.dt.Rows.Add("@roomtype2", txt_RoomType2.Text);//txt_RoomType2  ddlroomtype2
                            m.dt.Rows.Add("@meal_type2", ddlmealtype2.Text);
                            m.dt.Rows.Add("@rating2", ddlhotelstar2.Text);
                            if (txtindate2.Text != "")
                            {
                                m.dt.Rows.Add("@indate2", Convert.ToDateTime(txtindate2.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@indate2", null);
                            }
                            if (txtcheckout2.Text != "")
                            {
                                m.dt.Rows.Add("@outdate2", Convert.ToDateTime(txtcheckout2.Text));
                            }
                            else
                            {
                                m.dt.Rows.Add("@outdate2", null);
                            }
                            m.dt.Rows.Add("@ss1place", txtplacename1.Text);
                            m.dt.Rows.Add("@ss1name", txtss1.Text);
                            m.dt.Rows.Add("@ss1time", txttime1.Text);
                            m.dt.Rows.Add("@ss2place", txtplacename2.Text);
                            m.dt.Rows.Add("@ss2name", txtss2.Text);
                            m.dt.Rows.Add("@ss2time", txttime2.Text);
                            m.dt.Rows.Add("@ss3place", txtplacename3.Text);
                            m.dt.Rows.Add("@ss3name", txtss3.Text);
                            m.dt.Rows.Add("@ss3time", txttime3.Text);
                            m.dt.Rows.Add("@ss4place", txtplacename4.Text);
                            m.dt.Rows.Add("@ss4name", txtss4.Text);
                            m.dt.Rows.Add("@ss4time", txttime4.Text);
                            m.dt.Rows.Add("@ss5place", txtplacename5.Text);
                            m.dt.Rows.Add("@ss5name", txtss5.Text);
                            m.dt.Rows.Add("@ss5time", txttime5.Text);
                            m.dt.Rows.Add("@mealname1", txtmealtype1.Text);
                            m.dt.Rows.Add("@mealtype1", txtmealinclude.Text);
                            m.dt.Rows.Add("@meal_time1", txtmealtime.Text);
                            m.dt.Rows.Add("@mealname2", txtmealtype2.Text);
                            m.dt.Rows.Add("@mealtype2", txtmealinclude2.Text);
                            m.dt.Rows.Add("@meal_time2", txtmealtime2.Text);
                            m.dt.Rows.Add("@mealname3", txtmealtype3.Text);
                            m.dt.Rows.Add("@mealtype3", txtmealinclude3.Text);
                            m.dt.Rows.Add("@meal_time3", txtmealtime3.Text);

                            m.dt.Rows.Add("@Edited_By", 1);
                            m_sMessage = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Update);
                            if (m_sMessage.IndexOf("Error") != 0)
                            {
                                y++;
                            }
                            else
                            {
                                throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
                            }
                        }
                    }
                    //------------Insert theam code
                    //lblpakgid.Text = dt.Rows[0]["Pkg_id"].ToString();
                    string m_sMessageth = "";

                    m.dt = null;
                    m.dt = new DataTable();
                    m.dt.Columns.Add("COLUMN", typeof(string));
                    m.dt.Columns.Add("VALUE", typeof(object));
                    m.dt.Rows.Add("@p_SubOpMode", 3);
                    m.dt.Rows.Add("@PkgCodeThm", txtpackagecode.Text);
                    m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
                    // m.dt.Rows.Add("@ThemeId", thmid);
                    m_sMessageth = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Delete);
                    if (m_sMessageth.IndexOf("Error") != 0)
                    {
                    }
                    else
                    {
                        throw new Exception(m_sMessageth.Substring(5, m_sMessage.Length - 5));
                    }

                    m_sMessageth = "";
                    string thmid = string.Empty;
                    int j = 0;
                    for (int i = 0; i < CheckBoxList1themetype.Items.Count; i++)
                    {
                        if (CheckBoxList1themetype.Items[i].Selected == true)
                        {
                            thmid = CheckBoxList1themetype.Items[i].Value;
                            m_sMessageth = "";
                            m.dt = null;
                            m.dt = new DataTable();
                            m.dt.Columns.Add("COLUMN", typeof(string));
                            m.dt.Columns.Add("VALUE", typeof(object));
                            m.dt.Rows.Add("@p_SubOpMode", 3);
                            m.dt.Rows.Add("@PkgCodeThm", txtpackagecode.Text);
                            //m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
                            m.dt.Rows.Add("@ThemeId", thmid);
                            m_sMessageth = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Insert);
                            if (m_sMessageth.IndexOf("Error") != 0)
                            {
                                j++;
                            }
                            else
                            {
                                throw new Exception(m_sMessageth.Substring(5, m_sMessage.Length - 5));
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Add Successfully.');", true);
                //txtpackagename.Text = txtpackagecode.Text = txt_SubPackageName.Text = "";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void getpkgID()
    {
        try
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@Pkg_code", Session["pkg_nmbr"].ToString());
            m.dt.Rows.Add("@p_SubOpMode", 4);
            DataSet dsp = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref dsp);
            if (dsp.Tables[0].Rows.Count > 0)
            {
                Session["pkg_id"] = dsp.Tables[0].Rows[0]["Pkg_id"].ToString();
                //lbl_packagenameCkeck.InnerText = dsp.Tables[0].Rows[0]["Pkg_name"].ToString();
            }
            else
            {
                Session["pkg_id"] = "";
            }
        }
        catch (Exception ex) { throw ex; }
    }

    public void insertItinery()
    {
        try
        {
            string m_sMessage = "";
            int y = 1;
            foreach (RepeaterItem r in rep1.Items)
            {
                Label lblday = (Label)r.FindControl("lblday");
                TextBox txtdate = (TextBox)r.FindControl("txtdate");
                TextBox txttime = (TextBox)r.FindControl("txttime");
                TextBox txtflightname1 = (TextBox)r.FindControl("txtflightname1");
                TextBox txtfrom1 = (TextBox)r.FindControl("txtfrom1");
                TextBox txtdepdate1 = (TextBox)r.FindControl("txtdepdate1");
                TextBox txtstops1 = (TextBox)r.FindControl("txtstops1");
                TextBox txtto1 = (TextBox)r.FindControl("txtto1");
                TextBox txtarrival = (TextBox)r.FindControl("txtarrival");
                TextBox txtflight2 = (TextBox)r.FindControl("txtflight2");
                TextBox txtfrom2 = (TextBox)r.FindControl("txtfrom2");
                TextBox txtdepdate2 = (TextBox)r.FindControl("txtdepdate2");
                TextBox txtstops2 = (TextBox)r.FindControl("txtstops2");
                TextBox txtto2 = (TextBox)r.FindControl("txtto2");
                TextBox txtarrival2 = (TextBox)r.FindControl("txtarrival2");
                TextBox txttransfer1_1 = (TextBox)r.FindControl("txttransfer1_1");
                TextBox txttransfer2_1 = (TextBox)r.FindControl("txttransfer2_1");
                TextBox txttransfer3_1 = (TextBox)r.FindControl("txttransfer3_1");
                TextBox txttransfer4_1 = (TextBox)r.FindControl("txttransfer4_1");
                TextBox txttransfer5_1 = (TextBox)r.FindControl("txttransfer5_1");
                FileUpload hotelimg1 = (FileUpload)r.FindControl("hotelimg1");
                FileUpload hotelimg1B = (FileUpload)r.FindControl("hotelimg1B");
                FileUpload hotelimg1C = (FileUpload)r.FindControl("hotelimg1C");
                TextBox txtduration = (TextBox)r.FindControl("txtduration");
                TextBox txthotelname = (TextBox)r.FindControl("txthotelname");
                TextBox txt_RoomType = (TextBox)r.FindControl("txt_RoomType");
                //DropDownList ddlroomtype = (DropDownList)r.FindControl("ddlroomtype");
                DropDownList ddlmealtype = (DropDownList)r.FindControl("ddlmealtype");
                DropDownList ddlhotelstar = (DropDownList)r.FindControl("ddlhotelstar");
                TextBox txtindate = (TextBox)r.FindControl("txtindate");
                TextBox txtcheckout = (TextBox)r.FindControl("txtcheckout");
                FileUpload hotelimg2 = (FileUpload)r.FindControl("hotelimg2");
                FileUpload hotelimg2B = (FileUpload)r.FindControl("hotelimg2");
                FileUpload hotelimg2C = (FileUpload)r.FindControl("hotelimg2");
                TextBox txtduration2 = (TextBox)r.FindControl("txtduration2");
                TextBox txthotelname2 = (TextBox)r.FindControl("txthotelname2");
                TextBox txt_RoomType2 = (TextBox)r.FindControl("txt_RoomType2");
                //DropDownList ddlroomtype2 = (DropDownList)r.FindControl("ddlroomtype2");
                DropDownList ddlmealtype2 = (DropDownList)r.FindControl("ddlmealtype2");
                DropDownList ddlhotelstar2 = (DropDownList)r.FindControl("ddlhotelstar2");
                TextBox txtindate2 = (TextBox)r.FindControl("txtindate2");
                TextBox txtcheckout2 = (TextBox)r.FindControl("txtcheckout2");
                TextBox txtplacename1 = (TextBox)r.FindControl("txtplacename1");
                TextBox txtss1 = (TextBox)r.FindControl("txtss1");
                TextBox txttime1 = (TextBox)r.FindControl("txttime1");
                TextBox txtplacename2 = (TextBox)r.FindControl("txtplacename2");
                TextBox txtss2 = (TextBox)r.FindControl("txtss2");
                TextBox txttime2 = (TextBox)r.FindControl("txttime2");
                TextBox txtplacename3 = (TextBox)r.FindControl("txtplacename3");
                TextBox txtss3 = (TextBox)r.FindControl("txtss3");
                TextBox txttime3 = (TextBox)r.FindControl("txttime3");
                TextBox txtplacename4 = (TextBox)r.FindControl("txtplacename4");
                TextBox txtss4 = (TextBox)r.FindControl("txtss4");
                TextBox txttime4 = (TextBox)r.FindControl("txttime4");
                TextBox txtplacename5 = (TextBox)r.FindControl("txtplacename5");
                TextBox txtss5 = (TextBox)r.FindControl("txtss5");
                TextBox txttime5 = (TextBox)r.FindControl("txttime5");
                TextBox txtmealtype1 = (TextBox)r.FindControl("txtmealtype1");
                TextBox txtmealinclude = (TextBox)r.FindControl("txtmealinclude1");
                TextBox txtmealtime = (TextBox)r.FindControl("txtmealtime1");
                TextBox txtmealtype2 = (TextBox)r.FindControl("txtmealtype2");
                TextBox txtmealinclude2 = (TextBox)r.FindControl("txtmealinclude2");
                TextBox txtmealtime2 = (TextBox)r.FindControl("txtmealtime2");
                TextBox txtmealtype3 = (TextBox)r.FindControl("txtmealtype3");
                TextBox txtmealinclude3 = (TextBox)r.FindControl("txtmealinclude3");
                TextBox txtmealtime3 = (TextBox)r.FindControl("txtmealtime3");
                //TextBox txtdate = (TextBox)r.FindControl("txtdate");
                if (Convert.ToInt32(ddlNoofdays.SelectedValue) >= y)
                {
                    m_sMessage = "";
                    m.dt = null;
                    m.dt = new DataTable();
                    m.dt.Columns.Add("COLUMN", typeof(string));
                    m.dt.Columns.Add("VALUE", typeof(object));
                    m.dt.Rows.Add("@p_SubOpMode", 2);
                    m.dt.Rows.Add("@Pkg_code", txtpackagecode.Text);
                    if (txtdate.Text != "")
                    {
                        m.dt.Rows.Add("@pkg_date", Convert.ToDateTime(txtdate.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@pkg_date", null);
                    }
                    //m.dt.Rows.Add("@pkg_date", txtdate.Text);
                    m.dt.Rows.Add("@pkg_time", txttime.Text);
                    m.dt.Rows.Add("@day_count", lblday.Text);
                    m.dt.Rows.Add("@Flight_Name1", txtflightname1.Text);
                    m.dt.Rows.Add("@from1", txtfrom1.Text);
                    if (txtdepdate1.Text != "")
                    {
                        m.dt.Rows.Add("@flight_datetime1", Convert.ToDateTime(txtdepdate1.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@flight_datetime1", null);
                    }
                    //m.dt.Rows.Add("@flight_datetime1", txtdepdate1.Text);
                    m.dt.Rows.Add("@stops1", txtstops1.Text);
                    m.dt.Rows.Add("@to1", txtto1.Text);
                    if (txtarrival.Text != "")
                    {
                        m.dt.Rows.Add("@to_datetime1", txtarrival.Text);
                    }
                    else
                    {
                        m.dt.Rows.Add("@to_datetime1", null);
                    }

                    m.dt.Rows.Add("@Flight_Name2", txtflight2.Text);
                    m.dt.Rows.Add("@from2", txtfrom2.Text);
                    if (txtdepdate2.Text != "")
                    {
                        m.dt.Rows.Add("@flight_datetime2", Convert.ToDateTime(txtdepdate2.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@flight_datetime2", null);
                    }
                    //m.dt.Rows.Add("@flight_datetime2", txtdepdate2.Text);
                    m.dt.Rows.Add("@stops2", txtstops2.Text);
                    m.dt.Rows.Add("@to2", txtto2.Text);
                    if (txtarrival2.Text != "")
                    {
                        m.dt.Rows.Add("@to_datetime2", txtarrival2.Text);
                    }
                    else
                    {
                        m.dt.Rows.Add("@to_datetime2", null);
                    }
                    m.dt.Rows.Add("@transfer_name1", txttransfer1_1.Text);
                    m.dt.Rows.Add("@transfer_name2", txttransfer2_1.Text);
                    m.dt.Rows.Add("@transfer_name3", txttransfer3_1.Text);
                    m.dt.Rows.Add("@transfer_name4", txttransfer4_1.Text);
                    m.dt.Rows.Add("@transfer_name5", txttransfer5_1.Text);
                    if (hotelimg1.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1.FileName).ToString() + Path.GetExtension(hotelimg1.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel1img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel1img", "");
                    }
                    if (hotelimg1B.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1B.FileName).ToString() + Path.GetExtension(hotelimg1B.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel1B_img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel1B_img", "");
                    }
                    if (hotelimg1C.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg1C.FileName).ToString() + Path.GetExtension(hotelimg1C.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel1C_img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel1C_img", "");
                    }
                    // m.dt.Rows.Add("@hotel1img", hotelimg1.Text);
                    m.dt.Rows.Add("@daynight1", txtduration.Text);
                    m.dt.Rows.Add("@hotel_name1", txthotelname.Text);
                    m.dt.Rows.Add("@roomtype1", txt_RoomType.Text);//  ddlroomtype
                    m.dt.Rows.Add("@meal_type1", ddlmealtype.SelectedItem.Text);
                    m.dt.Rows.Add("@rating1", ddlhotelstar.SelectedItem.Text);
                    if (txtindate.Text != "")
                    {
                        m.dt.Rows.Add("@indate1", Convert.ToDateTime(txtindate.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@indate1", null);
                    }
                    //m.dt.Rows.Add("@indate1", txtindate.Text);
                    //m.dt.Rows.Add("@outdate1", txtcheckout.Text);
                    if (txtcheckout.Text != "")
                    {
                        m.dt.Rows.Add("@outdate1", Convert.ToDateTime(txtcheckout.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@outdate1", null);
                    }
                    if (hotelimg2.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2.FileName).ToString() + Path.GetExtension(hotelimg2.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel2img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel2img", "");
                    }
                    if (hotelimg2B.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2B.FileName).ToString() + Path.GetExtension(hotelimg2B.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel2B_img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel2B_img", "");
                    }
                    if (hotelimg2C.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + hotelimg2C.FileName).ToString() + Path.GetExtension(hotelimg2C.FileName).ToString();
                        string path = "~/Upload_image/" + filepath;
                        PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                        m.dt.Rows.Add("@hotel2C_img", path.Trim());
                    }
                    else
                    {
                        m.dt.Rows.Add("@hotel2C_img", "");
                    }
                    //m.dt.Rows.Add("@hotel2img", hotelimg2.Text);
                    m.dt.Rows.Add("@daynight2", txtduration2.Text);
                    m.dt.Rows.Add("@hotel_name2", txthotelname2.Text);
                    m.dt.Rows.Add("@roomtype2", txt_RoomType2.Text);//txt_RoomType2  ddlroomtype2
                    m.dt.Rows.Add("@meal_type2", ddlmealtype2.Text);
                    m.dt.Rows.Add("@rating2", ddlhotelstar2.Text);
                    if (txtindate2.Text != "")
                    {
                        m.dt.Rows.Add("@indate2", Convert.ToDateTime(txtindate2.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@indate2", null);
                    }
                    //m.dt.Rows.Add("@indate2", txtindate2.Text);
                    if (txtcheckout2.Text != "")
                    {
                        m.dt.Rows.Add("@outdate2", Convert.ToDateTime(txtcheckout2.Text));
                    }
                    else
                    {
                        m.dt.Rows.Add("@outdate2", null);
                    }
                    //m.dt.Rows.Add("@outdate2", txtcheckout2.Text);
                    m.dt.Rows.Add("@ss1place", txtplacename1.Text);
                    m.dt.Rows.Add("@ss1name", txtss1.Text);
                    m.dt.Rows.Add("@ss1time", txttime1.Text);
                    m.dt.Rows.Add("@ss2place", txtplacename2.Text);
                    m.dt.Rows.Add("@ss2name", txtss2.Text);
                    m.dt.Rows.Add("@ss2time", txttime2.Text);
                    m.dt.Rows.Add("@ss3place", txtplacename3.Text);
                    m.dt.Rows.Add("@ss3name", txtss3.Text);
                    m.dt.Rows.Add("@ss3time", txttime3.Text);
                    m.dt.Rows.Add("@ss4place", txtplacename4.Text);
                    m.dt.Rows.Add("@ss4name", txtss4.Text);
                    m.dt.Rows.Add("@ss4time", txttime4.Text);
                    m.dt.Rows.Add("@ss5place", txtplacename5.Text);
                    m.dt.Rows.Add("@ss5name", txtss5.Text);
                    m.dt.Rows.Add("@ss5time", txttime5.Text);
                    m.dt.Rows.Add("@mealname1", txtmealtype1.Text);
                    m.dt.Rows.Add("@mealtype1", txtmealinclude.Text);
                    m.dt.Rows.Add("@meal_time1", txtmealtime.Text);
                    m.dt.Rows.Add("@mealname2", txtmealtype2.Text);
                    m.dt.Rows.Add("@mealtype2", txtmealinclude2.Text);
                    m.dt.Rows.Add("@meal_time2", txtmealtime2.Text);
                    m.dt.Rows.Add("@mealname3", txtmealtype3.Text);
                    m.dt.Rows.Add("@mealtype3", txtmealinclude3.Text);
                    m.dt.Rows.Add("@meal_time3", txtmealtime3.Text);
                    m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
                    m.dt.Rows.Add("@HUB_StartingFrom", ddlstartingfrom.SelectedItem.Text);
                    m.dt.Rows.Add("@Departure_Date", txt_DepartureDate.Text);
                    m.dt.Rows.Add("@Created_By", 1);
                    m_sMessage = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Insert);
                    if (m_sMessage.IndexOf("Error") != 0)
                    {
                        y++;
                    }
                    else
                    {
                        throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
                    }
                }
            }
            //------------Insert theam code
            //lblpakgid.Text = dt.Rows[0]["Pkg_id"].ToString();
            string m_sMessageth = "";
            string thmid = string.Empty;
            int j = 0;
            for (int i = 0; i < CheckBoxList1themetype.Items.Count; i++)
            {
                if (CheckBoxList1themetype.Items[i].Selected == true)
                {
                    thmid = CheckBoxList1themetype.Items[i].Value;
                    m_sMessageth = "";
                    m.dt = null;
                    m.dt = new DataTable();
                    m.dt.Columns.Add("COLUMN", typeof(string));
                    m.dt.Columns.Add("VALUE", typeof(object));
                    m.dt.Rows.Add("@p_SubOpMode", 3);
                    m.dt.Rows.Add("@PkgCodeThm", txtpackagecode.Text);
                    m.dt.Rows.Add("@ThemeId", thmid);
                    m_sMessageth = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Insert);
                    if (m_sMessageth.IndexOf("Error") != 0)
                    {
                        j++;
                    }
                    else
                    {
                        throw new Exception(m_sMessageth.Substring(5, m_sMessage.Length - 5));
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Add Successfully.');", true);
    }

    public void FillBordingpoint(ref DropDownList ddlbordingpt)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillBordingpoint");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            ddlbordingpt.DataSource = ds;
            ddlstartingfrom.DataTextField = "Boarding_place";
            ddlstartingfrom.DataValueField = "Boarding_id";
            ddlstartingfrom.DataBind();
            ddlstartingfrom.Items.Insert(0, "--Select--");

            ddlstartingfrom1.DataSource = ds;
            ddlstartingfrom1.DataTextField = "Boarding_place";
            ddlstartingfrom1.DataValueField = "Boarding_id";
            ddlstartingfrom1.DataBind();
            ddlstartingfrom1.Items.Insert(0, "--Select--");
        }
        catch (Exception ex) { throw ex; }
    }

    public void Filltaxvalue(ref DropDownList ddltax)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillTax");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            ddltax.DataSource = ds;
            ddltax.DataTextField = "Taxvalue";
            ddltax.DataValueField = "Taxid";
            ddltax.DataBind();
            //ddltax.Items.Insert(0, "--Select--");
        }
        catch (Exception ex) { throw ex; }
    }

    protected void ddlpackagetype_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlgroup.Visible = true;
        //if (ddlpackagetype.SelectedItem.Text == "Group")
        //{
        //    ddlgroup.Visible = true;
        //    //ddlcustomized.Visible = false;
        //    ddlweekend.Visible = false;
        //    ddlDestinationdomestic.SelectedIndex = -1;
        //    ddlDestinationInternational.SelectedIndex = -1;
        //    //ddlcustomized.SelectedIndex = -1;

        //}
        //else if (ddlpackagetype.SelectedItem.Text == "Customized")
        //{
        //    //ddlcustomized.Visible = true;
        //    ddlgroup.Visible = true;
        //    ddlweekend.Visible = false;
        //    ddlDestinationdomestic.SelectedIndex = -1;
        //    ddlDestinationInternational.SelectedIndex = -1;
        //    ddlgroup.SelectedIndex = -1;
        //}
        //else
        //{
        //    ddlpackagetype.SelectedIndex = -1;
        //    ddlweekend.SelectedIndex = -1;
        //    //ddlcustomized.SelectedIndex = -1;
        //}
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlgroup.SelectedItem.Text == "Domestic")
        //{
        //    ddlweekend.Visible = true;
        //    ddlinternational.Visible = false;
        //    ddlDestinationdomestic.SelectedIndex = -1;
        //    ddlDestinationInternational.SelectedIndex = -1;
        //    ddlinternational.SelectedIndex = -1;

        //}
        //else if (ddlgroup.SelectedItem.Text == "International")
        //{
        //    ddlweekend.Visible = false;
        //    ddlinternational.Visible = true;
        //    //ddlgroup.SelectedIndex = -1;
        //    ddlDestinationdomestic.SelectedIndex = -1;
        //    ddlDestinationInternational.SelectedIndex = -1;
        //}
        //else
        //{
        //    ddlgroup.SelectedIndex = -1;
        //}
    }

    protected void ddlweekend_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    ddlDestinationdomestic.Visible = true;
        //    ddlDestinationInternational.Visible = false;
        //    ddlDestinationInternational.SelectedIndex = -1;
        //    //txtdomesticCityIncluded.Visible = true;
        //    //txtinternationalCityIncluded.Visible = false;
        //    SqlCommand cmd = new SqlCommand("FillDomestic_Destination_Admin");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@Domestic_Regional", ddlweekend.SelectedItem.Text.Trim());
        //    DataTable dsd = new DataTable();
        //    Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
        //    dsd = dt.RetrieveRecordsdt(dsd, cmd);
        //    ddlDestinationdomestic.DataSource = dsd;
        //    ddlDestinationdomestic.DataTextField = "Domestic_Name";
        //    ddlDestinationdomestic.DataValueField = "Domestic_Id";
        //    ddlDestinationdomestic.DataBind();
        //    ddlDestinationdomestic.Items.Insert(0, "--Select--");
        //}
        //catch (Exception ex) { throw ex; }
    }

    protected void ddlinternational_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    ddlDestinationdomestic.Visible = false;
        //    ddlDestinationInternational.Visible = true;
        //    //txtinternationalCityIncluded.Visible = true;
        //    ddlDestinationdomestic.SelectedIndex = -1;
        //    //txtdomesticCityIncluded.Visible = false;

        //    SqlCommand cmd = new SqlCommand("FillInternational_Destination_Admin");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@International_Regional", ddlinternational.SelectedItem.Text.Trim());
        //    DataTable dsi = new DataTable();
        //    Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
        //    dsi = dt.RetrieveRecordsdt(dsi, cmd);
        //    ddlDestinationInternational.DataSource = dsi;
        //    ddlDestinationInternational.DataTextField = "International_Name";
        //    ddlDestinationInternational.DataValueField = "International_Id";
        //    ddlDestinationInternational.DataBind();
        //    ddlDestinationInternational.Items.Insert(0, "--Select--");
        //}
        //catch (Exception ex) { throw ex; }
    }

    protected void txtpackagename_TextChanged(object sender, EventArgs e)
    {
        try
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@Pkg_name", txtpackagename.Text.TrimStart());
            m.dt.Rows.Add("@p_SubOpMode", 5);
            DataSet dsp = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref dsp);
            if (dsp.Tables[0].Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Package Name Already Exists..!');", true);
                txtpackagename.Focus();
                txtpackagename.Text = "";
                //lbl_packagenameCkeck.InnerText = dsp.Tables[0].Rows[0]["Pkg_name"].ToString();
            }
        }
        catch (Exception ex) { throw ex; }
    }

    public static string GetCurrentFinancialYear()
    {
        int CurrentYear = DateTime.Today.Year;
        int PreviousYear = DateTime.Today.Year - 1;
        int NextYear = DateTime.Today.Year + 1;
        string PreYear = PreviousYear.ToString();
        string NexYear = NextYear.ToString().Substring(2);
        string CurYear = CurrentYear.ToString();
        string cy_short = CurYear.ToString().Substring(2);
        string FinYear = null;

        if (DateTime.Today.Month > 3) { FinYear = CurYear + "/" + NexYear; }
        else { FinYear = PreYear + "/" + cy_short; }
        return FinYear.Trim();
    }

    public string GenarateEnqNo()
    {
        string pkg_nmbr = "";
        try
        {
            string fiscalyr = GetCurrentFinancialYear();
            //string m_sMessage = "";
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@Pkg_Code", txtpackagecode.Text.TrimStart());
            m.dt.Rows.Add("@p_SubOpMode", 7);
            DataSet ds = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int pkgcode = Convert.ToInt32(ds.Tables[0].Rows[0]["Pkg_Code"].ToString());
                //int SLNO = Convert.ToInt32(pkgcode.su(0, 4));
                pkg_nmbr = (pkgcode + 1).ToString();
            }
            else
            {
                pkg_nmbr = "1001".ToString();
            }
        }
        catch (Exception ex) { throw ex; }
        Session["pkg_nmbr"] = pkg_nmbr;
        return pkg_nmbr;
    }

    protected void ddlselectpkg_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    public void Package_Duration(DropDownList Noofdays)
    {
        try
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@Pkg_code", txtpackagecode.Text);
            m.dt.Rows.Add("@HUB_StartingFrom", ddlstartingfrom1.SelectedItem.Text);
            m.dt.Rows.Add("@Departure_Date", ddldepDate.SelectedItem.Text);
            m.dt.Rows.Add("@p_SubOpMode", 16);
            DataSet ds = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //rep1.DataSource = ds;
                //rep1.DataBind();
                if (Noofdays.SelectedItem.Value != "1")
                {
                    int y = 0;
                    int x = Convert.ToInt32(Noofdays.SelectedItem.Value);
                    List<string> notes = new List<string>();
                    for (int a = 1; a <= x; a++)
                    {
                        notes.Add("" + a);
                    }
                    rep1.DataSource = notes;
                    rep1.DataBind();

                    x = x + y;
                    foreach (RepeaterItem r in rep1.Items)
                    {
                        if (y <= x)
                        {
                            Label lblday = (Label)r.FindControl("lblday");
                            y++;
                            lblday.Text = y.ToString();
                        }
                    }
                    y--;

                    /**********************************************************************/

                    //Label lblday = (Label)r.FindControl("lblday");
                    for (int t = 0; t < x; t++)
                    //  foreach (RepeaterItem r in rep1.Items)
                    {
                        Label lbl_id = (Label)rep1.Items[t].FindControl("lbl_id");
                        TextBox txtdate = (TextBox)rep1.Items[t].FindControl("txtdate");
                        TextBox txttime = (TextBox)rep1.Items[t].FindControl("txttime");
                        TextBox txtflightname1 = (TextBox)rep1.Items[t].FindControl("txtflightname1");
                        TextBox txtfrom1 = (TextBox)rep1.Items[t].FindControl("txtfrom1");
                        TextBox txtdepdate1 = (TextBox)rep1.Items[t].FindControl("txtdepdate1");
                        TextBox txtstops1 = (TextBox)rep1.Items[t].FindControl("txtstops1");
                        TextBox txtto1 = (TextBox)rep1.Items[t].FindControl("txtto1");
                        TextBox txtarrival = (TextBox)rep1.Items[t].FindControl("txtarrival");
                        TextBox txtflight2 = (TextBox)rep1.Items[t].FindControl("txtflight2");
                        TextBox txtfrom2 = (TextBox)rep1.Items[t].FindControl("txtfrom2");
                        TextBox txtdepdate2 = (TextBox)rep1.Items[t].FindControl("txtdepdate2");
                        TextBox txtstops2 = (TextBox)rep1.Items[t].FindControl("txtstops2");
                        TextBox txtto2 = (TextBox)rep1.Items[t].FindControl("txtto2");
                        TextBox txtarrival2 = (TextBox)rep1.Items[t].FindControl("txtarrival2");
                        TextBox txttransfer1_1 = (TextBox)rep1.Items[t].FindControl("txttransfer1_1");
                        TextBox txttransfer2_1 = (TextBox)rep1.Items[t].FindControl("txttransfer2_1");
                        TextBox txttransfer3_1 = (TextBox)rep1.Items[t].FindControl("txttransfer3_1");
                        TextBox txttransfer4_1 = (TextBox)rep1.Items[t].FindControl("txttransfer4_1");
                        TextBox txttransfer5_1 = (TextBox)rep1.Items[t].FindControl("txttransfer5_1");
                        FileUpload hotelimg1 = (FileUpload)rep1.Items[t].FindControl("hotelimg1");
                        FileUpload hotelimg1B = (FileUpload)rep1.Items[t].FindControl("hotelimg1B");
                        FileUpload hotelimg1C = (FileUpload)rep1.Items[t].FindControl("hotelimg1C");

                        Label lbl_hotelimg1 = (Label)rep1.Items[t].FindControl("lbl_hotelimg1");
                        Label lbl_hotelimg1_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg1_hidden");
                        Label lbl_hotelimg1B = (Label)rep1.Items[t].FindControl("lbl_hotelimg1B");
                        Label lbl_hotelimg1B_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg1B_hidden");
                        Label lbl_hotelimg1C = (Label)rep1.Items[t].FindControl("lbl_hotelimg1C");
                        Label lbl_hotelimg1C_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg1C_hidden");

                        TextBox txtduration = (TextBox)rep1.Items[t].FindControl("txtduration");
                        TextBox txthotelname = (TextBox)rep1.Items[t].FindControl("txthotelname");
                        TextBox txt_RoomType = (TextBox)rep1.Items[t].FindControl("txt_RoomType");//DropDownList ddlroomtype = (DropDownList)rep1.Items[t].FindControl("ddlroomtype");
                        DropDownList ddlmealtype = (DropDownList)rep1.Items[t].FindControl("ddlmealtype");
                        DropDownList ddlhotelstar = (DropDownList)rep1.Items[t].FindControl("ddlhotelstar");
                        TextBox txtindate = (TextBox)rep1.Items[t].FindControl("txtindate");
                        TextBox txtcheckout = (TextBox)rep1.Items[t].FindControl("txtcheckout");
                        FileUpload hotelimg2 = (FileUpload)rep1.Items[t].FindControl("hotelimg2");
                        FileUpload hotelimg2B = (FileUpload)rep1.Items[t].FindControl("hotelimg2B");
                        FileUpload hotelimg2C = (FileUpload)rep1.Items[t].FindControl("hotelimg2C");
                        Label lbl_hotelimg2 = (Label)rep1.Items[t].FindControl("lbl_hotelimg2");
                        Label lbl_hotelimg2_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg2_hidden");
                        Label lbl_hotelimg2B = (Label)rep1.Items[t].FindControl("lbl_hotelimg2B");
                        Label lbl_hotelimg2B_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg2B_hidden");
                        Label lbl_hotelimg2C = (Label)rep1.Items[t].FindControl("lbl_hotelimg2C");
                        Label lbl_hotelimg2C_hidden = (Label)rep1.Items[t].FindControl("lbl_hotelimg2C_hidden");

                        TextBox txtduration2 = (TextBox)rep1.Items[t].FindControl("txtduration2");
                        TextBox txthotelname2 = (TextBox)rep1.Items[t].FindControl("txthotelname2");
                        TextBox txt_RoomType2 = (TextBox)rep1.Items[t].FindControl("txt_RoomType2");
                        // //DropDownList ddlroomtype2 = (DropDownList)rep1.Items[t].FindControl("ddlroomtype2");
                        DropDownList ddlmealtype2 = (DropDownList)rep1.Items[t].FindControl("ddlmealtype2");
                        DropDownList ddlhotelstar2 = (DropDownList)rep1.Items[t].FindControl("ddlhotelstar2");
                        TextBox txtindate2 = (TextBox)rep1.Items[t].FindControl("txtindate2");
                        TextBox txtcheckout2 = (TextBox)rep1.Items[t].FindControl("txtcheckout2");
                        TextBox txtplacename1 = (TextBox)rep1.Items[t].FindControl("txtplacename1");
                        TextBox txtss1 = (TextBox)rep1.Items[t].FindControl("txtss1");
                        TextBox txttime1 = (TextBox)rep1.Items[t].FindControl("txttime1");
                        TextBox txtplacename2 = (TextBox)rep1.Items[t].FindControl("txtplacename2");
                        TextBox txtss2 = (TextBox)rep1.Items[t].FindControl("txtss2");
                        TextBox txttime2 = (TextBox)rep1.Items[t].FindControl("txttime2");
                        TextBox txtplacename3 = (TextBox)rep1.Items[t].FindControl("txtplacename3");
                        TextBox txtss3 = (TextBox)rep1.Items[t].FindControl("txtss3");
                        TextBox txttime3 = (TextBox)rep1.Items[t].FindControl("txttime3");
                        TextBox txtplacename4 = (TextBox)rep1.Items[t].FindControl("txtplacename4");
                        TextBox txtss4 = (TextBox)rep1.Items[t].FindControl("txtss4");
                        TextBox txttime4 = (TextBox)rep1.Items[t].FindControl("txttime4");
                        TextBox txtplacename5 = (TextBox)rep1.Items[t].FindControl("txtplacename5");
                        TextBox txtss5 = (TextBox)rep1.Items[t].FindControl("txtss5");
                        TextBox txttime5 = (TextBox)rep1.Items[t].FindControl("txttime5");
                        TextBox txtmealtype1 = (TextBox)rep1.Items[t].FindControl("txtmealtype1");
                        TextBox txtmealinclude = (TextBox)rep1.Items[t].FindControl("txtmealinclude1");
                        TextBox txtmealtime = (TextBox)rep1.Items[t].FindControl("txtmealtime1");
                        TextBox txtmealtype2 = (TextBox)rep1.Items[t].FindControl("txtmealtype2");
                        TextBox txtmealinclude2 = (TextBox)rep1.Items[t].FindControl("txtmealinclude2");
                        TextBox txtmealtime2 = (TextBox)rep1.Items[t].FindControl("txtmealtime2");
                        TextBox txtmealtype3 = (TextBox)rep1.Items[t].FindControl("txtmealtype3");
                        TextBox txtmealinclude3 = (TextBox)rep1.Items[t].FindControl("txtmealinclude3");
                        TextBox txtmealtime3 = (TextBox)rep1.Items[t].FindControl("txtmealtime3");

                        lbl_id.Text = ds.Tables[0].Rows[t]["id"].ToString();
                        if (ds.Tables[0].Rows[t]["pkg_date"].ToString() != "")
                        { txtdate.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["pkg_date"]).ToString("yyyy-MM-dd"); }

                        // txtdate.Text = ds.Tables[0].Rows[t]["pkg_date"].ToString();
                        txttime.Text = (ds.Tables[0].Rows[t]["pkg_time"]).ToString();
                        txtflightname1.Text = ds.Tables[0].Rows[t]["Flight_Name1"].ToString();
                        txtfrom1.Text = ds.Tables[0].Rows[t]["from1"].ToString();
                        if (ds.Tables[0].Rows[t]["flight_datetime1"].ToString() != "")
                        {
                            txtdepdate1.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["flight_datetime1"]).ToString("yyyy-MM-dd");
                        }

                        txtstops1.Text = ds.Tables[0].Rows[t]["stops1"].ToString();
                        txtto1.Text = ds.Tables[0].Rows[t]["to1"].ToString();
                        if (ds.Tables[0].Rows[t]["to_datetime1"].ToString() != "")
                        {
                            txtarrival.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["to_datetime1"]).ToString("yyyy-MM-dd");
                        }
                        txtflight2.Text = ds.Tables[0].Rows[t]["Flight_Name2"].ToString();
                        txtfrom2.Text = ds.Tables[0].Rows[t]["from2"].ToString();
                        if (ds.Tables[0].Rows[t]["flight_datetime2"].ToString() != "")
                        {
                            txtdepdate2.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["flight_datetime2"]).ToString("yyyy-MM-dd");
                        }
                        txtstops2.Text = ds.Tables[0].Rows[t]["stops2"].ToString();
                        txtto2.Text = ds.Tables[0].Rows[t]["to2"].ToString();
                        if (ds.Tables[0].Rows[t]["to_datetime2"].ToString() != "")
                        {
                            txtarrival2.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["to_datetime2"]).ToString("yyyy-MM-dd");
                        }
                        txttransfer1_1.Text = ds.Tables[0].Rows[t]["transfer_name1"].ToString();
                        txttransfer2_1.Text = ds.Tables[0].Rows[t]["transfer_name2"].ToString();
                        txttransfer3_1.Text = ds.Tables[0].Rows[t]["transfer_name3"].ToString();
                        txttransfer4_1.Text = ds.Tables[0].Rows[t]["transfer_name4"].ToString();
                        txttransfer5_1.Text = ds.Tables[0].Rows[t]["transfer_name5"].ToString();
                        // FileUpload hotelimg1 .Text = ds.Tables[0].Rows[t]["from1"].ToString();
                        //(FileUpload)rep1.Items[t].FindControl("hotelimg1");
                        //FileUpload hotelimg1B .Text = ds.Tables[0].Rows[t]["from1"].ToString();
                        //(FileUpload)rep1.Items[t].FindControl("hotelimg1B");
                        //FileUpload hotelimg1C .Text = ds.Tables[0].Rows[t]["from1"].ToString();
                        //(FileUpload)rep1.Items[t].FindControl("hotelimg1C");
                        /*hotel1img	meal_type1	rating1	hotel2img */

                        txtduration.Text = ds.Tables[0].Rows[t]["daynight1"].ToString();
                        txthotelname.Text = ds.Tables[0].Rows[t]["hotel_name1"].ToString();
                        txt_RoomType.Text = ds.Tables[0].Rows[t]["roomtype1"].ToString(); //DropDownList ddlroomtype .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlroomtype
                                                                                          // DropDownList ddlmealtype .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlmealtype

                        // DropDownList ddlhotelstar .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlhotelstar
                        if (ds.Tables[0].Rows[t]["indate1"].ToString() != "")
                        {
                            txtindate.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["indate1"]).ToString("yyyy-MM-dd");
                        }
                        if (ds.Tables[0].Rows[t]["outdate1"].ToString() != "")
                        { txtcheckout.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["outdate1"]).ToString("yyyy-MM-dd"); ; }

                        if (ds.Tables[0].Rows[t]["hotel1img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel1img"].ToString();
                            lbl_hotelimg1_hidden.Text = myString;
                            lbl_hotelimg1.Text = myString.Split('/').Last();
                        }
                        if (ds.Tables[0].Rows[t]["hotel1B_img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel1B_img"].ToString();
                            lbl_hotelimg1B_hidden.Text = myString;
                            lbl_hotelimg1B.Text = myString.Split('/').Last();
                        }
                        if (ds.Tables[0].Rows[t]["hotel1C_img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel1C_img"].ToString();
                            lbl_hotelimg1C_hidden.Text = myString;
                            lbl_hotelimg1C.Text = myString.Split('/').Last();
                        }
                        if (ds.Tables[0].Rows[t]["hotel2img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel2img"].ToString();
                            lbl_hotelimg2_hidden.Text = myString;
                            lbl_hotelimg2.Text = myString.Split('/').Last();
                        }
                        if (ds.Tables[0].Rows[t]["hotel2B_img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel2B_img"].ToString();
                            lbl_hotelimg2B_hidden.Text = myString;
                            lbl_hotelimg2B.Text = myString.Split('/').Last();
                        }
                        if (ds.Tables[0].Rows[t]["hotel2C_img"].ToString() != "")
                        {
                            string myString = ds.Tables[0].Rows[t]["hotel2C_img"].ToString();
                            lbl_hotelimg2C_hidden.Text = myString;
                            lbl_hotelimg2C.Text = myString.Split('/').Last();
                        }
                        //FileUpload hotelimg2 .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (FileUpload)rep1.Items[t].FindControl("hotelimg2
                        // FileUpload hotelimg2B .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (FileUpload)rep1.Items[t].FindControl("hotelimg2
                        // FileUpload hotelimg2C .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (FileUpload)rep1.Items[t].FindControl("hotelimg2
                        txtduration2.Text = ds.Tables[0].Rows[t]["daynight2"].ToString();
                        txthotelname2.Text = ds.Tables[0].Rows[t]["hotel_name2"].ToString();
                        txt_RoomType2.Text = ds.Tables[0].Rows[t]["roomtype2"].ToString();
                        // //DropDownList ddlroomtype2 .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlroomtype2
                        // DropDownList ddlmealtype2 .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlmealtype2
                        // DropDownList ddlhotelstar2 .Text = ds.Tables[0].Rows[t]["from1"].ToString(); (DropDownList)rep1.Items[t].FindControl("ddlhotelstar2

                        if (ds.Tables[0].Rows[t]["indate2"].ToString() != "")
                        {
                            txtindate2.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["indate2"]).ToString("yyyy-MM-dd");
                        }
                        if (ds.Tables[0].Rows[t]["outdate2"].ToString() != "")
                        {
                            txtcheckout2.Text = Convert.ToDateTime(ds.Tables[0].Rows[t]["outdate2"]).ToString("yyyy-MM-dd");
                        }

                        txtplacename1.Text = ds.Tables[0].Rows[t]["ss1place"].ToString();
                        txtss1.Text = ds.Tables[0].Rows[t]["ss1name"].ToString();
                        txttime1.Text = ds.Tables[0].Rows[t]["ss1time"].ToString();
                        txtplacename2.Text = ds.Tables[0].Rows[t]["ss2place"].ToString();
                        txtss2.Text = ds.Tables[0].Rows[t]["ss2name"].ToString();
                        txttime2.Text = ds.Tables[0].Rows[t]["ss2time"].ToString();
                        txtplacename3.Text = ds.Tables[0].Rows[t]["ss3place"].ToString();
                        txtss3.Text = ds.Tables[0].Rows[t]["ss3name"].ToString();
                        txttime3.Text = ds.Tables[0].Rows[t]["ss3time"].ToString();
                        txtplacename4.Text = ds.Tables[0].Rows[t]["ss4place"].ToString();
                        txtss4.Text = ds.Tables[0].Rows[t]["ss4name"].ToString();
                        /*meal_type2	rating2	hotel1B_img	hotel1C_img	hotel2B_img	hotel2C_img*/
                        txttime4.Text = ds.Tables[0].Rows[t]["ss4time"].ToString();
                        txtplacename5.Text = ds.Tables[0].Rows[t]["ss5place"].ToString();
                        txtss5.Text = ds.Tables[0].Rows[t]["ss5name"].ToString();
                        txttime5.Text = ds.Tables[0].Rows[t]["ss5time"].ToString();
                        txtmealtype1.Text = ds.Tables[0].Rows[t]["mealname1"].ToString();
                        txtmealinclude.Text = ds.Tables[0].Rows[t]["mealtype1"].ToString();
                        txtmealtime.Text = ds.Tables[0].Rows[t]["meal_time1"].ToString();
                        txtmealtype2.Text = ds.Tables[0].Rows[t]["mealname2"].ToString();
                        txtmealinclude2.Text = ds.Tables[0].Rows[t]["mealtype2"].ToString();
                        txtmealtime2.Text = ds.Tables[0].Rows[t]["meal_time2"].ToString();
                        txtmealtype3.Text = ds.Tables[0].Rows[t]["mealname3"].ToString();
                        txtmealinclude3.Text = ds.Tables[0].Rows[t]["mealtype3"].ToString();
                        txtmealtime3.Text = ds.Tables[0].Rows[t]["meal_time3"].ToString();
                    }
                }
                /*******************************************************************************/
            }
        }
        catch (Exception ex) { throw ex; }
    }

    protected void btnsave2_Click(object sender, EventArgs e)
    {
        updatePkgMasterNew();
        //./ ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Right now not working.Coming Soon');", true);
        //insertItinery();
    }

    protected void ddlstartingfrom1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddldepDate
        try
        {
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            m.dt.Rows.Add("@HUB_StartingFrom", ddlstartingfrom1.SelectedItem.Text);
            m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@p_SubOpMode", 15);
            DataSet ds = new DataSet();
            m.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddldepDate.DataSource = ds;
                ddldepDate.DataTextField = "Departure_Date";
                ddldepDate.DataBind();
                ddldepDate.Items.Insert(0, "--Select--");
            }
        }
        catch (Exception ex) { throw ex; }
    }

    protected void ddldepDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlselectpkg.SelectedItem.Text != "--Select--")
        {
            //btnsave.Visible = false;
            btnsave2.Visible = true;
            pnlupdatedata.Visible = pnlupdatedata2.Visible = true;
            try
            {
                m.dt = null;
                m.dt = new DataTable();
                m.dt.Columns.Add("COLUMN", typeof(string));
                m.dt.Columns.Add("VALUE", typeof(object));
                m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
                // m.dt.Rows.Add("pkg_code", txtpackagecode.Text);
                m.dt.Rows.Add("@p_SubOpMode", 13);
                DataSet ds = new DataSet();
                m.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtpackagename.Text = ds.Tables[0].Rows[0]["Pkg_name"].ToString();
                    txt_SubPackageName.Text = ds.Tables[0].Rows[0]["Sub_PkgName"].ToString();
                    txtpackagecode.Text = ds.Tables[0].Rows[0]["Pkg_code"].ToString();
                    txt_MetaTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    txt_MetaDescription.Text = ds.Tables[0].Rows[0]["Meta_description"].ToString();
                    txt_MetaKeywords.Text = ds.Tables[0].Rows[0]["Meta_keywords"].ToString();
                    txt_URLAlias.Text = ds.Tables[0].Rows[0]["URL_Alias"].ToString();
                    txtFromDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Pkg_validity_from"]).ToString("yyyy-MM-dd");
                    txtDurationToDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Pkg_validity_to"]).ToString("yyyy-MM-dd");

                    //ddlstartingfrom.SelectedItem.Text = ds.Tables[0].Rows[0]["Boarding_place"].ToString();
                    ddlstartingfrom.SelectedIndex = ddlstartingfrom.Items.IndexOf(ddlstartingfrom.Items.FindByText(ds.Tables[0].Rows[0]["Boarding_place"].ToString()));

                    ddltaxvalues.SelectedItem.Text = ds.Tables[0].Rows[0]["Pkg_Taxtype_id"].ToString();
                    if (ds.Tables[0].Rows[0]["Departure_Date"].ToString() != "")
                    {
                        txt_DepartureDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Departure_Date"]).ToString("yyyy-MM-dd");
                    }
                    if (ds.Tables[0].Rows[0]["Pkg_Inclusion_Hotel"].ToString() != "False")
                    {
                        chkbhotel.Checked = true;
                    }
                    if (ds.Tables[0].Rows[0]["Pkg_Inclusion_Flight"].ToString() != "False")
                    {
                        chkbFlight.Checked = true;
                    }
                    if (ds.Tables[0].Rows[0]["Pkg_Inclusion_Transfer"].ToString() != "False")
                    {
                        chkbTransfer.Checked = true;
                    }
                    if (ds.Tables[0].Rows[0]["Pkg_Inclusion_Restaurant"].ToString() != "False")
                    {
                        chkbRestaurant.Checked = true;
                    }

                    if (ds.Tables[0].Rows[0]["Pkg_Inclusion_Sightseen"].ToString() != "False")
                    {
                        chkSightseeing.Checked = true;
                    }

                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                        {
                            string Theme = ds.Tables[1].Rows[i]["ThemeId"].ToString();
                            foreach (ListItem item in CheckBoxList1themetype.Items)
                            {
                                if (Theme.Contains(item.Value) && (Theme == item.Value))
                                {
                                    item.Selected = true;
                                    break;
                                }
                            }
                        }

                        //foreach (ListItem item in CheckBoxList1themetype.Items)
                        //{
                        //    string Theme = ds.Tables[1].Rows[i]["ThemeId"].ToString();
                        //    if (Theme.Contains(item.Value))
                        //    {
                        //        item.Selected = true;

                        //    }
                        //    i++;
                        //}
                    }

                    //   ddlstartingfrom.SelectedIndex = ddlstartingfrom.Items.IndexOf(ddlstartingfrom.Items.FindByText(ds.Tables[0].Rows[0]["Boarding_place"].ToString()));
                    //    ddlstartingfrom.SelectedIndex = ddlstartingfrom.Items.IndexOf(ddlstartingfrom.Items.FindByText(ds.Tables[0].Rows[0]["Boarding_place"].ToString()));
                    //    ddlstartingfrom.SelectedIndex = ddlstartingfrom.Items.IndexOf(ddlstartingfrom.Items.FindByText(ds.Tables[0].Rows[0]["Boarding_place"].ToString()));
                    //    ddlstartingfrom.SelectedIndex = ddlstartingfrom.Items.IndexOf(ddlstartingfrom.Items.FindByText(ds.Tables[0].Rows[0]["Boarding_place"].ToString()));

                    //m.dt.Rows.Add("@Pkg_type", ddlpackagetype.SelectedItem.Text.Trim());
                    //m.dt.Rows.Add("@Pkg_Group_type", ddlgroup.SelectedItem.Text.Trim());
                    //if (ddlweekend.SelectedItem.Text != "--Select--")
                    //{
                    //    m.dt.Rows.Add("@Zone", ddlweekend.SelectedItem.Text);
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Zone", ddlinternational.SelectedItem.Text);
                    //}

                    //if (ddlDestinationdomestic.SelectedIndex > 0)
                    //{
                    //    m.dt.Rows.Add("@pkg_destination", ddlDestinationdomestic.SelectedValue);
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@pkg_destination", ddlDestinationInternational.SelectedValue);
                    //}
                    txtCityIncluded.Text = ds.Tables[0].Rows[0]["pkg_city"].ToString();
                    ddlNoofdays.SelectedValue = ds.Tables[0].Rows[0]["pkg_duration"].ToString();
                    txtoverview.Text = ds.Tables[0].Rows[0]["pkg_overview"].ToString();
                    txtinclution.Text = ds.Tables[0].Rows[0]["pkg_incl_excl"].ToString();
                    txt_Exclusion.Text = ds.Tables[0].Rows[0]["Pkg_exclusion"].ToString();
                    txt_PaymentPolicy.Text = ds.Tables[0].Rows[0]["Payment_Policy"].ToString();
                    txt_CancellationPolicy.Text = ds.Tables[0].Rows[0]["Cancellation_Policy"].ToString();
                    txttandc.Text = ds.Tables[0].Rows[0]["pkg_Terms_Condtition"].ToString();
                    txt_ItineraryDetailed.Text = ds.Tables[0].Rows[0]["Itinerary_Detailed"].ToString();
                    txthighlights.Text = ds.Tables[0].Rows[0]["Heighlights"].ToString();

                    if (ds.Tables[0].Rows[0]["Image1"].ToString() != "")
                    {
                        string myString = ds.Tables[0].Rows[0]["Image1"].ToString();
                        lbl_PkgImg1_hidden.Text = myString;
                        lbl_PkgImg1.Text = myString.Split('/').Last();
                    }
                    if (ds.Tables[0].Rows[0]["Image2"].ToString() != "")
                    {
                        string myString = ds.Tables[0].Rows[0]["Image2"].ToString();
                        lbl_PkgImg2_hidden.Text = myString;
                        lbl_PkgImg2.Text = myString.Split('/').Last();
                    }
                    if (ds.Tables[0].Rows[0]["Image3"].ToString() != "")
                    {
                        string myString = ds.Tables[0].Rows[0]["Image3"].ToString();
                        lbl_PkgImg3_hidden.Text = myString;
                        lbl_PkgImg3.Text = myString.Split('/').Last();
                    }
                    if (ds.Tables[0].Rows[0]["Image4"].ToString() != "")
                    {
                        string myString = ds.Tables[0].Rows[0]["Image4"].ToString();
                        lbl_PkgImg4_hidden.Text = myString;
                        lbl_PkgImg4.Text = myString.Split('/').Last();
                    }
                    if (ds.Tables[0].Rows[0]["Image5"].ToString() != "")
                    {
                        string myString = ds.Tables[0].Rows[0]["Image5"].ToString();
                        lbl_PkgImg5_hidden.Text = myString;
                        lbl_PkgImg5.Text = myString.Split('/').Last();
                    }

                    //if (PkgImg1.HasFile)
                    //{
                    //    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg1.FileName).ToString() + Path.GetExtension(PkgImg1.FileName).ToString();
                    //    string path = "~/Upload_image/" + filepath;
                    //    PkgImg1.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                    //    m.dt.Rows.Add("@Image1", path.Trim());
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Image1", "");
                    //}
                    //if (PkgImg2.HasFile)
                    //{
                    //    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg2.FileName).ToString() + Path.GetExtension(PkgImg2.FileName).ToString();
                    //    string path = "~/Upload_image/" + filepath;
                    //    PkgImg2.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                    //    m.dt.Rows.Add("@Image2", path.Trim());
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Image2", "");
                    //}
                    //if (PkgImg3.HasFile)
                    //{
                    //    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg3.FileName).ToString() + Path.GetExtension(PkgImg3.FileName).ToString();
                    //    string path = "~/Upload_image/" + filepath;
                    //    PkgImg3.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                    //    m.dt.Rows.Add("@Image3", path.Trim());
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Image3", "");
                    //}
                    //if (PkgImg4.HasFile)
                    //{
                    //    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg4.FileName).ToString() + Path.GetExtension(PkgImg4.FileName).ToString();
                    //    string path = "~/Upload_image/" + filepath;
                    //    PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                    //    m.dt.Rows.Add("@Image4", path.Trim());
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Image4", "");
                    //}

                    //if (PkgImg5.HasFile)
                    //{
                    //    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + PkgImg5.FileName).ToString() + Path.GetExtension(PkgImg4.FileName).ToString();
                    //    string path = "~/Upload_image/" + filepath;
                    //    PkgImg4.PostedFile.SaveAs(Request.MapPath("~/Upload_image/") + filepath);
                    //    m.dt.Rows.Add("@Image5", path.Trim());
                    //}
                    //else
                    //{
                    //    m.dt.Rows.Add("@Image5", "");
                    //}
                    //  m.dt.Rows.Add("@Created_By", 1);
                    //string s = ds.Tables[0].Rows[0]["Pkg_theme_id"].ToString();
                    //string[] themeArray = s.Split(',');
                    //for (int i = 0; i < CheckBoxList1themetype.Items.Count; i++)
                    //{
                    //    if (CheckBoxList1themetype.Items[i].Value == themeArray[i])
                    //    {
                    //        CheckBoxList1themetype.Items[i].Selected = true;
                    //    }
                    //}

                    Package_Duration(ddlNoofdays);
                }
            }
            catch (Exception ex) { throw ex; }
        }
        else
        {
            ///btnsave.Visible = true;
            btnsave2.Visible = false;
            pnlupdatedata.Visible = pnlupdatedata2.Visible = true;
        }
    }
}