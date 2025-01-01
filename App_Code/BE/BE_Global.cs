using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for BE_Global
/// </summary>
public class BE_Global
{
	public BE_Global()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int UserId { get; set; }
    public int ModifiedBy { get; set; }
    public int UserType { get; set; }
    public int WarehouseId { get; set; }
    public string OutletType { get; set; }

}