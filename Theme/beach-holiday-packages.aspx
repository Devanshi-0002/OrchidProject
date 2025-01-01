<%@ Page Title="" Language="C#" MasterPageFile="~/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="beach-holiday-packages.aspx.cs" ClientIDMode="Static" Inherits="beach_holiday_packagess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media(max-width: 991px) {
            .dastination-tab-content {
                padding: 0;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
    <div class="dastination-slider-area d-sm-block">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner ">
                <div class="carousel-item destination-carousel-inner active">
                    <img class="d-block w-100 destination-slider-image" src="../img_theme/beach.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block dastination-carousel-caption w-75">
                        <h1>Beach Packages</h1>
                        <p class="h6 font-weight-light mt-2">Close your eyes and imagine standing on sun kissed sands, getting tanned and can only see crystal clear water in front of you. Beautiful isn’t it? These words cant explain how will you feel when you are actually experiencing a beach holiday. OrchidGlobal will help you to experience not only beach holidays in India but around the world. Scroll down and book your beach tour packages with us in no minute. No hustle just a click of your mouse and your beach Holiday Tour is Booked right away.</p>
                    </div>
                    <div class="carousel-itineary-btn">
                        <a href="#">Download Itinerary <i class="fas fa-download"></i></a>
                    </div>
                </div>
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
    <span id="lbldeparture_City" runat="server" style="display: none"></span>
    <span id="lbldeparture_date" runat="server" style="display: none"></span>
    <span id="lbl_pkgtype" runat="server" style="display: none"></span>
    <%--<asp:UpdatePanel ID="ajbcn" runat="server"><ContentTemplate>--%>
    <div class="dastination-body-area">
        <div class="container">
            <div class="row">
                <div class="col-12 p-sm-0">
                    <div class="dastination-package-main">
                        <ul class="nav nav-tabs dastination-nav-tabs mt-sm-4 text-center" role="tablist">
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
                        </ul>
                        <div class="tab-content pr-sm-0 dastination-tab-content">
                            <div class="tab-pane active dastination-tab-panel" id="home" role="tabpanel">
                                <asp:Repeater ID="rpt_adventure" runat="server">
                                    <ItemTemplate>
                                        <div class="desctination-package-area mb-5">
                                            <ul class="dastination-package-box pr-sm-0 row m-0">
                                                <li class="col-12 col-md-5 col-sm-12 pr-sm-0">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' class="w-100 destination-package-image" />
                                                <li class="col p-sm-0">
                                                    <div class="dastination-package-details">
                                                        <h5 class="dastination-package-details-title"><%# Eval("Sub_PkgName") %></h5>
                                                        <p class="font-weight-bold mb-sm-2"><%# Eval("pkg_duration") %> Nights</p>
                                                        <ul class="daetination-night-stay">
                                                            <%-- <li><span></span></li>--%>
                                                            <%--<li><span>1N Nubra</span></li>--%>
                                                        </ul>
                                                        <hr class="text-black mt-2 mb-1" />
                                                        <p class="font-weight-bold mb-2">Highlights</p>
                                                        <ul class="dastination-highlight-list">
                                                            <li><span><%# Eval("Heighlights") %></span></li>
                                                            <%-- <img title="Group" src="img/group.png" alt="Zenith Group Tour" class="Groupcustomize">--%>
                                                        <p class=" ml-sm-4 text-right">
                                                            <asp:LinkButton ID="LinkButton1" runat="server" class="text-primary" Text="View All" CommandArgument='<%# Eval("Pkg_code")%>' CommandName='<%# Eval("City")%>' OnClick="lnkbtnInternationalBook_Click"></asp:LinkButton>
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
                                                    <asp:LinkButton ID="lnkbtnInternationalBook" runat="server" class="btn btn-danger" Text="More Details" CommandArgument='<%# Eval("Pkg_code")%>' CommandName='<%# Eval("City")%>' OnClick="lnkbtnInternationalBook_Click"></asp:LinkButton>
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
                                                <p><span class="text-warning h6 font-weight-bold"><a style="color: #ffcd1f !important;" href="tel:+916290952054">(+91)6290952054</a> </span><span>(7am - 10pm)</span></p>
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
                                        <asp:LinkButton ID="btn_saveEnq" runat="server" Text="CALL ME BACK" type="submit" class="btn btn-danger btn-block btn-lg" OnClick="btn_saveEnq_Click"></asp:LinkButton>
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
    <%--</ContentTemplate></asp:UpdatePanel>--%>
</asp:Content>
