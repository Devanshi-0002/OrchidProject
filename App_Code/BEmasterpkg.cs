using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for BEmasterpkg
/// </summary>
public class BEmasterpkg
{
	public BEmasterpkg()
	{
		//
		// TODO: Add constructor logic here
		//
	}
            public string  Pkg_name { set; get; }
            public string Pkg_code{ set; get; }
            public string Pkg_validity_from{ set; get; }
            public string Pkg_validity_to { set; get; }
            public string Pkg_duration{ set; get; }
            public int Pkg_inclusion_id{ set; get; }
            public string Pkg_details{ set; get; }
            public string Pkg_Itineray{ set; get; }
            public int Room_Typeid{ set; get; }
            public string Terms_Condtition{ set; get; }
            public int taxvalue{ set; get; }
            public string Pkg_type{ set; get; }
            public string Pkg_Group{ set; get; }
            public string Pkg_GroupCustomized{ set; get; }
            public string Pkg_GroupWeekend{ set; get; }
            public string Pkg_GroupInternational{ set; get; }
            public int Pkg_cityDomesticId{ set; get; }
            public int Pkg_cityInternationalId{ set; get; }
            public string Pkg_Domestic_city__included{ set; get; }
            public string Pkg_International_city__included{ set; get; }
            public string Image1{ set; get; }
            public string Image2{ set; get; }
            public string Image3{ set; get; }
            public string Image4{ set; get; }
            public string Image5{ set; get; }
            public int Created_By{ set; get; }
            public string Created_Date { set; get; }
            public int TotalPkgQtyOnline { set; get; }
            public int TotalPkgQtyOffline { set; get; }

            public int Pkg_Inclusion_Hotel { set; get; }
            public int Pkg_Inclusion_Flight { set; get; }
            public int Pkg_Inclusion_Transfer { set; get; }
            public int Pkg_Inclusion_Restaurant { set; get; }
            public int Pkg_Inclusion_Sightseen { set; get; }

    

}