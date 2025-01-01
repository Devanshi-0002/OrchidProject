<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="holidays.aspx.cs" Inherits="holidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <section class="after-header-section">
        <div class="after-header">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="#" target="_blank" class="slider-enquiry-button">
                            <img src="img/banner/EUROPE3.jpg?v3" alt="Second slide">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href="#" target="_blank" class="slider-enquiry-button">
                            <img src="img/banner/LADAKHHOMEPAGE.jpg?1" alt="Third slide">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href="#" target="_blank" class="slider-enquiry-button">
                            <img src="img/banner/BHUTANBANNER.jpg" alt="fourth slide">
                        </a>
                    </div>
                    <%--<div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/4.jpg" alt="Second slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/5.jpg" alt="Third slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/6.jpg" alt="Second slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/7.jpg" alt="Third slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/8.jpg" alt="Second slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/9.jpg" alt="Third slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div><div class="carousel-item"> <img class="d-block w-100 custom-slider-image" src="img/Background/10.jpg" alt="Third slide"><div class="carousel-caption d-none d-md-block dastination-carousel-caption"><h1>Europe</h1><h4>Holidays Packages</h4></div></div>--%>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
            </div>
            <div class="body-content holidays-body-content">
                <div class="container">
                    <div class="col-sm-12">
                        <%--<h2 class="text-center header-headline">Book Hotels and Holiday Packages</h2>--%><div class="header-search-area">
                            <div class="col-sm-12">
                                <ul class="nav nav-pills nav-pills-new">
                                    <li class="nav-item"><a class="nav-link active nav-link-custom" href="holidays.aspx" target="">Holidays</a></li>
                                    <li class="nav-item"><a class="nav-link nav-link-custom" href="HotelSearch.aspx" target="">Hotels</a></li>
                                    <li class="nav-item "><a class="nav-link nav-link-custom" href="SightSeeingSearch.aspx" target="">Sightseeing</a></li>
                                    <li class="nav-item"><a class="nav-link nav-link-custom" href="TransferSearch.aspx" target="">Transfer</a></li>
                                    <!--<li class="nav-item"> <a style="border-right: none;" class="nav-link nav-link-custom" href="TransportService.aspx">Zenith Transport</a></li>-->
                                </ul>
                                <div class="tab-content tab-content-custom">
                                    <div class="tab-pane active container" id="holidays">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-10" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <%--<input type="text" class="form-control custom-form-control" id="validationDefaultUsername" placeholder="Where Will Your Next Holiday Be" aria-describedby="inputGroupPrepend2">--%>
                                                        <asp:TextBox ID="txtdestination" runat="server" Font-Size="14px" placeholder="Enter destination eg. Goa, Paris , Singapore" class="form-control custom-form-control"></asp:TextBox>
                                                        <%--<asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" Enabled="True" ServiceMethod="Listofdestination" MinimumPrefixLength="1" EnableCaching="true" TargetControlID="txtdestination" CompletionInterval="1000" CompletionSetCount="10" CompletionListCssClass="completionListElement" CompletionListItemCssClass="listItem" CompletionListHighlightedItemCssClass="highlightedListItem" />--%><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend2"><i class="fas fa-map-marker-alt"></i></span></div>
                                                        <span id="destinationtype" runat="server" style="display: none"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 clear-padding">
                                                <%--<a href="#" class="btn btn-danger custom-btn-danger">Search</a>--%> <%--			OnClick="linkbtn_search_Click"--%>
                                                <asp:LinkButton ID="linkbtn_search" runat="server" class="btn btn-danger custom-btn-danger" Text="Search" OnClick="linkbtn_search_Click"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="hotels">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-3 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1" placeholder="To" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend22"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername13" placeholder="Nationality" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend221"><i class="fas fa-globe"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" id="datepicker" class="form-control custom-form-control" placeholder="Check-in"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Check-out" id="datepicker1"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <select class="form-control custom-form-control">
                                                            <option>1 Adult, 0 Children</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-1 clear-padding"><a href="#" class="btn btn-danger custom-btn-danger">Search</a></div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="sightseeing">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-4 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Nationality" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-globe"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" id="datepicker2" class="form-control custom-form-control" placeholder="Check-in"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <select class="form-control custom-form-control">
                                                            <option>1 Adult, 0 Children</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a></div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="transfer">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername11121" placeholder="From Where" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a></div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="cruise">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1111" placeholder="From Where" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a></div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="forex">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-2" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <select class="form-control custom-form-control">
                                                            <option>Select Your Currency</option>
                                                            <option>USD</option>
                                                            <option>SGD</option>
                                                            <option>EUR</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername11111" placeholder="Type Your Amount" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend2111"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Delivery Location" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="far fa-money-bill-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Contact Details" aria-describedby="inputGroupPrepend2"><div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-envelope"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="w-100">
        <div class="holidays-body">
            <div class="container">
                <div id="holidaysBody" class="carousel slide" data-ride="satac">
                    <ol class="carousel-indicators holidays-carousel-indicators-custom">
                        <li data-target="#holidaysBody" data-slide-to="0" class="active"></li>
                        <li data-target="#holidaysBody" data-slide-to="1"></li>
                        <li data-target="#holidaysBody" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row m-0">
                                <div class="col-md-4 col-sm-12 low-padding">
                                    <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                        <a href="gitpackage-details?destination=1051&dpCity=Delhi&dpDate=08/05/2019">
                                            <img class="Zenith-Populer-Packages" src="Upload_image/26102018_133723_slider%203.jpg"><div class="imgoverlay-zenithpackage">
                                                <div class="overlay-meta-box">
                                                    <h4 style="color: white">Breathtaking Europe</h4>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 low-padding">
                                    <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                        <a href="gitpackage-details?destination=1052&dpCity=Delhi&dpDate=19/05/2019#ItineraryDetailed">
                                            <img class="Zenith-Populer-Packages" src="Upload_image/26102018_155453_slider%203.jpg"><div class="imgoverlay-zenithpackage">
                                                <div class="overlay-meta-box">
                                                    <h4 style="color: white">European Blockbuster</h4>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 low-padding">
                                    <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                        <a href="gitpackage-details?destination=1100&dpCity=Delhi&dpDate=04/06/2019">
                                            <img class="Zenith-Populer-Packages" src="http://www.zenithholidays.com/Upload_image/26122018_115020_StPTSBURG.jpg">
                                            <div class="overlay-meta-box">
                                                <h4 style="color: white">Russia Highlight</h4>
                                            </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row m-0">
                            <div class="col-md-4 col-sm-12 low-padding">
                                <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                    <a href="fitpackage-details?destination=1016">
                                        <img class="Zenith-Populer-Packages" src="Upload_image/28092018_180735_pelling%20.jpg"><div class="imgoverlay-zenithpackage">
                                            <div class="overlay-meta-box">
                                                <h4 style="color: white">Himalayan Golden Triangle</h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12 low-padding">
                                <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                    <a href="gitpackage-details?destination=1052&dpCity=Delhi&dpDate=19/05/2019#ItineraryDetailed">
                                        <img class="Zenith-Populer-Packages" src="Upload_image/26102018_155453_slider%203.jpg"><div class="imgoverlay-zenithpackage">
                                            <div class="overlay-meta-box">
                                                <h4 style="color: white">European Blockbuster</h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12 low-padding">
                                <div class="Zenith-Populer-Packages holidays-best-selling-package">
                                    <a href="gitpackage-details?destination=1009&dpCity=Delhi&dpDate=05/10/2018">
                                        <img class="Zenith-Populer-Packages" src="Upload_image/26092018_141337_barong%20dance%20performance%20in%20bali%20indonesia%201200%20400.jpg"><div class="imgoverlay-zenithpackage">
                                            <div class="overlay-meta-box">
                                                <h4 style="color: white">Bali Fixed Departure on Malaysian Airlines</h4>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%--<div class="col-md-4 col-sm-12 low-padding"><div class="Zenith-Populer-Packages holidays-best-selling-package"> <a href="#"> <img class="Zenith-Populer-Packages" src="img_destination/Srilanka1.jpg"><div class="imgoverlay-zenithpackage"><div class="overlay-meta-box"><h4 style="color: white">Andaman</h4></div></div> </a></div></div><div class="col-md-4 col-sm-12 low-padding"><div class="Zenith-Populer-Packages holidays-best-selling-package"> <a href="#"> <img class="Zenith-Populer-Packages" src="img_destination/Srilanka1.jpg"><div class="imgoverlay-zenithpackage"><div class="overlay-meta-box"><h4 style="color: white">Andaman</h4></div></div> </a></div></div>--%>
                        </div>
                    </div>
                    <%--<div class="carousel-item"><div class="row m-0"><div class="col-md-4 col-sm-12 low-padding"><div class="Zenith-Populer-Packages holidays-best-selling-package"> <a href="#"> <img class="Zenith-Populer-Packages" src="img_destination/Srilanka1.jpg"><div class="imgoverlay-zenithpackage"><div class="overlay-meta-box"><h4 style="color: white">Andaman</h4></div></div> </a></div></div><div class="col-md-4 col-sm-12 low-padding"><div class="Zenith-Populer-Packages holidays-best-selling-package"> <a href="#"> <img class="Zenith-Populer-Packages" src="img_destination/Srilanka1.jpg"><div class="imgoverlay-zenithpackage"><div class="overlay-meta-box"><h4 style="color: white">Andaman</h4></div></div> </a></div></div><div class="col-md-4 col-sm-12 low-padding"><div class="Zenith-Populer-Packages holidays-best-selling-package"> <a href="#"> <img class="Zenith-Populer-Packages" src="img_destination/Srilanka1.jpg"><div class="imgoverlay-zenithpackage"><div class="overlay-meta-box"><h4 style="color: white">Andaman</h4></div></div> </a></div></div></div></div>--%>
                </div>
                <a class="carousel-control-prev carousel-control-prev-custom" href="#holidaysBody" role="button" data-slide="prev"><i class="fas fa-angle-left fa-3x"></i><span class="sr-only">Previous</span> </a><a class="carousel-control-next carousel-control-next-custom" href="#holidaysBody" role="button" data-slide="next"><i class="fas fa-angle-right fa-3x"></i><span class="sr-only">Next</span> </a>
            </div>
        </div>
        </div>
    </section>
    <section class="w-100">
        <div class="holidays-body-text-area">
            <div class="container">
                <h1 class="mb-sm-3 text-center font-weight-bold">Holiday Packages</h1>
                <p class="mb-sm-2">
                    <b>Domestic </b>
                    <br />
                    No matter how much you like to travel, everyone has different preferences while travelling. We are here to take care of all your travelling needs within India. No matter if you are travelling to Ladakh or Goa, our travel expertise is here to arrange a perfect vacation for you. All you have to do is to book your holiday, pack your back, sit back and relax. Just wait for your travel date and get ready for a perfect holiday. We wish you a wonderful tour ahead.<br />
                    <br />
                    <b>International Package</b><br>
                    Holidays in a foreign land creates a lot of memories which are everlasting. Explore the beauty of those foreign land while experience its culture. While you are thinking of some exotic places for your vacations, Zenith Holidays has handpicked the best holiday destination packages just for you. Scroll down and choose the destination which is perfect for you. Just sit back and relax because you are going to experience a Hassle-free vacation just at your fingertips. From exotic Bali to lively Thailand, booking a perfect International package has become easy with Zenith Holidays.
                </p>
                <p class="h6"><a href="/blog/">( Read More... )</a></p>
            </div>
        </div>
    </section>
    <section class="w-100">
        <div class="holidays-body-text-area pt-0">
            <div class="container">
                <h1 class="text-center ">#Trending<span class="text-danger">at</span>Orchidglobal</h1>
                <p class="text-center mb-sm-4">Tailor-made holidays to the hottest desctination</p>
                <div class="row">
                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1119&dpCity=Delhi&dpDate=16/05/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/30012019_124644_3.jpg"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>North East</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1115&dpCity=Delhi&dpDate=21/05/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/03012019_164828_3%20(2).jpg"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>Ladakh</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1106&dpCity=Delhi&dpDate=06/06/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/28122018_115423_Bhutan2.jpg"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>Bhutan</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1128&dpCity=Kolkata&dpDate=25/05/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/15022019_163909_Untitled%20design%20(31).png"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>Bali</span></div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1052&dpCity=Delhi&dpDate=19/05/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/26102018_133723_slider%202.jpg"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>European Blockbuster</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 low-padding">
                        <div class="Zenith-Populer-Packages holidays-populer-packages">
                            <a href="gitpackage-details?destination=1051&dpCity=Delhi&dpDate=08/05/2019">
                                <img class="Zenith-Populer-Packages" src="Upload_image/26102018_133723_slider%203.jpg"><div class="imgoverlay-zenithpackage">
                                    <div class="overlay-meta-box"><span>Breathtaking Europe</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <h3 class="mb-4 mt-5">Top Theme Based Holiday Packages</h3>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-users fa-lg"></i></span><a href="Theme/family-holiday-packages.aspx" style="color: black">Family Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-user-friends fa-lg"></i></span><a href="Theme/honeymoon-holiday-packages.aspx" style="color: black">Honeymoon Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <p><span class="mr-2 border p-1"><i class="fas fa-globe-asia fa-lg"></i></span><a href="Theme/adventure-holiday-packages.aspx" style="color: black">Adventure Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="far fa-calendar-alt fa-lg"></i></span><a href="Theme/Senior-Citizen-holiday-packages.aspx" style="color: black">Senior Citizen Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-umbrella-beach fa-lg"></i></span><a href="Theme/beach-holiday-packages.aspx" style="color: black">Beach Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-hotel fa-lg"></i></span><a href="Theme/ladies-special-holiday-packages.aspx" style="color: black">Ladies Special Tour Packages</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-tree fa-lg"></i></span><a href="Theme/custom-made-holiday-packages.aspx" style="color: black">Custom-Made Holidays</a></p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p><span class="mr-2 border p-1"><i class="fas fa-tree fa-lg"></i></span><a href="Theme/curated-experiences-holiday-packages.aspx" style="color: black">Curated Experiences</a></p>
                    </div>
                </div>
                <hr />
            </div>
            <div class="container">
                <h3 class="mb-4 mt-5">Top Zenith Domestic Packages</h3>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="lnkbtnAndaman" runat="server" Text="Andaman" OnClick="lnkbtnAndaman_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Ladakh" runat="server" Text="Ladakh" OnClick="LinkButton_Ladakh_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Kerala" runat="server" Text="Kerala" OnClick="LinkButton_Kerala_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Goa" runat="server" Text="Goa" OnClick="LinkButton_Goa_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Rajasthan" runat="server" Text="Rajasthan" OnClick="LinkButton_Rajasthan_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Kashmir" runat="server" Text="Kashmir" OnClick="LinkButton_Kashmir_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_GoldenTriangle" runat="server" Text="Golden Triangle" OnClick="LinkButton_GoldenTriangle_Click"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Darjeelingandsikkim" runat="server" Text="Darjeeling and Sikkim" OnClick="LinkButton_Darjeelingandsikkim_Click"></asp:LinkButton>
                        </p>
                    </div>
                </div>
                <hr />
            </div>
            <div class="container">
                <h3 class="mb-4 mt-5">Top International Packages</h3>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Dubai" runat="server" Text="Dubai" OnClick="LinkButton_Dubai_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Bhutan" runat="server" Text="Bhutan" OnClick="LinkButton_Bhutan_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Bangkok" runat="server" Text="Bangkok" OnClick="LinkButton_Bangkok_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Thailand" runat="server" Text="Thailand" OnClick="LinkButton_Thailand_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Bali" runat="server" Text="Bali" OnClick="LinkButton_Bali_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Singapore" runat="server" Text="Singapore" OnClick="LinkButton_Singapore_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Europe" runat="server" Text="Europe" OnClick="LinkButton_Europe_Click" />
                        </p>
                    </div>
                    <div class="col-md-3 mb-3">
                        <p>
                            <span class="mr-2"><i class="fas fa-angle-double-right fa-lg"></i></span>
                            <asp:LinkButton ID="LinkButton_Srilanka" runat="server" Text="Srilanka" OnClick="LinkButton_Srilanka_Click" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal animated fadeIn delay-5s" id="customizedHolidays" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog mt-5 modal-lg" role="document">
            <div class="modal-content rounded-0 ">
                <div class="modal-header bg-danger">
                    <h5 class="modal-title text-white" id="exampleModalLabel">Select Your Service</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                </div>
                <div class="modal-body p-5">
                    <div class="row">
                        <div class="col"><a class="csut-modal-content" href="HotelSearch.aspx"><span><i class="fas fa-hotel fa-2x"></i></span><span>HOTEL</span> </a></div>
                        <div class="col"><a class="csut-modal-content" href="SightSeeingSearch.aspx"><span><i class="fas fa-camera-retro fa-2x"></i></span><span>SIGHTSEEING</span> </a></div>
                        <div class="col"><a class="csut-modal-content" href="TransferSearch.aspx"><span><i class="fas fa-car fa-2x"></i></span><span>TRANSFER</span> </a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<asp:Timer ID="timer1" runat="server" Interval="1000" OnTick="timer1_tick"> </asp:Timer><asp:UpdatePanel ID="updPnl" runat="server" UpdateMode="Conditional"> <ContentTemplate> <asp:Label ID="lblTimer" runat="server"></asp:Label> </ContentTemplate> <Triggers> <asp:AsyncPostBackTrigger ControlID="timer1" EventName="tick" /> </Triggers> </asp:UpdatePanel>--%>
</asp:Content>
