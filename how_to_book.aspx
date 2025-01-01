<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.master" AutoEventWireup="true" CodeFile="zen_khusi.aspx.cs" Inherits="zen_khusi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
 
        <div class="container-fluid pl-0 pr-0">
            <div class="row">
                
    <div class="mini-search-row">
        <div class="container">
            <div class="row">
                <div class="col-auto p-0">
                    <img src="img/travel-icon.png" alt="">
                </div>
                <div class="col my-1">
                    <label class="sr-only" for="txtFrom">From</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-custom form-control-lg border-0 rounded-0" id="txtFrom" placeholder="Kolkata">
                        <div class="input-group-prepend rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col my-1">
                    <label class="sr-only" for="txtTo">To</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-custom border-0 form-control-lg rounded-0" id="txtTo" placeholder="Bali">
                        <div class="input-group-prepend rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col my-1">
                    <label class="sr-only" for="txtDate">Date</label>
                    <div class="input-group">
                        <input type="date" class="form-control border-0 form-control-lg rounded-0 form-control-custom" id="txtDate">
                        <div class="input-group-prepend  rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-calendar-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col my-1">
                    <button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button>
                </div>
            </div>
        </div>
    </div>
<div class="container">
	<div class="row">
		<div class="hotel_bread_crumbs"><ul><li class="pre_active">Home</li><li class="active">How to Book</li></ul></div>
	</div>
	<div class="row">
		<div class="col-sm-3 heading">
			<h2 class="text-center">HOW TO BOOK</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-xs-12 unorderd_list">
		<p><b>At the time of booking INTERNATIONAL TOURS</b><br/>There are 4 Easy Steps to register your tour.</p>
			<ul class="t&c">
				<li>Read carefully the “Terms and Conditions”.</li><li>Carry original Passports.</li><li>Select your tour, fill in the Registration form.</li><li>Pay the Registration amount.</li>
			</ul>
<p>Please provide your complete details, including Name as in Passport, Birth date, Meal preferences, Address, Tel, Mobile, Email, Emergency contact (other than residence), pre/post tour program if any, Insurance, extension of insurance, any extras such as additional accommodation, transfers, change of return travel date, etc. Collect the official payment receipt on payment of the Registration amount.</p>
	<table border="0" cellpadding="10" cellspacing="0" width="100%" class="table_badse">
		<tr>
<td bgcolor="#1266b1" class="thead">
Tour Price (INR)												
</td>
<td bgcolor="#1266b1" class="thead">Registration amount per person</td>
</tr>
<tr>
	<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>

</table>
	</div>
	</div>
<div class="row">
		<div class="col-sm-12 col-xs-12 unorderd_list">
		<p><b>At the time of booking DOMESTIC TOURS</b><br/>There are 4 Easy Steps to register your tour.</p>
			<ul class="t&c">
				<li>Read carefully the “Terms and Conditions”.</li><li>Carry original Passports.</li><li>Select your tour, fill in the Registration form.</li><li>Pay the Registration amount.</li>
			</ul>
<p>Please provide your complete details, including Name as in Passport, Birth date, Meal preferences, Address, Tel, Mobile, Email, Emergency contact (other than residence), pre/post tour program if any, Insurance, extension of insurance, any extras such as additional accommodation, transfers, change of return travel date, etc. Collect the official payment receipt on payment of the Registration amount.</p>
	<table border="0" cellpadding="10" cellspacing="0" width="100%" class="table_badse">
		<tr>
<td bgcolor="#1266b1" class="thead">
Tour Price (INR)												
</td>
<td bgcolor="#1266b1" class="thead">Registration amount per person</td>
</tr>
<tr>
	<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>
<tr>
<td class="tbody" width="50%">Below 50,000</td>
<td class="tbody" width="50%">15,000</td>
</tr>

</table>
	</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

