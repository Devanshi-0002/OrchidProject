<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paynow.aspx.cs" Inherits="paynow" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
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
                        <div class="col-4 col-sm-4 col-md-3">
                            <a class="nav-link active nav-link-custom" href="../Default.aspx">
                                <img src="img/logo.png" alt="Zenith Logo" class="img-responsive zenith-log" /></a>
                        </div>
                        <div class="col-md-9 col-sm-8 col-8 clear-padding ">
                            <div class="menu-area float-right">
                                <nav class="navbar navbar-custom navbar-expand-lg">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fas fa-align-justify fa-2x"></i></button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav navbar-nav-custom mr-auto">
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link active text-black" style="border-bottom: 2px solid #ff0020;" href="holidays.aspx" target="">Holidays</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href="../customized_package/index.aspx" target="">Create Package</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href="../HotelSearch.aspx" target="">Hotels</a> </li>
                                            <li class="nav-item "><a class="nav-link manu-nav-custom-link text-black" href="../SightSeeingSearch.aspx" target="">Sightseeing</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link text-black" href=".//TransferSearch.aspx" target="">Transfer</a> </li>
                                            <li class="nav-item "><a class="nav-link manu-nav-custom-link text-black" href=".//contact_us">Contact Us</a></li>
                                            <li class="nav-item dropdown nav-dropdown-new text-black" id="limenu_myAccount" runat="server" visible="true"><a class="nav-link dropdown-toggle manu-nav-custom-link-for-myaccount text-black" href="#" id="navbarDropdown111" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</a><div class="dropdown-menu dropdown-md-new" aria-labelledby="navbarDropdown111">
                                                <div class="container clear-padding">
                                                    <div class="col-md-12 clear-padding">
                                                        <%--<p class="menu-contact-headline"><i class="fas fa-lock fa-2x"></i></p>--%><div class="row">
                                                            <div class="col-md-12">
                                                                <div class="p-3 bg-white" style="box-shadow: 0 0 10px #888888">
                                                                    <div id="login-dp">
                                                                        <div class="form-group"><a href="modalRegistration" class="btn btn-danger rounded-0 btn-block" data-toggle="modal" data-target="#modalLogin">LOGIN</a> <%--<a href="#" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#modalRegistration">Register Here</a>--%></div>
                                                                        <div class="form-group">
                                                                            <p class="h5 m-0 text-center">OR</p>
                                                                            <a href="modalRegistration" class="btn btn-danger rounded-0 btn-block" data-toggle="modal" data-target="#modalRegistration">SIGN UP</a> <%--<a href="#" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#modalRegistration">Register Here</a>--%>
                                                                        </div>
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

        <div class="after-header">
            <div class="container" >

                <div id="frmError" runat="server">
                    <span style="color: red">Please fill all mandatory fields.</span>
                    <br />
                    <br />
                </div>
                <input type="hidden" runat="server" id="key" name="key" />
                <input type="hidden" runat="server" id="hash" name="hash" />
                <input type="hidden" runat="server" id="txnid" name="txnid" />
                <center>
                    <h5 style="text-align: center; color:#822674" >Preview Your Package Details
                    </h5>
                    
                    <table  class="table table-light">
                        <tr>
                            <td class="align-content-between">Your Name: </td>
                            <td>
                                <asp:TextBox ID="firstname" runat="server" ReadOnly="true" class="form-control" /></td>
                      
                            <td>Email: </td>
                            <td>
                                <asp:TextBox ID="email" runat="server" ReadOnly="true" class="form-control" /></td>

                        </tr>
                        <tr>
                            <td>Contact No.: </td>
                            <td>
                                <asp:TextBox ID="phone" runat="server" ReadOnly="true" class="form-control" /></td>
                       
                            <td>Package Name: </td>
                            <td>
                                <asp:TextBox ID="productinfo" runat="server" ReadOnly="true" class="form-control" /></td>
                        </tr>

                        <tr>
                            <td>Travel Date: </td>
                            <td>
                                <asp:TextBox ID="txt_traveldate" runat="server" ReadOnly="true" class="form-control" /></td>

                            <td>No of Room(s): </td>
                            <td>
                                <asp:TextBox ID="txt_totalrooms" runat="server" ReadOnly="true" class="form-control" /></td>
                        </tr>
                         <tr>
                            <td>Adult(s): </td>
                            <td>
                                <asp:TextBox ID="txt_adult" runat="server" ReadOnly="true" class="form-control" /></td>
                       
                            <td>Child(s): </td>
                            <td>
                                <asp:TextBox ID="txt_child" runat="server" ReadOnly="true" class="form-control" /></td>
                        </tr>
                         <tr>
                            <td>Infant(s): </td>
                            <td>
                                <asp:TextBox ID="txt_infant" runat="server" ReadOnly="true" class="form-control" /></td>
 
                            <td>Package Duration: </td>
                            <td>
                                <asp:TextBox ID="txt_PackageDuration" runat="server" ReadOnly="true" class="form-control" /></td>
                            
                          </tr>
                         <tr>
                             <td>Package Cost: </td>
                            <td>
                                <asp:TextBox ID="amount" runat="server" ReadOnly="true" class="form-control" /></td>

                      </tr>

                        <tr  style="display:none">
                            <td>Last Name: </td>
                            <td>
                                <asp:TextBox ID="lastname" runat="server" ReadOnly="true" class="form-control" /></td>
                        </tr>
                        <tr style="display: none">
                            <td>Success URI: </td>
                            <td>
                                <asp:TextBox ID="surl" runat="server" /></td>

                            <td>Failure URI: </td>
                            <td>
                                <asp:TextBox ID="furl" runat="server" /></td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="submit" Text="Pay Now" CssClass="btn btn-primary" Width="210px" runat="server" OnClick="Button1_Click" />

                    </center>

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
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <span class="fotter-social-media">Connect with us: <a href="https://www.facebook.com/orchid.holidays2" target="_blank">
                                <i class="fab fa-facebook-square fa-lg" aria-hidden="true"></i></a>
                                <a href="https://twitter.com/DmcOrchid" target="_blank">
                                    <i class="fab fa-twitter-square fa-lg" aria-hidden="true"></i></a><a href="https://www.youtube.com/channel/UCG8JjyLm1z4MnaMab9Ib25Q" target="_blank">
                                        <i class="fab fa-youtube-square fa-lg" aria-hidden="true"></i></a><a href="#" target="_blank">
                                            <i class="fab fa-google-plus-square fa-lg" aria-hidden="true"></i></a><a href="https://www.linkedin.com/company/orchidglobal" target="_blank">
                                                <i class="fab fa-linkedin fa-lg" aria-hidden="true"></i></a><a href="https://www.instagram.com/orchid_global" target="_blank">
                                                    <i class="fab fa-instagram fa-lg" aria-hidden="true"></i></a></span>
                        </div>
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
    </form>
</body>
</html>
