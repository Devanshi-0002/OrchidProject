<%@ Page Title="" Language="C#" MasterPageFile="/HomeMainMaster.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Best Tours & Travel Company in India - Holiday Packages</title>
    <meta name="viewport" content="width=device-promo-box-caotionwidth, initial-scale=1, maximum-scale=1" />
    <meta name="keywords" content="India holiday packages, tours and travels, holiday companies, mice tourism, holidays travel, leisure holidays" />
    <meta name="description" content="Summer holiday packages from leading tours & travel company in India. Bhutan, Ladakh, Hong Kong, Nort heast & Thailand Packages at *Best price. Call @ 6290952054" />
    <style>
        .responsive-search-btn {
            font-size: 15px;
            font-weight: bold;
            border-radius: 25px;
            width: 100px;
            height: 30px;
            /*box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);*/
            box-shadow: inset 6px 0 5px #2121ad;
            text-align: center;
        }

        /* Medium Screen Adjustments */
        @media (max-width: 992px) {
            .responsive-search-btn {
                width: 100px;
                font-size: 16px;
                padding: 6px;
            }
        }

        /* Small Screen Adjustments */
        @media (max-width: 768px) {
            .responsive-search-btn {
                width: 80px;
                font-size: 14px;
                padding: 4px;
            }
        }

        /* Extra Small Screen Adjustments */
        @media (max-width: 576px) {
            .responsive-search-btn {
                width: 60px;
                font-size: 12px;
                padding: 2px;
            }
        }

        .hei {
            height: 274px !important;
        }

        .completionListElement {
            visibility: hidden;
            margin: 0px !important;
            background-color: inherit;
            color: black;
            border: solid 1px gray;
            cursor: pointer;
            text-align: left;
            list-style-type: none;
            font-family: Verdana;
            font-size: 14px;
            padding: 0;
        }

        .listItem {
            background-color: white;
            padding: 1px;
        }

        .highlightedListItem {
            background-color: #c3ebf9;
            padding: 1px;
        }

        .slider-text {
            position: absolute;
            margin-top: -25%;
            margin-left: 2.2%;
            width: 648px;
            color: white;
            Background: #000;
            Background: rgba(0, 0, 0, 0.3215686274509804);
            padding: 1% 3%;
            -ms-border-top-left-radius: 30px;
            border-top-left-radius: 30px;
            -ms-border-bottom-right-radius: 30px;
            border-bottom-right-radius: 30px;
            text-align: center;
            box-shadow: 0 0 6px #000;
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.50);
        }

            .slider-text h1 {
                color: yellow;
                font-size: 40px;
                font-style: italic;
                font-family: 'Berkshire Swash',cursive;
            }

            .slider-text h3 {
                color: #fff;
                font-family: 'Berkshire Swash',cursive;
                font-size: 20px;
            }

            .slider-text h2 {
                color: #fff;
                font-family: 'Berkshire Swash',cursive;
                font-size: 20px;
            }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <%--<script type="text/javascript">$(document).ready(function(){$("#<%=txtSearch.ClientID %>").autocomplete({source:function(request,response){$.ajax({url:'<%=ResolveUrl( "~/Service.asmx/GetCustomers") %>',data:"{'prefix': '"+request.term+"'}",dataType:"json",type:"POST",contentType:"application/json; charset=utf-8",success:function(data){response($.map(data.d,function(item){return{label:item.split('-')[0],val:item.split('-')[1]}}))},error:function(response){alert(response.responseText);},failure:function(response){alert(response.responseText);}});},select:function(e,i){$("#<%=hfCustomerId.ClientID %>").val(i.item.val);},minLength:1});});</script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <%--<asp:UpdatePanel ID="jgvfvlk" runat="server"><ContentTemplate>--%>
    <section class="after-header-section">
        <div class="after-header">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <!--<div class="carousel-item active"><a href="campaign/fbcampaign.aspx"> <img class="d-block w-100 custom-slider-image" src="img/Background/BIGSALE.jpg" alt="First slide"></a> </div>-->
                    <div class="carousel-item active">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/3.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/4.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/5.jpg?2" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/6.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/7.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/8.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/9.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 custom-slider-image" src="img/Background/10.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
            </div>
            <div class="body-content">
                <div class="container">
                    <div class="col-sm-12">
                        <%--<h2 class="text-center header-headline">Book Hotels and Holiday Packages</h2>--%>
                        <div class="header-search-area">
                            <div class="col-sm-12">
                                <br />
                                <br />
                                <br />
                                <%-- <ul class="nav nav-pills nav-pills-new">
                                    <li class="nav-item"><a class="nav-link active nav-link-custom" href="holidays.aspx" target="">Holidays</a> </li>
                                    <li class="nav-item"><a class="nav-link nav-link-custom" href="HotelSearch.aspx" target="">Hotels</a> </li>
                                    <li class="nav-item "><a class="nav-link nav-link-custom" href="SightSeeingSearch.aspx" target="">Sightseeing</a> </li>
                                    <li class="nav-item"><a class="nav-link nav-link-custom" href="TransferSearch.aspx" target="">Transfer</a> </li>
                                    <li class="nav-item"></li>
                                    <li class="nav-item" style="display: none"><a class="nav-link nav-link-custom nav-link-custom-after text-white" data-toggle="modal" data-target="#customizedHolidays">Customized Holidays</a> </li>
                                </ul>--%>
                                <div class="tab-content tab-content-custom">

                                    <div class="tab-pane active container" id="holidays">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-10" style="border-right: none">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text input-group-text-custom"
                                                                style="border-radius: 50%!important; font-size: 20px;"
                                                                id="inputGroupPrepend2">
                                                                <i class="fas fa-map-marker-alt"></i></span>
                                                        </div>
                                                        <span id="destinationtype" runat="server" style="display: none"></span>
                                                        <%--<input type="text" class="form-control custom-form-control" id="validationDefaultUsername" placeholder="Where Will Your Next Holiday Be" aria-describedby="inputGroupPrepend2">--%>
                                                        <asp:TextBox ID="txtdestination" runat="server" Font-Size="14px"
                                                            placeholder="Enter Destination eg. Thailand, Japan , Europe" class="form-control custom-form-control font-weight-bold"></asp:TextBox>
                                                        <%--<asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" Enabled="True" ServiceMethod="Listofdestination" MinimumPrefixLength="1" EnableCaching="true" TargetControlID="txtdestination" CompletionInterval="1000" CompletionSetCount="10" CompletionListCssClass="completionListElement" CompletionListItemCssClass="listItem" CompletionListHighlightedItemCssClass="highlightedListItem"/>--%>
                                                        <asp:HiddenField ID="hfCustomerId" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 clear-padding text-center" style="align-self: center;">
                                                <%--<a href="#" class="btn btn-danger custom-btn-danger">Search</a>--%>
                                                <asp:LinkButton
                                                    ID="linkbtn_search"
                                                    runat="server"
                                                    class="btn btn-primary custom-btn-primary responsive-search-btn"
                                                    Text="Search"
                                                    OnClick="linkbtn_search_Click"></asp:LinkButton>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="tab-pane container" id="hotels">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-3 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend22"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername13" placeholder="Nationality" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend221"><i class="fas fa-globe"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" id="datepicker" class="form-control custom-form-control" placeholder="Check-in">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Check-out" id="datepicker1">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
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
                                            <div class="col-sm-1 clear-padding"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="sightseeing">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-4 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Nationality" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-globe"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" id="datepicker2" class="form-control custom-form-control" placeholder="Check-in">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
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
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="transfer">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1111" placeholder="From Where" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane container" id="cruise">
                                        <div class="row custom-row-new">
                                            <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1111" placeholder="From Where" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
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
                                                        <input type="text" class="form-control custom-form-control" id="validationDefaultUsername11111" placeholder="Type Your Amount" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend2111"><i class="fas fa-map-marker-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Delivery Location" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="far fa-money-bill-alt"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                <div class="custom-area">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control custom-form-control" placeholder="Contact Details" aria-describedby="inputGroupPrepend2">
                                                        <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-envelope"></i></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
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
    <section class="body-area">
        <div class="trading-package">
            <div class="container">
                <div class="row">
                    <div class="promotional-area-homepage">
                        <div class="home-theme-boxx">
                            <h5>Our Holiday Themes</h5>
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/todayspick/2017/Dec/f2b71c90fc1a350349df55a27372a0eb.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/imagemanager/2017/Dec/e146fa679a3487469c66fb92cb6d7faf.png" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/commonimage/2018/Jan/e1c2ea530150d5400df1ea9bb76bb815.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/todayspick/2017/Dec/f2b71c90fc1a350349df55a27372a0eb.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/imagemanager/2017/Dec/e146fa679a3487469c66fb92cb6d7faf.png" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/commonimage/2018/Jan/e1c2ea530150d5400df1ea9bb76bb815.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/todayspick/2017/Dec/f2b71c90fc1a350349df55a27372a0eb.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/imagemanager/2017/Dec/e146fa679a3487469c66fb92cb6d7faf.png" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="promo-package-thumble">
                                                    <img src="https://www.yatra.com/ythomepagecms/media/commonimage/2018/Jan/e1c2ea530150d5400df1ea9bb76bb815.jpg" class="img-responsive" alt="">
                                                    <div class="promo-box-caotion">
                                                        <div><span class="day-tag">6N 7D</span> <span class="price-tag">INR 33,999 </span></div>
                                                    </div>
                                                    <div class="caption-box"><span class="promo-title">Charismatic Kashmir Ex-Kolkata</span> <span class="holidays-type">On Domestic Holidays</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev carousel-control-prev-new" href="#carouselExampleIndicators" role="button" data-slide="prev"><span><i class="fas fa-angle-left fa-3x carousel-control-prev-icon-new" aria-hidden="true"></i></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next carousel-control-next-new" href="#carouselExampleIndicators" role="button" data-slide="next"><span><i class="fas fa-angle-right fa-3x carousel-control-prev-icon-new" aria-hidden="true"></i></span><span class="sr-only">Next</span> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="why-choose-us-area pl-3 pr-4 pt-3">
        <div class="container">
            <div class="row">
                <div class="home-theme-box">
                    <div class="view-all-area-homepage pl-4 pr-4">
                        <h1 class="font-weight-bold">Holiday Inspirations</h1>
                    </div>
                    <div class="d-flex justify-content-center w-100 mb-3">
                        <div class="div-header-underline-reverse ml-4" style="margin-top: 5px;"></div>
                        <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                            </g></svg>
                        <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                            </g></svg>
                        <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                            </g></svg>
                        <div class="div-header-underline mr-4" style="margin-top: 5px;"></div>
                    </div>
                    <div class="pl-3 pr-3">
                        <div class="row ml-0 mr-2">
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img class="w-100" src="thumb/adventure.jpg" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/adventure-holiday-packages.aspx" style="color: white">Adventure</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/family.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/family-holiday-packages.aspx" style="color: white">Family</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/beach.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/beach-holiday-packages.aspx" style="color: white">Beach</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Honeymoon.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/honeymoon-holiday-packages.aspx" style="color: white">Honeymoon</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Senior_Citizen.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/Senior-Citizen-holiday-packages.aspx" style="color: white">Senior Citizen</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row ml-0 mr-2">
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Value_Group_Holiday.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/Value-Group-Holiday-holiday-packages.aspx" style="color: white">Value Group Holiday</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Ladies_Special.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/ladies-special-holiday-packages.aspx" style="color: white">Ladies Special</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Custom_Made_Holidays.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/custom-made-holiday-packages.aspx" style="color: white">Custom-Made Holidays</a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm pl-1 pr-1">
                                <div class="holiday-theme-area">
                                    <img src="thumb/Curated_Experiences.jpg" class="w-100" alt="" />
                                    <div class="imgoverlay">
                                        <div class="pkgData">
                                            <p><a href="Theme/curated-experiences-holiday-packages.aspx" style="color: white">Curated Experiences</a> </p>
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
    <section class="Zenith-Populer-Packages-section pt-2">
        <div class="container ">
            <div class="row">
                <div class="col-md-12">
                    <div class="body-package">
                        <div class="home-theme-box">
                            <div class="row custom-row">
                                <div class="view-all-area-homepage">
                                    <h1 class="font-weight-bold">Recommended Holidays</h1>
                                </div>
                                <div class="d-flex justify-content-center w-100 mb-3">
                                    <div class="div-header-underline-reverse ml-4" style="margin-top: 5px;"></div>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <div class="div-header-underline mr-4" style="margin-top: 5px;"></div>
                                </div>
                            </div>
                            <div class="row custom-row">
                                <asp:Repeater ID="DataListDomestic" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-3 col-sm-12 low-padding">
                                            <div class="Zenith-Populer-Packages">
                                                <asp:LinkButton ID="lnkbtnInternationalBook" runat="server" Text="" CommandArgument='<%# Eval("Destination")%>' CommandName='<%# Eval("Pkg_Group_type")%>' OnClick="lnkbtnInternationalBook_Click">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' CssClass="Zenith-Populer-Packages" />
                                                    <div class="imgoverlay-zenithpackage">
                                                        <div class="overlay-meta-box">
                                                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("Pkg_name") %>' Font-Size="14px" Style="color: white;" Visible-="false"></asp:Label><asp:Label ID="lblDomgroup" runat="server" Text='<%# Eval("Pkg_type") %>' Visible="false"></asp:Label><asp:Label ID="lblPkg_id" runat="server" Text='<%# Eval("Pkg_id") %>' Visible="false"></asp:Label>--%>
                                                            <h4 style="color: white"><%# Eval("Destination")%></h4>
                                                            <h5 style="color: #03A9F4; font-size: 13px !important;">Starting From</h5>
                                                            <h5><i class="fas fa-rupee-sign"></i><%# Eval("Per_Unit_Cost") %></h5>
                                                        </div>
                                                        <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>--%>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="home-theme-box">
                            <div class="row custom-row">
                                <div class="view-all-area-homepage">
                                    <h1 class="font-weight-bold">Featured Destinations</h1>
                                </div>
                                <div class="d-flex justify-content-center w-100 mb-3">
                                    <div class="div-header-underline-reverse ml-4" style="margin-top: 5px;"></div>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <svg width="12px" height="12px" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <rect x="1" y="1" width="14" height="14" fill="#666666"></rect>
                                        </g></svg>
                                    <div class="div-header-underline mr-4" style="margin-top: 5px;"></div>
                                </div>
                            </div>
                            <ul class="featured-destinations-box-area">
                                <asp:Repeater ID="rptr_FeaturedDestinationsn" runat="server">
                                    <ItemTemplate>
                                        <li class="low-padding">
                                            <div class="Zenith-Populer-Packages">
                                                <asp:LinkButton ID="lnkbtn_FeaturedDestinations" runat="server" Text="" CommandArgument='<%# Eval("Destination")%>' CommandName='<%# Eval("Pkg_Group_type")%>' OnClick="lnkbtn_FeaturedDestinations_Click">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' CssClass="Zenith-Populer-Packages" />
                                                    <div class="imgoverlay-zenithpackage">
                                                        <div class="overlay-meta-box overlay-meta-box-top">
                                                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("Pkg_name") %>' Font-Size="14px" Style="color: white;" Visible-="false"></asp:Label><asp:Label ID="lblDomgroup" runat="server" Text='<%# Eval("Pkg_type") %>' Visible="false"></asp:Label><asp:Label ID="lblPkg_id" runat="server" Text='<%# Eval("Pkg_id") %>' Visible="false"></asp:Label>--%> <%--<h5><i class="fas fa-rupee-sign"></i> <%# Eval( "Per_Unit_Cost") %></h5>--%>
                                                            <h3 class="font-weight-bold" style="color: white"><%# Eval("Destination")%></h3>
                                                        </div>
                                                        <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>--%>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <%-- <section class="why-choose-us-area">
        <div class="container ">
            <div class="row mt-3">
                <div class="col-md-4 col-sm-12 clear-right-padding">
                    <div class="dastination-adv-banner">
                        <a href="#">
                            <img src="img/banner1.jpg" class="img-fluid" alt="Promotional Banner" />
                        </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="dastination-adv-banner">
                        <a href="#">
                            <img src="img/banner-europe1.png" class="img-fluid" alt="Promotional Banner" />
                        </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 clear-left-padding">
                    <div class="dastination-adv-video">
                        <iframe style="width: 100%" height="200" src="https://www.youtube.com/watch?v=C_LKCXzF-94&ab_channel=OrchidGlobal=0&amp;controls=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="why-choose-us-area1">
        <div class="container ">
            <div class="home-theme-box home-theme-box-new">
                <div class="">
                    <div class="view-all-area-homepage text-left font-weight-bold">
                        <h3><i class="fas fa-lightbulb"></i>Why Book with OrchidGlobal</h3>
                    </div>
                    <div class="div-break-line"></div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-globe fa-lg"></i>20 Locations across India</h4>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-globe fa-lg"></i>10 Locations Worldwide</h4>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-people-carry fa-lg"></i>500+ Employees</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-users fa-lg"></i>1 Million + Happy Customers</h4>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-hand-holding-usd fa-lg"></i>Transparent Pricing</h4>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="why-choose-box">
                                <h4 class="promo-title"><i class="fas fa-money-check-alt fa-lg"></i>Easy Payment Options</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>

    <section class="why-choose-us-area1">
        <div class="container">
            <section class="after-header-section">
                <div class="after-header">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <!--<div class="carousel-item active"><a href="campaign/fbcampaign.aspx"> <img class="d-block w-100 custom-slider-image" src="img/Background/BIGSALE.jpg" alt="First slide"></a> </div>-->
                            <div class="carousel-item active">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/1.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/2.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/3.jpg" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/4.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/5.jpg?2" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/6.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/7.jpg" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/8.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/9.jpg" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 custom-slider-image" src="img/Background/10.jpg" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
                    </div>
                    <div class="body-content">
                        <div class="container">
                            <div class="col-sm-12">
                                <%--<h2 class="text-center header-headline">Book Hotels and Holiday Packages</h2>--%>
                                <div class="header-search-area">
                                    <div class="col-sm-12">
                                        <br />
                                        <br />
                                        <br />
                                        <%-- <ul class="nav nav-pills nav-pills-new">
                                  <li class="nav-item"><a class="nav-link active nav-link-custom" href="holidays.aspx" target="">Holidays</a> </li>
                                  <li class="nav-item"><a class="nav-link nav-link-custom" href="HotelSearch.aspx" target="">Hotels</a> </li>
                                  <li class="nav-item "><a class="nav-link nav-link-custom" href="SightSeeingSearch.aspx" target="">Sightseeing</a> </li>
                                  <li class="nav-item"><a class="nav-link nav-link-custom" href="TransferSearch.aspx" target="">Transfer</a> </li>
                                  <li class="nav-item"></li>
                                  <li class="nav-item" style="display: none"><a class="nav-link nav-link-custom nav-link-custom-after text-white" data-toggle="modal" data-target="#customizedHolidays">Customized Holidays</a> </li>
                              </ul>--%>
                                        <div class="tab-content tab-content-custom">

                                            <div class="tab-pane active container" id="holidays">
                                                <div class="row custom-row-new">
                                                    <div class="col-sm-10" style="border-right: none">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text input-group-text-custom"
                                                                        style="border-radius: 50%!important; font-size: 20px;"
                                                                        id="inputGroupPrepend2">
                                                                        <i class="fas fa-map-marker-alt"></i></span>
                                                                </div>
                                                                <span id="Span1" runat="server" style="display: none"></span>
                                                                <%--<input type="text" class="form-control custom-form-control" id="validationDefaultUsername" placeholder="Where Will Your Next Holiday Be" aria-describedby="inputGroupPrepend2">--%>
                                                                <asp:TextBox ID="TextBox1" runat="server" Font-Size="14px"
                                                                    placeholder="Enter Destination eg. Thailand, Japan , Europe" class="form-control custom-form-control font-weight-bold"></asp:TextBox>
                                                                <%--<asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" Enabled="True" ServiceMethod="Listofdestination" MinimumPrefixLength="1" EnableCaching="true" TargetControlID="txtdestination" CompletionInterval="1000" CompletionSetCount="10" CompletionListCssClass="completionListElement" CompletionListItemCssClass="listItem" CompletionListHighlightedItemCssClass="highlightedListItem"/>--%>
                                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 clear-padding text-center" style="align-self: center;">
                                                        <%--<a href="#" class="btn btn-danger custom-btn-danger">Search</a>--%>
                                                        <asp:LinkButton
                                                            ID="LinkButton1"
                                                            runat="server"
                                                            class="btn btn-primary custom-btn-primary responsive-search-btn"
                                                            Text="Search"
                                                            OnClick="linkbtn_search_Click"></asp:LinkButton>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="tab-pane container" id="hotels">
                                                <div class="row custom-row-new">
                                                    <div class="col-sm-3 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend22"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" id="validationDefaultUsername13" placeholder="Nationality" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend221"><i class="fas fa-globe"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" id="datepicker" class="form-control custom-form-control" placeholder="Check-in">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="Check-out" id="datepicker1">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
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
                                                    <div class="col-sm-1 clear-padding"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container" id="sightseeing">
                                                <div class="row custom-row-new">
                                                    <div class="col-sm-4 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="Nationality" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-globe"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2 low-padding" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" id="datepicker2" class="form-control custom-form-control" placeholder="Check-in">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-calendar-alt"></i></span></div>
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
                                                    <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container" id="transfer">
                                                <div class="row custom-row-new">
                                                    <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1111" placeholder="From Where" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane container" id="cruise">
                                                <div class="row custom-row-new">
                                                    <div class="col-sm-6" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" id="validationDefaultUsername1111" placeholder="From Where" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend211"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="To" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
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
                                                                <input type="text" class="form-control custom-form-control" id="validationDefaultUsername11111" placeholder="Type Your Amount" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom" id="inputGroupPrepend2111"><i class="fas fa-map-marker-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="Delivery Location" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="far fa-money-bill-alt"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3" style="border-right: 1px solid #000000; border-right: 1px solid rgba(0, 0, 0, 0.30)">
                                                        <div class="custom-area">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control custom-form-control" placeholder="Contact Details" aria-describedby="inputGroupPrepend2">
                                                                <div class="input-group-prepend"><span class="input-group-text input-group-text-custom"><i class="fas fa-envelope"></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2"><a href="#" class="btn btn-danger custom-btn-danger">Search</a> </div>
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
        </div>
    </section>

    <section class="why-choose-us-area1">
        <div class="container text-center" style="margin-top: 20px; margin-bottom: 20px">
            <h3 class="mb-4"><i class="fas fa-lightbulb"></i>Why Book with OrchidGlobal</h3>
            <div class="row">
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-globe fa-2x mb-3"></i>
                            <p class="card-text">20 Locations across India</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-globe fa-2x mb-3"></i>
                            <p class="card-text">10 Locations Worldwide</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-users fa-2x mb-3"></i>
                            <p class="card-text">500+ Employees</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-smile fa-2x mb-3"></i>
                            <p class="card-text">1 Million+ Happy Customers</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-hand-holding-usd fa-2x mb-3"></i>
                            <p class="card-text">Transparent Pricing</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 mb-2">
                    <div class="card shadow h-100" style="border-radius: 8px">
                        <div class="card-body text-center">
                            <i class="fas fa-money-check-alt fa-2x mb-3"></i>
                            <p class="card-text">Easy Payment Options</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <%-- <section class="why-choose-us-area"><div class="container "><div class="row pl-5 pr-5"><br/><p style="color: #999">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris molestie ante ac augue lacinia cursus. Pellentesque fringilla nisl vitae lectus commodo rutrum. Vestibulum maximus, enim ut aliquet fringilla, elit leo tincidunt mi, sit amet accumsan nulla lorem vel ex. Nam dolor ex, interdum sit amet maximus in, laoreet eget lacus. Ut tincidunt velit felis, sit amet eleifend lorem eleifend semper. Pellentesque sit amet est nec nulla feugiat pulvinar vitae id lacus. Phasellus purus est, vestibulum nec luctus vel, rhoncus mattis urna. Aliquam suscipit, ex eu blandit commodo, dui mi dictum augue, a ultrices neque nulla et nunc. Aliquam fermentum efficitur urna, at ullamcorper arcu. Maecenas turpis turpis, sodales ut dictum eget, pellentesque nec augue. Nunc malesuada pharetra augue et aliquet. Sed in turpis fermentum, efficitur augue vel, luctus ex.</p></div></div></section>--%> <%--</ContentTemplate></asp:UpdatePanel>--%>
    <section class="extra-box-area padT0 padB0">
        <div class="container-fluid">
            <div class="extra-box-content">
                <div class="extra-box-content-extra">
                    <div class="row custom-row">
                        <div class="col-sm-12 col-md-6 col-lg-6 border-right">

                            <div class="row" style="text-align: center">
                                <div class="col-6 col-sm-6"></div>
                                <div class="col-6 col-sm-6">
                                    <div class="before-footer before-footer-new pb-0">
                                        <h2>Need Help?</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <div class="col-6 col-sm-6">
                                </div>
                                <div class="col-6 col-sm-6">
                                    <div class="before-footer confused">
                                        <h4 class="font-weight-bold">Holidays In India</h4>
                                        <h5>Give us a call:</h5>
                                        <h5>+91 6290952054</h5>
                                    </div>
                                </div>
                            </div>


                            <h3 class="text-right font-weight-bold" style="margin-right: 90px">OR</h3>
                            <div class="row" style="text-align: center">
                                <div class="col-6 col-sm-6">
                                </div>
                                <div class="col-6 col-sm-6">
                                    <div class="before-footer confused">
                                        <h5>Write Us Email:</h5>
                                        <h5>enquiry@orchiddmc.net</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-5 col-lg-5">
                            <div class="before-footer before-footer-new text-left pb-0 mb-sm-4 ml-sm-4">
                                <h2>Get Started Here</h2>
                            </div>
                            <div class="before-footer ml-sm-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="input-group mb-4">
                                            <div class="input-group-prepend"><span class="input-group-text home-subs-icon"><i class="fas fa-envelope fa-lg"></i></span></div>
                                            <input id="txt_EmailId" runat="server" type="email" class="form-control" placeholder="Email Id" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_EmailId"
                                                Display="Static" ForeColor="white" ValidationGroup="sbk" ErrorMessage="Enter Email" runat="server" />
                                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server"
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ControlToValidate="txt_EmailId" ValidationGroup="sbk" ForeColor="white"
                                                ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-group mb-4">
                                            <%-- <input id="txt_PhoneNo" runat="server" type="text" class="form-control rounded-0" placeholder="Phone No" ondisposed="txt_PhoneNo_Disposed">--%>
                                            <span id="lbl_subscriber_mobileno" runat="server" style="display: none"></span>
                                            <div class="input-group-prepend"><span class="input-group-text home-subs-icon"><i class="fas fa-phone fa-lg"></i></span></div>
                                            <asp:TextBox ID="txt_PhoneNo" runat="server" class="form-control " placeholder="Mobile Number" TextMode="Phone"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_PhoneNo" Display="Static" ForeColor="white" ValidationGroup="sbk" ErrorMessage="Enter Mobile no." runat="server" />
                                            <asp:RegularExpressionValidator ID="REVtxt_PhoneNo" runat="server" ControlToValidate="txt_PhoneNo" ValidationGroup="sbk" ForeColor="white" ErrorMessage="Invalid Mobile no." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-group mb-4">
                                            <div class="input-group-prepend"><span class="input-group-text home-subs-icon"><i class="fa fa-home"></i></span></div>
                                            <input id="txt_City" runat="server" type="text" class="form-control " placeholder="City" />
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton ID="lnlbtn_SUBSCRIBENOW" runat="server" type="submit"
                                    class="btn home-subs-icon text-dark  subscribe-btn-new" Text="SUBSCRIBE NOW" ValidationGroup="sbk"
                                    OnClick="lnlbtn_SUBSCRIBENOW_Click"></asp:LinkButton>
                            </div>
                        </div>
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
    <script>$('#datepicker').datepicker(); $('#datepicker1').datepicker(); $('#datepicker2').datepicker(); </script>
    <script>$(document).on('change', '.div-toggle', function () { var target = $(this).data('target'); var show = $("option:selected", this).data('show'); if ('option:selected') { $(target).children().addClass('hide'); $(show).removeClass('hide'); } else { return false; } }); $(document).ready(function () { $('.div-toggle').trigger('change'); }); </script>
    <script>$("#lnlbtn_SUBSCRIBENOW").on('click', function (e) { var EmailId = $('#txt_EmailId').val(); var phone = $('#txt_PhoneNo').val(); var city = $('#txt_City').val(); if (EmailId === '') { alert("Please input Your Email"); $('#txt_EmailId').addClass("is-invalid"); e.preventDefault(); } else if (phone === '') { alert("Please input Your Mobile no"); $('#txt_PhoneNo').addClass("is-invalid"); e.preventDefault(); } else if (city === '') { alert("Please input Your City"); $('#txt_City').addClass("is-invalid"); e.preventDefault(); } else { $('.validation').addClass("is-valid"); } }); </script>
    <style>
        .modal-backdrop.show {
            opacity: 0;
        }

        .modal-open .modal {
            overflow-y: hidden;
        }

        #modal-pop .modal { /*left: calc(100% - 200px);*/
            top: calc(100% - 320px);
        }
    </style>

    <script>
        $(window).load(function () {
            $('#onload').modal('show');
        });
        $('#onload').modal({ keyboard: true, backdrop: 'static' });
        $(window).click(function () {
            $('#onload').modal('hide');
        });
    </script>
</asp:Content>
