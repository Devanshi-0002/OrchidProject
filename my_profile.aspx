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
		<div class="hotel_bread_crumbs"><ul><li class="pre_active">Home</li><li class="active">My Profile</li></ul></div>
	</div>
	<div class="row">
		<div class="col-sm-3 heading">
			<h2 class="text-center">My Profile</h2>
		</div>
	</div>
	
	<div class="row marT3">
	<div class="nav flex-column nav-pills col-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<div class="heading_cat">Category</div>
  
	<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><i><img src="img/icotb.png" /></i>&nbsp;My Bookings</a>
	<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><i><img src="img/icotp.png" /></i>&nbsp;My Profile</a>


</div>

<div class="tab-content col-9" id="v-pills-tabContent">

  <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

<div class="row">
    	<div class="col-md-12">
            <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab">Holidays</a></li>
                            <li><a href="#tab2default" data-toggle="tab">Flight</a></li>
                            <li><a href="#tab3default" data-toggle="tab">Sightseeing</a></li>
                            <li><a href="#tab4default" data-toggle="tab">Hotel</a></li>
							<li><a href="#tab5default" data-toggle="tab">Transfer</a></li>
							<li><a href="#tab6default" data-toggle="tab">Cruise</a></li>
							<li><a href="#tab7default" data-toggle="tab">Forex</a></li>
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">Holidays</div>
                        <div class="tab-pane fade" id="tab2default">Flight</div>
                        <div class="tab-pane fade" id="tab3default">Sightseeing</div>
                        <div class="tab-pane fade" id="tab4default">Hotel</div>
                        <div class="tab-pane fade" id="tab5default">Transfer</div>
						<div class="tab-pane fade" id="tab6default">Cruise</div>
						<div class="tab-pane fade" id="tab7default">Forex</div>
                    </div>
                </div>
            </div>
        </div>
</div>


  <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab"><div class="content-inner">
    <div class="panel profile">
      <div class="panel-body clearfix pt15 pb15 profile-page">
       
        <div class="user-profile col-sm-2 col-xs-12 lg" style="float: left;">
          <i class="ico-profile"></i>
        </div>
        <div class="profile-info clearfix" style="display:grid;">
          <div class="col-sm-10 col-md-10 col-xs-12 p0 mb5">
            <span class="fs-lg text-dark ng-binding"> Paras Zenith Mishra</span>
            <button class="button primary fr">Edit <i class="fas fa-pen ml5"></i></button>
          </div>
          <div class="col-lg-6 col-md-10 col-xs-12 p0 mb5">
            <p class="fs-sm mt5">
              <i class="fas fa-envelope mr10"></i>
              <a href="#" class="ng-binding">paras@zenithholidays.com</a>
            </p>
            <p class="fs-sm mt5 ng-binding">
              <i class="fas fa-phone mr10"></i>
              + 91 7042666273
            </p>
            <!-- ngIf: userVO.address1 || userVO.city || userVO.pincode || userVO.country -->
          </div>
        </div>
      </div>
        <div class="panel-body clearfix pt15 pb15 profile-page" style="display:none;">
          <form class="fs-md edit-user ng-pristine ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength" novalidate="" name="profileForm">
            <div class="row">
              <div class="col-lg-12 mb5">
                <div class="col-lg-2 col-sm-12 mb5" style="float:left;">User Name:<span class="text-blue">*</span></div>
                <div class="col-lg-2 col-sm-4 form-group" style="float:left;">
                  <div class="select-box">
                    <select name="title" required="" class="ng-pristine ng-untouched ng-invalid ng-invalid-required">
                      <option value="">Title</option>
                      <!-- ngRepeat: title in titles --><option class="ng-binding ng-scope" value="Mr.">Mr.</option><!-- end ngRepeat: title in titles --><option ng-repeat="title in titles" ng-selected="title == editProfile.userVO.title" class="ng-binding ng-scope" value="Mrs.">Mrs.</option><!-- end ngRepeat: title in titles --><option ng-repeat="title in titles" ng-selected="title == editProfile.userVO.title" class="ng-binding ng-scope" value="Ms.">Ms.</option><!-- end ngRepeat: title in titles -->
                    </select>
                  </div>
                  <span class="error ng-binding"></span>
                </div>
                <div class="col-lg-3 col-sm-4 form-group" style="float:left;">
                  <input class="input block ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength" type="text" placeholder="First Name" ng-model="editProfile.userVO.name" required="" name="firstName" ng-click="validateUserProfileEditForm()" ng-blur="validateField($event, 'firstName')" ng-pattern="/^[A-z]+$/" ng-minlength="2">
                  <!-- ngIf: profileUpdateSubmitted -->
                </div>
                <div class="col-lg-3 col-sm-4 form-group" style="float:left;">
                  <input class="input block ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength" type="text" placeholder="Last Name" ng-model="editProfile.userVO.lastName" required="" name="lastName" ng-click="validateUserProfileEditForm()" ng-blur="validateField($event, 'lastName')" ng-pattern="/^[A-z]+$/" ng-minlength="2">
                  <span class="error ng-binding" ></span>
                </div> 
              </div>
              <div class="col-lg-12 mb5">
                <div class="col-lg-2 col-sm-12 mb5" style="float:left;margin-bottom: 10px;">Email:</div>
                <div class="col-lg-8 col-sm-11" style="float:left;margin-bottom: 10px;">
                  <input class="input block ng-pristine ng-untouched ng-valid" type="text" placeholder="Enter the email"  disabled="" name="email">
                </div>  
              </div>
              <div class="col-lg-12 mb5">
                <div class="col-lg-2 col-sm-12 mb5" style="float:left;">Password:</div>
                <div class="col-lg-4 col-sm-11 mb5" style="float:left;margin-bottom: 10px;">
                  <input class="input block" type="password" value="password" disabled="" name="password">
                </div>
                 <div class="col-lg-4 col-sm-9 link mb5 mt10" style="float:left;">
                  <a class=" text-blue" href="">Change Password</a>
                </div>
              </div>
              <div class="col-lg-12 mb5">
                <div class="col-lg-2 col-sm-12 mb5" style="float:left;">Phone:<span class="text-blue">*</span></div>
               
                <div class="col-lg-4 col-sm-7 form-group" style="float:left;">
                  <input class="input block" type="text" placeholder="Enter the Phone Number" name="mobile" ng-disabled="true" disabled="disabled">
                </div> 
                 <div class="col-lg-4 col-sm-9 link mt10" style="float:left;">
                    <a class=" text-blue" href="">Change Phone No.</a>
               
                </div>
              </div>

              <div class="col-lg-12 mb5">
                <div class="col-lg-2 col-sm-12 mb5" style="float:left;">Address:<span class="text-blue">*</span></div>
                 <div class="col-lg-4 col-sm-6 mb5" style="float:left;margin-bottom: 10px;">
                  <div class="select-box" style="width:200px;">
                    <select name="country" class="">
                      <option value="">Select Country</option>
                      <!-- ngRepeat: (country, value) in countryStatesList --><option  value="India"  class="ng-binding ng-scope">India</option><!-- end ngRepeat: (country, value) in countryStatesList --><option  value="UK" class="ng-binding ng-scope">UK</option><!-- end ngRepeat: (country, value) in countryStatesList --><option  value="US" class="ng-binding ng-scope">US</option><!-- end ngRepeat: (country, value) in countryStatesList -->
                    </select>
                  </div>
                </div>
                <div class="col-lg-4 col-sm-6 mb5" style="float:left;margin-bottom: 10px;">
                  <div class="select-box" style="width:200px;">
                    <select name="state" class="" disabled="disabled">
                      <option value="">Select state</option>
                      <!-- ngRepeat: (state, value) in countryStatesList[editProfile.userVO.country] -->
                    </select>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="col-lg-2 col-sm-3 resp-hide"></div>
                  <div class="col-lg-4 col-sm-6 rsp-ml8" style="float:left;margin-bottom: 10px;">
                    <input class="input block " type="text" placeholder="Enter the City" name="city">
                  </div>
                  <div class="col-lg-4 col-sm-6 rsp-mr8" style="float:left;margin-bottom: 10px;">
                    <input class="input block " type="text" placeholder="Enter the pincode" name="pincode">
                     <!-- ng-pattern="/^\d{6}$/"  ng-blur="validateField($event, 'pincode')"> -->
                    <!-- <span class="error" ng-bind="pincodeValidationMsg"></span> -->
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="col-lg-2 col-sm-3 "></div>
                  <div class="col-lg-8 col-sm-12 mt15 p0" style="float:left;margin-bottom: 10px;">
                    <textarea class="input block" placeholder="Enter address" rows="5" name="address"></textarea>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-12">
               <div class="col-lg-2 col-sm-3"></div>
                <div class="col-lg-2 col-lg-4 mt15 mb15" style="float:left;">
                  <button class="button primary bordered block">Submit</button>
                </div>
                <div class="col-lg-2 col-lg-4 mt15 mb15" style="float:left;">
                  <button class="button primary bordered block">Cancel</button>
                </div>
              </div>
              <div class="col-lg-12">
                <span class="fs-sm ng-scope">To deactivate your account , <a class="text-blue" style="cursor:pointer">click here</a></span>
              </div>
              
            </div>
          </form>
        </div>
      </div>
  </div></div>
  
</div>
	</div>
</div>
            </div>
        </div>
  
</asp:Content>

