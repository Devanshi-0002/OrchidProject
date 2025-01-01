using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for BE_Login
/// </summary>
public class BE_Login
{
	public BE_Login()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string LoginId { get; set; }
    public string UserPassword { get; set; }
    public int UserId { get; set; }
    public int CompanyId { get; set; }
    public string Mobileno { get; set; }
    public string Emailid { get; set; }
}