<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="gitpackage-details.aspx.cs" Inherits="gitpackage_details" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media (max-width: 991px) {
            .dastination-tab-content {
                margin: 0;
                border: none;
                padding: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
    <div class="mini-search-row">
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
    <div class="dastination-slider-area">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner ">
                <%--<div class="carousel-item destination-carousel-inner">--%>
                <asp:Repeater ID="rpt_sliderImage" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item destination-carousel-inner active  w-100">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="d-block w-100 destination-slider-image" />
                        </div>
                        <div class="carousel-item destination-carousel-inner  w-100">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image2") %>' class="d-block w-100 destination-slider-image" />
                        </div>
                        <div class="carousel-item destination-carousel-inner  w-100">
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("Image3") %>' class="d-block w-100 destination-slider-image" />
                        </div>
                        <div class="carousel-caption d-none d-md-block dastination-carousel-caption">
                            <h1><%# Eval("Pkg_name") %></h1>
                            <h4><%# Eval("pkg_duration") %>  Nights</h4>
                        </div>
                    </ItemTemplate>
                    <%-- <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image1") %>' class="d-block w-100 destination-slider-image" />
                        </ItemTemplate>--%>
                </asp:Repeater>
                <%--<img class="d-block w-100 destination-slider-image" src="img/Background/adventure-alps-clouds-206353.jpg" alt="First slide">--%>
                <%-- <div class="carousel-caption d-none d-md-block dastination-carousel-caption">
                        <h1 id="pkg_nmaeSlider" runat="server"></h1>
                        <h4 id="pkg_DutationSlider" runat="server"></h4>
                    </div>--%>
                <%-- </div>--%>
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
        <div class="package-price-box">
            <div class="dastination-slider-price-box package-details-price-tab">
                <%--<h2 class="text-black-50">From <span class="dastination-slider-price-tag-from">INR 2040.00</span></h2>--%>
                <h2 class="text-danger font-weight-bold">INR <span id="pckcost_onslider" runat="server"></span></h2>
                <%--<h6 class="text-primary font-weight-bold mb-2"></h6>--%>
                <p><span>Price Per Adult Twin Sharing Basis </span><span><i class="fas fa-pen-square dastination-slider-price-span"></i></span><u class="dastination-slider-price-span" data-toggle="modal" data-target="#bookNow">Change</u></p>
                <ul class="dastination-slider-price-btn">
                    <li>
                        <button type="button" class="btn dastination-slider-price-enquiry-btn rounded-0" data-toggle="modal" data-target="#sendEnquiry">Send Enquiry</button>
                    </li>
                    <li>
                        <a href="#" class="btn dastination-slider-price-book-btn rounded-0" data-toggle="modal" data-target="#bookNow">Book Now</a>
                    </li>
                </ul>
            </div>
            <div class="carousel-itineary-btn">
                <a href="#" data-toggle="modal" data-target="#myModalItinerary">Download Itinerary <i class="fas fa-download"></i></a>
            </div>
        </div>
    </div>

    <div class="dastination-body-area">
        <div class="container">
            <div class="row ml-12 mr-12">
                <div class="col">
                    <div class="row">
                        <div class="col-3 mt-3">
                            <span>Change Departure City</span>
                        </div>
                        <div class="col-3 mt-3">
                            <asp:DropDownList runat="server" CssClass="form-control rounded-0" ID="ddlChangeDepartureCity" OnSelectedIndexChanged="ddlChangeDepartureCity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>

                        <div class="col-3 mt-3">
                            <span>Change Departure Date</span>
                        </div>
                        <div class="col-3 mt-3">
                            <asp:DropDownList runat="server" CssClass="form-control rounded-0" ID="ddlSelectDate" AutoPostBack="true" OnSelectedIndexChanged="ddlSelectDate_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="dastination-body-area">
        <div class="container">
            <div class="row">
                <div class="col-12 pl-sm-0">
                    <div class="dastination-package-main">
                        <ul class="nav nav-tabs dastination-nav-tabs mt-4 text-center" role="tablist">
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link active " data-toggle="tab" href="#home" role="tab">Itinerary</a>
                            </li>
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link border-left-0" data-toggle="tab" href="#InclusionsExclusions" role="tab">Inclusions & Exclusions</a>
                            </li>
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link" data-toggle="tab" href="#Policy" role="tab">Payment & Cancellation Policy</a>
                            </li>
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link" data-toggle="tab" href="#TermsConditions" role="tab">Terms & Conditions</a>
                            </li>
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link" data-toggle="tab" href="#ItineraryDetailed" role="tab">Package Itinerary</a>
                            </li>
                            <li class="nav-item rounded-0">
                                <a class="nav-link dastination-nav-link" data-toggle="tab" href="#Overview" role="tab">Overview</a>
                            </li>
                        </ul>
                        <div class="tab-content pr-sm-0 dastination-tab-content">
                            <asp:Label ID="lblpgkid" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblPkg_type" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblpkgname" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lbl_Departure_City" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lbl_Departure_Date" runat="server" Visible="false"></asp:Label>
                            <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="d-block w-100 destination-slider-image" />--%>
                            <div class="tab-pane active " id="home" role="tabpanel">
                                <asp:Repeater ID="rpt_pkgdetails" runat="server">
                                    <ItemTemplate>
                                        <div class="pr-sm-4 pl-sm-2">
                                            <div id="accordion">
                                                <div class="card rounded-0 border-0 mb-1">
                                                    <div class="card-header bg-transparent row m-0 p-0 border-0 tabpanelforjs1" id="headingOne">
                                                        <div class="col-md-8 col-3 p-0">
                                                            <a class="btn text-left w-100  rounded-0 text-white itn-title-tab tabpanelforjs2" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Day- <%# Eval("day_count") %>
                                                            </a>
                                                        </div>
                                                        <div class="col-md-2 col-5 p-0 text-center">
                                                            <p class="btn w-100 border rounded-0 itn-title-tab-date"><%# Eval("pkg_date") %></p>
                                                            <%--day wise date --%>
                                                        </div>
                                                        <div class="col-md-2 col-4 text-center p-0">
                                                            <p class="btn w-100 border border-danger rounded-0 text-danger itn-title-tab-time"><span><i class="far fa-clock "></i></span><span><%# Eval("pkg_time") %></span> </p>
                                                            <%--TIME--%>
                                                        </div>
                                                    </div>

                                                    <div id="collapseOne" class="collapse show tabpanelforjs3 tabpanelforjs4" aria-labelledby="headingOne" data-parent="#accordion">
                                                        <div class="card-body pl-2 pr-0">
                                                            <div>
                                                                <%--flight 1--%>
                                                                <asp:Panel ID="pnl_Flight" runat="server" Visible="false">
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-plane-departure fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Flight </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-sm-0">
                                                                        <div class="col-3 col-md-2 pt-sm-2">
                                                                            <span><i class="fas fa-plane fa-lg  text-primary mr-3"></i></span>
                                                                            <asp:Label ID="lbl_flight" runat="server" class="h6 " Text='<%# Eval("Flight_Name1") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-4 col-md-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("from1") %></h5>
                                                                            <p><%# Eval("flight_datetime1") %></p>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle d-sm-block">
                                                                            <span><i class="fas fa-plane fa-lg pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-2 pt-2 text-center align-middle  d-sm-block">
                                                                            <span class="h6 text-primary "><%# Eval("stops1") %> Stop(s)</span>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle  d-sm-block">
                                                                            <span><i class="fas fa-long-arrow-alt-right fa-2x pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-4 col-md-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("to1") %> </h5>
                                                                            <p><%# Eval("to_datetime1") %></p>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div>
                                                                <%--flight 2--%>
                                                                <asp:Panel ID="pnl_Flight2" runat="server" Visible="false">
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-plane-departure fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Flight </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col-3 col-md-2 pt-2">
                                                                            <span><i class="fas fa-plane fa-lg  text-primary mr-3"></i></span>
                                                                            <asp:Label ID="lbl_flight2" runat="server" class="h6 " Text='<%# Eval("Flight_Name2") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-4 col-md-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("from2") %></h5>
                                                                            <p><%# Eval("flight_datetime2") %></p>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle d-sm-block">
                                                                            <span><i class="fas fa-plane fa-lg pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-2 pt-2 text-center align-middle d-sm-block">
                                                                            <span class="h6 text-primary "><%# Eval("stops2") %> Stop(s)</span>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle d-sm-block">
                                                                            <span><i class="fas fa-long-arrow-alt-right fa-2x pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-3 col-md-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("to2") %> </h5>
                                                                            <p><%# Eval("to_datetime2") %></p>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <asp:Panel ID="pnl_Transfer" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="card-body pt-0 pl-0 pr-0">
                                                                        <div class="col-12 p-0">
                                                                            <span><i class="fas fa-car fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Transfer </span>
                                                                        </div>
                                                                        <hr class="w-100" />
                                                                        <div class="row pb-3 ml-0">
                                                                            <div class="col-12 pt-2">
                                                                                <asp:Panel ID="pnl_transfer_name1" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name1" runat="server" class="h6 " Text='<%# Eval("transfer_name1") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name2" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name2" runat="server" class="h6 " Text='<%# Eval("transfer_name2") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name3" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name3" runat="server" class="h6 " Text='<%# Eval("transfer_name3") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name4" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name4" runat="server" class="h6 " Text='<%# Eval("transfer_name4") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name5" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name5" runat="server" class="h6 " Text='<%# Eval("transfer_name5") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_Hotels" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-hotel fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Hotels </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-sm-3 ml-sm-0">
                                                                        <div class="col-2 pr-sm-0 d-sm-block">
                                                                            <span>
                                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hotel1img") %>' class="img-fluid" />
                                                                            </span>
                                                                        </div>
                                                                        <div class="col-3 col-md-2">
                                                                            <h6 class="font-weight-bold"><%# Eval("daynight1") %>  Night </h6>
                                                                        </div>

                                                                        <div class="col-6 col-md-4">
                                                                            <asp:Label ID="lbl_hotel_name1" runat="server" class="h6 text-primary" Text='<%# Eval("hotel_name1") %>'></asp:Label>
                                                                            <%--<h6 class="h6 text-primary"><%# Eval("hotel_name1") %></h6>--%>
                                                                            <%--hotel name--%>
                                                                            <p class="h6"><span class="font-weight-bold">Room Type : </span><%# Eval("roomtype1") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Meal Type : </span><%# Eval("meal_type1") %></p>
                                                                        </div>
                                                                        <div class="col col-3 p-0">
                                                                            <p class="h6"><span class="font-weight-bold">In</span> <%# Eval("indate1") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Out</span> <%# Eval("outdate1") %></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_Hotels2" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-sm-0">
                                                                        <span><i class="fas fa-hotel fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Hotels </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-sm-3 ml-sm-0">
                                                                        <div class="col-4 col-md-2 pr-sm-0 d-sm-block">
                                                                            <span>
                                                                                <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("hotel2img") %>' class="img-fluid" />
                                                                            </span>
                                                                        </div>
                                                                        <div class="col-4 col-md-2">
                                                                            <h6 class="font-weight-bold"><%# Eval("daynight2") %>  Night(s)  <span class="d-block mt-2"><%# Eval("daynight2") %>  Day(s)</span> </h6>
                                                                        </div>

                                                                        <div class="col-4 col-md-4">
                                                                            <asp:Label ID="lbl_hotel_name2" runat="server" class="h6 text-primary" Text='<%# Eval("hotel_name2") %>'></asp:Label>
                                                                            <%--<h6 class="h6 text-primary"><%# Eval("hotel_name1") %></h6>--%>
                                                                            <%--hotel name--%>
                                                                            <p class="h6"><span class="font-weight-bold">Room Type : </span><%# Eval("roomtype2") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Meal Type : </span><%# Eval("meal_type2") %></p>
                                                                        </div>
                                                                        <div class="col col-4 p-0">
                                                                            <p class="h6"><span class="font-weight-bold">In</span> <%# Eval("indate2") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Out</span> <%# Eval("outdate2") %></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_Sightseeing" runat="server" Visible="true">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-sm-0">
                                                                        <span><i class="fas fa-images fa-2x text-danger mr-3"></i></span><span class="h5 text-danger">Sightseeing </span>
                                                                    </div>

                                                                    <hr class="w-100" />
                                                                    <div class="row pb-sm-3 ml-sm-0">
                                                                        <div class="col col-4">
                                                                            <asp:Panel ID="pnl_ss1place" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss1place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2place" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss2place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3place" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss3place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4place" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss4place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5place" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss5place") %></p>
                                                                            </asp:Panel>

                                                                            <asp:Label ID="lbl_ss1place" runat="server" Visible="false" Text='<%# Eval("ss1place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss2place" runat="server" Visible="false" Text='<%# Eval("ss2place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss3place" runat="server" Visible="false" Text='<%# Eval("ss3place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss4place" runat="server" Visible="false" Text='<%# Eval("ss4place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss5place" runat="server" Visible="false" Text='<%# Eval("ss5place") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-5">
                                                                            <asp:Panel ID="pnl_ss1name" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss1name" runat="server" class="h6 " Text='<%# Eval("ss1name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2name" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss2name" runat="server" class="h6 " Text='<%# Eval("ss2name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3name" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss3name" runat="server" class="h6 " Text='<%# Eval("ss3name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4name" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss4name" runat="server" class="h6 " Text='<%# Eval("ss4name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5name" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss5name" runat="server" class="h6 " Text='<%# Eval("ss5name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-3">
                                                                            <asp:Panel ID="pnl_ss1time" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss1time" runat="server" class="h6 " Text='<%# Eval("ss1time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2time" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss2time" runat="server" class="h6 " Text='<%# Eval("ss2time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3time" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss3time" runat="server" class="h6 " Text='<%# Eval("ss3time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4time" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss4time" runat="server" class="h6 " Text='<%# Eval("ss4time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5time" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss5time" runat="server" class="h6 " Text='<%# Eval("ss5time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_Meals" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-sm-0">
                                                                        <span><i class="fas fa-utensils fa-2x text-danger mr-3"></i></span><span class="h5 text-danger">Meals & Restaurant </span>
                                                                    </div>

                                                                    <hr class="w-100" />
                                                                    <div class="row pb-sm-3 ml-sm-0">
                                                                        <div class="col col-4">
                                                                            <asp:Panel ID="pnl_mealname1" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname1" runat="server" Text='<%# Eval("mealname1") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealname2" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname2" runat="server" Text='<%# Eval("mealname2") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealname3" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname3" runat="server" Text='<%# Eval("mealname3") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-5 col-md-6">
                                                                            <asp:Panel ID="pnl_mealtype1" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype1") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealtype2" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype2") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealtype3" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype3") %></p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-3 col-md-2">
                                                                            <asp:Panel ID="pnl_meal_time1" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time1") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_meal_time2" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time2") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_meal_time3" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time3") %></p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="tab-pane " id="InclusionsExclusions" role="tabpanel">
                                <h4>Inclusions :</h4>
                                <span id="InclutionsAndExclusions" runat="server"></span>
                                <br />
                                <h4>Exclusions :</h4>
                                <span id="Exclusions" runat="server"></span>
                            </div>
                            <div class="tab-pane " id="Policy" role="tabpanel">
                                <h4>Payment Policy :</h4>
                                <span id="txtPayment_Policy" runat="server"></span><%--Payment Policy--%>
                                <br />
                                <h4>Cancellation Policy :</h4>
                                <span id="CancellationPolicy" runat="server"></span><%--Cancellation Policy--%>
                            </div>
                            <div class="tab-pane" id="TermsConditions" role="tabpanel">
                                <span id="txt_TermsAndCondition" runat="server"></span><%--Terms & Conditions--%>
                            </div>
                            <div class="tab-pane" id="ItineraryDetailed" role="tabpanel">
                                <span id="txt_ItineraryDetailed" runat="server"></span><%--Itinerary Detailed--%>
                            </div>
                            <div class="tab-pane" id="Overview" role="tabpanel">
                                <span id="txt_Overview" runat="server"></span><%--Overview--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--	Modal Area--%>
    <!-- Button trigger modal -->
    <!-- Modal  for registation-->
    <div class="modal " id="sendEnquiry" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg package-details-modal-for-enquiry-lg" role="document">
            <div class="modal-content package-details-modal-for-enquiry">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel">Get the Best Holiday Planned by Experts!
                    </h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8 col-sm-12 pr-sm-0">
                            <div class="modal-call-option">
                                <h4 class="text-danger font-weight-bold pb-4"><span class="package-modal-call-icon"><i class="fas fa-phone img-flip text-white"></i></span><span>Call (+91)8100667733</span></h4>
                                <hr class="w-100" />

                                <p class="pt-sm-3 h5 pl-sm-5 mr-sm-5 pr-sm-3">Enter your contact details and we will plan the best holiday suiting all your requirements.</p>
                            </div>
                            <div class="package-enquiry-modal-form pr-sm-4 pl-sm-3 mt-sm-4">
                                <div class="row">
                                    <div class="col col-6">
                                        <asp:TextBox ID="txt_YourName" runat="server" CssClass="form-control rounded-0" placeholder="Your Name"></asp:TextBox>
                                    </div>
                                    <div class="col col-6">
                                        <asp:TextBox ID="txt_emailid" runat="server" TextMode="Email" CssClass="form-control rounded-0" placeholder="Your Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-5 col-4 pr-0">
                                        <asp:TextBox ID="txt_mobileno" runat="server" TextMode="Number" CssClass="form-control rounded-0" placeholder="Phone With Country Code"></asp:TextBox>
                                    </div>
                                    <div class="col-4 col-md-3 pr-0">
                                        <asp:TextBox ID="txt_cityname" runat="server" CssClass="form-control rounded-0" placeholder="Your City "></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 col-4">
                                        <asp:TextBox ID="txt_traveldate" runat="server" TextMode="Date" CssClass="form-control rounded-0" placeholder="Travel Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-auto col-sm-12 mt-2 pr-0">
                                        <span>No. of Traveller(s) :</span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="input-group input-group-custom">
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Adult">
                                                    <span>-</span>
                                                </button>
                                            </span>
                                            <input id="txt_noof_Adult" runat="server" type="text" name="quant[1]" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Adult">
                                                    <span>+</span>
                                                </button>
                                            </span>
                                        </div>
                                        <small class="text-secondary">Adult (12yrs +)</small>
                                    </div>
                                    <div class="col-auto">
                                        <div class="input-group input-group-custom">
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Child">
                                                    <span>-</span>
                                                </button>
                                            </span>
                                            <input id="txt_noof_Child" runat="server" type="text" name="quant[2]" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Child">
                                                    <span>+</span>
                                                </button>
                                            </span>
                                        </div>
                                        <small class="text-secondary">Child (2-12yrs)</small>
                                    </div>
                                    <div class="col-auto">
                                        <div class="input-group input-group-custom">
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Infant">
                                                    <span>-</span>
                                                </button>
                                            </span>
                                            <input id="txt_noof_Infant" runat="server" type="text" name="ctl00$BodyContentPlaceHolder$txt_noof_Adult" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Infant">
                                                    <span>+</span>
                                                </button>
                                            </span>
                                        </div>
                                        <small class="text-secondary">Infant (0-2yrs)</small>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col text-right">
                                        <asp:TextBox ID="txt_coment" runat="server" Rows="3" TextMode="MultiLine" CssClass="form-control rounded-0" placeholder="Type your message "></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col text-right">
                                        <asp:LinkButton ID="btn_saveEnq" runat="server" Text="Submit" class="btn btn-danger btn-lg font-weight-bold rounded-0 w-50" type="submit" OnClick="btn_saveEnq_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col d-sm-block pl-0" id="Div1" runat="server">
                            <div class="package-modal-enquiry-image">
                                <asp:Repeater ID="rptImageEnq" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="w-100" alt="" />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box text-center">
                                        <h5 id="packagename2" runat="server"></h5>
                                        <h6 id="pkgDuration2" runat="server">NIGHTS</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal  for Check Price & Availability-->
    <div class="modal animated fadeIn delay-5s " id="bookNow" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg package-details-modal-for-enquiry-lg" role="document">
            <div class="modal-content package-details-modal-for-enquiry">
                <div class="modal-header">
                    <h2 class="modal-title">Check Price & Availability from <span id="departure" runat="server"></span>- Flights Included
                    </h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8 col-sm-12 pr-sm-0">
                            <div class="modal-call-option">
                                <h4 class="text-danger font-weight-bold pb-4"><span class="package-modal-call-icon"><i class="fas fa-phone img-flip text-white"></i></span><span>Call (+91)8100667733</span></h4>
                                <hr class="w-100" />
                                <p class="pt-3 h5 pl-sm-5 mr-sm-5 pr-sm-3">Enter your contact details and we will plan the best holiday suiting all your requirements.</p>
                            </div>
                            <div class="package-enquiry-modal-form pr-sm-4 pl-sm-3 mt-sm-4">
                                <div class="row">
                                    <div class="col">
                                        <p class="mb-2 font-weight-bold text-danger">Your Departure Date</p>
                                        <span id="lbl_departureDate" runat="server"></span><%--desplay departureDate + cost--%>
                                        <asp:Label ID="HotelTwinRoomCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="HotelTripleRoomCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="HotelSingleRoomCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="ChildWithBedCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="ChildWithoutBedCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="VisaCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="AirfareCost" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="AutoSP1" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="AutoSP2" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="AutoSP3" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="SPAllocation1" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="SPAllocation2" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="SPAllocation3" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="DepartureDate" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <p class="mb-2 font-weight-bold text-danger">Your Departure City</p>
                                        <span id="lbl_DepartureCity" runat="server"></span>
                                    </div>
                                    <div class="col">
                                        <p class="mb-2 font-weight-bold text-danger">Select Customer State*</p>
                                        <asp:DropDownList runat="server" CssClass="form-control rounded-0" ID="ddlCustomerState"></asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col d-sm-block pl-sm-0" id="gsg" runat="server">
                            <div class="package-modal-enquiry-image">
                                <asp:Repeater ID="rpt_distinationImge" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="w-100" alt="" />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box text-center">
                                        <h5 id="packagename" runat="server"></h5>
                                        <h6 id="pkgDuration" runat="server">NIGHTS</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="package-enquiry-modal-form pr-sm-4 pl-sm-3 mt-sm-4">
                        <div class="input_fields_wrap">
                            <div class="row mt-4">
                                <div class="col-auto col-12 mt-2 pr-0">
                                    <br />
                                    <span>Room 1 :</span>
                                </div>
                                <div class="col-md-auto col-6">
                                    <small class="text-secondary">Adult</small>
                                    <div class="input-group input-group-custom">
                                        <asp:DropDownList runat="server" ID="ddlAdults1" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <small class="text-secondary">(12yrs +)</small>
                                </div>
                                <div class="col-md-auto col-6 ddlAdultAge">
                                    <small class="text-secondary">Child(with bed)</small>
                                    <div class="input-group input-group-custom">

                                        <asp:DropDownList runat="server" ID="ddlchildAge1" class="form-control rounded-0 ddlAdultSelect1">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                        </asp:DropDownList>

                                    </div>
                                    <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 1--%>
                                </div>
                                <div class="col-md-auto col-6 aanwithb">
                                    <small class="text-secondary">Child Age (With Bed)</small>
                                    <div class="input-group input-group-custom">
                                        <asp:DropDownList runat="server" ID="DropDownList4" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                            <asp:ListItem Value="1"> < 1 </asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12"> < 12</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <small class="text-secondary">(12yrs +)</small>
                                </div>
                                <div class="col-md-auto col-6 ddlAdultAge1">
                                    <small class="text-secondary">Child(without bed)</small>
                                    <div class="input-group input-group-custom">

                                        <asp:DropDownList runat="server" ID="ddlchildAge2" class="form-control rounded-0 ">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                        </asp:DropDownList>

                                    </div>
                                    <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 2--%>
                                </div>
                                <div class="col-md-auto col-6 aanwithoutb">
                                    <small class="text-secondary">Child Age (Without Bed)</small>
                                    <div class="input-group input-group-custom">
                                        <asp:DropDownList runat="server" ID="DropDownList5" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                            <asp:ListItem Value="1">< 1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">< 12</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <small class="text-secondary">(12yrs +)</small>
                                </div>
                                <div class="col-md-auto col-6 ddlAdultAge1">
                                    <small class="text-secondary">Infant</small>
                                    <div class="input-group input-group-custom">

                                        <asp:DropDownList runat="server" ID="DropDownList1" class="form-control rounded-0 ">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                        </asp:DropDownList>

                                    </div>
                                    <small class="text-secondary">(0-2 yrs)</small>  <%--CHILD AGE 2--%>
                                </div>
                                <div class="col-md-auto p-0">
                                    <br />
                                    <asp:Button ID="btnadd1" runat="server" Text="+" class="add_field_button btn btn-success" />
                                    <%-- <button class="add_field_button btn btn-success">+</button>
                                                     <button class="add_field_button btn btn-success">-</button>--%>
                                </div>
                            </div>
                            <%--2nd div --%>
                            <div id="div_2nd" class="row" runat="server">
                                <div class="col-md-auto col-12">
                                    <div class="row mt-3">
                                        <div class="col-md-auto col-12 mt-2 pr-0">
                                            <br />
                                            <span>Room 2 :</span>
                                        </div>
                                        <div class="col-md-auto col-6">
                                            <small class="text-secondary">Adult</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlAdults2" CssClass="form-control rounded-0 ddlAdultSelect2">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6" id="divddlChildrenNo2" runat="server" visible="false">
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlChildrenNo2" CssClass="form-control rounded-0 ddlChildSelect2">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">No of Children</small>
                                        </div>
                                        <div class="col-md-auto  col-6 divshow2">
                                            <small class="text-secondary">Child(with bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlchildAge3" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 3--%>
                                        </div>
                                        <div class="col-md-auto  col-6 aanwithb1">
                                            <small class="text-secondary">Child Age (With Bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="DropDownList6" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">< 1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">< 12</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6 divshow12">
                                            <small class="text-secondary">Child(without bed)</small>
                                            <div class="input-group input-group-custom">

                                                <asp:DropDownList runat="server" ID="ddlchildAge4" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 4--%>
                                        </div>
                                        <div class="col-md-auto col-6 aanwithoutb1">
                                            <small class="text-secondary">Child Age (Without Bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="DropDownList7" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">< 1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">< 12</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6 ddlAdultAge1">
                                            <small class="text-secondary">Infant</small>
                                            <div class="input-group input-group-custom">

                                                <asp:DropDownList runat="server" ID="DropDownList2" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                            <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>

                                            </div>
                                            <small class="text-secondary">(0-2 yrs)</small>  <%--CHILD AGE 2--%>
                                        </div>
                                        <div class="col-md-auto col-6 p-0 mt-4">
                                            <asp:Button ID="btnadd2" runat="server" Text="+" class="add_field_button btn btn-success col-auto " />
                                            <asp:Button ID="btn_minus1" runat="server" Text="X" class="remove_field btn btn-danger col-auto " />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%--3rd div --%>
                            <div id="div_3rd" class="row" runat="server">
                                <div class="col-md-auto col-12">
                                    <div class="row mt-3">
                                        <div class="col-md-auto col-12 mt-2 pr-0">
                                            <br />
                                            <span>Room 3 :</span>
                                        </div>
                                        <div class="col-md-auto col-6">
                                            <small class="text-secondary">Adult</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlAdults3" CssClass="form-control rounded-0 ddlAdultSelect3">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6" id="divddlChildrenNo3" runat="server" visible="false">
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlChildrenNo3" CssClass="form-control rounded-0 ddlChildSelect3">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">No of Children</small>
                                        </div>
                                        <div class="col-md-auto col-6 divshow3">
                                            <small class="text-secondary">Child(with bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlchildAge5" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <%--                                                                    <asp:ListItem Value="2">2</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 5--%>
                                        </div>
                                        <div class="col-md-auto col-6 aanwithb2">
                                            <small class="text-secondary">Child Age (With Bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="DropDownList8" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">< 1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">< 12</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6 divshow13">
                                            <small class="text-secondary">Child(without bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="ddlchildAge6" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(Below 12 yrs)</small>  <%--CHILD AGE 6--%>
                                        </div>
                                        <div class="col-md-auto col-6 aanwithoutb2">
                                            <small class="text-secondary">Child Age (Without Bed)</small>
                                            <div class="input-group input-group-custom">
                                                <asp:DropDownList runat="server" ID="DropDownList9" CssClass="form-control rounded-0 ddlAdultSelect1" OnSelectedIndexChanged="ddlAdults1_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">< 1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">< 12</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <small class="text-secondary">(12yrs +)</small>
                                        </div>
                                        <div class="col-md-auto col-6 ddlAdultAge1">
                                            <small class="text-secondary">Infant</small>
                                            <div class="input-group input-group-custom">

                                                <asp:DropDownList runat="server" ID="DropDownList3" class="form-control rounded-0 ">
                                                    <asp:ListItem Value="0">0</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>


                                                </asp:DropDownList>

                                            </div>
                                            <small class="text-secondary">(0-2 yrs)</small>  <%--CHILD AGE 2--%>
                                        </div>
                                        <div class="col-md-auto col-3">
                                            <asp:Button ID="btnminus3" runat="server" Text="X" class="remove_field btn btn-danger col-auto mt-4" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col text-center">
                                <%--<a href="checkout.aspx" class="btn btn-danger btn-lg font-weight-bold rounded-0 w-50" type="submit">SUBMIT</a>--%>
                                <asp:LinkButton ID="lnlbtn_checkoutsubmit" runat="server" Text="Submit" class="btn btn-danger btn-lg font-weight-bold rounded-0 w-50" OnClick="lnlbtn_checkoutsubmit_Click"></asp:LinkButton>
                                <span id="TotalPrice" runat="server"></span>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>


    <%--<<<<<<<<<<<<<<Download Itinerary>>>>>>>>>>>>>>>>--%>

    <div id="divdocprint" runat="server">
        <div class="modal fade" id="myModalItinerary" style="margin-left: -216px;">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 900px">
                    <!-- Modal Header Start-->

                    <div class="modal-header">
                        <div id="header_text" class="text-center">
                            <button type="button" id="close_btn" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <span id="modal_printbtn" style="float: none; margin-right: 20px;">
                                <a id="print_btn" onclick="PrintContent()"><i class="fa fa-print"></i></a>
                                <%-- <a id="word_btn" class="word-export btn jquery-word-export btn-sm btn-info btn" href="javascript:void(0)"><i class="fa fa-file-word-o" aria-hidden="true"></i></a>
                                <a id="mail_btn" class="btn-sm btn-warning btn" data-toggle="modal" style="cursor: pointer; text-decoration: none; color: #fff" data-target="#myModal2"><i class="fa fa-envelope" aria-hidden="true"></i></a>--%>
                            </span>
                        </div>
                    </div>
                    <div class="row pb-12 ml-0">
                        <div class="col-6 pt-6">
                            <h5>Get the Best Holiday Planned by Experts!.</h5>
                        </div>
                        <div class="col-6 pt-6">
                            <h5 class="text-danger font-weight-bold pb-4"><span class="package-modal-call-icon"><i class="fas fa-phone img-flip text-white"></i></span><span>Call (+91)8100667733</span></h5>
                        </div>
                    </div>
                    <hr class="w-100" />
                    <div style="text-align: center">
                        <h3 id="pkgname_forprint" runat="server" class="modalheader" style="padding: 7px 0"></h3>
                        <h4 id="PricePerAdult_forprint" runat="server" class="modalheader" style="padding: 7px 0"></h4>
                    </div>
                    <%-- <div style="float: right; margin-right: 50px;">
                        <asp:Repeater ID="rptDownloadIttinary" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item destination-carousel-inner active  w-100">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="d-block w-100 destination-slider-image" />
                                </div>
                                   <div class="carousel-caption d-none d-md-block dastination-carousel-caption">
                                    <h1><%# Eval("Pkg_name") %></h1>
                                    <h4><%# Eval("pkg_duration") %>  Nights</h4>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>--%>

                    <div id="export">
                        <div id="modaldivbody" runat="server" style="padding: 15px 0;">
                            <asp:Panel ID="modal_pkg_dtls" runat="server">
                                <asp:Repeater ID="rpt_downloadIttinary" runat="server">
                                    <ItemTemplate>
                                        <div class="pr-4 pl-2">
                                            <div id="accordion">
                                                <div class="card rounded-0 border-0 mb-1">
                                                    <div class="card-header bg-transparent row m-0 p-0 border-0 tabpanelforjs1" id="headingOne">
                                                        <div class="col-8 p-0">
                                                            <a class="btn text-left w-100  rounded-0 text-white itn-title-tab tabpanelforjs2" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="##collapseOne">Day- <%# Eval("day_count") %>
                                                            </a>
                                                        </div>
                                                        <div class="col-2 p-0 text-center">
                                                            <p class="btn w-100 border rounded-0 itn-title-tab-date"><%# Eval("pkg_date") %></p>
                                                            <%--day wise date --%>
                                                        </div>
                                                        <div class="col-2 text-center">
                                                            <p class="btn w-100 border border-danger rounded-0 text-danger itn-title-tab-time"><span><i class="far fa-clock "></i></span><span><%# Eval("pkg_time") %></span> </p>
                                                            <%--TIME--%>
                                                        </div>
                                                    </div>

                                                    <div id="collapseOne" class="collapse show tabpanelforjs3 tabpanelforjs4" aria-labelledby="headingOne" data-parent="#accordion">
                                                        <div class="card-body pl-2 pr-0">
                                                            <div>
                                                                <%--flight 1--%>
                                                                <asp:Panel ID="pnl_FlightD" runat="server" Visible="false">
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-plane-departure fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Flight </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col-2 pt-2">
                                                                            <span><i class="fas fa-plane fa-lg  text-primary mr-3"></i></span>
                                                                            <asp:Label ID="lbl_flightD" runat="server" class="h6 " Text='<%# Eval("Flight_Name1") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("from1") %></h5>
                                                                            <p><%# Eval("flight_datetime1") %></p>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle">
                                                                            <span><i class="fas fa-plane fa-lg pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-2 pt-2 text-center align-middle">
                                                                            <span class="h6 text-primary "><%# Eval("stops1") %> Stop(s)</span>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle">
                                                                            <span><i class="fas fa-long-arrow-alt-right fa-2x pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("to1") %> </h5>
                                                                            <p><%# Eval("to_datetime1") %></p>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div>
                                                                <%--flight 2--%>
                                                                <asp:Panel ID="pnl_Flight2D" runat="server" Visible="false">
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-plane-departure fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Flight </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col-2 pt-2">
                                                                            <span><i class="fas fa-plane fa-lg  text-primary mr-3"></i></span>
                                                                            <asp:Label ID="lbl_flight2D" runat="server" class="h6 " Text='<%# Eval("Flight_Name2") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("from2") %></h5>
                                                                            <p><%# Eval("flight_datetime2") %></p>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle">
                                                                            <span><i class="fas fa-plane fa-lg pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-2 pt-2 text-center align-middle">
                                                                            <span class="h6 text-primary "><%# Eval("stops2") %> Stop(s)</span>
                                                                        </div>
                                                                        <div class="col-1 text-center align-middle">
                                                                            <span><i class="fas fa-long-arrow-alt-right fa-2x pt-2"></i></span>
                                                                        </div>
                                                                        <div class="col-3">
                                                                            <h5 class="font-weight-bold"><%# Eval("to2") %> </h5>
                                                                            <p><%# Eval("to_datetime2") %></p>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <asp:Panel ID="pnl_TransferD" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="card-body pt-0 pl-0 pr-0">
                                                                        <div class="col-12 p-0">
                                                                            <span><i class="fas fa-car fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Transfer </span>
                                                                        </div>
                                                                        <hr class="w-100" />
                                                                        <div class="row pb-3 ml-0">
                                                                            <div class="col-12 pt-2">
                                                                                <asp:Panel ID="pnl_transfer_name1D" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name1D" runat="server" class="h6 " Text='<%# Eval("transfer_name1") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name2D" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name2D" runat="server" class="h6 " Text='<%# Eval("transfer_name2") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name3D" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name3D" runat="server" class="h6 " Text='<%# Eval("transfer_name3") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name4D" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name4D" runat="server" class="h6 " Text='<%# Eval("transfer_name4") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                                <asp:Panel ID="pnl_transfer_name5D" runat="server" Visible="false">
                                                                                    <p>
                                                                                        <span class="align-middle"><i class="fas fa-car-alt fa-lg text-primary mr-3"></i></span>
                                                                                        <asp:Label ID="lbl_transfer_name5D" runat="server" class="h6 " Text='<%# Eval("transfer_name5") %>'></asp:Label>
                                                                                    </p>
                                                                                </asp:Panel>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_HotelsD" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-hotel fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Hotels </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col-2 pr-0">
                                                                            <span>
                                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hotel1img") %>' class="img-fluid" />
                                                                            </span>
                                                                        </div>
                                                                        <div class="col-2">
                                                                            <h6 class="font-weight-bold"><%# Eval("daynight1") %>  Night <%--<span class="d-block mt-2"><%# Eval("daynight1") %>  Day(s)</span>--%> </h6>
                                                                        </div>

                                                                        <div class="col-4">
                                                                            <asp:Label ID="lbl_hotel_name1D" runat="server" class="h6 text-primary" Text='<%# Eval("hotel_name1") %>'></asp:Label>
                                                                            <%--<h6 class="h6 text-primary"><%# Eval("hotel_name1") %></h6>--%>
                                                                            <%--hotel name--%>
                                                                            <p class="h6"><span class="font-weight-bold">Room Type : </span><%# Eval("roomtype1") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Meal Type : </span><%# Eval("meal_type1") %></p>
                                                                        </div>
                                                                        <div class="col p-0">
                                                                            <p class="h6"><span class="font-weight-bold">In</span> <%# Eval("indate1") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Out</span> <%# Eval("outdate1") %></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_Hotels2D" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-hotel fa-2x  text-danger mr-3"></i></span><span class="h5 text-danger">Hotels </span>
                                                                    </div>
                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col-2 pr-0">
                                                                            <span>
                                                                                <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("hotel2img") %>' class="img-fluid" />
                                                                            </span>
                                                                        </div>
                                                                        <div class="col-2">
                                                                            <h6 class="font-weight-bold"><%# Eval("daynight2") %>  Night(s)  <span class="d-block mt-2"><%# Eval("daynight2") %>  Day(s)</span> </h6>
                                                                        </div>

                                                                        <div class="col-4">
                                                                            <asp:Label ID="lbl_hotel_name2D" runat="server" class="h6 text-primary" Text='<%# Eval("hotel_name2") %>'></asp:Label>
                                                                            <%--<h6 class="h6 text-primary"><%# Eval("hotel_name1") %></h6>--%>
                                                                            <%--hotel name--%>
                                                                            <p class="h6"><span class="font-weight-bold">Room Type : </span><%# Eval("roomtype2") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Meal Type : </span><%# Eval("meal_type2") %></p>
                                                                        </div>
                                                                        <div class="col p-0">
                                                                            <p class="h6"><span class="font-weight-bold">In</span> <%# Eval("indate2") %></p>
                                                                            <p class="h6"><span class="font-weight-bold">Out</span> <%# Eval("outdate2") %></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_SightseeingD" runat="server" Visible="true">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-images fa-2x text-danger mr-3"></i></span><span class="h5 text-danger">Sightseeing </span>
                                                                    </div>

                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col">
                                                                            <asp:Panel ID="pnl_ss1placeD" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss1place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2placeD" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss2place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3placeD" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss3place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4placeD" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss4place") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5placeD" runat="server">
                                                                                <p class="h6"><span class="font-weight-bold"><i class="fas fa-images text-primary mr-3"></i></span><%# Eval("ss5place") %></p>
                                                                            </asp:Panel>

                                                                            <asp:Label ID="lbl_ss1placeD" runat="server" Visible="false" Text='<%# Eval("ss1place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss2placeD" runat="server" Visible="false" Text='<%# Eval("ss2place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss3placeD" runat="server" Visible="false" Text='<%# Eval("ss3place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss4placeD" runat="server" Visible="false" Text='<%# Eval("ss4place") %>'></asp:Label>
                                                                            <asp:Label ID="lbl_ss5placeD" runat="server" Visible="false" Text='<%# Eval("ss5place") %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <asp:Panel ID="pnl_ss1nameD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss1nameD" runat="server" class="h6 " Text='<%# Eval("ss1name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2nameD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss2nameD" runat="server" class="h6 " Text='<%# Eval("ss2name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3nameD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss3nameD" runat="server" class="h6 " Text='<%# Eval("ss3name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4nameD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss4nameD" runat="server" class="h6 " Text='<%# Eval("ss4name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5nameD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss5nameD" runat="server" class="h6 " Text='<%# Eval("ss5name") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-2">
                                                                            <asp:Panel ID="pnl_ss1timeD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss1timeD" runat="server" class="h6 " Text='<%# Eval("ss1time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss2timeD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss2timeD" runat="server" class="h6 " Text='<%# Eval("ss2time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss3timeD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss3timeD" runat="server" class="h6 " Text='<%# Eval("ss3time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss4timeD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss4timeD" runat="server" class="h6 " Text='<%# Eval("ss4time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_ss5timeD" runat="server">
                                                                                <p class="h6">
                                                                                    <asp:Label ID="lbl_ss5timeD" runat="server" class="h6 " Text='<%# Eval("ss5time") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnl_MealsD" runat="server" Visible="false">
                                                                <div>
                                                                    <hr class="w-100" />
                                                                    <div class="col-12 p-0">
                                                                        <span><i class="fas fa-utensils fa-2x text-danger mr-3"></i></span><span class="h5 text-danger">Meals & Restaurant </span>
                                                                    </div>

                                                                    <hr class="w-100" />
                                                                    <div class="row pb-3 ml-0">
                                                                        <div class="col">
                                                                            <asp:Panel ID="pnl_mealname1D" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname1D" runat="server" Text='<%# Eval("mealname1") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealname2D" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname2D" runat="server" Text='<%# Eval("mealname2") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealname3D" runat="server">
                                                                                <p class="h6">
                                                                                    <span class="font-weight-bold"><i class="fas fa-utensils text-primary mr-3"></i></span>
                                                                                    <asp:Label ID="lbl_mealname3D" runat="server" Text='<%# Eval("mealname3") %>'></asp:Label>
                                                                                </p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <asp:Panel ID="pnl_mealtype1D" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype1") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealtype2D" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype2") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_mealtype3D" runat="server">
                                                                                <p class="h6"><%# Eval("mealtype3") %></p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                        <div class="col-2">
                                                                            <asp:Panel ID="pnl_meal_time1D" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time1") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_meal_time2D" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time2") %></p>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnl_meal_time3D" runat="server">
                                                                                <p class="h6"><%# Eval("meal_time3") %></p>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <hr class="w-100" />
                                <p style="text-align: center">***** END OF TOUR *****</p>
                                <hr class="w-100" />
                                <div class="tab-pane">
                                    <h4 style="color: #dc3545">Overview :</h4>
                                    <span id="Overview_print" runat="server"></span><%--Overview--%>
                                    <br />
                                    <h4 style="color: #dc3545">Package Itinerary :</h4>
                                    <span id="ItineraryDetailed_print" runat="server"></span><%--tinerary Detailed--%>
                                </div>
                                <div class="tab-pane">
                                    <h4 style="color: #dc3545">Inclusions :</h4>
                                    <span id="Inclusions_print" runat="server"></span>
                                    <br />
                                    <h4 style="color: #dc3545">Exclusions :</h4>
                                    <span id="Exclusions_print" runat="server"></span>
                                </div>
                                <div class="tab-pane">
                                    <h4 style="color: #dc3545">Payment Policy :</h4>
                                    <span id="PaymentPolicy_print" runat="server"></span><%--Cancellation Policy--%>
                                    <br />
                                    <h4 style="color: #dc3545">Cancellation Policy :</h4>
                                    <span id="CancellationPolicy_print" runat="server"></span><%--Cancellation Policy--%>
                                </div>
                                <div class="tab-pane">
                                    <h4 style="color: #dc3545">Terms & Conditions :</h4>
                                    <span id="TermsConditions_print" runat="server"></span><%--Terms & Conditions--%>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".btn-number").on("click",
                function (d) {
                    fieldName = $(this).attr("data-field"), type = $(this).attr("data-type");
                    var e = $("input[name='" + fieldName + "']"),
                        l = parseInt(e.val());
                    isNaN(l)
                        ? e.val(0)
                        : "minus" == type
                        ? (l > e.attr("min") && e.val(l - 1).change(), parseInt(e.val()) === e.attr("min") &&
                            $(this).attr("disabled", !0))
                        : "plus" === type &&
                        (l < e.attr("max") && e.val(l + 1).change(), parseInt(e.val()) == e.attr("max") &&
                            $(this).attr("disabled", !0))
                }), $(".input-number").focusin(function () {
                    $(this).data("oldValue", $(this).val())
                }), $(".input-number").change(function () {
                    minValue = parseInt($(this).attr("min")), maxValue = parseInt($(this).attr("max")), valueCurrent =
                            parseInt($(this).val()), name =
                            $(this).attr("name"), valueCurrent >= minValue
                            ? $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr("disabled")
                            : (alert("Sorry, the minimum value was reached"), $(this).val($(this).data("oldValue"))),
                        valueCurrent <= maxValue
                            ? $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr("disabled")
                            : (alert("Sorry, the maximum value was reached"), $(this).val($(this).data("oldValue")))
                }), $(".input-number").keydown(function (d) {
                    -1 !== $.inArray(d.keyCode, [46, 8, 9, 27, 13, 190]) ||
                        65 == d.keyCode && !0 === d.ctrlKey ||
                        35 <= d.keyCode && d.keyCode <= 39 ||
                        (d.shiftKey || d.keyCode < 48 || 57 < d.keyCode) &&
                        (d.keyCode < 96 || 105 < d.keyCode) &&
                        d.preventDefault()
                });
        }),

        $(document).ready(function () {
            $(function () {
                $("#div_2nd").hide(),
                $("#div_3rd").hide(),
                $(".aanwithb").hide(),
                $(".aanwithoutb").hide(),
                $(".aanwithb1").hide(),
                $(".aanwithoutb1").hide(),
                $(".aanwithb2").hide(),
                $(".aanwithoutb2").hide(),
                    $("#btnadd1").on("click", function (d) {
                        $("#div_2nd").show(),
                        $("#btnadd1").hide(),
                        $("#ddlchildAge3").prop("disabled", !0).addClass("disabled"),
                        $("#ddlchildAge4").prop("disabled", !0).addClass("disabled"),
                        $("#DropDownList2").prop("disabled", !0).addClass("disabled"),
                        d.preventDefault();
                    }),
                    $("#btnadd2").on("click", function (d) {
                        $("#div_3rd").show(),
                        $("#btnadd2").hide(),
                        $("#btn_minus1").hide(),
                        $("#ddlchildAge5").prop("disabled", !0).addClass("disabled"),
                        $("#ddlchildAge6").prop("disabled", !0).addClass("disabled"),
                        $("#DropDownList3").prop("disabled", !0).addClass("disabled"),
                        d.preventDefault();
                    }),
                    $("#btnminus3").on("click", function (d) {
                        $("#div_3rd").hide(),
                        $("#btnadd2").show(),
                        $("#btn_minus1").show(),
                        $("#ddlAdults3").prop("selectedIndex", 0),
                        $("#ddlchildAge5").prop("selectedIndex", 0),
                        $("#ddlchildAge6").prop("selectedIndex", 0),
                        $("#DropDownList3").prop("selectedIndex", 0),
                        d.preventDefault();
                    }),
                    $("#btn_minus1").on("click", function (d) {
                        $("#div_2nd").hide(),
                            $("#btnadd1").show(),
                            $("#ddlAdults2").prop("selectedIndex", 0),
                            $("#ddlchildAge3").prop("selectedIndex", 0),
                            $("#ddlchildAge4").prop("selectedIndex", 0),
                            $("#DropDownList2").prop("selectedIndex", 0),
                            d.preventDefault();
                    }),
                    $(document).on("change", "#ddlchildAge1", function () {
                        $(".aanwithb").show();
                    }),
                    $(document).on("change", "#ddlchildAge2", function () {
                        $(".aanwithoutb").show();
                    }),
                    $(document).on("change", "#ddlchildAge3", function () {
                        $(".aanwithb1").show();
                    }),
                    $(document).on("change", "#ddlchildAge4", function () {
                        $(".aanwithoutb1").show();
                    }),
                    $(document).on("change", "#ddlchildAge5", function () {
                        $(".aanwithb2").show();
                    }),
                    $(document).on("change", "#ddlchildAge6", function () {
                        $(".aanwithoutb2").show();
                    }),
                    $(document).on("change", "#ddlAdults1", function () {
                        "3" === $(this).val() ? (
                    $("#ddlchildAge1").prop("selectedIndex", 0),
                    $("#DropDownList4").prop("selectedIndex", 0),
                    $(".aanwithb").hide(),
                                $("#ddlchildAge1").prop("disabled", !0).addClass("disabled"))
                            : $("#ddlchildAge1").prop("disabled", !1).removeClass("disabled");
                    }),
                    $(document).on("change", "#ddlAdults2", function () {
                        $("#ddlchildAge3").prop("disabled", !1).removeClass("disabled"),
                            $("#ddlchildAge4").prop("disabled", !1).removeClass("disabled"),
                            $("#DropDownList2").prop("disabled", !1).removeClass("disabled"),
                            "3" === $(this).val() ? (
                                    $("#DropDownList6").prop("selectedIndex", 0),
                                    $(".aanwithb1").hide(),
                    $("#ddlchildAge3").prop("selectedIndex", 0),
                                    $("#ddlchildAge3").prop("disabled", !0).addClass("disabled"))
                                : $("#ddlchildAge3").prop("disabled", !1).removeClass("disabled");
                    }),
                    $(document).on("change", "#ddlAdults3", function () {
                        $("#ddlchildAge6").prop("disabled", !1).removeClass("disabled"),
                            $("#ddlchildAge5").prop("disabled", !1).removeClass("disabled"),
                            $("#DropDownList3").prop("disabled", !1).removeClass("disabled"),
                            "3" === $(this).val() ? (
                                    $("#DropDownList8").prop("selectedIndex", 0),
                                    $(".aanwithb2").hide(),
                    $("#ddlchildAge5").prop("selectedIndex", 0),
                                    $("#ddlchildAge5").prop("disabled", !0).addClass("disabled"))
                                : $("#ddlchildAge5").prop("disabled", !1).removeClass("disabled");
                    });
            });
            var d = function (d, e) {
                //debugger;
                e || (e = window.location.href), d = d.replace(/[\[\]]/g, "\\$&");
                var l = new RegExp("[?&]" + d + "(=([^&#]*)|&|#|$)").exec(e);
                return l ? l[2] ? decodeURIComponent(l[2].replace(/\+/g, " ")) : "" : null
            }("Zenith");
            $(document).ready(function () {
                "ERU112" === d && $(function () {
                    $(document).on("change", "#ddlAdults1", function () {
                        "3" === $(this).val() ? ($("#ddlchildAge1").prop("selectedIndex", 0), $("#ddlchildAge2").prop("selectedIndex", 0), $("#ddlchildAge2").prop("disabled", !0).addClass("disabled"), $("#ddlchildAge1").prop("disabled", !0).addClass("disabled")) : "2" === $(this).val() ? ($("#ddlchildAge1").prop("selectedIndex", 0), $("#ddlchildAge2").prop("selectedIndex", 0), $("#ddlchildAge2").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge1").prop("disabled", !1).removeClass("disabled")) : "1" === $(this).val() && ($("#ddlchildAge1").prop("selectedIndex", 0), $("#ddlchildAge2").prop("selectedIndex", 0), $("#ddlchildAge2").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge1").prop("disabled", !1).removeClass("disabled"))
                    }), $(document).on("change", "#ddlchildAge1", function () {
                        "1" === $(this).val() ? $("#ddlAdults1 option[value='1']").is(":selected") ? $("#ddlchildAge2").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge2").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge2").prop("disabled", !1).removeClass("disabled")
                    }), $(document).on("change", "#ddlchildAge2", function () {
                        "1" === $(this).val() ? $("#ddlAdults1 option[value='1']").is(":selected") ? $("#ddlchildAge1").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge1").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge1").prop("disabled", !1).removeClass("disabled")
                    }), $(document).on("change", "#ddlAdults2", function () {
                        $("#ddlchildAge3").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge4").prop("disabled", !1).removeClass("disabled"), $("#DropDownList2").prop("disabled", !1).removeClass("disabled"), "3" === $(this).val() ? ($("#ddlchildAge3").prop("selectedIndex", 0), $("#ddlchildAge4").prop("selectedIndex", 0), $("#ddlchildAge3").prop("disabled", !0).addClass("disabled"), $("#ddlchildAge4").prop("disabled", !0).addClass("disabled")) : "2" === $(this).val() ? ($("#ddlchildAge3").prop("selectedIndex", 0), $("#ddlchildAge4").prop("selectedIndex", 0)) : "1" === $(this).val() ? ($("#ddlchildAge3").prop("selectedIndex", 0), $("#ddlchildAge4").prop("selectedIndex", 0)) : "0" === $(this).val() ? ($("#ddlchildAge3").prop("selectedIndex", 0), $("#ddlchildAge4").prop("selectedIndex", 0)) : ($("#ddlchildAge3").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge4").prop("disabled", !1).removeClass("disabled"))
                    }), $(document).on("change", "#ddlchildAge3", function () {
                        "1" === $(this).val() ? $("#ddlAdults2 option[value='1']").is(":selected") ? $("#ddlchildAge4").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge4").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge4").prop("disabled", !1).removeClass("disabled")
                    }), $(document).on("change", "#ddlchildAge4", function () {
                        "1" === $(this).val() ? $("#ddlAdults2 option[value='1']").is(":selected") ? $("#ddlchildAge3").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge3").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge3").prop("disabled", !1).removeClass("disabled")
                    }), $(document).on("change", "#ddlAdults3", function () {
                        $("#ddlchildAge6").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge5").prop("disabled", !1).removeClass("disabled"), $("#DropDownList3").prop("disabled", !1).removeClass("disabled"), "3" === $(this).val() ? ($("#ddlchildAge5").prop("selectedIndex", 0), $("#ddlchildAge6").prop("selectedIndex", 0), $("#ddlchildAge5").prop("disabled", !0).addClass("disabled"), $("#ddlchildAge6").prop("disabled", !0).addClass("disabled")) : "2" === $(this).val() ? ($("#ddlchildAge5").prop("selectedIndex", 0), $("#ddlchildAge6").prop("selectedIndex", 0)) : "1" === $(this).val() ? ($("#ddlchildAge5").prop("selectedIndex", 0), $("#ddlchildAge6").prop("selectedIndex", 0)) : "0" === $(this).val() ? ($("#ddlchildAge5").prop("selectedIndex", 0), $("#ddlchildAge6").prop("selectedIndex", 0)) : ($("#ddlchildAge5").prop("disabled", !1).removeClass("disabled"), $("#ddlchildAge6").prop("disabled", !1).removeClass("disabled"))
                    }), $(document).on("change", "#ddlchildAge5", function () {
                        "1" === $(this).val() ? $("#ddlAdults3 option[value='1']").is(":selected") ? $("#ddlchildAge6").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge6").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge6").prop("disabled", !1).removeClass("disabled")
                    }), $(document).on("change", "#ddlchildAge6", function () {
                        "1" === $(this).val() ? $("#ddlAdults3 option[value='1']").is(":selected") ? $("#ddlchildAge5").prop("disabled", !1).removeClass("disabled") : $("#ddlchildAge5").prop("disabled", !0).addClass("disabled") : $("#ddlchildAge5").prop("disabled", !1).removeClass("disabled")
                    })
                })
            })
        }), $(document).ready(function () {
            $(".tabpanelforjs1").each(function (d) {
                $(this).attr("id", "headingOne" + (d + 1))
            }), $(".tabpanelforjs2").each(function (d) {
                $(this).attr("data-target", "#collapseOne" + (d + 1))
            }), $(".tabpanelforjs3").each(function (d) {
                $(this).attr("id", "collapseOne" + (d + 1))
            }), $(".tabpanelforjs4").each(function (d) {
                $(this).attr("aria-labelledby", "headingOne" + (d + 1))
            }), $(".itn-title-tab").each(function (d) {
                $(this).attr("aria-controls", "collapseOne" + (d + 1))
            }), $("#btn_saveEnq").on("click", function (d) {
                var e = $("#txt_YourName").val(),
                    l = $("#txt_emailid").val(),
                    a = $("#txt_mobileno").val(),
                    s = $("#txt_cityname").val(),
                    i = $("#txt_traveldate").val();
                "" === e ? (alert("Please input Your name"), $("#txt_YourName").addClass("is-invalid"), d.preventDefault()) : "" === l ? (alert("Please input Your Email"), $("#txt_emailid").addClass("is-invalid"), d.preventDefault()) : "" === a ? (alert("Please input Your Phone no"), $("#txt_mobileno").addClass("is-invalid"), d.preventDefault()) : "" === s ? (alert("Please input Your City"), $("#txt_cityname").addClass("is-invalid"), d.preventDefault()) : "" === i ? (alert("Please input Your Date Of Birth"), $("#txt_traveldate").addClass("is-invalid")) : $(".validation").addClass("is-valid")
            })
        });
    </script>

    <%--<<<<<<<<<<<<<<Download Itinerary SCRIPT>>>>>>>>>>>>>>>>--%>
    <script src="js/FileSaver.js"></script>
    <script src="js/jquery.wordexport.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function PrintContent() {
            var printContents = document.getElementById('myModalItinerary').innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            document.getElementById('print_btn').style.display = "none";
            document.getElementById('close_btn').style.display = "none";
            document.getElementById('header_text').style.textAlign = "center";
            window.print();
            document.body.innerHTML = originalContents;
            document.getElementById('myModal').style.display = 'none';
            return false;
        }
        $(document).ready(function () { $('[data-toggle="tooltip"]').tooltip(); });
    </script>

    <script>
        $("#lnlbtn_checkoutsubmit").on('click', function (e) {
            var State = $('#ddlCustomerState').val();

            if (State === '---Select State---') {
                alert("Please Select your State");
                $('#ddlCustomerState').addClass("is-invalid");
                e.preventDefault();
            }
            else {
                $('.validation').addClass("is-valid");
            }
        });

    </script>
</asp:Content>


