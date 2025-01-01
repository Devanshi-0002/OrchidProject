<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="international-holidays.aspx.cs" Inherits="international_holidays" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    
    <div class="mini-search-row">
        <div class="container" >
            <a style="color:white" href="Default.aspx">Home ></a><a style="color:white"> International holidays</a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 my-1">
                    <div class="row">
                        <div class="col-auto d-sm-block">
                            <img src="img/travel-icon.png" alt="" />
                        </div>
                        <div class="input-group col">
                            <asp:TextBox ID="txt_from" runat="server" placeholder="From eg. Kolkata, Delhi" class="form-control form-control-custom border-0 form-control-lg rounded-0"></asp:TextBox>
                            <span id="lbl_Pkg_Group_type" runat="server" style="display: none"></span>
                            <div class="input-group-prepend rounded-0 ">
                                <div class="input-group-text border-0 bg-white">
                                    <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3 col-sm-4 my-1">
                    <label class="sr-only" for="txtTo">To</label>
                    <div class="input-group">
                        <asp:TextBox ID="txt_to" runat="server" placeholder="To eg. Paris , Singapore" class="form-control form-control-custom border-0 form-control-lg rounded-0"></asp:TextBox>
                        <div class="input-group-prepend rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 my-1">
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
                <div class="col-md-2 col-sm-12 my-1">
                    <%--<button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button>--%>
                    <asp:LinkButton ID="linkbtn_search_international" runat="server" class="btn btn-danger btn-block rounded-0 btn-lg" Text="Search" OnClick="linkbtn_search_international_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
        
    </div>
    <%--<div class="prepend_top append_bottom clearFix">
                <!-- Header -Breadcrumb -->
                <ul class="breadcrumb fontSize11 flL">
                    <li><a href="/" onclick="makeLoggingRequest('Branch','OBT','Page','PackageDetailsPage','LinkClicked','Home');return true;">Home</a></li>
                    <li class="breadcrumb_seprator">&gt;</li>
                    <li>

                        <a href="international" onclick="makeLoggingRequest('Branch','OBT','Page','PackageDetailsPage','LinkClicked','International Holidays');return true;">International Holidays</a>

                    </li>
                    <li class="breadcrumb_seprator">&gt;</li>

                    <li>
                        <a href="international/search.act?dest=Bhutan&fromBreadCrump=true" onclick="makeLoggingRequest('Branch','OBT','Page','PackageDetailsPage','PackageName','bhutan_via_bagdograwithout_flights_private','LinkClicked','Holidays Packages');return true;">Bhutan</a>
                    </li>

                    <li class="breadcrumb_seprator">&gt;</li>
                    <li><span class="pacTitle RobotoLight">Bhutan via Bagdogra-Without Flights (Private)</span></li>
                </ul>
                <!-- /Header -Breadcrumb -->
            </div>--%>
    <span id="lbldeparture_City" runat="server" style="display: none"></span>
    <span id="lbldeparture_date" runat="server" style="display: none"></span>
    <span id="lbl_pkgtype" runat="server" style="display: none"></span>
    <div class="dastination-slider-area d-sm-block">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner ">
                <asp:Label ID="destination" runat="server" Visible="false"></asp:Label>
                <asp:Repeater ID="rpt_sliderDestination" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item destination-carousel-inner active animated fadeInDown w-100">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="d-block w-100 destination-slider-image" />
                        </div>
                        <div class="carousel-item destination-carousel-inner animated fadeInDown w-100">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image2") %>' class="d-block w-100 destination-slider-image" />
                        </div>
                        <div class="carousel-item destination-carousel-inner animated fadeInDown w-100">
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("Image3") %>' class="d-block w-100 destination-slider-image" />
                        </div>

                        <div class="carousel-caption d-none d-md-block dastination-carousel-caption">
                            <h1><%# Eval("Destination") %></h1>
                            <h4>Holidays Packages</h4>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <a class="carousel-control-prev dastination-carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next dastination-carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    
    <div class="dastination-body-area">
        <div class="container">
            <div class="row">
                <div class="col-12 p-0">
                    <div class="dastination-package-main">
                        <ul class="nav nav-tabs dastination-nav-tabs mt-4 text-center" role="tablist">
                            <li class="nav-item rounded-0">
                                <asp:LinkButton ID="btnAll" runat="server" class="nav-link dastination-nav-link border-left-0" Text="All" OnClick="btnAll_Click"><span id="totalNoOfPkg" runat="server"></span></asp:LinkButton>
                            </li>
                            <li class="nav-item rounded-0">
                                <%--<a class="nav-link dastination-nav-link border-left-0" data-toggle="tab" href="#profile" role="tab">Group (6)</a>--%>
                                <asp:LinkButton ID="btn_group" runat="server" class="nav-link dastination-nav-link border-left-0" Text="Group" OnClick="btn_group_Click"><span id="totalgroup" runat="server"></span></asp:LinkButton>
                            </li>
                            <li class="nav-item rounded-0">
                                <asp:LinkButton ID="btn_Customizable" runat="server" class="nav-link dastination-nav-link border-left-0" Text="Customizable" OnClick="btn_Customizable_Click"><span id="totalcustomized" runat="server"></span></asp:LinkButton>
                                <%--<a class="nav-link dastination-nav-link" data-toggle="tab" href="#messages" role="tab">Customizable (12)</a>--%>
                            </li>
                             <li class="nav-item rounded-0" id="Tab_flexibleGroupTours" runat="server" visible="false">
                                 <a class="nav-link dastination-nav-link border-left-0" href="http://www.zenithholidays.com/europetours" target="_self">Flexible Group Tours</a>
                            </li>
                        </ul>
                        <div class="tab-content pr-sm-0 dastination-tab-content">
                            <div class="tab-pane active dastination-tab-panel" id="home" role="tabpanel">
                                <div class="desctination-package-area mb-5">
                                    <asp:Repeater ID="rpt_adventure" runat="server">
                                        <ItemTemplate>
                                            <div class="desctination-package-area mb-5">
                                                <ul class="dastination-package-box pr-sm-0 row m-0">
                                                    <li class="col-md-5 col-sm-12 pr-sm-0">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="w-100 destination-package-image" />
                                                    </li>
                                                    <li class="col p-0">
                                                        <div class="dastination-package-details">
                                                            <h5 class="dastination-package-details-title"><%# Eval("Sub_PkgName") %></h5>
                                                            <p class="font-weight-bold mb-2"><%# Eval("pkg_duration") %> Nights</p>
                                                            <ul class="daetination-night-stay">
                                                                <%-- <li><span></span></li>--%>
                                                                <%--<li><span>1N Nubra</span></li>--%>
                                                            </ul>
                                                            <hr class="text-black mt-2 mb-1" />
                                                            <p class="font-weight-bold mb-2">Highlights</p>
                                                            <ul class="dastination-highlight-list">
                                                                <li><span><%# Eval("Heighlights") %></span></li>
                                                                <%-- <img title="Group" src="img/group.png" alt="Zenith Group Tour" class="Groupcustomize">--%>
                                                            <p class="text-right">
                                                                <asp:LinkButton ID="LinkButton1" runat="server" class="text-primary" Text="View All" CommandArgument='<%# Eval("Pkg_code")%>' CommandName='<%# Eval("Pkg_name")%>' OnClick="lnkbtnInternationalBook_Click"></asp:LinkButton>
                                                            </p>
                                                    </li>
                                                    <%--  <li><span>Enjoy a ride on double humped camel</span> <span class=" ml-4"><a href="#" class="text-primary">View All</a> </span></li>--%>
                                                </ul>
                                                <hr class="text-black mt-2 mb-1" />
                                                <%--for data banding--%>
                                                <asp:Label ID="lbllg" runat="server" Text='<%# Eval("Pkg_Inclusion_Flight") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblbulding" runat="server" Text='<%# Eval("Pkg_Inclusion_Hotel") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblcar" runat="server" Text='<%# Eval("Pkg_Inclusion_Transfer") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblcutlery" runat="server" Text='<%# Eval("Pkg_Inclusion_Restaurant") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblSightseen" runat="server" Text='<%# Eval("Pkg_Inclusion_Sightseen") %>' Visible="false"></asp:Label>

                                                <ul class="dastination-inclution-details-icon-area">
                                                    <li>
                                                        <asp:Panel ID="pnllgd" runat="server">
                                                            <div class="package-details-icon">
                                                                <span>
                                                                    <img src="../img/icons/flight-icon.png" alt="" />
                                                                </span><span>Flight</span>
                                                            </div>
                                                        </asp:Panel>
                                                    </li>
                                                    <li>
                                                        <asp:Panel ID="pnlcard" runat="server">
                                                            <div class="package-details-icon">
                                                                <span>
                                                                    <img src="../img/icons/car-icon.png" alt="" />
                                                                </span><span>Transfers</span>
                                                            </div>
                                                        </asp:Panel>
                                                    </li>
                                                    <li>
                                                        <asp:Panel ID="pnlSightseen" runat="server">
                                                            <div class="package-details-icon">
                                                                <span>
                                                                    <img src="../img/icons/sightseeing-icon.png" alt="" />
                                                                </span><span>Sightseeings</span>
                                                            </div>
                                                        </asp:Panel>
                                                    </li>
                                                    <li>
                                                        <asp:Panel ID="pnlbuldingd" runat="server">
                                                            <div class="package-details-icon">
                                                                <span>
                                                                    <img src="../img/icons/hotels-icon.png" alt="" />
                                                                </span><span>Hotels</span>
                                                            </div>
                                                        </asp:Panel>
                                                    </li>
                                                    <li>
                                                        <asp:Panel ID="pnlcutleryd" runat="server">
                                                            <div class="package-details-icon">
                                                                <span>
                                                                    <img src="../img/icons/food-icon.png" alt="" />
                                                                </span><span>Meals</span>
                                                            </div>
                                                        </asp:Panel>
                                                    </li>
                                                </ul>
                                                <ul class="dastination-package-price-area m-0 row">
                                                    <li class="col-auto">
                                                        <p><span class="h3 font-weight-bold ">INR <%# Eval("Per_Unit_Cost") %></span><span class="h4 text-dark"> Onwards</span></p>
                                                    </li>
                                                    <li class="text-right col">
                                                        <asp:LinkButton ID="lnkbtnInternationalBook" runat="server" class="btn btn-danger" Text="More Details" CommandArgument='<%# Eval("Pkg_code")%>' CommandName='<%# Eval("Pkg_name")%>' OnClick="lnkbtnInternationalBook_Click"></asp:LinkButton>
                                                        <%--<a href="package-details" class="btn btn-danger">More Details</a>--%>
                                                    </li>
                                                </ul>
                                            </div>
                                            </li>

                                                </ul>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="tab-pane dastination-tab-panel" id="profile" role="tabpanel">B</div>
                            <div class="tab-pane dastination-tab-panel" id="messages" role="tabpanel">C</div>
                            <div class="dastination-sidebar">
                                <div class="dastination-sidebar-contact scrolldiv">
                                    <div class="dest-sidebar-form-header">
                                        <ul class="row dest-sidebar-form-header-ul">
                                            <li class="col-auto">
                                                <i class="fas fa-phone img-flip fa-2x text-white"></i>
                                            </li>
                                            <li>
                                                <h5 class="font-weight-bold">Talk To Our Holiday Expert</h5>
                                                <p><span class="text-warning h6 font-weight-bold"><a "color: #ffcd1f !important;" href="tel:+916290952054">(+91) 6290952054 </a></span><span>(7am - 10pm)</span></p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="dest-sidebar-contact-body">
                                        <p class="h6 dest-form-title">
                                            Give us your details. Our expert will get in touch with you within 30 minutes.
                                        </p>
                                        <div class="form-group mt-4">
                                            <input id="txt_YourName" runat="server" class="form-control form-control-lg rounded-0 border-left-0 border-right-0 border-top-0" placeholder="Name" />
                                        </div>
                                        <div class="form-group ">
                                            <input type="email" class="form-control form-control-lg rounded-0 border-left-0 border-right-0 border-top-0" id="txt_emailid" runat="server" aria-describedby="emailHelp" placeholder="Enter email" />
                                        </div>
                                        <div class="form-group">

                                            <input type="tel" id="txt_mobileno" runat="server" class="form-control form-control-lg rounded-0 border-left-0 border-right-0 border-top-0" placeholder="Mobile No." />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="txt_cityname" runat="server" class="form-control form-control-lg rounded-0 border-left-0 border-right-0 border-top-0" placeholder="Your City" />
                                        </div>
                                        <div class="custom-control custom-checkbox pb-2">
                                            <input type="checkbox" class="custom-control-input" id="checkbox1" runat="server" checked="checked" />
                                            <label class="custom-control-label" for="checkbox1">I have read the T&Cs and authorize OrchidGlobal to contact me</label>
                                        </div>
                                        <div class="custom-control custom-checkbox mb-3">
                                            <input type="checkbox" class="custom-control-input" id="checkbox2" checked="checked">
                                            <label class="custom-control-label" for="checkbox2">I agree to receive updates & offers from OrchidGlobal</label>
                                        </div>
                                        <asp:LinkButton ID="btn_saveEnq" runat="server" Text="Call Me Back" type="submit" class="btn btn-danger btn-block btn-lg" OnClick="btn_saveEnq_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#btn_saveEnq").on('click', function (e) {
            var name = $('#txt_YourName').val();
            var email = $('#txt_emailid').val();
            var phone = $('#txt_mobileno').val();
            var city = $('#txt_cityname').val();

            if (name === '') {
                alert("Please input Your name");
                $('#txt_YourName').addClass("is-invalid");
                e.preventDefault();
            }
            else if (email === '') {
                alert("Please input Your Email");
                $('#txt_emailid').addClass("is-invalid");
                e.preventDefault();
            }

            else if (!$("#checkbox1").is(":checked")) {
                alert("Checkbox is Not unchecked.");
                $('#checkbox1').addClass("is-invalid");
                e.preventDefault();
            }
            else if (!$("#checkbox2").is(":checked")) {
                alert("Checkbox is Not unchecked.");
                $('#checkbox2').addClass("is-invalid");
                e.preventDefault();
            }
            else if (phone === '') {
                alert("Please input Your Phone no");
                $('#txt_mobileno').addClass("is-invalid");
                e.preventDefault();
            }
            else if (city === '') {
                alert("Please input Your City");
                $('#txt_cityname').addClass("is-invalid");
                e.preventDefault();
            } else {
                $('.validation').addClass("is-valid");
            }

        });

    </script>
</asp:Content>

