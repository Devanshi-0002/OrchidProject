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
		<div class="hotel_bread_crumbs"><ul><li class="pre_active">Home</li><li class="pre_active">About Us</li><li class="active">Vision & Mission</li></ul></div>
	</div>
	<div class="row">
		<div class="col-sm-3 heading">
			<h2 class="text-center">VISION MISSION</h2>
		</div>
	</div>

</div>
<div class="container-fluid mission_bg">
	<div class="container">
	<div class="row">
		<div class="col-sm-6 col-xs-12 mision">		
			<img src="img/mission.png" class="img-responsive" /><h3>Mission</h3>
			<div class="col-sm-7 vision" style="float:left;">
			<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia</p>
		</div>
		<div class="col-sm-5 mission_bull" style="float:left;">
			<ul>
				<li>There are many </li>				<li>variations of </li>				<li>passages of </li>				<li>Lorem Ipsum  </li>				<li>the majority</li>
			</ul>

		</div>
		</div>
		<div class="col-sm-6 col-xs-12 vision">		
			<img src="img/vision.png" class="img-responsive" /><h3>Vision</h3>
			<div class="col-sm-12">
				<p>“All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words”</p>
</div>
		</div>
	</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

