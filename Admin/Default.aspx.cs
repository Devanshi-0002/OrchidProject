using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using Zenithholidays;

public partial class _Default : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    DbConnect m = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login_Id"] != null || Session["LoginRef_Id"] != null || Session["Password"] != null || Session["User_Name"] != null || Session["User_Category_Id"] != null )
            {
                ShowPkgDetails_Customized_domestic();
                ShowPkgDetails_Customized_International();
                ShowPkgDetails_Group_Domestic();
                ShowPkgDetails_Group_International();
                AdminControl();
                //if (Convert.ToInt32(Session["User_Category_Id"].ToString())==1)
                //{
                //    pnladmin.Visible = true;
                //}
                //else
                //{
                //    pnladmin.Visible = false;
                //}
            }
            else
            {
                Session.Clear();
                Session.RemoveAll();
                Response.Redirect("Login.aspx");
            }
        }
        sessionReassign();
    }
    public void sessionReassign()
    {
        try
        {
            if (Session["LoginRef_Id"] != null || Session["Login_Id"] != null || Session["Password"] != null || Session["User_Category_Id"] != null || Session["User_Name"] != null)
            {
                //Session["UserDetail"] = Session["UserDetail"];
                //// DataTable DtFn = DAL_Global.SelectLivefinancialYearDates();
                //Session["FinancialYear"] = Session["FinancialYear"];
                //Session["FromDate"] = Session["FromDate"];
                //Session["ToDate"] = Session["ToDate"];
                //Session["CompanyName"] = Session["CompanyName"];
                //Session["UserId"] = Session["UserId"];
                //Session["LoginName"] = Session["LoginName"];
                //Session["Password"] = Session["Password"];
                ////Session["LoginName"] = txtLoginId.Text.Trim();
                ////Session["Password"] = txtPassword.Text.Trim();
                //Session["CompanyId"] = Convert.ToInt32(Session["CompanyId"].ToString());
                //Session["UserTypeId"] = Session["UserTypeId"];
                //Session["UserName"] = Session["UserName"];
                //Session["MainMenu"] = Session["MainMenu"];
                //Session["URLMenu"] = Session["URLMenu"];
                //Session["UserImage"] = Session["UserImage"];
                //Session["UserCategory"] = Session["UserCategory"];

                Session["LoginRef_Id"] = Session["LoginRef_Id"];
                Session["Login_Id"] = Session["Login_Id"];
                Session["Password"] = Session["Password"];
                Session["User_Category_Id"] = Session["User_Category_Id"];
                Session["User_Name"] = Session["User_Name"];

            }
        }

        catch (Exception ex) { throw ex; }
    }
    public void AdminControl()
    {
        if (Convert.ToInt32(Session["User_Category_Id"].ToString()) == 1)
        {
            //menuid.Visible = true;
        }
        else
        {
            //menuid.Visible = false;
        }
    }
    public void ShowPkgDetails_Customized_domestic()
    {
        try
        {
            //if (Session["FinancialYear"] != null && Session["UserId"] != null && Session["Password"] != null && Session["CompanyId"] != null && Session["LoginName"] != null)
            //{
            //    double TotalCR = 0.00;
            //SqlCommand command = new SqlCommand("Bk_ShowPkgDetails_Customized_domestic");
            //command.CommandType = CommandType.StoredProcedure;          
            //Dataacces.Dataconnection da = new Dataacces.Dataconnection();
            //DataTable dtc = new DataTable();
            //dtc = da.RetrieveRecordsdt(dtc, command);
            //if (dtc.Rows.Count > 0)
            //{
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
           // m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@p_SubOpMode", 12);
            DataSet ds = new DataSet();
            m.pfn_GetData("Z_NewPkgMasterDetails", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptPackageDetails.DataSource = ds.Tables[1];
                rptPackageDetails.DataBind();
                //for (int i = 0; i < dtc.Rows.Count; i++)
                //{
                //    TotalCR += Convert.ToDouble(dtc.Rows[i].ItemArray[6]);
                //    lbltotlcramt.Text = TotalCR.ToString();
                //}
            }
            //}
            //else
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
    }
    public void ShowPkgDetails_Customized_International()
    {
        try
        {

            //SqlCommand command = new SqlCommand("Bk_ShowPkgDetails_Customized_International");
            //command.CommandType = CommandType.StoredProcedure;
            //Dataacces.Dataconnection da = new Dataacces.Dataconnection();
            //DataTable dtc = new DataTable();
            //dtc = da.RetrieveRecordsdt(dtc, command);
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
           // m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@p_SubOpMode", 12);
            DataSet dtc = new DataSet();
            m.pfn_GetData("Z_NewPkgMasterDetails", ref dtc);
            if (dtc.Tables[0].Rows.Count > 0)
            {
                Rptonlinepkgavailable.DataSource = dtc;
                Rptonlinepkgavailable.DataBind();

                //for (int i = 0; i < dtc.Rows.Count; i++)
                //{
                //    TotalCR += Convert.ToDouble(dtc.Rows[i].ItemArray[6]);
                //    lbltotlDebitor.Text = TotalCR.ToString();
                //}

            }
            //}
            //else
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }
        catch (Exception ex)
        {
            string errorMsg = "Error in Insertion";
            errorMsg += ex.Message;
        }
    }
    public void ShowPkgDetails_Group_Domestic()
    {
        try
        {
            //SqlCommand command = new SqlCommand("Bk_ShowPkgDetails_Group_Domestic");
            //command.CommandType = CommandType.StoredProcedure;
            //Dataacces.Dataconnection da = new Dataacces.Dataconnection();
            //DataTable dtc = new DataTable();
            //dtc = da.RetrieveRecordsdt(dtc, command);
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            // m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@p_SubOpMode", 11);
            DataSet dtcg = new DataSet();
            m.pfn_GetData("Z_NewPkgMasterDetails", ref dtcg);
            if (dtcg.Tables[0].Rows.Count > 0)
            {
                //double Totalcost = 0.00;
                rptDomesticPackagesDetails.DataSource = dtcg.Tables[1];
                rptDomesticPackagesDetails.DataBind();
                //for (int i = 0; i < dtc.Rows.Count; i++)
                //{
                //    Totalcost += Convert.ToDouble(dtc.Rows[i].ItemArray[1]);
                //    lblcostcentertotalAmt.Text = Totalcost.ToString();
                //}

            }
        }

        catch (Exception ex) { throw ex; }

    }
    public void ShowPkgDetails_Group_International()
    {
        try
        {
            //SqlCommand command = new SqlCommand("Bk_ShowPkgDetails_Group_International");
            //command.CommandType = CommandType.StoredProcedure;
            //Dataacces.Dataconnection da = new Dataacces.Dataconnection();
            //DataTable dtc = new DataTable();
            //dtc = da.RetrieveRecordsdt(dtc, command);
            m.dt = null;
            m.dt = new DataTable();
            m.dt.Columns.Add("COLUMN", typeof(string));
            m.dt.Columns.Add("VALUE", typeof(object));
            // m.dt.Rows.Add("@Pkg_id", ddlselectpkg.SelectedItem.Value);
            m.dt.Rows.Add("@p_SubOpMode", 11);
            DataSet dtci = new DataSet();
            m.pfn_GetData("Z_NewPkgMasterDetails", ref dtci);
            if (dtci.Tables[0].Rows.Count > 0)
            {
                //double Totalcost = 0.00;
                rptGroupInternationalPackages.DataSource = dtci;
                rptGroupInternationalPackages.DataBind();
                //for (int i = 0; i < dtc.Rows.Count; i++)
                //{
                //    Totalcost += Convert.ToDouble(dtc.Rows[i].ItemArray[1]);
                //    lblcostcentertotalAmt.Text = Totalcost.ToString();
                //}

            }
        }

        catch (Exception ex) { throw ex; }

    }
    public void GetWorkProgress()
    {
        SqlCommand command = new SqlCommand("SelectWorksInProgress");
        command.CommandType = CommandType.StoredProcedure;
        //command.Parameters.AddWithValue("@ParentId", Menuid);
        //command.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"].ToString()));
        Dataacces.Dataconnection da = new Dataacces.Dataconnection();
        DataTable Dwp = new DataTable();
        Dwp = da.RetrieveRecordsdt(Dwp, command);
        //if (Dwp.Rows.Count>0)
        //{
        //}
        // rptrWorkProgress.DataSource = Dwp;
        //rptrWorkProgress.DataBind();
    }
}