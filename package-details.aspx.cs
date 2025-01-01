using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using Zenithholidays;
    public partial class package_details : System.Web.UI.Page
    {
        DbConnect dc = new DbConnect();
        mailbody md = new mailbody();
        string source = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["destination"]))// && string.IsNullOrEmpty(Request.QueryString["dpCity"]) && string.IsNullOrEmpty(Request.QueryString["dpDate"]) && string.IsNullOrEmpty(Request.QueryString["pt"]))
                {
                    lblpgkid.Text = Request.QueryString["destination"];//destination Zenith
                    lbl_Departure_City.Text = Request.QueryString["dpCity"];//destination Zenith
                    lbl_Departure_Date.Text = Request.QueryString["dpDate"];//destination Zenith
                    //lblpgkid.Text = Request.QueryString["pc"];
                    //string lblpgkid = Request.QueryString["Zenith"];
                    string pname = Request.QueryString["pn"];
                    //BindDatalistPkgddetailInter();
                    //md.FillDepartureDate(ref ddlSelectDate, lblpgkid.Text);
                    //lbl_departureDate.InnerText = ddlSelectDate.SelectedItem.Text;
                    //md.FillDepartureCity(ref ddlChangeDepartureCity, lblpgkid.Text);
                    //FillDepartureCity("");
                    FillDepartureCity_PageLoad();
                    //if (ddlChangeDepartureCity.Text != "")
                    //{
                    ShowPkgDetails(lbl_Departure_City.Text, lbl_Departure_Date.Text);
                    ddlChangeDepartureCity.SelectedItem.Text = lbl_Departure_City.Text;
                    //ddlSelectDate.sel
                    //}
                    //else
                    //{
                    //    ShowPkgDetails("");
                    //}
                    md.FillState(ref ddlCustomerState);
                    //ShowPrice_dateWise();
                    //downloadIttinary(ddlChangeDepartureCity.SelectedItem.Text);
                }
                //else if (!string.IsNullOrEmpty(Request.QueryString["destination"]) && string.IsNullOrEmpty(Request.QueryString["dpCity"]) && string.IsNullOrEmpty(Request.QueryString["dpDate"]) && string.IsNullOrEmpty(Request.QueryString["pt"]))
                //{
                //    lblpgkid.Text = "NO DATA PROVIDED OR COULD NOT BE READ";
                //}
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            if (!string.IsNullOrEmpty(Request.QueryString["source"]))
            {
                source = Request.QueryString["source"];
            }
        }
        protected void ShowPkgDetails(string hub, string dpdate)
        {
            try
            {
                dc.dt = null;
                dc.dt = new DataTable();
                dc.dt.Columns.Add("COLUMN", typeof(string));
                dc.dt.Columns.Add("VALUE", typeof(object));
                dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
                dc.dt.Rows.Add("@HUB_StartingFrom", hub);
                dc.dt.Rows.Add("@Departure_Date", dpdate);
                dc.dt.Rows.Add("@p_SubOpMode", 2);
                DataSet ds = new DataSet();
                dc.pfn_GetData("Z_NewPkgMasterDetails", ref ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rpt_pkgdetails.DataSource = ds;
                    rpt_pkgdetails.DataBind();

                    InclutionsAndExclusions.InnerHtml = ds.Tables[1].Rows[0]["pkg_incl_excl"].ToString();
                    Exclusions.InnerHtml = ds.Tables[1].Rows[0]["Pkg_exclusion"].ToString();
                    txtPayment_Policy.InnerHtml = ds.Tables[1].Rows[0]["Payment_Policy"].ToString();//Payment_Policy
                    CancellationPolicy.InnerHtml = ds.Tables[1].Rows[0]["Cancellation_Policy"].ToString();//Cancellation Policy
                    txt_TermsAndCondition.InnerHtml = ds.Tables[1].Rows[0]["pkg_Terms_Condtition"].ToString();//Terms Condtition
                    txt_ItineraryDetailed.InnerHtml = ds.Tables[1].Rows[0]["Itinerary_Detailed"].ToString();//Itinerary_Detailed
                    txt_Overview.InnerHtml = ds.Tables[1].Rows[0]["Heighlights"].ToString();//Heighlights

                    departure.InnerText = ds.Tables[1].Rows[0]["Boarding_place"].ToString();
                    //pckcost_onslider.InnerText = ds.Tables[2].Rows[0]["Per_Unit_Cost"].ToString();
                    lblPkg_type.Text = ds.Tables[1].Rows[0]["Pkg_type"].ToString();
                    lblpkgname.Text = ds.Tables[1].Rows[0]["Pkg_name"].ToString();
                    this.Title = ds.Tables[1].Rows[0]["Title"].ToString();
                    this.MetaDescription = ds.Tables[1].Rows[0]["Meta_description"].ToString();
                    this.MetaKeywords = ds.Tables[1].Rows[0]["Meta_keywords"].ToString();

                    rpt_sliderImage.DataSource = ds.Tables[1];// image for slider
                    rpt_sliderImage.DataBind();

                    rpt_distinationImge.DataSource = ds.Tables[1];// image bind for departure
                    rpt_distinationImge.DataBind();

                    rptImageEnq.DataSource = ds.Tables[1];// image bind for inq
                    rptImageEnq.DataBind();

                    packagename.InnerText =packagename2.InnerText= ds.Tables[1].Rows[0]["Sub_PkgName"].ToString();
                    pkgDuration.InnerText = pkgDuration2.InnerText= ds.Tables[1].Rows[0]["pkg_duration"].ToString() + " Nights";
                    //Image11111.ImageUrl = ResolveUrl("~/DisplayingImages/Images/Sunset.jpg");
                   
                    foreach (RepeaterItem rpt in rpt_pkgdetails.Items)
                    {
                        Label lbl_flight = (Label)rpt.FindControl("lbl_flight"); // flight
                        Label lbl_flight2 = (Label)rpt.FindControl("lbl_flight2");
                        Panel pnl_Flight = (Panel)rpt.FindControl("pnl_Flight");
                        Panel pnl_Flight2 = (Panel)rpt.FindControl("pnl_Flight2");
                        if (lbl_flight.Text != "")
                        {
                            pnl_Flight.Visible = true;
                        }
                        else
                        {
                            pnl_Flight.Visible = false;

                        }
                        if (lbl_flight2.Text != "")
                        {
                            pnl_Flight2.Visible = true;
                        }
                        else
                        {
                            pnl_Flight2.Visible = false;
                        }
                        Panel pnl_Transfer = (Panel)rpt.FindControl("pnl_Transfer");// transfer panel main
                        Label lbl_transfer_name1 = (Label)rpt.FindControl("lbl_transfer_name1");// Transfer
                        Label lbl_transfer_name2 = (Label)rpt.FindControl("lbl_transfer_name2");
                        Label lbl_transfer_name3 = (Label)rpt.FindControl("lbl_transfer_name3");
                        Label lbl_transfer_name4 = (Label)rpt.FindControl("lbl_transfer_name4");
                        Label lbl_transfer_name5 = (Label)rpt.FindControl("lbl_transfer_name5");
                        Panel pnl_transfer_name1 = (Panel)rpt.FindControl("pnl_transfer_name1");
                        Panel pnl_transfer_name2 = (Panel)rpt.FindControl("pnl_transfer_name2");
                        Panel pnl_transfer_name3 = (Panel)rpt.FindControl("pnl_transfer_name3");
                        Panel pnl_transfer_name4 = (Panel)rpt.FindControl("pnl_transfer_name4");
                        Panel pnl_transfer_name5 = (Panel)rpt.FindControl("pnl_transfer_name5");
                        if(lbl_transfer_name1.Text!="")
                        {
                            pnl_Transfer.Visible = true;
                            pnl_transfer_name1.Visible = true;
                            
                        }
                        else
                        {
                            pnl_Transfer.Visible = false;
                            pnl_transfer_name1.Visible = false;
                        }

                        if(lbl_transfer_name2.Text!="")
                        {
                            pnl_transfer_name2.Visible = true;
                            
                        }
                        else
                        {
                            pnl_transfer_name2.Visible = false;
                        }
                        if (lbl_transfer_name3.Text != "")
                        {
                            pnl_transfer_name3.Visible = true;

                        }
                        else
                        {
                            pnl_transfer_name3.Visible = false;
                        }
                        if (lbl_transfer_name4.Text != "")
                        {
                            pnl_transfer_name4.Visible = true;

                        }
                        else
                        {
                            pnl_transfer_name4.Visible = false;
                        }
                        if (lbl_transfer_name5.Text != "")
                        {
                            pnl_transfer_name5.Visible = true;

                        }
                        else
                        {
                            pnl_transfer_name5.Visible = false;
                        }
                        Label lbl_hotel_name1 = (Label)rpt.FindControl("lbl_hotel_name1");// hotel
                        Label lbl_hotel_name2 = (Label)rpt.FindControl("lbl_hotel_name2");
                        Panel pnl_Hotels = (Panel)rpt.FindControl("pnl_Hotels");
                        Panel pnl_Hotels2 = (Panel)rpt.FindControl("pnl_Hotels2");
                        if (lbl_hotel_name1.Text != "")
                        {
                            pnl_Hotels.Visible = true;
                        }
                        else
                        {
                            pnl_Hotels.Visible = false;
                        }
                        if (lbl_hotel_name2.Text != "")
                        {
                            pnl_Hotels2.Visible = true;
                        }
                        else
                        {
                            pnl_Hotels2.Visible = false;
                        }
                        
                        //-----------------------------------------------------------Sightseeing
                        Panel pnl_Sightseeing = (Panel)rpt.FindControl("pnl_Sightseeing");// Sightseeing place name
                        Label lbl_ss1place = (Label)rpt.FindControl("lbl_ss1place");
                        Label lbl_ss2place = (Label)rpt.FindControl("lbl_ss2place");
                        Label lbl_ss3place = (Label)rpt.FindControl("lbl_ss3place");
                        Label lbl_ss4place = (Label)rpt.FindControl("lbl_ss4place");
                        Label lbl_ss5place = (Label)rpt.FindControl("lbl_ss5place");
                        Panel pnl_ss1place = (Panel)rpt.FindControl("pnl_ss1place");
                        Panel pnl_ss2place = (Panel)rpt.FindControl("pnl_ss2place");
                        Panel pnl_ss3place = (Panel)rpt.FindControl("pnl_ss3place");
                        Panel pnl_ss4place = (Panel)rpt.FindControl("pnl_ss4place");
                        Panel pnl_ss5place = (Panel)rpt.FindControl("pnl_ss5place");
                        Panel pnl_ss1name = (Panel)rpt.FindControl("pnl_ss1name");// Sightseeing Description name
                        Panel pnl_ss2name = (Panel)rpt.FindControl("pnl_ss2name");
                        Panel pnl_ss3name = (Panel)rpt.FindControl("pnl_ss3name");
                        Panel pnl_ss4name = (Panel)rpt.FindControl("pnl_ss4name");
                        Panel pnl_ss5name = (Panel)rpt.FindControl("pnl_ss5name");
                        Panel pnl_ss1time = (Panel)rpt.FindControl("pnl_ss1name");// Sightseeing time
                        Panel pnl_ss2time = (Panel)rpt.FindControl("pnl_ss2name");
                        Panel pnl_ss3time = (Panel)rpt.FindControl("pnl_ss3name");
                        Panel pnl_ss4time = (Panel)rpt.FindControl("pnl_ss4name");
                        Panel pnl_ss5time = (Panel)rpt.FindControl("pnl_ss5name");
                        if (lbl_ss1place.Text != "")
                        {
                            pnl_ss1place.Visible = true;
                            pnl_ss1name.Visible = true;
                            pnl_ss1time.Visible = true;
                        }
                        else
                        {
                            pnl_ss1place.Visible = false;
                            pnl_ss1name.Visible = false;
                            pnl_ss1time.Visible = false;
                        }

                        if (lbl_ss2place.Text != "")
                        {
                            pnl_ss2place.Visible = true;
                            pnl_ss2name.Visible = true;
                            pnl_ss2time.Visible = true;
                        }
                        else
                        {
                            pnl_ss2place.Visible = false;
                            pnl_ss2name.Visible = false;
                            pnl_ss1time.Visible = false;
                        }
                        if (lbl_ss3place.Text != "")
                        {
                            pnl_ss3place.Visible = true;
                            pnl_ss3name.Visible = true;
                            pnl_ss3time.Visible = true;
                        }
                        else
                        {
                            pnl_ss3place.Visible = false;
                            pnl_ss3name.Visible = false;
                            pnl_ss3time.Visible = false;
                        }
                        if (lbl_ss4place.Text != "")
                        {
                            pnl_ss4place.Visible = true;
                            pnl_ss4name.Visible = true;
                            pnl_ss4time.Visible = true;
                        }
                        else
                        {
                            pnl_ss4place.Visible = false;
                            pnl_ss4name.Visible = false;
                            pnl_ss4time.Visible = false;
                        }
                        if (lbl_ss5place.Text != "")
                        {
                            pnl_ss5place.Visible = true;
                            pnl_ss5name.Visible = true;
                            pnl_ss5time.Visible = true;
                        }
                        else
                        {
                            pnl_ss5place.Visible = false;
                            pnl_ss5name.Visible = false;
                            pnl_ss5time.Visible = false;
                        }
                        Panel pnl_Meals = (Panel)rpt.FindControl("pnl_Meals");//Meals & Restaurant find
                        Label lbl_mealname1 = (Label)rpt.FindControl("lbl_mealname1");
                        Label lbl_mealname2 = (Label)rpt.FindControl("lbl_mealname2");
                        Label lbl_mealname3 = (Label)rpt.FindControl("lbl_mealname3");
                        Panel pnl_mealname1 = (Panel)rpt.FindControl("pnl_mealname1");//Meals & Restaurant display
                        Panel pnl_mealname2 = (Panel)rpt.FindControl("pnl_mealname2");
                        Panel pnl_mealname3 = (Panel)rpt.FindControl("pnl_mealname3");
                        Panel pnl_mealtype1 = (Panel)rpt.FindControl("pnl_mealtype1");
                        Panel pnl_mealtype2 = (Panel)rpt.FindControl("pnl_mealtype2");
                        Panel pnl_mealtype3 = (Panel)rpt.FindControl("pnl_mealtype3");
                        Panel pnl_meal_time1 = (Panel)rpt.FindControl("pnl_meal_time1");
                        Panel pnl_meal_time2 = (Panel)rpt.FindControl("pnl_meal_time2");
                        Panel pnl_meal_time3 = (Panel)rpt.FindControl("pnl_meal_time3");
                        if (lbl_mealname1.Text != "")
                        {
                            pnl_Meals.Visible = true;
                            pnl_mealname1.Visible = true;
                            pnl_mealtype1.Visible = true;
                            pnl_meal_time1.Visible = true;
                        }
                        else
                        {
                            pnl_Meals.Visible = false;
                            pnl_mealname1.Visible = false;
                            pnl_mealtype1.Visible = false;
                            pnl_meal_time1.Visible = false;

                        }
                        if (lbl_mealname2.Text != "")
                        {
                            //pnl_Meals.Visible = true;
                            pnl_mealname2.Visible = true;
                            pnl_mealtype2.Visible = true;
                            pnl_meal_time2.Visible = true;
                        }
                        else
                        {
                            //pnl_Meals.Visible = false;
                            pnl_mealname2.Visible = false;
                            pnl_mealtype2.Visible = false;
                            pnl_meal_time2.Visible = false;
                        }
                        if (lbl_mealname3.Text != "")
                        {
                            //pnl_Meals.Visible = true;
                            pnl_mealname3.Visible = true;
                            pnl_mealtype3.Visible = true;
                            pnl_meal_time3.Visible = true;
                        }
                        else
                        {
                            //pnl_Meals.Visible = false;
                            pnl_mealname3.Visible = false;
                            pnl_mealtype3.Visible = false;
                            pnl_meal_time3.Visible = false;
                        }
                    }
                }
                else
                {
                    ds = null;
                    rpt_pkgdetails.DataSource = ds;
                    rpt_pkgdetails.DataBind();
                }
            }
            catch (Exception ex) { throw ex; }
        }
        public void FillDepartureDate(string hub)
        {
            try
            {
                dc.dt = null;
                dc.dt = new DataTable();
                dc.dt.Columns.Add("COLUMN", typeof(string));
                dc.dt.Columns.Add("VALUE", typeof(object));
                dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
                dc.dt.Rows.Add("@HUB_StartingFrom", hub);
                dc.dt.Rows.Add("@p_SubOpMode", 3);
                DataSet m_ddl = new DataSet();
                dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddl);
                if (m_ddl.Tables[0].Rows.Count > 0)
                {
                    ddlSelectDate.DataSource = m_ddl;
                    ddlSelectDate.DataTextField = "Departure_Date";
                    ddlSelectDate.DataValueField = "Dep_Date";
                    ddlSelectDate.DataBind();
                    //ddlSelectDate.DataBind();
                    //ddlSelectDate.Items.Insert(0, "--- Select Currency ---");
                    //ddlpkg.DataSource = ds;
                    //ddlpkg.DataTextField = "Pkg_name";
                    //ddlpkg.DataValueField = "Pkg_id";
                    //ddlpkg.DataBind();
                    pckcost_onslider.InnerText = ddlSelectDate.SelectedItem.Text;// show price in book now header
                    lbl_departureDate.InnerText = ddlSelectDate.SelectedItem.Text;// show price in book now popup
                    pckcost_onslider.InnerText = pckcost_onslider.InnerText.Substring(15);
                    
                    //lbl_departureDate_only.InnerText = m_ddl.Tables[0].Rows[0]["Dep_Date"].ToString();// only departure date for method  ShowPrice_dateWise()
                }
                else
                {
                    m_ddl = null;
                    ddlSelectDate.SelectedItem.Text = "";
                }
            }
            catch (Exception ex) { throw ex; }
        }
        public void FillDepartureCity_PageLoad()
        {
            try
            {
                dc.dt = null;
                dc.dt = new DataTable();
                dc.dt.Columns.Add("COLUMN", typeof(string));
                dc.dt.Columns.Add("VALUE", typeof(object));
                dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
                dc.dt.Rows.Add("@HUB_StartingFrom", "");
                dc.dt.Rows.Add("@p_SubOpMode", 4);
                DataSet m_ddlp = new DataSet();
                dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddlp);
                if (m_ddlp.Tables[0].Rows.Count > 0)
                {
                    ddlChangeDepartureCity.DataSource = m_ddlp;
                    ddlChangeDepartureCity.DataTextField = "Boarding_place";
                    ddlChangeDepartureCity.DataValueField = "Boarding_id";
                    ddlChangeDepartureCity.DataBind();
                    ddlChangeDepartureCity.Items.Insert(0, "--Select--");

                    lbl_DepartureCity.InnerText = lbl_Departure_City.Text;// ddlChangeDepartureCity.SelectedItem.Text;
                    FillDepartureDate(lbl_Departure_City.Text);
                    //ShowPkgDetails(ddlChangeDepartureCity.SelectedItem.Text, ddlSelectDate.SelectedValue.ToString());
                    ShowPrice_dateWise(lbl_Departure_City.Text, lbl_Departure_Date.Text);
                }
            }
            catch (Exception ex) { throw ex; }
        }
        public void FillDepartureCity(string dpcity)
        {
            try
            {
                dc.dt = null;
                dc.dt = new DataTable();
                dc.dt.Columns.Add("COLUMN", typeof(string));
                dc.dt.Columns.Add("VALUE", typeof(object));
                dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
                dc.dt.Rows.Add("@HUB_StartingFrom", dpcity);
                dc.dt.Rows.Add("@p_SubOpMode", 4);
                DataSet m_ddlc = new DataSet();
                dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddlc);
                if (m_ddlc.Tables[0].Rows.Count > 0)
                {
                    ddlChangeDepartureCity.DataSource = m_ddlc;
                    ddlChangeDepartureCity.DataTextField = "Boarding_place";
                    ddlChangeDepartureCity.DataValueField = "Boarding_id";
                    ddlChangeDepartureCity.DataBind();

                    lbl_DepartureCity.InnerText = ddlChangeDepartureCity.SelectedItem.Text;
                    FillDepartureDate(ddlChangeDepartureCity.SelectedItem.Text);
                    //ShowPkgDetails(ddlChangeDepartureCity.SelectedItem.Text, ddlSelectDate.SelectedValue.ToString());
                    ShowPrice_dateWise(ddlChangeDepartureCity.SelectedItem.Text,ddlSelectDate.SelectedValue.ToString());
                }
            }
            catch (Exception ex) { throw ex; }
        }
        protected void ddlChangeDepartureCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                FillDepartureDate(ddlChangeDepartureCity.SelectedItem.Text);
                ShowPkgDetails(ddlChangeDepartureCity.SelectedItem.Text, ddlSelectDate.SelectedValue.ToString());
                ShowPrice_dateWise(ddlChangeDepartureCity.SelectedItem.Text,ddlSelectDate.SelectedValue.ToString());
                //downloadIttinary(ddlChangeDepartureCity.SelectedItem.Text);
                //FillDepartureCity(ddlChangeDepartureCity.SelectedItem.Text);
                lbl_DepartureCity.InnerText = ddlChangeDepartureCity.SelectedItem.Text;
            }
            catch (Exception ex) { throw ex; }
        }
        protected void ddlSelectDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //pckcost_onslider.InnerText = ddlSelectDate.SelectedValue.ToString();// show price in book now header
                lbl_departureDate.InnerText = ddlSelectDate.SelectedItem.Text;// show price in book now popup
                pckcost_onslider.InnerText = lbl_departureDate.InnerText.Substring(15);
                ShowPkgDetails(ddlChangeDepartureCity.SelectedItem.Text, ddlSelectDate.SelectedValue.ToString());
                ShowPrice_dateWise(ddlChangeDepartureCity.SelectedItem.Text, ddlSelectDate.SelectedValue.ToString());
                //lbl_departureDate.InnerText = ddlSelectDate.SelectedItem.Text;
                //FillDepartureDate(ddlSelectDate.SelectedItem.Text);
            }
            catch (Exception ex) { throw ex; }
        }
        public double PriceRoom1(double Adultno, double Childno,double Age1, double HotelCost, double ChildWithoutBedCost, double ChildWithBedCost, double ChildWithBedCost2)
        {
            Adultno = 0;
            double RoomCost1 = 0;
            double AdultCost = 0;
            if (Adultno == 1)
            {
                if (Childno == 2 && Age1 <= 3)
                {
                    AdultCost =(ChildWithoutBedCost * 2);
                }
                else if (Childno == 2 && Age1 > 3)
                {
                    AdultCost = (ChildWithBedCost * 2 );
                }
                else if (Childno == 3 && Age1 <= 3)
                {
                    AdultCost = ChildWithBedCost;
                }
                else
                {
                    AdultCost = 0;
                }
                RoomCost1 = HotelCost + AdultCost;
            }
            else if (Adultno == 2)
            {
                if (Childno == 2)
                {
                    AdultCost = ChildWithoutBedCost + ChildWithoutBedCost;
                }
                else if (Childno == 3)
                {
                    AdultCost = ChildWithBedCost;
                }
                else
                {
                    AdultCost = 0;
                }
                RoomCost1 = HotelCost + AdultCost;
            }
            else if (Adultno == 3)
            {
                if (Childno == 2)
                {
                    AdultCost = ChildWithoutBedCost + ChildWithoutBedCost;
                }
                else if (Childno == 3)
                {
                    AdultCost = ChildWithBedCost;
                }
                else
                {
                    AdultCost = 0;
                }
                RoomCost1 = HotelCost + AdultCost;
            }
            return RoomCost1;
        }
        protected void ddlAdults1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlAdults1.SelectedValue=="1")
            {
                //PriceRoom1(ddlAdults1.SelectedValue, ddlNoOfChilds.SelectedValue, HotelSingleRoomCost.Text,);
            }
        }
        protected void btn_saveEnq_Click(object sender, EventArgs e)
        {
            try
            {
                //string fit_git = "GIT";
                //    //Session["PPkg_type"].ToString();
                //if (fit_git == "Customized")
                //{
                //    fit_git = "FIT";
                //}
                //else
                //{
                //    fit_git = "GIT";
                //}
                //savemaildetail(string name, string mailid, string mobileno, string message, string Location, string date, int adult, string pkgtype, string Pkgname, string Source_Enquiry)
                //mailbody ml = new mailbody();
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
            txt_coment.Text =txt_cityname.Text=txt_traveldate.Text= "";
        }
        public void rateCalculation(DropDownList adult, DropDownList child1, DropDownList child2, out decimal adlt_price, out decimal chld_price)
        {
            try
            {
                Decimal adult_price = 0;
                Decimal child_price = 0;
                int adult_no = Convert.ToInt32(adult.SelectedItem.Text);
                int child1_age = Convert.ToInt32(child1.SelectedItem.Text);// child with bed CWB
                int child2_age = Convert.ToInt32(child2.SelectedItem.Text);// child with bed CNB

                if (adult_no == 1 & child1_age==0 & child2_age==0) 
                { 
                    adult_price = Convert.ToDecimal(HotelSingleRoomCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);

                }
                else if (adult_no == 1 & child1_age == 1 & child2_age == 0)
                {
                    adult_price = (Convert.ToDecimal(HotelTwinRoomCost.Text)*2) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    //child_price += Convert.ToDecimal(ChildWithBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                }
                else if (adult_no == 1 & child1_age == 1 & child2_age == 1)
                {
                    adult_price = (Convert.ToDecimal(HotelTwinRoomCost.Text)*2) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    child_price += Convert.ToDecimal(ChildWithoutBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                }

                else if (adult_no == 2) 
                { 
                    adult_price = (Convert.ToDecimal(HotelTwinRoomCost.Text) + (Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text)))*2;
                    if (child1_age > 0)
                    {
                        child_price += Convert.ToDecimal(ChildWithBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    }

                    else
                    {
                        child_price += 0;
                    }
                    if (child2_age > 0)
                    {
                        child_price += Convert.ToDecimal(ChildWithoutBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    }
                    else
                    {
                        child_price += 0;
                    }

                }//{ adult_price = adult_no * Convert.ToDecimal(HotelTwinRoomCost.Text); }
                else if (adult_no == 3) 
                { 
                    adult_price = (Convert.ToDecimal(HotelTripleRoomCost.Text) + (Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text)))*3;
                    if (child1_age > 0)
                    {
                        child_price += Convert.ToDecimal(ChildWithBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    }

                    else
                    {
                        child_price += 0;
                    }
                    if (child2_age > 0)
                    {
                        child_price += Convert.ToDecimal(ChildWithoutBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    }
                    else
                    {
                        child_price += 0;
                    }
                }//{ adult_price = adult_no * Convert.ToDecimal(HotelTripleRoomCost.Text); }
                //if (child1_age > 0)
                //{
                //    child_price += Convert.ToDecimal(ChildWithBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                //}
              
                //else 
                //{ 
                //    child_price += 0; 
                //}
                //if (child2_age >0)
                //{
                //    child_price += Convert.ToDecimal(ChildWithoutBedCost.Text) + Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                //}
                //else 
                //{ 
                //    child_price += 0; 
                //}
                adlt_price = adult_price;
                chld_price = child_price;
                //  return (adult_price, child_price);
            }
            catch (Exception ex) { throw ex; }
        }
        protected void lnlbtn_checkoutsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                TotalPrice.InnerText = "";
                decimal totalRoom = 0;
                decimal tot_ap = 0; decimal tot_cp = 0;
                decimal x = 0; decimal y = 0; decimal z = 0;
                decimal x2 = 0; decimal y2 = 0; decimal z2 = 0;
                decimal x3 = 0; decimal y3 = 0; decimal z3 = 0;
                int totalAdult = 0;
                int totalChild1 = 0;
                int totalChild2 = 0;
                //for (int i = 0; i < counter; i++)
                //{
                    rateCalculation(ddlAdults1, ddlchildAge1, ddlchildAge2, out tot_ap, out tot_cp);
                    x += tot_ap;
                    y += tot_cp;
                    z += x + y; //+Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    if (Convert.ToDecimal(SPAllocation1.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP1.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation2.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP2.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation3.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP3.Text)) / 100; }
                    else { x = y = 0; }
                //}
                    totalAdult += Convert.ToInt32(ddlAdults1.SelectedValue);
                    if (ddlchildAge1.SelectedIndex > 0)
                    {
                        totalChild1 += 1;
                    }
                    if (ddlchildAge2.SelectedIndex > 0)
                    {
                        totalChild2 += 1;
                    }
                    totalRoom += 1;
                if (div_2nd.Visible == true) 
                {
                    rateCalculation(ddlAdults2, ddlchildAge3, ddlchildAge4, out tot_ap, out tot_cp);
                    //x += tot_ap;
                    //y += tot_cp;
                    //z += x + y;
                    x2 += tot_ap;
                    y2 += tot_cp;
                    z2 += x2 + y2;// +Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    if (Convert.ToDecimal(SPAllocation1.Text) > 0) { z2 += (z2 * Convert.ToDecimal(AutoSP1.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation2.Text) > 0) { z2 += (z2 * Convert.ToDecimal(AutoSP2.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation3.Text) > 0) { z2 += (z2 * Convert.ToDecimal(AutoSP3.Text)) / 100; }
                    else { x2 = y2 = 0; }
                    totalAdult += Convert.ToInt32(ddlAdults2.SelectedValue);
                    if (ddlchildAge3.SelectedIndex > 0)
                    {
                        totalChild1 += 1;
                    }
                    if (ddlchildAge4.SelectedIndex > 0)
                    {
                        totalChild2 += 1;
                    }
                    if (x2 > 0)
                    {
                        totalRoom += 1;
                    }
                }
                if (div_3rd.Visible == true)
                {
                    rateCalculation(ddlAdults3, ddlchildAge5, ddlchildAge6, out tot_ap, out tot_cp);
                    //x += tot_ap;
                    //y += tot_cp;
                    //z += x + y;
                    x3 += tot_ap;
                    y3 += tot_cp;
                    z3 += x3 + y3; //+Convert.ToDecimal(VisaCost.Text) + Convert.ToDecimal(AirfareCost.Text);
                    if (Convert.ToDecimal(SPAllocation1.Text) > 0) { z3 += (z3 * Convert.ToDecimal(AutoSP1.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation2.Text) > 0) { z3 += (z3 * Convert.ToDecimal(AutoSP2.Text)) / 100; }
                    else if (Convert.ToDecimal(SPAllocation3.Text) > 0) { z3 += (z3 * Convert.ToDecimal(AutoSP3.Text)) / 100; }
                    else { x3 = y3 = 0; }
                    totalAdult += Convert.ToInt32(ddlAdults3.SelectedValue);
                    if (ddlchildAge5.SelectedIndex > 0)
                    {
                        totalChild1 += 1;
                    }
                    if (ddlchildAge6.SelectedIndex > 0)
                    {
                        totalChild2 += 1;
                    }
                    if (x3 > 0)
                    {
                        totalRoom += 1;
                    }
                }
                //if (Convert.ToDecimal(SPAllocation1.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP1.Text)) / 100; }
                //else if (Convert.ToDecimal(SPAllocation2.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP2.Text)) / 100; }
                //else if (Convert.ToDecimal(SPAllocation3.Text) > 0) { z += (z * Convert.ToDecimal(AutoSP3.Text)) / 100; }
                //else { x = y = 0; }

                TotalPrice.InnerText =Convert.ToDecimal(z+z2+z3).ToString();
                //LinkButton lnksender = (LinkButton)sender;
                //if (lnksender.CommandArgument.ToString() != "")
                //{
                //    string pc = lnksender.CommandArgument;
                //    string pn = lnksender.CommandName;
                //Response.Redirect("checkout.aspx?Zenith=" + lblpgkid.Text + "&pn=" + Request.QueryString["pn"]);
                //Response.Redirect("index.aspx?id=" + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
                //Response.Redirect("TourGV.aspx?id=" + lnksender.Text + "&agentid=" + Request.QueryString["agentid"] + "&emaild=" + Request.QueryString["emaild"] + "&m=" + Request.QueryString["m"]);
                //}
                Session["TotalAdult"] = totalAdult.ToString();
                Session["TotalChild1"] = totalChild1.ToString();
                Session["TotalChild2"] = totalChild2.ToString();
                Session["TotalChilds"] = (totalChild1 + totalChild2);
                Session["TotalCost"] = Convert.ToDecimal(z + z2 + z3).ToString();
                Session["destination"] = ddlChangeDepartureCity.SelectedItem.Text;
                Session["TotalRoom"] = totalRoom.ToString();
                Session["hub"] = ddlChangeDepartureCity.SelectedItem.Text;
                Session["departure_date"] = ddlSelectDate.SelectedValue.ToString();
                Response.Redirect("checkout.aspx?Zenith=" + lblpgkid.Text);
            }
            catch (Exception ex) { throw ex; }
        }
        protected void ShowPrice_dateWise(string hub, string dpdate)
        {
            try
            {
                dc.dt = null;
                dc.dt = new DataTable();
                dc.dt.Columns.Add("COLUMN", typeof(string));
                dc.dt.Columns.Add("VALUE", typeof(object));
                dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
                dc.dt.Rows.Add("@HUB_StartingFrom", hub);
                dc.dt.Rows.Add("@Departure_Date", dpdate);
                //dc.dt.Rows.Add("@Pkg_CostId", ddlSelectDate.SelectedValue.ToString());
                dc.dt.Rows.Add("@p_SubOpMode", 6);
                DataSet dsc = new DataSet();
                dc.pfn_GetData("Z_NewPkgMasterDetails", ref dsc);
                if (dsc.Tables[0].Rows.Count > 0)
                {
                    HotelTwinRoomCost.Text = dsc.Tables[0].Rows[0]["TwinRoom_Cost"].ToString();
                    HotelTripleRoomCost.Text = dsc.Tables[0].Rows[0]["TripleRoom_Cost"].ToString();
                    HotelSingleRoomCost.Text = dsc.Tables[0].Rows[0]["SingleRoom_Cost"].ToString();
                    ChildWithBedCost.Text = dsc.Tables[0].Rows[0]["Child_WBed_Cost"].ToString();
                    ChildWithoutBedCost.Text = dsc.Tables[0].Rows[0]["Child_WOBed_Cost"].ToString();
                    VisaCost.Text = dsc.Tables[0].Rows[0]["Visa_Cost"].ToString();
                    AirfareCost.Text = dsc.Tables[0].Rows[0]["Airfare_Cost"].ToString();
                    AutoSP1.Text = dsc.Tables[0].Rows[0]["AutoSP1"].ToString();
                    AutoSP2.Text = dsc.Tables[0].Rows[0]["AutoSP2"].ToString();
                    AutoSP3.Text = dsc.Tables[0].Rows[0]["AutoSP3"].ToString();
                    SPAllocation1.Text = dsc.Tables[0].Rows[0]["AutoSPAllocation1"].ToString();
                    SPAllocation2.Text = dsc.Tables[0].Rows[0]["AutoSPAllocation2"].ToString();
                    SPAllocation3.Text = dsc.Tables[0].Rows[0]["AutoSPAllocation3"].ToString();
                    DepartureDate.Text = dsc.Tables[0].Rows[0]["Dep_Date"].ToString();
                    Session["DepartuerDate"] = dsc.Tables[0].Rows[0]["Dep_Date"].ToString();// Select from departure date 
                }
                else
                {
                    dsc = null;
                    rpt_pkgdetails.DataSource = dsc;
                    rpt_pkgdetails.DataBind();
                }
            }
            catch (Exception ex) { throw ex; }
        }
        public void downloadIttinary(string hub)
        {
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@Pkg_code", lblpgkid.Text);
            dc.dt.Rows.Add("@HUB_StartingFrom", hub);
            dc.dt.Rows.Add("@p_SubOpMode", 2);
            DataSet dsi = new DataSet();
            dc.pfn_GetData("Z_NewPkgMasterDetails", ref dsi);
            if (dsi.Tables[0].Rows.Count > 0)
            {
                rpt_downloadIttinary.DataSource = dsi;// download ittinary
                rpt_downloadIttinary.DataBind();

                //rptDownloadIttinary.DataSource = dsi.Tables[1];
                //rptDownloadIttinary.DataBind();

                pkgname_forprint.InnerHtml = dsi.Tables[1].Rows[0]["Pkg_name"].ToString();
                PricePerAdult_forprint.InnerHtml = "Price Per Adult Twin Sharing Basis Rs. " + dsi.Tables[2].Rows[0]["Per_Unit_Cost"].ToString();

                Inclusions_print.InnerHtml = dsi.Tables[1].Rows[0]["pkg_incl_excl"].ToString();
                Exclusions_print.InnerHtml = dsi.Tables[1].Rows[0]["Pkg_exclusion"].ToString();
                PaymentPolicy_print.InnerHtml = dsi.Tables[1].Rows[0]["Payment_Policy"].ToString();//Payment_Policy
                CancellationPolicy_print.InnerHtml = dsi.Tables[1].Rows[0]["pkg_Terms_Condtition"].ToString();//Cancellation Policy
                foreach (RepeaterItem rpt in rpt_downloadIttinary.Items)
                {
                    Label lbl_flight = (Label)rpt.FindControl("lbl_flightD"); // flight
                    Label lbl_flight2 = (Label)rpt.FindControl("lbl_flight2D");
                    Panel pnl_Flight = (Panel)rpt.FindControl("pnl_FlightD");
                    Panel pnl_Flight2 = (Panel)rpt.FindControl("pnl_Flight2D");
                    if (lbl_flight.Text != "")
                    {
                        pnl_Flight.Visible = true;
                    }
                    else
                    {
                        pnl_Flight.Visible = false;

                    }
                    if (lbl_flight2.Text != "")
                    {
                        pnl_Flight2.Visible = true;
                    }
                    else
                    {
                        pnl_Flight2.Visible = false;
                    }
                    Panel pnl_Transfer = (Panel)rpt.FindControl("pnl_TransferD");// transfer panel main
                    Label lbl_transfer_name1 = (Label)rpt.FindControl("lbl_transfer_name1D");// Transfer
                    Label lbl_transfer_name2 = (Label)rpt.FindControl("lbl_transfer_name2D");
                    Label lbl_transfer_name3 = (Label)rpt.FindControl("lbl_transfer_name3D");
                    Label lbl_transfer_name4 = (Label)rpt.FindControl("lbl_transfer_name4D");
                    Label lbl_transfer_name5 = (Label)rpt.FindControl("lbl_transfer_name5D");
                    Panel pnl_transfer_name1 = (Panel)rpt.FindControl("pnl_transfer_name1D");
                    Panel pnl_transfer_name2 = (Panel)rpt.FindControl("pnl_transfer_name2D");
                    Panel pnl_transfer_name3 = (Panel)rpt.FindControl("pnl_transfer_name3D");
                    Panel pnl_transfer_name4 = (Panel)rpt.FindControl("pnl_transfer_name4D");
                    Panel pnl_transfer_name5 = (Panel)rpt.FindControl("pnl_transfer_name5D");
                    if (lbl_transfer_name1.Text != "")
                    {
                        pnl_Transfer.Visible = true;
                        pnl_transfer_name1.Visible = true;

                    }
                    else
                    {
                        pnl_Transfer.Visible = false;
                        pnl_transfer_name1.Visible = false;
                    }

                    if (lbl_transfer_name2.Text != "")
                    {
                        pnl_transfer_name2.Visible = true;

                    }
                    else
                    {
                        pnl_transfer_name2.Visible = false;
                    }
                    if (lbl_transfer_name3.Text != "")
                    {
                        pnl_transfer_name3.Visible = true;

                    }
                    else
                    {
                        pnl_transfer_name3.Visible = false;
                    }
                    if (lbl_transfer_name4.Text != "")
                    {
                        pnl_transfer_name4.Visible = true;

                    }
                    else
                    {
                        pnl_transfer_name4.Visible = false;
                    }
                    if (lbl_transfer_name5.Text != "")
                    {
                        pnl_transfer_name5.Visible = true;

                    }
                    else
                    {
                        pnl_transfer_name5.Visible = false;
                    }
                    Label lbl_hotel_name1 = (Label)rpt.FindControl("lbl_hotel_name1D");// hotel
                    Label lbl_hotel_name2 = (Label)rpt.FindControl("lbl_hotel_name2D");
                    Panel pnl_Hotels = (Panel)rpt.FindControl("pnl_HotelsD");
                    Panel pnl_Hotels2 = (Panel)rpt.FindControl("pnl_Hotels2D");
                    if (lbl_hotel_name1.Text != "")
                    {
                        pnl_Hotels.Visible = true;
                    }
                    else
                    {
                        pnl_Hotels.Visible = false;
                    }
                    if (lbl_hotel_name2.Text != "")
                    {
                        pnl_Hotels2.Visible = true;
                    }
                    else
                    {
                        pnl_Hotels2.Visible = false;
                    }

                    //-----------------------------------------------------------Sightseeing
                    Panel pnl_Sightseeing = (Panel)rpt.FindControl("pnl_SightseeingD");// Sightseeing place name
                    Label lbl_ss1place = (Label)rpt.FindControl("lbl_ss1placeD");
                    Label lbl_ss2place = (Label)rpt.FindControl("lbl_ss2placeD");
                    Label lbl_ss3place = (Label)rpt.FindControl("lbl_ss3placeD");
                    Label lbl_ss4place = (Label)rpt.FindControl("lbl_ss4placeD");
                    Label lbl_ss5place = (Label)rpt.FindControl("lbl_ss5placeD");
                    Panel pnl_ss1place = (Panel)rpt.FindControl("pnl_ss1placeD");
                    Panel pnl_ss2place = (Panel)rpt.FindControl("pnl_ss2placeD");
                    Panel pnl_ss3place = (Panel)rpt.FindControl("pnl_ss3placeD");
                    Panel pnl_ss4place = (Panel)rpt.FindControl("pnl_ss4placeD");
                    Panel pnl_ss5place = (Panel)rpt.FindControl("pnl_ss5placeD");
                    Panel pnl_ss1name = (Panel)rpt.FindControl("pnl_ss1nameD");// Sightseeing Description name
                    Panel pnl_ss2name = (Panel)rpt.FindControl("pnl_ss2nameD");
                    Panel pnl_ss3name = (Panel)rpt.FindControl("pnl_ss3nameD");
                    Panel pnl_ss4name = (Panel)rpt.FindControl("pnl_ss4nameD");
                    Panel pnl_ss5name = (Panel)rpt.FindControl("pnl_ss5nameD");
                    Panel pnl_ss1time = (Panel)rpt.FindControl("pnl_ss1nameD");// Sightseeing time
                    Panel pnl_ss2time = (Panel)rpt.FindControl("pnl_ss2nameD");
                    Panel pnl_ss3time = (Panel)rpt.FindControl("pnl_ss3nameD");
                    Panel pnl_ss4time = (Panel)rpt.FindControl("pnl_ss4nameD");
                    Panel pnl_ss5time = (Panel)rpt.FindControl("pnl_ss5nameD");
                    if (lbl_ss1place.Text != "")
                    {
                        pnl_ss1place.Visible = true;
                        pnl_ss1name.Visible = true;
                        pnl_ss1time.Visible = true;
                    }
                    else
                    {
                        pnl_ss1place.Visible = false;
                        pnl_ss1name.Visible = false;
                        pnl_ss1time.Visible = false;
                    }

                    if (lbl_ss2place.Text != "")
                    {
                        pnl_ss2place.Visible = true;
                        pnl_ss2name.Visible = true;
                        pnl_ss2time.Visible = true;
                    }
                    else
                    {
                        pnl_ss2place.Visible = false;
                        pnl_ss2name.Visible = false;
                        pnl_ss1time.Visible = false;
                    }
                    if (lbl_ss3place.Text != "")
                    {
                        pnl_ss3place.Visible = true;
                        pnl_ss3name.Visible = true;
                        pnl_ss3time.Visible = true;
                    }
                    else
                    {
                        pnl_ss3place.Visible = false;
                        pnl_ss3name.Visible = false;
                        pnl_ss3time.Visible = false;
                    }
                    if (lbl_ss4place.Text != "")
                    {
                        pnl_ss4place.Visible = true;
                        pnl_ss4name.Visible = true;
                        pnl_ss4time.Visible = true;
                    }
                    else
                    {
                        pnl_ss4place.Visible = false;
                        pnl_ss4name.Visible = false;
                        pnl_ss4time.Visible = false;
                    }
                    if (lbl_ss5place.Text != "")
                    {
                        pnl_ss5place.Visible = true;
                        pnl_ss5name.Visible = true;
                        pnl_ss5time.Visible = true;
                    }
                    else
                    {
                        pnl_ss5place.Visible = false;
                        pnl_ss5name.Visible = false;
                        pnl_ss5time.Visible = false;
                    }
                    Panel pnl_Meals = (Panel)rpt.FindControl("pnl_MealsD");//Meals & Restaurant find
                    Label lbl_mealname1 = (Label)rpt.FindControl("lbl_mealname1D");
                    Label lbl_mealname2 = (Label)rpt.FindControl("lbl_mealname2D");
                    Label lbl_mealname3 = (Label)rpt.FindControl("lbl_mealname3D");
                    Panel pnl_mealname1 = (Panel)rpt.FindControl("pnl_mealname1D");//Meals & Restaurant display
                    Panel pnl_mealname2 = (Panel)rpt.FindControl("pnl_mealname2D");
                    Panel pnl_mealname3 = (Panel)rpt.FindControl("pnl_mealname3D");
                    Panel pnl_mealtype1 = (Panel)rpt.FindControl("pnl_mealtype1D");
                    Panel pnl_mealtype2 = (Panel)rpt.FindControl("pnl_mealtype2D");
                    Panel pnl_mealtype3 = (Panel)rpt.FindControl("pnl_mealtype3D");
                    Panel pnl_meal_time1 = (Panel)rpt.FindControl("pnl_meal_time1D");
                    Panel pnl_meal_time2 = (Panel)rpt.FindControl("pnl_meal_time2D");
                    Panel pnl_meal_time3 = (Panel)rpt.FindControl("pnl_meal_time3D");
                    if (lbl_mealname1.Text != "")
                    {
                        pnl_Meals.Visible = true;
                        pnl_mealname1.Visible = true;
                        pnl_mealtype1.Visible = true;
                        pnl_meal_time1.Visible = true;
                    }
                    else
                    {
                        pnl_Meals.Visible = false;
                        pnl_mealname1.Visible = false;
                        pnl_mealtype1.Visible = false;
                        pnl_meal_time1.Visible = false;

                    }
                    if (lbl_mealname2.Text != "")
                    {
                        //pnl_Meals.Visible = true;
                        pnl_mealname2.Visible = true;
                        pnl_mealtype2.Visible = true;
                        pnl_meal_time2.Visible = true;
                    }
                    else
                    {
                        //pnl_Meals.Visible = false;
                        pnl_mealname2.Visible = false;
                        pnl_mealtype2.Visible = false;
                        pnl_meal_time2.Visible = false;
                    }
                    if (lbl_mealname3.Text != "")
                    {
                        //pnl_Meals.Visible = true;
                        pnl_mealname3.Visible = true;
                        pnl_mealtype3.Visible = true;
                        pnl_meal_time3.Visible = true;
                    }
                    else
                    {
                        //pnl_Meals.Visible = false;
                        pnl_mealname3.Visible = false;
                        pnl_mealtype3.Visible = false;
                        pnl_meal_time3.Visible = false;
                    }
                }
            }
            else
            {
                dsi = null;
                rpt_downloadIttinary.DataSource = dsi;
                rpt_downloadIttinary.DataBind();
            }
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
                    lbl_Pkg_Group_type.InnerText = dss.Tables[0].Rows[0]["Pkg_Group_type"].ToString();
                    if (lbl_Pkg_Group_type.InnerText == "International") // for international 
                    {
                        Response.Redirect("international-holidays.aspx?destination=" + "" + "&dfrom=" + txt_from.Text + "&dto=" + txt_to.Text);
                    }
                    else if (lbl_Pkg_Group_type.InnerText == "Domestic") // for international 
                    {
                        Response.Redirect("holidays-in-india.aspx?destination=" + "" + "&dfrom=" + txt_from.Text + "&dto=" + txt_to.Text);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
                    }
                }
                else
                {
                    dss = null;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
                }
            }
            catch (Exception ex) { throw ex; }
        }
        protected void linkbtn_search_international_Click(object sender, EventArgs e)
        {
            SearchDestination_FronTo();
        }
        
}

