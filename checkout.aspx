<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" ClientIDMode="Static" EnableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <script>(function (w, d, s, l, i) { w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f); })(window, document, 'script', 'dataLayer', 'GTM-KJGJS2S');</script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OrchidGlobal</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/GlobalStyle.css?ver10" rel="stylesheet" />
    <link href="Content/responsive.css?ver10" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link href="img/favicon.gif" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <div id="fb-root"></div>
    
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="jhi" runat="server"></asp:ScriptManager>
        <script src="Scripts/jquery-3.3.1.js"></script>
        <script src="Scripts/modernizr-2.6.2.js"></script>
        <script src="Scripts/respond.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
        <section>
            <div class="top-menu-row inner-top-menu-row" id="task_flyout">
                <%--id="scrolldiv"--%><div class="container">
                    <div class="row">
                        <div class="col-4 col-sm-4 col-md-3"><a class="nav-link active nav-link-custom" href="Default.aspx">
                            <img src="img/logo.png" alt="Zenith Logo" class="img-responsive zenith-log" /></a></div>
                        <div class="col-md-9 col-sm-8 col-8 clear-padding ">
                            <div class="menu-area float-right">
                                <nav class="navbar navbar-custom navbar-expand-lg">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fas fa-align-justify fa-2x"></i></button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav navbar-nav-custom mr-auto">
                                             <li class="nav-item"><a class="nav-link manu-nav-custom-link active text-black" style="border-bottom: 2px solid #ff0020;" href="holidays.aspx" target="">Holidays</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href="customized_package/index.aspx" target="">Create Package</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href="HotelSearch.aspx" target="">Hotels</a> </li>
                                            <li class="nav-item "><a class="nav-link manu-nav-custom-link text-black" href="SightSeeingSearch.aspx" target="">Sightseeing</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href="TransferSearch.aspx" target="">Transfer</a> </li>
                                             <li class="nav-item "><a class="nav-link manu-nav-custom-link text-black" href="contact_us">Contact Us</a></li>
                                            <li class="nav-item dropdown nav-dropdown-new text-black" id="limenu_myAccount" runat="server" visible="true"><a class="nav-link dropdown-toggle manu-nav-custom-link-for-myaccount text-black" href="#" id="navbarDropdown111" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</a><div class="dropdown-menu dropdown-md-new" aria-labelledby="navbarDropdown111">
                                                <div class="container clear-padding">
                                                    <div class="col-md-12 clear-padding"><%--<p class="menu-contact-headline"><i class="fas fa-lock fa-2x"></i></p>--%><div class="row">
                                                        <div class="col-md-12">
                                                            <div class="p-3 bg-white" style="box-shadow: 0 0 10px #888888">
                                                                <div id="login-dp">
                                                                    <div class="form-group"><a href="modalRegistration" class="btn btn-danger rounded-0 btn-block" data-toggle="modal" data-target="#modalLogin">LOGIN</a> <%--<a href="#" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#modalRegistration">Register Here</a>--%></div>
                                                                    <div class="form-group">
                                                                        <p class="h5 m-0 text-center">OR</p>
                                                                        <a href="modalRegistration" class="btn btn-danger rounded-0 btn-block" data-toggle="modal" data-target="#modalRegistration">SIGN UP</a> <%--<a href="#" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#modalRegistration">Register Here</a>--%></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </li>
                                            <li class="nav-item dropdown nav-dropdown-new" id="limenu_userProfile" runat="server" visible="false"><a class="nav-link dropdown-toggle manu-nav-custom-link-for-myaccount text-black" href="#" id="navbarDropdown112" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hi <span id="username" runat="server"></span></a>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown1"><a class="dropdown-item" href="My-Bookings.aspx"><i class="fas fa-caret-right fa-lg text-light-low"></i>My Bookings</a> <a class="dropdown-item" href="my-profile.aspx"><i class="fas fa-caret-right fa-lg text-light-low"></i>My Profile</a> <a class="dropdown-item" href="logout.aspx"><i class="fas fa-caret-right fa-lg text-light-low"></i>Logout</a></div>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <span id="lbl_pkgtype" runat="server" style="display: none"></span>
        <div class="mini-search-row">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-4 my-1">
                        <div class="row">
                            <div class="col-auto d-sm-block">
                                <img src="img/travel-icon.png" alt="" /></div>
                            <div class="input-group col">
                                <input type="text" class="form-control form-control-custom form-control-lg border-0 rounded-0" id="txtFrom" placeholder="Kolkata"><div class="input-group-prepend rounded-0 ">
                                    <div class="input-group-text border-0 bg-white"><i class="fas fa-map-marker-alt fa-lg text-black-50"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 my-1">
                        <label class="sr-only" for="txtTo">To</label><div class="input-group">
                            <input type="text" class="form-control form-control-custom border-0 form-control-lg rounded-0" id="txtTo" placeholder="Bali"><div class="input-group-prepend rounded-0 ">
                                <div class="input-group-text border-0 bg-white"><i class="fas fa-map-marker-alt fa-lg text-black-50"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 my-1">
                        <label class="sr-only" for="txtDate">Date</label><div class="input-group">
                            <input type="date" class="form-control border-0 form-control-lg rounded-0 form-control-custom" id="txtDate"><div class="input-group-prepend rounded-0 ">
                                <div class="input-group-text border-0 bg-white"><i class="fas fa-calendar-alt fa-lg text-black-50"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12 my-1">
                        <button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button></div>
                </div>
            </div>
        </div>
        <div class="checkout-area">
            <section>
                <div class="container">
                    <div class="row ml-sm-0 mr-sm-0 mt-sm-3 mb-sm-3">
                        <div class="col-12 col-md-auto">
                            <asp:Label ID="lblpgkid" runat="server" Visible="false"></asp:Label><p><span class="mr-2"><i class="fas fa-map-marker-alt fa-lg"></i></span><span id="packagename" runat="server"></span></p>
                        </div>
                        <div class="col-md-auto col-4">
                            <p><span class="mr-2"><i class="fas fa-calendar-alt fa-lg"></i></span><span id="departure_date" runat="server"></span></p>
                        </div>
                        <div class="col-md-auto col-4">
                            <p><span class="mr-2"><i class="fa fa-plane fa-lg"></i></span><span id="destination" runat="server"></span></p>
                        </div>
                        <div class="col-md-auto col-4 p-0">
                            <p><span class="mr-2"><i class="fas fa-user fa-lg"></i></span><span><span id="NoOfAdult" runat="server"></span>Adult <span id="NoOfChild" runat="server"></span>Child </span></p>
                        </div>
                        <span id="lbl_totalRoom" runat="server" visible="false"></span></div>
                    <div class="w-100" style="display: none">
                        <div class="row mt-3 mb-3 text-right ">
                            <div class="col-6 col"><a href="#" class="btn btn-secondary rounded-0"><span class="mr-1"><i class="far fa-save fa-lg"></i></span>Save As PDF </a></div>
                            <div class="col-6 col-md-auto"><%--<a class="" data-toggle="modal" data-target="#sendEnquiry">Submit Query</a>--%>
                                <button type="button" class="btn btn-danger rounded-0" data-toggle="modal" data-target="#sendEnquiry">Send Enquiry</button></div>
                            <hr class="w-100" />
                        </div>
                    </div>
                    <div class="row mt-sm-3 mb-sm-3">
                        <div class="col-md-9 col-sm-12 col-12 pl-sm-0 pr-sm-0">
                            <div class="checkout-main-body">
                                <h5 class="bg-light p-3 text-dark">Almost done! Just fill in the required details</h5>
                                <div class="checkOut-body-area"><%--payumoney--%><div>
                                    <div id="frmError" runat="server"><span style="color: red">Please fill all mandatory fields and Choose The Payment Mode.</span></div>
                                    <input type="hidden" runat="server" id="key" name="key" />
                                    <input type="hidden" runat="server" id="hash" name="hash" />
                                    <input type="hidden" runat="server" id="txnid" name="txnid" />
                                    <%--<input type="hidden" runat="server" id="enforce_paymethod" name="enforce_paymethod" />
                                    <input id="service_provider" runat="server" value="payu_paisa" type="hidden" />--%>
                                    <input id="productinfo" runat="server" value="Package Name" type="hidden" />
                                    <input id="surl" runat="server" type="hidden" />
                                    <input id="furl" runat="server" type="hidden" /></div>
                                    <div class="row mt-3" id="panelHide" runat="server" visible="True">
                                        <div class="col-12 col-sm-7 col-md-7 border-right">
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox" id="IHaveAZenithAccount" runat="server">
                                                    <input type="checkbox" class="custom-control-input mr-2" id="checkbox1">
                                                    <label class="custom-control-label custom-control-label-lg " for="checkbox1">I Have A OrchidGlobal Account</label></div>
                                            </div>
                                            <small class="font-weight-bold text-danger "><span id="NowToBookonlineasaguest" runat="server">To Book online as a guest</span> </small>
                                            <div class="form-group showDiv">Enter Your Name<span style="color: red"> *</span>
                                                <asp:TextBox ID="firstname" Required="Required" runat="server" CssClass="form-control rounded-0 bg-white " placeholder="Enter Your Name" /></div>
                                            <div class="form-group">Enter Your Email Id<span style="color: red"> *</span>
                                                <asp:TextBox ID="email" Text="" Required="Required" runat="server" TextMode="Email" CssClass="form-control rounded-0 bg-white " placeholder="Your Email ID" />
                                                <small>Your Booking Details Will Send To Your Email Address</small></div>
                                            <div class="showDiv">
                                                <div class="form-group">Enter Your Mobile number<span style="color: red"> *</span>
                                                    <asp:TextBox ID="phone" Text="" Required="Required" runat="server" TextMode="Number" CssClass="form-control rounded-0 bg-white " placeholder="Enter Mobile number" />
                                                    <small>We will use this number to send possible updates alerts.</small></div>
                                                <div class="form-group">
                                                    <div class="w-50 mr-auto ml-auto">
                                                        <asp:LinkButton ID="submit" Text="Submit" class="btn btn-danger btn-lg btn-block" runat="server" OnClick="submit_Click" /></div>
                                                </div>
                                            </div>
                                            <div class="hideDiv">
                                                <div class="form-group">Enter Your Password<span style="color: red"> *</span>
                                                    <asp:TextBox runat="server" ID="txtUserPassword" CssClass="form-control rounded-0 bg-white" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                                                    <small>Enter Your Password </small></div>
                                                <div class="form-group">
                                                    <div class="w-50 mr-auto ml-auto">
                                                        <asp:LinkButton runat="server" ID="loginHere" OnClick="loginHere_OnClick" CssClass="btn btn-danger btn-lg btn-block" Text="Login Here"></asp:LinkButton></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col checkout-registation showDiv" id="Popup_DontHaveAccount" runat="server">
                                            <p class="mb-3 h6">Don't Have Account?</p>
                                            <div class="w-75 mr-auto ml-auto"><a href="#" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#modalRegistration">Register Here</a><hr class="w-100" />
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div id="panelShow" runat="server" Visible="False"> <asp:HiddenField runat="server" ID="firstname1"/> <asp:HiddenField runat="server" ID="email1"/> <asp:HiddenField runat="server" ID="phone1"/><div class="p-5 text-center"> <asp:LinkButton runat="server" OnClick="submit_Click" ID="submit1" CssClass="btn btn-danger btn-lg pl-5 pr-5" Text="Pay Now"></asp:LinkButton></div></div>--%></div>
                            </div>
                        </div>
                        <div class="col-12 col-md-3 col-sm-12">
                            <asp:UpdatePanel UpdateMode="Conditional" ID="updcsaOthercontrols" runat="server">
                                <ContentTemplate>
                                    <div class="mb-4">
                                        <h5 class="bg-light p-3 text-dark">Fare Details</h5>
                                        <div class="checkOut-body-area w-100">
                                            <p class="row"><span class="col-auto">Base Price</span> <span class="col text-right"><i class="fas fa-rupee-sign"></i><span id="BasePrice" runat="server"></span></span></p>
                                            <hr class="w-100 " />
                                            <p class="row"><span class="col-auto">GST/Tax 5%</span> <span class="col text-right"><i class="fas fa-rupee-sign"></i><span id="Taxes" runat="server"></span></span></p>
                                            <hr class="w-100 " />
                                            <div class="row"><span class="col-7">Total Package Cost</span><p class="col text-right d-flex"><span><i class="fas fa-rupee-sign"></i></span><span>
                                                <asp:TextBox ID="payAmount" runat="server" CssClass="text-danger border-0 form-control bg-white p-0 text-center h-auto h5 m-0" ReadOnly="true" /></span></p>
                                                <hr style="width: 89%" />
                                            </div>
                                            <div class="row" runat="server" id="payAmountVisable" visible="False"><span class="col-7">You Are Paying</span><p class="col text-center d-flex bg-dark text-white"><span><i class="fas fa-rupee-sign"></i></span><span>
                                                <asp:TextBox ID="amount" runat="server" CssClass="text-white border-0 form-control text-center bg-dark p-0 h-auto h5 m-0" ReadOnly="true" /></span></p>
                                                <hr style="width: 85%" />
                                            </div>
                                            <div class="row" runat="server" id="remainAmountVisable" visible="False"><span class="col-7">Remain Amount </span>
                                                <p class="col d-flex"><span><i class="fas fa-rupee-sign"></i></span><span>
                                                    <asp:TextBox ID="remainAmount" runat="server" CssClass="text-danger border-0 form-control text-center bg-white p-0 h-auto h5 m-0" ReadOnly="true" /></span></p>
                                                <hr style="width: 85%" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h5 class="bg-light p-3 text-dark">Choose The Payment Mode</h5>
                                        <div class="checkOut-body-area w-100">
                                            <div class="custom-control custom-radio ">
                                                <div>
                                                    <input type="radio" runat="server" id="customRadio1" name="customRadio" class="custom-control-input" onserverchange="customRadio1_OnServerChange" onclick="OnRadioChange(this); " />
                                                    <label class="custom-control-label h6" for="customRadio1">Pay & Hold 20% Per Person</label><div class="col">
                                                        <p class="text-secondary">Pay Now For <span id="totalnoofAdutl" runat="server"></span></p>
                                                        <i class="fas fa-rupee-sign"></i><span id="payandhold_Amount" runat="server"></span>and Reserve Your Holiday</div>
                                                    <%--per Person and Reserve Your Holiday--%></div>
                                            </div>
                                            <%--<hr class="w-100" />--%><div class="mt-3" style="display: none">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="customRadio2" onserverchange="customRadio2_OnServerChange" onchange="OnRadioChange(this); return false;" name="customRadio" class="custom-control-input" />
                                                    <label class="custom-control-label h6" for="customRadio2">Partial Payment</label><div class="row mt-2">
                                                        <div class="col">
                                                            <p class="text-secondary">Pay Now:</p>
                                                        </div>
                                                        <div class="col text-right"><i class="fas fa-rupee-sign"></i><span id="PartialPayment_PayNow" runat="server"></span></div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <p class="text-secondary">Pay Later:</p>
                                                        </div>
                                                        <div class="col text-right"><i class="fas fa-rupee-sign"></i><span id="PartialPayment_PayLater" runat="server"></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="w-100" />
                                            <div class="mt-3">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="customRadio3" onclick="OnRadioChange(this); " name="customRadio" onserverchange="customRadio3_OnServerChange" class="custom-control-input" />
                                                    <label class="custom-control-label h6" for="customRadio3">Pay Now</label><div class="row mt-2">
                                                        <div class="col">
                                                            <p class="text-secondary">Pay Now:</p>
                                                        </div>
                                                        <div class="col text-right"><i class="fas fa-rupee-sign"></i><span id="PayNow" runat="server"></span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <section class="w-100 bg-white">
            <div class="before-footer">
                <div class="container">
                    <div class="row"><%--<div class="col"><p class="text-secondary h5 mt-3">Pay Secured online:</p></div>--%><div class="col text-center">
                        <p class="small mb-1">Connect With Us:</p>
                        <span><a href="#"><i class="fab fa-facebook-f fa-lg text-secondary mr-2"></i></a></span><span><a href="#"><i class="fab fa-twitter fa-lg text-secondary mr-2"></i></a></span><span><a href="#"><i class="fab fa-instagram fa-lg text-secondary mr-2"></i></a></span><span><a href="#"><i class="fab fa-youtube fa-lg text-secondary mr-2"></i></a></span><span><a href="#"><i class="fab fa-pinterest-p fa-lg text-secondary mr-2"></i></a></span><span><a href="#"><i class="fab fa-google-plus-g fa-lg text-secondary"></i></a></span></div>
                        <div class="col">
                            <img src="img/paymentOption.png" class="img-fluid" /></div>
                    </div>
                </div>
            </div>
        </section>
        <%--	Modal Area--%>
        <asp:Label ID="lblPkg_type" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblpkgname" runat="server" Visible="false"></asp:Label><div class="modal " id="sendEnquiry" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-lg package-details-modal-for-enquiry-lg" role="document">
                <div class="modal-content package-details-modal-for-enquiry">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLabel">Get the Best Holiday Planned by Experts!</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 pr-sm-0">
                                <div class="modal-call-option">
                                    <h4 class="text-danger font-weight-bold pb-4"><span class="package-modal-call-icon"><i class="fas fa-phone img-flip text-white"></i></span><span>Call (+91)6290952054</span></h4>
                                    <hr class="w-100" />
                                    <p class="pt-sm-3 h5 pl-sm-5 mr-sm-5 pr-sm-3">Enter your contact details and we will plan the best holiday suiting all your requirements.</p>
                                </div>
                                <div class="package-enquiry-modal-form pr-sm-4 pl-sm-3 mt-sm-4">
                                    <div class="row">
                                        <div class="col">
                                            <asp:TextBox ID="txt_YourName" runat="server" CssClass="form-control rounded-0" placeholder="Your Name"></asp:TextBox></div>
                                        <div class="col">
                                            <asp:TextBox ID="txt_emailid" runat="server" TextMode="Email" CssClass="form-control rounded-0" placeholder="Your Email"></asp:TextBox></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-4 pr-1 pr-sm-0">
                                            <asp:TextBox ID="txt_mobileno" runat="server" TextMode="Number" CssClass="form-control rounded-0" placeholder="Phone With Country Code"></asp:TextBox></div>
                                        <div class="col-4 pr-1 pl-1 pr-sm-0">
                                            <asp:TextBox ID="txt_cityname" runat="server" CssClass="form-control rounded-0" placeholder="Your City "></asp:TextBox></div>
                                        <div class="col-4 pl-1">
                                            <asp:TextBox ID="txt_traveldate" runat="server" TextMode="Date" CssClass="form-control rounded-0" placeholder="Travel Date"></asp:TextBox></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-auto col-12 mb-3 mt-sm-2 pr-sm-0"><span>No. of Traveller(s) :</span></div>
                                        <div class="col-md-auto col-4">
                                            <div class="input-group input-group-custom"><span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Adult"><span>-</span> </button>
                                            </span>
                                                <input id="txt_noof_Adult" runat="server" type="text" name="quant[1]" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Adult"><span>+</span> </button>
                                                </span></div>
                                            <small class="text-secondary">Adult (12yrs +)</small></div>
                                        <div class="col-md-auto col-4">
                                            <div class="input-group input-group-custom"><span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Child"><span>-</span> </button>
                                            </span>
                                                <input id="txt_noof_Child" runat="server" type="text" name="quant[2]" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Child"><span>+</span> </button>
                                                </span></div>
                                            <small class="text-secondary">Child (2-12yrs)</small></div>
                                        <div class="col-md-auto col-4">
                                            <div class="input-group input-group-custom"><span class="input-group-btn">
                                                <button type="button" class="btn btn-secondary btn-number rounded-0" disabled="disabled" data-type="minus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Infant"><span>-</span> </button>
                                            </span>
                                                <input id="txt_noof_Infant" runat="server" type="text" name="ctl00$BodyContentPlaceHolder$txt_noof_Adult" class="form-control input-number rounded-0" value="1" min="1" max="20" />
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-secondary btn-number rounded-0" data-type="plus" data-field="ctl00$BodyContentPlaceHolder$txt_noof_Infant"><span>+</span> </button>
                                                </span></div>
                                            <small class="text-secondary">Infant (0-2yrs)</small></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col text-right">
                                            <asp:TextBox ID="txt_coment" runat="server" Rows="3" TextMode="MultiLine" CssClass="form-control rounded-0" placeholder="Type your message "></asp:TextBox></div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col text-right">
                                            <asp:LinkButton ID="btn_saveEnq" runat="server" Text="SUBMIT" class="btn btn-danger btn-lg font-weight-bold rounded-0 w-50" type="submit" OnClick="btn_saveEnq_Click"></asp:LinkButton></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--user Registation--%><div class="modal animated fadeInLeft delay-0s" id="modalRegistration" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog " role="document">
                <div class="modal-content package-details-modal-for-enquiry">
                    <div class="modal-header text-white bg-danger pt-2 pb-2 pl-4 pr-4">
                        <h2 class="modal-title h3">Register Here</h2>
                        <button type="button" class="close pt-4" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="First Name" ID="txtFirstName"></asp:TextBox></div>
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Last Name" ID="txtLastName"></asp:TextBox></div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Email Id" TextMode="Email" ID="txtEmailId"></asp:TextBox></div>
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Mobile Number" ID="txtPhoneNumber" TextMode="Number"></asp:TextBox></div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Password" TextMode="Password" ID="txtPassword"></asp:TextBox></div>
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Country" ID="txtCountry"></asp:TextBox></div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <asp:TextBox runat="server" CssClass="form-control rounded-0" placeholder="Date Of Birth" ToolTip="Date of Birth" TextMode="Date" ID="txtDateOfBirth"></asp:TextBox></div>
                            <div class="form-group col text-center">
                                <asp:LinkButton CssClass="btn btn-lg btn-danger" runat="server" ID="btnRegistationSave" Text="Register Now" OnClick="btnRegistationSave_Click" /></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--user Login--%><div class="modal animated fadeIn delay-0s" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog " role="document">
                <div class="modal-content package-details-modal-for-enquiry">
                    <div class="modal-header text-white bg-danger pt-2 pb-2 pl-4 pr-4">
                        <h2 class="modal-title h3">Login Here</h2>
                        <button type="button" class="close pt-4" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="p-3 bg-white" style="box-shadow: 0 0 10px #888888">
                                    <div>
                                        <div class="form-group">
                                            <input type="email" class="form-control cus-frm-crnt" id="useremailid" runat="server" placeholder="Email address" required="required" /></div>
                                        <div class="form-group">
                                            <input type="Password" class="form-control cus-frm-crnt" id="userPassword" runat="server" placeholder="Password" required="required" /><br />
                                            <div class="help-block text-right">
                                                <asp:LinkButton ID="lnk_Forgetpassword" runat="server" Text="Forget the password ?" OnClick="lnk_Forgetpassword_Click"></asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:LinkButton ID="lbtn_signin" runat="server" Text="SIGN IN" class="btn btn-danger btn-block " OnClick="lbtn_signin_Click"></asp:LinkButton></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <footer>
                    <div>
                        <div class="container container-new">
                            <div class="row m-0">
                                <div class="col-md-3">
                                    <h1 class="ist-footer-title">ORCHIDGLOBAL</h1>
                                    <ul class="footer-menu">
                                        <%--<li class="znslsh">Orchidglobal </li>--%>
                                        <li>
                                            <p class="pull-left">Phone &nbsp;:</p>
                                            <p class="pull-left" itemprop="telephone" style="width: 190px">
                                                INDIA & SOUTH ASIA
                                                <br />
                                                +91 6290952054
                                                <br>
                                                BANGLADESH
                                                <br />
                                                +880 1766189138
                                                <br>
                                                REST OF THE WORLD
                                                <br />
                                                +91 6290952054
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-auto">
                                    <h2 class="footer-title">ABOUT ORCHIDGLOBAL</h2>
                                    <ul class="footer-menu">
                                        <li><a href="About.aspx">About</a></li>
                                        <%--<li><a href="#">Awards Gallery</a></li>--%> <%--<li><a href="#">Zenith Offers</a></li>--%> <%--<li><a href="#">Careers</a></li>--%> <%--our_career.aspx--%><li><a href="termsandcondition.aspx">Terms & Conditions</a></li>
                                        <li><a href="how_to_book.aspx">How To Book</a></li>
                                        <%--<li><a href="our_team.aspx">Our Team</a></li>--%><%--<li><a href="zen_khusi.aspx">Zen Khushi</a></li>--%>
                                    </ul>
                                </div>
                                <div class="col-md-auto">
                                    <h2 class="footer-title">OUR PRODUCTS & SERVICES</h2>
                                    <ul class="footer-menu">
                                        <li><%--<a href="https://www.payumoney.com/webfronts/#/index/ZenithLeisureHolidaysLtd">--%>Make Payments<%--</a>--%></li>
                                        <%--<li><a href="#">Visa Forms</a></li>--%> <%--<li><a href="#">Visa Documents Required</a></li>--%>
                                        <li><a href="mice.aspx">Corporate Travel(MICE)</a></li>
                                        <%--<li><a href="mice">MICE</a></li>--%>
                                    </ul>
                                </div>
                                <div class="col-md-auto">
                                    <h2 class="footer-title">HELP</h2>
                                    <ul class="footer-menu">
                                        <%--li><a href="contact_us.aspx">Enquiry</a></li>--%><li><a href="contact_us.aspx">Contact Us</a></li>
                                        <%--<li><a href="contact_us.aspx">Customer Support</a></li><li><a href="#">FeedBack</a></li><li><a href="#">Privacy Policy</a></li><li><a href="#">Sitemap</a></li>--%>
                                        <li><a href="#">Blog</a></li>
                                    </ul>
                                </div>
                                <%--<div class="col-sm-2"></div>--%>
                            </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-6 col-md-4 col-lg-3">
                                    <span class="footer-email"><i class="fas fa-envelope fa-lg"></i>
                                        <a href="mailto:enquiry@orchiddmc.net">enquiry@orchiddmc.net</a></span>
                                </div>
                                <div class="col-sm-6 col-md-4 col-lg-3"><span class="footer-phone">24X7 <i class="fas fa-phone fa-lg"></i>+91 6290952054</span></div>
                                <div class="col-sm-6 col-md-4 col-lg-3"><span class="fotter-social-media">Connect with us: <a href="https://www.facebook.com/orchid.holidays2" target="_blank">
                                    <i class="fab fa-facebook-square fa-lg" aria-hidden="true"></i></a>
                                    <a href="https://twitter.com/DmcOrchid" target="_blank">
                                    <i class="fab fa-twitter-square fa-lg" aria-hidden="true"></i></a><a href="https://www.youtube.com/channel/UCG8JjyLm1z4MnaMab9Ib25Q" target="_blank">
                                    <i class="fab fa-youtube-square fa-lg" aria-hidden="true"></i></a><a href="#" target="_blank">
                                    <i class="fab fa-google-plus-square fa-lg" aria-hidden="true"></i></a><a href="https://www.linkedin.com/company/orchidglobal" target="_blank">
                                    <i class="fab fa-linkedin fa-lg" aria-hidden="true"></i></a><a href="https://www.instagram.com/orchid_global" target="_blank">
                                    <i class="fab fa-instagram fa-lg" aria-hidden="true"></i></a></span></div>
                                <div class="col-sm-6 col-md-4 col-lg-3">
                                    <span class="footer-payment">WE ACCEPT
                                    <img src="img/payu.jpg" alt="" /></span>
                                    <%--<b style="color:whitesmoke">No of Visitors : <asp:Label runat="server" ID="lbluser" /></b>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                </footer>
        
        <div class="container-fluid">
            <div class="row">
                <p class="footr-copyright text-center">&copy; <%: DateTime.Now.Year %> - Orchidglobal.net</p>
            </div>
        </div>
        <script>function radioCheck(e) { if (!$("input[name='customRadio']:checked").val()) { alert('Please Choose The Payment Mode'); e.preventDefault(); } else { return true; } return true; } $(document).ready(function () { var panelShow = document.getElementById('panelShow'); if (panelShow) { document.getElementById('firstname1').value = '<%= Session["Emp_FirstName"] %>'; document.getElementById('email1').value = '<%= Session["Emailid"] %>'; document.getElementById('phone1').value = '<%= Session["Phone_no"] %>'; } $('#submit1').click(function () { radioCheck(); }); $('#submit').click(function () { radioCheck(); }); $('.hideDiv').hide(); $('#checkbox1').change(function () { if (this.checked) { $('.hideDiv').show(); $('.showDiv').hide(); } else { $('.hideDiv').hide(); $('.showDiv').show(); } }); });</script>
        <script>$(document).ready(function () { $('.btn-number').on('click', function (e) { fieldName = $(this).attr('data-field'); type = $(this).attr('data-type'); var input = $("input[name='" + fieldName + "']"); var currentVal = parseInt(input.val()); if (!isNaN(currentVal)) { if (type == 'minus') { if (currentVal > input.attr('min')) { input.val(currentVal - 1).change(); } if (parseInt(input.val()) === input.attr('min')) { $(this).attr('disabled', true); } } else if (type === 'plus') { if (currentVal < input.attr('max')) { input.val(currentVal + 1).change(); } if (parseInt(input.val()) == input.attr('max')) { $(this).attr('disabled', true); } } } else { input.val(0); } }); $('.input-number').focusin(function () { $(this).data('oldValue', $(this).val()); }); $('.input-number').change(function () { minValue = parseInt($(this).attr('min')); maxValue = parseInt($(this).attr('max')); valueCurrent = parseInt($(this).val()); name = $(this).attr('name'); if (valueCurrent >= minValue) { $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled'); } else { alert('Sorry, the minimum value was reached'); $(this).val($(this).data('oldValue')); } if (valueCurrent <= maxValue) { $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled'); } else { alert('Sorry, the maximum value was reached'); $(this).val($(this).data('oldValue')); } }); $(".input-number").keydown(function (e) { if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 || (e.keyCode == 65 && e.ctrlKey === true) || (e.keyCode >= 35 && e.keyCode <= 39)) { return; } if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) { e.preventDefault(); } }); })</script>
        <script type="text/javascript">function OnRadioChange(cntrl) { if (cntrl.checked) { __doPostBack('somedata', cntrl.id); } }</script>
        <script>$("#btnRegistationSave").on('click', function (e) { var name = $('#txtFirstName').val(); var lastname = $('#txtLastName').val(); var email = $('#txtEmailId').val(); var password = $('#txtPassword').val(); var phone = $('#txtPhoneNumber').val(); if (name === '') { alert("Please input Your name"); $('#txtFirstName').addClass("is-invalid"); e.preventDefault(); } else if (lastname === '') { alert("Please input Your Last Name"); $('#txtLastName').addClass("is-invalid"); e.preventDefault(); } else if (email === '') { alert("Please input Your Email"); $('#txtEmailId').addClass("is-invalid"); e.preventDefault(); } else if (phone === '') { alert("Please input Your Mobile no"); $('#txtPhoneNumber').addClass("is-invalid"); e.preventDefault(); } else if (password === '') { alert("Please input Your Password"); $('#txtPassword').addClass("is-invalid"); e.preventDefault(); } else { $('.validation').addClass("is-valid"); } });</script>
        <%--<script type="text/javascript">$(document).ready(function(){$('#form1').keyup(function(){$.ajax({url:'Hash.aspx',type:'post',data:JSON.stringify({key:$('#key').val(),salt:$('#salt').val(),txnid:$('#txnid').val(),amount:$('#amount').val(),pinfo:$('#pinfo').val(),fname:$('#fname').val(),email:$('#email').val(),mobile:$('#mobile').val(),udf5:$('#udf5').val()}),contentType:"application/json",dataType:'json',success:function(json){if(json['error']){$('#alertinfo').html('<i class="fa fa-info-circle"></i>'+json['error']);} else if(json['success']){$('#hash').val(json['success']);}}});});});</script>--%> <%--<script type="text/javascript">function launchBOLT(){bolt.launch({key:$('#key').val(),txnid:$('#txnid').val(),hash:$('#hash').val(),amount:$('#amount').val(),firstname:$('#fname').val(),email:$('#email').val(),phone:$('#mobile').val(),productinfo:$('#pinfo').val(),udf5:$('#udf5').val(),surl:$('#surl').val(),furl:$('#surl').val()},{responseHandler:function(BOLT){console.log(BOLT.response.txnStatus);if(BOLT.response.txnStatus!='CANCEL'){debugger;var fr='<form action="'+$('#surl').val()+'" method="post">'+'<input type="hidden" name="key" value="'+BOLT.response.key+'" />'+'<input type="hidden" name="salt" value="'+$('#salt').val()+'" />'+'<input type="hidden" name="txnid" value="'+BOLT.response.txnid+'" />'+'<input type="hidden" name="amount" value="'+BOLT.response.amount+'" />'+'<input type="hidden" name="productinfo" value="'+BOLT.response.productinfo+'" />'+'<input type="hidden" name="firstname" value="'+BOLT.response.firstname+'" />'+'<input type="hidden" name="email" value="'+BOLT.response.email+'" />'+'<input type="hidden" name="udf5" value="'+BOLT.response.udf5+'" />'+'<input type="hidden" name="mihpayid" value="'+BOLT.response.mihpayid+'" />'+'<input type="hidden" name="status" value="'+BOLT.response.status+'" />'+'<input type="hidden" name="hash" value="'+BOLT.response.hash+'" />'+'</form>';var form=jQuery(fr);jQuery('body').append(form);form.submit();}},catchException:function(BOLT){alert(BOLT.message);}});}</script>--%>
    </form>
</body>
</html>
