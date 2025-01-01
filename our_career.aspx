<%@ Page Title="" Language="C#" MasterPageFile="~/InnerMasterPage.master" AutoEventWireup="true" CodeFile="zen_khusi.aspx.cs" Inherits="zen_khusi" %>

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
		<div class="hotel_bread_crumbs"><ul><li class="pre_active">Home</li><li class="active">Career</li></ul></div>
	</div>
	<div class="row">
		<div class="col-sm-3 heading">
			<h2 class="text-center">CAREER</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 col-xs-12"><img src="img/we_are_hiring.png" class="img-responsive" /></div>
		<div class="col-sm-9 col-xs-12">Zenith Leisure Holidays is looking for talented and motivated people who want to realize their professional ambitions while delivering the highest levels of expertise and service to our customers. Being one of the top companies in travel, we offer exciting opportunities for you. If you share our commitment to excellence and customer care and enjoy professional challenges, we would like to hear from you. Please email your resume to hrd@zenithholidays.com</div>
	</div>
	<div class="row marT3">
	<div class="nav flex-column nav-pills col-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<div class="heading_cat">Category</div>
  
	<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><i><img src="img/icot1.png" /></i>&nbsp;All Available Jobs</a>
	<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><i><img src="img/icot2.png" /></i>&nbsp;Accounting & Operations</a>
	<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><i><img src="img/icot3.png" /></i>&nbsp;Events & Group Leaders</a>
	<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false"><i><img src="img/icot4.png" /></i>&nbsp;Sales & Manager</a>

</div>

<div class="tab-content col-9" id="v-pills-tabContent">

  <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
<table border="0" cellpadding="10" cellspacing="0" width="100%" class="table">
		<tr>
<td bgcolor="#1266b1" class="thead" colspan="5">
ALL LISTED JOBS IN BOARD												
</td>

</tr>
<tr>
<td class="tbody" >Sr. Manager(Comm)</td>
<td class="tbody" >Vacancy 1</td>
<td class="tbody" >Kolkata</td>
<td class="tbody" >Commercial</td>
<td class="tbody" ><a href="" class="dcolor">View Details</a></td>
</tr>
<tr>
<td class="tbody" >Sr. Manager(Comm)</td>
<td class="tbody" >Vacancy 1</td>
<td class="tbody" >Delhi</td>
<td class="tbody" >Events</td>
<td class="tbody" ><a href="" class="dcolor">View Details</a></td>
</tr>
<tr>
<td class="tbody" >Sr. Manager(Comm)</td>
<td class="tbody" >Vacancy 1</td>
<td class="tbody" >Delhi | Chennai | Hyderbad</td>
<td class="tbody" >MICE International </td>
<td class="tbody" ><a href="" class="dcolor">View Details</a></td>
</tr>
<tr>
<td class="tbody" >Sr. Manager(Comm)</td>
<td class="tbody" >Vacancy 1</td>
<td class="tbody" >Delhi</td>
<td class="tbody" >Ticketing</td>
<td class="tbody" ><a href="" class="dcolor">View Details</a></td>
</tr>
<tr>
<td class="tbody" >Sr. Manager(Comm)</td>
<td class="tbody" >Vacancy 1</td>
<td class="tbody" >Delhi</td>
<td class="tbody" >Leisure</td>
<td class="tbody " ><a href="#" class="dcolor">View Details</a></td>
</tr>

</table></div>


  <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">...</div>
  <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
  <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

