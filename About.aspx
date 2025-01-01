<%@ Page Title="About" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>.zenithbody-part {
	margin-top: 0px;
	border-top: 3px;
	border-color: #fff;
	border-style: double;
	background: rgba(255, 255, 255, 0.94);
	padding: 15px 15px;    
	z-index: 0;
	
	width: 1150px;
}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
	
	<div class="container-fluid">
	<div class="row">
<%--<div class="mini-search-row">
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
	</div>--%>
		<div class="col-sm-12 zenithbody-part">		
			<div class="row">
<div class="col-sm-3 heading">
<h2 class="text-center">ABOUT</h2>
</div>
</div>
<div class="container"><div class="row">
			<div class="col-sm-5">
				<img src="img/about.png" class="img-responsive"/>
			</div>
			<div class="col-sm-7" style="float:left;">

						<p>
                            Orchid Global is a worldwide supplier of hotel accommodation, sightseeing and transfer services to our partners across India & the globe. Our system connects you to over 200,000 hotels, more than 50,000 sightseeing attractions and transfers in over 1000 cities. We provide our services exclusively to travel specialists: travel agents, tour operators and wholesalers, with large inventory and instant online confirmation.

Orchid Global has a dynamic team of travel and IT professionals with over 25 years of experience. Our focus is to give you a refined user platform, competitive prices and trustworthiness that will give you an extraordinary booking experience.
							<%--Zenith Leisure Holidays Ltd, founded in the year 1997 is one of India’s leading travel companies that offers an array of services to its guests. Today, it is the most trusted travel partner and has set itself up as a brand that believes in the fact that ‘THE JOURNEY IS MORE IMPORTANT THAN THE DESTINATION’.

Over the years Zenith has created happiness amongst travelers through new experiences every day. Zenith believes in providing the best quality service to her guests starting from the day their travel begins to the moment their journey ends. It offers travel services to groups, individual travelers, honeymoon couples, students, senior citizens and the corporate executive. The company was established and is run by experts from the hospitality, hotel and travel industry background. Their skills and leadership has positioned the company among the leading travel companies of India.

Initially focused on the MICE segment Zenith today has diversified into Leisure Travel, Events, Inbound Travel, Rewards & Recognition programs & Foreign Exchange. The company owes its success to the large number of satisfied guests from all over India.

Zenith promises to maintain the standards of its services and create a relationship with its growing customer base for generations to come.--%>


						</p>
					</div></div></div>
				</div>
			
		</div>
	</div>
</asp:Content>
