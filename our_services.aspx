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
		<div class="hotel_bread_crumbs"><ul><li class="pre_active">Home</li><li class="pre_active">About Us</li><li class="active">Our Team</li></ul></div>
	</div>
	<div class="row">
		<div class="col-sm-3 heading">
			<h2 class="text-center">OUR TEAM</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg-1">
				<div class="text-center"><img src="img/ico1.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10 color-blue">LEISURE TRAVEL</h4>				
				<p class="pa">Are you tired of your day-to-day schedules? Indulge in the luxury and bliss of travelling with Zenith Holidays. We are one of the leading travel.</p>
				<a href="" >Read More</a>
			</div>
	</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg-1">
				<div class="text-center"><img src="img/ico2.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10 color-blue">MICE</h4>				
				<p class="pa">At Zenith Holidays, we have specialized in organizing business trips and conferences all around the globe. Our experienced team designs programs.</p>
				<a href="" >Read More</a>				
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg-1">
				<div class="text-center"><img src="img/ico3.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10 color-blue">CMM SOLUTIONS</h4>				
				<p class="pa">Zenith Holidays is an excellent Corporate Meetings Management solution provider with a team of expert and experienced professionals who are keen on offering.</p>
				<a href="" >Read More</a>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg-1">
				<div class="text-center"><img src="img/ico4.png" alt="" class="img-responsive" /></div>			
				<h4 class="text-center mt10 color-blue">AIR TICKETS</h4>							
				<p class="pa">When it comes to travelling, the fastest and the most convenient way is air travel. Not only for international travel, but these days, domestic air travel has also become a popular mode of transportation.</p>
				<a href="" >Read More</a>
				</div>
		</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

