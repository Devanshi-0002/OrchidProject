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
			<div class="col-bg">
				<div class="text-center"><img src="img/team-1.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10">Tessane Padares</h4>
				<h6 class="text-center mt10 text-red text-upc">CO-FOUNDER & CFO</h6>
				<p class="pa">Team Zenith is an amalgamation of budding travel enthusiasts & professionals who have a common goal of creatingwonderful memories through your holiday experience. </p>
				<div class="text-center pb15"><a href="" target="_blank"><i class="fab fa-twitter"></i></a><a href="" target="_blank"><i class="fab fa-facebook-f"></i></a><a href="" target="_blank"><i class="fab fa-google-plus-g"></i></a><a href="" target="_blank"><i class="fab fa-linkedin-in"></i></a></div>
			</div>
	</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg">
				<div class="text-center"><img src="img/team-2.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10">John Bennett</h4>
				<h6 class="text-center mt10 text-red text-upc">MARKETING MANAGER</h6>
				<p class="pa">We take care to plan and execute all the tours be it a corporate trip or leisure holiday with your family. We believe that one happy guest is worth a 100 more and live with the promise of bringing that level of happiness so you come back for more !</p>
				<div class="text-center pb15"><a href="" target="_blank"><i class="fab fa-twitter"></i></a><a href="" target="_blank"><i class="fab fa-facebook-f"></i></a><a href="" target="_blank"><i class="fab fa-google-plus-g"></i></a><a href="" target="_blank"><i class="fab fa-linkedin-in"></i></a></div>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg">
				<div class="text-center"><img src="img/team-3.png" alt="" class="img-responsive" /></div>
				<h4 class="text-center mt10">Christina Hardy</h4>
				<h6 class="text-center mt10 text-red text-upc">TECHNICAL LEAD & CTO</h6>
				<p class="pa">You know that you have come to the right place when you reach out to us at Zenith, for your memorable holiday trip!</p>
				<div class="text-center pb15"><a href="" target="_blank"><i class="fab fa-twitter"></i></a><a href="" target="_blank"><i class="fab fa-facebook-f"></i></a><a href="" target="_blank"><i class="fab fa-google-plus-g"></i></a><a href="" target="_blank"><i class="fab fa-linkedin-in"></i></a></div>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="col-bg">
				<div class="text-center"><img src="img/team-4.png" alt="" class="img-responsive" />	</div>		
				<h4 class="text-center mt10">Jessica Lee</h4>
				<h6 class="text-center mt10 text-red text-upc">SALE MANAGER</h6>			
				<p class="pa">Each team member has been handpicked best suited for the profile of work he or she takes up. We follow professional and a rigorous process of recruitment and select those who have the best knowledge.</p>
				<div class="text-center pb15"><a href="" target="_blank"><i class="fab fa-twitter"></i></a><a href="" target="_blank"><i class="fab fa-facebook-f"></i></a><a href="" target="_blank"><i class="fab fa-google-plus-g"></i></a><a href="" target="_blank"><i class="fab fa-linkedin-in"></i></a></div>
			</div>
		</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

