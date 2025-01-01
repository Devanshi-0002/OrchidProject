using System;
using System.Collections.Generic;
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
public partial class Admin_PackageCost : System.Web.UI.Page
{
	DbConnect dc = new DbConnect();
	protected void Page_Load(object sender, EventArgs e)
	{
		
		if (!IsPostBack)
		{
            if (Session["Login_Id"] == null || Session["LoginRef_Id"] == null || Session["UserPassword"] == null || Session["User_Category_Id"] == null || Session["ReportingHd"] == null)
            {
                Response.Redirect("Login.aspx");
                Session.Clear();
                Session.RemoveAll();
            }
            else
            {
                FillPkgName(ref ddlPackagetype);
                ShoeCostDetails();
            }
		 //Fillroomtype(ref ddlroomtype);
		
		 //FillBordingpoint(ref ddlbordingpoint);
		// txt_DepartureDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
		 //CalendarExtendertxtDepartureDate.Format = "dd/MM/yyyy";
		}
	}
	protected void btnsavecost_Click(object sender, EventArgs e)
	{
		string m_sMessage = "";
		dc.dt = null;
		dc.dt = new DataTable();
		dc.dt.Columns.Add("COLUMN", typeof(string));
		dc.dt.Columns.Add("VALUE", typeof(object));
		dc.dt.Rows.Add("@p_SubOpMode",2);
		dc.dt.Rows.Add("@pkg_code", ddlPackagetype.SelectedItem.Value);
		m_sMessage = dc.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Delete);
        if (m_sMessage.IndexOf("Error") != 0)
        {
            try
            {
                int y = 1;
                foreach (RepeaterItem r in rep_pkgCost.Items)
                {
                    Label lbl_DepartureDate = (Label)r.FindControl("lbl_DepartureDate");
                    Label lblHUB = (Label)r.FindControl("lblHUB");
                    Label lblpkgid = (Label)r.FindControl("lblpkgid");
                    TextBox txt_TwinRoomCost = (TextBox)r.FindControl("txt_TwinRoomCost");
                    TextBox txt_TripleRoomCost = (TextBox)r.FindControl("txt_TripleRoomCost");
                    TextBox txt_SingleRoomCost = (TextBox)r.FindControl("txt_SingleRoomCost");
                    TextBox txtChild_WBed_Cost = (TextBox)r.FindControl("txtChild_WBed_Cost");
                    TextBox txtChild_WOBed_Cost = (TextBox)r.FindControl("txtChild_WOBed_Cost");
                    TextBox txt_INFcost = (TextBox)r.FindControl("txt_INFcost");
                    TextBox txt_VisaCost = (TextBox)r.FindControl("txt_VisaCost");
                    TextBox txt_AirfareCost = (TextBox)r.FindControl("txt_AirfareCost");
                    TextBox txt_AutoSP1 = (TextBox)r.FindControl("txt_AutoSP1");
                    TextBox txt_SPAllocation1 = (TextBox)r.FindControl("txt_SPAllocation1");
                    TextBox txt_AutoSP2 = (TextBox)r.FindControl("txt_AutoSP2");
                    TextBox txt_SPAllocation2 = (TextBox)r.FindControl("txt_SPAllocation2");
                    TextBox txt_AutoSP3 = (TextBox)r.FindControl("txt_AutoSP3");
                    TextBox txt_SPAllocation3 = (TextBox)r.FindControl("txt_SPAllocation3");

                    //if (lbl_DepartureDate.Text == "")
                    {
                        int x = 0;
                        SqlCommand cmd = new SqlCommand("Insert_PackageCost_New");
                        cmd.CommandType = CommandType.StoredProcedure;
                        //if (ddlPackagetype.Text != "--Select--")
                        {
                            cmd.Parameters.AddWithValue("@PackageId", lblpkgid.Text);
                            cmd.Parameters.AddWithValue("@pkgCode", ddlPackagetype.SelectedItem.Value);
                            if (txt_TwinRoomCost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@TwinRoom_Cost", txt_TwinRoomCost.Text.TrimStart());
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@TwinRoom_Cost", 0);
                            }
                            if (txt_TripleRoomCost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@TripleRoom_Cost", txt_TripleRoomCost.Text.TrimStart());
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@TripleRoom_Cost", 0);
                            }
                            if (txt_SingleRoomCost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@SingleRoom_Cost", txt_SingleRoomCost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@SingleRoom_Cost", 0);
                            }

                            if (txtChild_WBed_Cost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@Child_WBed_Cost", txtChild_WBed_Cost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Child_WBed_Cost", 0);
                            }

                            if (txtChild_WOBed_Cost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@Child_WOBed_Cost", txtChild_WOBed_Cost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Child_WOBed_Cost", 0);
                            }

                            if (txt_INFcost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@INF_Cost", txt_INFcost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@INF_Cost", 0);
                            }

                            if (txt_VisaCost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@Visa_Cost", txt_VisaCost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Visa_Cost", 0);
                            }
                            if (txt_AirfareCost.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@Airfare_Cost", txt_AirfareCost.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Airfare_Cost", 0);
                            }

                            if (txt_AutoSP1.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSP1", txt_AutoSP1.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSP1", 0);
                            }

                            if (txt_SPAllocation1.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation1", txt_SPAllocation1.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation1", 0);
                            }
                            if (txt_AutoSP2.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSP2", txt_AutoSP2.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSP2", 0);
                            }
                            if (txt_SPAllocation2.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation2", txt_SPAllocation2.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation2", 0);
                            }
                            if (txt_AutoSP3.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSP3", txt_AutoSP3.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSP3", 0);
                            }
                            
                            if (txt_SPAllocation3.Text != "")
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation3", txt_SPAllocation3.Text);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@AutoSPAllocation3", 0);
                            }
                            cmd.Parameters.AddWithValue("@Departure_Date", lbl_DepartureDate.Text);
                            cmd.Parameters.AddWithValue("@CreatedBy", 1);//Session["LoginRef_Id"].ToString()
                            cmd.Parameters.AddWithValue("@Boarding_Point", lblHUB.Text);
                            x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                            if (x > 0)
                            {

                                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Package Cost Save Successfully.');", true);
                            }
                            else
                            {
                                //MessageBox.PopUp(sender, " Room Type Save Failed....", "Error!!");
                                //MessageBox.PopUp(sender, "Room Type Save Failed....", "Error!!");

                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed.')", true);
                            }
                        }
                        //else
                        //{
                        // MessageBox.PopUp(sender, "Please Select Package Name ...", "Error!!");

                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Package Name.')", true);
                        // }              
                    }
                    //else
                    //{
                    //	ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Departure date already exists for this package..!');", true);
                    //}
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Package Cost Save Successfully.')", true);
            }
            catch (Exception ex) { throw ex; }
        }
	}
	public void Clear()
	{
		//txtPer_Unit_Cost.Text = "";
		//txtPer_Child_Cost.Text = "";
		////txtChild_WBed_Cost.Text = "";
	   //// txtChild_WOBed_Cost.Text = "";
	  ////  txt_TwinRoomCost.Text = "";
		//txtExtrabed_Cost.Text = "";
		//txtExtrabed_Cost.Text = "";
		//ddlroomtype.SelectedIndex = -1;
		ddlPackagetype.SelectedIndex = -1;
	}
	public void displaypkgCost()
	{
		try
		{
			dc.dt = null;
			dc.dt = new DataTable();
			dc.dt.Columns.Add("COLUMN", typeof(string));
			dc.dt.Columns.Add("VALUE", typeof(object));
			dc.dt.Rows.Add("@Pkg_code", ddlPackagetype.SelectedItem.Value);
			dc.dt.Rows.Add("@p_SubOpMode", 14);
			DataSet ds = new DataSet();
			dc.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				//int x = Convert.ToInt32(ds.Tables[0].Rows.Count);
				//List<string> notes = new List<string>();
				//for (int a = 1; a <= x; a++)
				//{
				//    notes.Add("" + a);
				//}
				rep_pkgCost.DataSource = ds;
				rep_pkgCost.DataBind();
			}
		}
		catch(Exception ex) { throw ex; }
	 }
	public void Fillroomtype( ref DropDownList ddlroom)
	{
		try
		{
			SqlCommand cmd = new SqlCommand("FillRoomType");
			cmd.CommandType = CommandType.StoredProcedure;
			DataTable ds = new DataTable();
			Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
			ds = dt.RetrieveRecordsdt(ds, cmd);
			ddlroom.DataSource = ds;
			ddlroom.DataTextField = "Room_type";
			ddlroom.DataValueField = "Room_id";
			ddlroom.DataBind();
			ddlroom.Items.Insert(0, "--Select--");
		}
		catch (Exception ex) { throw ex; }
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
			ddlbordingpt.DataTextField = "Boarding_place";
			ddlbordingpt.DataValueField = "Boarding_id";
			ddlbordingpt.DataBind();
			ddlbordingpt.Items.Insert(0, "--Select--");
		}
		catch (Exception ex) { throw ex; }
	}
	public void FillPkgName(ref DropDownList ddlpkg)
	{
		try
		{
			dc.dt = null;
			dc.dt = new DataTable();
			dc.dt.Columns.Add("COLUMN", typeof(string));
			dc.dt.Columns.Add("VALUE", typeof(object));
			//dc.dt.Rows.Add("@Pkg_code", "cxvcxx");
			dc.dt.Rows.Add("@p_SubOpMode", 2);
			DataSet ds = new DataSet();
			dc.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlpkg.DataSource = ds;
				ddlpkg.DataTextField = "Pkg_name";
				ddlpkg.DataValueField = "Pkg_code";
				ddlpkg.DataBind();
				ddlpkg.Items.Insert(0, "--Select--");
			}

			//SqlCommand cmd = new SqlCommand("FillPkgName");
			//cmd.CommandType = CommandType.StoredProcedure;
			//cmd.Parameters.AddWithValue("@Pkg_id", "");
			//DataTable dsp = new DataTable();
			//Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
			//dsp = dt.RetrieveRecordsdt(dsp, cmd);
			//ddlpkg.DataSource = dsp;
			//ddlpkg.DataTextField = "Pkg_name";
			//ddlpkg.DataValueField = "Pkg_id";
			//ddlpkg.DataBind();
			//ddlpkg.Items.Insert(0, "--Select--");
		}
		catch (Exception ex) { throw ex; }
	}
	protected void ddlPackagetype_SelectedIndexChanged(object sender, EventArgs e)
	{
		displaypkgCost();
		pnl_save.Visible = true;
	   try
		{
			//if (ddlPackagetype.SelectedIndex > 0)
			//{
			//    SqlCommand cmd = new SqlCommand("FillPkgName");
			//    cmd.CommandType = CommandType.StoredProcedure;
			//    cmd.Parameters.AddWithValue("@Pkg_id", ddlPackagetype.SelectedValue.ToString());
			//    DataTable dsp = new DataTable();
			//    Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
			//    dsp = dt.RetrieveRecordsdt(dsp, cmd);
			//    if (dsp.Rows.Count > 0)
			//    {
			//        pkgcode.Visible = true;
			//        lblpkgcode.Text = dsp.Rows[0]["Pkg_code"].ToString();
			//    }
			//}
			//else
			//{
			//    MessageBox.PopUp(sender, " Please  Select Packag Name....", "Error!!");
			//}
		}
		catch (Exception ex) { throw ex; }
	}
	protected void btnreset_Click(object sender, EventArgs e)
	{
		Response.Redirect("PackageCost.aspx");
	}
	public void ShoeCostDetails()//sp_tbl_new_PkgMaster
	{
		try
		{
			dc.dt = null;
			dc.dt = new DataTable();
			dc.dt.Columns.Add("COLUMN", typeof(string));
			dc.dt.Columns.Add("VALUE", typeof(object));
			dc.dt.Rows.Add("@p_SubOpMode", 3);
			DataSet ds = new DataSet();
			dc.pfn_GetData("sp_tbl_new_PkgMaster", ref ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				GV_Costdetails.DataSource = ds;
				GV_Costdetails.DataBind();
			}
		}
		catch (Exception ex) { throw ex; }
	}
	public void CkeckDepartureDate()//check depatrure date not Exists
	{
		try
		{
			//dc.dt = null;
			//dc.dt = new DataTable();
			//dc.dt.Columns.Add("COLUMN", typeof(string));
			//dc.dt.Columns.Add("VALUE", typeof(object));
			//dc.dt.Rows.Add("@PackageId", ddlPackagetype.SelectedValue.TrimStart());
			//dc.dt.Rows.Add("@Departure_Date", txt_DepartureDate.Text);
			//dc.dt.Rows.Add("@p_SubOpMode", 6);
			//DataSet dsd = new DataSet();
			//dc.pfn_GetData("sp_tbl_new_PkgMaster", ref dsd);
			//if (dsd.Tables[0].Rows.Count > 0)
			//{
			//    lblDepartureDate_Check.InnerText = dsd.Tables[0].Rows[0]["Departure_Date"].ToString();
			//}
		}
		catch (Exception ex) { throw ex; }
	}

    protected void btnsavecost2_Click(object sender, EventArgs e)
    {

    }
}