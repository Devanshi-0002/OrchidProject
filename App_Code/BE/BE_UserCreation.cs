using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for BE_UserCreation
/// </summary>
public class BE_UserCreation
{
	public BE_UserCreation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int Menu_id { set; get; }
    public bool CanEdit { set; get; }
    public bool CanDel { set; get; }
    public bool CanAdd { set; get; }
    public bool CanApprove { set; get; }
   
    public int UserCategory_Id { set; get; }
    public string UserCategory { set; get; }
    public string UserCategoryDesc { set; get; }
    
    public int CompanyId { set; get; }
    public string EmpCode { set; get; }
    public string LoginId { set; get; }
    public string Password { set; get; }
    public int UserCategoryId { set; get; }
    public string UserDepartmentId { set; get; }
    public string Emp_Name { set; get; }

      public int Parent_Id { set; get; }
      public int Menuid { set; get; }
      public string Menu_Name { set; get; }
      public string Page_Link { set; get; }
      public int Sequence_No { set; get; }
      public string ImageUrl { set; get; }
      public string HoverImageUrl { set; get; }
      public string Expression { get; set; }
      public string Destination { get; set; }
     
}