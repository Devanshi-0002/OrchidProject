using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DAL_UserCreation
/// </summary>
public class DAL_UserCreation
{
	public DAL_UserCreation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static DataTable SelectHotelDestination(BE_UserCreation prpty)
    {
        SqlCommand cmd = new SqlCommand("SELECT * From View_SearchHotel " + prpty.Expression + "  order by Pkg_validity_from ");
        cmd.CommandType = CommandType.Text;
        DataTable dtb = new DataTable();
        Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
        dtb = dt.RetrieveRecordsdt(dtb, cmd);
        return dtb;
    }
     public static DataSet ShowMenus()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SelectMenu");
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecords(ds, cmd);
            return ds;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataTable ShowCompany()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_SelectCompanyName");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dtb = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecordsdt(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataTable ShowUserCategory()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Sp_UserCategory");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dtb = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecordsdt(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }

    }

    public static DataTable Insertpkgmaster(BEmasterpkg prptypo)
    {
        try
        {
            SqlCommand cmnd = new SqlCommand("Insert_PackageMaster");
            cmnd.CommandType = CommandType.StoredProcedure;
            cmnd.Parameters.AddWithValue("@Pkg_name", prptypo.Pkg_name.Trim());
            cmnd.Parameters.AddWithValue("@Pkg_code", prptypo.Pkg_code);
            cmnd.Parameters.AddWithValue("@Pkg_validity_from", prptypo.Pkg_validity_from);
            cmnd.Parameters.AddWithValue("@Pkg_validity_to", prptypo.Pkg_validity_to);
            cmnd.Parameters.AddWithValue("@Pkg_inclusion_id", prptypo.Pkg_inclusion_id);
            cmnd.Parameters.AddWithValue("@Taxvalue_id", prptypo.taxvalue);
            cmnd.Parameters.AddWithValue("@Pkg_duration", prptypo.Pkg_duration);
            cmnd.Parameters.AddWithValue("@Pkg_type", prptypo.Pkg_type);
            cmnd.Parameters.AddWithValue("@Pkg_Group", prptypo.Pkg_Group);
            cmnd.Parameters.AddWithValue("@Pkg_GroupCustomized", prptypo.Pkg_GroupCustomized);
            cmnd.Parameters.AddWithValue("@Pkg_GroupWeekend", prptypo.Pkg_GroupWeekend);
            cmnd.Parameters.AddWithValue("@Pkg_GroupInternational", prptypo.Pkg_GroupInternational);
            cmnd.Parameters.AddWithValue("@Pkg_cityDomesticId", prptypo.Pkg_cityDomesticId);
            cmnd.Parameters.AddWithValue("@Pkg_cityInternationalId", prptypo.Pkg_cityInternationalId);
            cmnd.Parameters.AddWithValue("@Pkg_Domestic_city__included", prptypo.Pkg_Domestic_city__included);
            cmnd.Parameters.AddWithValue("@Pkg_International_city__included", prptypo.Pkg_International_city__included);
            cmnd.Parameters.AddWithValue("@Room_Typeid", prptypo.Room_Typeid);
            cmnd.Parameters.AddWithValue("@Pkg_details", prptypo.Pkg_details);
            cmnd.Parameters.AddWithValue("@Pkg_Itineray", prptypo.Pkg_Itineray);
            cmnd.Parameters.AddWithValue("@Terms_Condtition", prptypo.Terms_Condtition);
            cmnd.Parameters.AddWithValue("@Image1", prptypo.Image1);
            cmnd.Parameters.AddWithValue("@Image2", prptypo.Image2);
            cmnd.Parameters.AddWithValue("@Image3", prptypo.Image3);
            cmnd.Parameters.AddWithValue("@Image4", prptypo.Image4);
            cmnd.Parameters.AddWithValue("@Image5", prptypo.Image5);
            cmnd.Parameters.AddWithValue("@TotalPkgQtyOnline", prptypo.TotalPkgQtyOnline);
            cmnd.Parameters.AddWithValue("@TotalPkgQtyOffline", prptypo.TotalPkgQtyOffline);
            cmnd.Parameters.AddWithValue("@Pkg_Inclusion_Hotel", prptypo.Pkg_Inclusion_Hotel);
            cmnd.Parameters.AddWithValue("@Pkg_Inclusion_Flight", prptypo.Pkg_Inclusion_Flight);
            cmnd.Parameters.AddWithValue("@Pkg_Inclusion_Transfer", prptypo.Pkg_Inclusion_Transfer);
            cmnd.Parameters.AddWithValue("@Pkg_Inclusion_Restaurant", prptypo.Pkg_Inclusion_Restaurant);
            cmnd.Parameters.AddWithValue("@Pkg_Inclusion_Sightseen", prptypo.Pkg_Inclusion_Sightseen);
            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmnd);
            return ds;

        }
        catch (Exception ex) { throw ex; }
    }
    public static int InsertUserCategory(BE_UserCreation prprty)
    {
        SqlCommand cmd = new SqlCommand("Sp_InsertUserCategory");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@User_Category_Name", prprty.UserCategory);
        cmd.Parameters.AddWithValue("@User_Category_Description", prprty.UserCategoryDesc);
        int x = Dataacces.Dataconnection.ExecuteQuery(cmd);
        return x;
    }
    public static int InsertUserLoginDetail(BE_UserCreation prprty)
    {
        SqlCommand cmd = new SqlCommand("Sp_InsertUserLoginDetail");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Company_Id", prprty.CompanyId);
        cmd.Parameters.AddWithValue("@Emp_Code", prprty.EmpCode);
        cmd.Parameters.AddWithValue("@Login_Id", prprty.LoginId);
        cmd.Parameters.AddWithValue("@UserPassword", prprty.Password);
        cmd.Parameters.AddWithValue("@User_Category_Id", prprty.UserCategoryId);
        cmd.Parameters.AddWithValue("@UserDepartmentId", prprty.UserDepartmentId);
        int x = Dataacces.Dataconnection.ExecuteQuery(cmd);
        return x;
    }
    public static DataTable ShowUserDetails(BE_UserCreation prprty)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Select Row_number()over(Order by LoginRef_Id) as sno,* from VW_SelectUserDetails where Company_Id=" + prprty.CompanyId);
            cmd.CommandType = CommandType.Text;
            DataTable dtb = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecordsdt(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }
    }
  
    public static DataSet ShowMenusDetails()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ShowMenuDetails");
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecords(ds, cmd);
            return ds;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataSet ViewWMenuDetails(string Expression)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[Menu_Master]  " + Expression);
            cmd.CommandType = CommandType.Text;
            DataSet ds = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecords(ds, cmd);
            return ds;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataTable FillDDlmenuid()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillDDLMenuName");
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            DataTable dtb = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecordsdt(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }
    }
    public static DataTable Fillroomtype()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillRoomType");
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            DataTable dtb = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecordsdt(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }
    }
}
