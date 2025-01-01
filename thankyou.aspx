<%@ Page Language="C#" AutoEventWireup="true" CodeFile="thankyou.aspx.cs" Inherits="thankyou" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <script>(function (w, d, s, l, i) { w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f); })(window, document, 'script', 'dataLayer', 'GTM-KJGJS2S');</script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %>Best Tours & Travel Company in India - Holiday Packages</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/GlobalStyle.css?ver10" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
   <%-- <script>gtag('event', 'conversion', { 'send_to': 'AW-861332077/FUZJCIaatXwQ7cTbmgM' });</script>
    <script>!function (f, b, e, v, n, t, s) { if (f.fbq) return; n = f.fbq = function () { n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments) }; if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0; t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s) }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js'); fbq('init', '512941962439806'); fbq('track', 'PageView'); fbq('track', 'Lead');</script>
    <script>(function (i, s, o, g, r, a, m) { i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga'); ga('create', 'UA-118676497-1', 'auto'); ga('send', 'pageview');</script>--%>
   <%-- <script type="text/javascript">var google_conversion_id = 861332077; var google_custom_params = window.google_tag_params; var google_remarketing_only = true;</script>
    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>--%>
   <%-- <noscript>
        <div style="display: inline;">
            <img height="1" width="1" style="border-style: none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/861332077/?guid=ON&amp;script=0" /></div>
    </noscript>--%>
    <%--<script async src="https://www.googletagmanager.com/gtag/js?id=AW-861332077"></script>
    <script>window.dataLayer = window.dataLayer || []; function gtag() { dataLayer.push(arguments); } gtag('js', new Date()); gtag('config', 'AW-861332077');</script>--%>
</head>
<body>
    <div id="fb-root"></div>
    <script>(function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1'; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
    <div class="fb-customerchat" attribution="install_email" page_id="151122584941146"></div>
    <form runat="server">
        <asp:ScriptManager ID="jhi" runat="server"></asp:ScriptManager>
        <script src="Scripts/jquery-3.3.1.js"></script>
        <script src="Scripts/modernizr-2.6.2.js"></script>
        <script src="Scripts/respond.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
        <section>
            <div class="top-menu-row inner-top-menu-row bg-secondary" id="task_flyout"><%--id="scrolldiv"--%><div class="container">
                <div class="row">
                    <div class="col-sm-3"><a class="nav-link active nav-link-custom" href="Default.aspx" target="_self">
                        <img src="img/logo.png" alt="Zenith Logo" class="img-responsive zenith-log" /></a></div>
                    <div class="col-sm-9 clear-padding ">
                        <div class="menu-area float-right">
                            <nav class="navbar navbar-expand-lg">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item"><a class="nav-link manu-nav-custom-link active" style="border-bottom: 2px solid #ff0020;" href="holidays.aspx" target="">Holidays</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link" href="HotelSearch.aspx" target="">Hotels</a> </li>
                                            <li class="nav-item "><a class="nav-link manu-nav-custom-link" href="SightSeeingSearch.aspx" target="">Sightseeing</a> </li>
                                            <li class="nav-item"><a class="nav-link manu-nav-custom-link" href="TransferSearch.aspx" target="">Transfer</a> </li>
                                             <li class="nav-item "><a class="nav-link manu-nav-custom-link" href="contact_us">Contact Us</a></li>
                                        <li class="nav-item dropdown nav-dropdown-new"><a class="nav-link dropdown-toggle manu-nav-custom-link-for-myaccount" href="#" id="navbarDropdown111" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</a><div class="dropdown-menu dropdown-md-new" aria-labelledby="navbarDropdown111">
                                            <div class="container clear-padding">
                                                <div class="col-md-12 clear-padding">
                                                    <p class="menu-contact-headline">Login</p>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div id="login-dp">
                                                                <div class="form-group">
                                                                    <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                                    <input type="email" class="form-control custom-form-control cus-frm-crnt" id="exampleInputEmail2" placeholder="Email address" required></div>
                                                                <div class="form-group">
                                                                    <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                                    <input type="password" class="form-control custom-form-control cus-frm-crnt" id="exampleInputPassword2" placeholder="Password" required>
                                                                    <br />
                                                                    <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-danger btn-block">Sign in</button></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#" class="btn btn-danger menu-contact-headline">Or Join Us</a></div>
                                            </div>
                                        </div>
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
        <div class="container-fluid pl-0 pr-0">
            <div class="row">
                <section class="w-100">
                    <div class="container">
                        <div class="row zenithbody-part mt-5 mb-5 pt-5 pb-5">
                            <div class="col-lg-12 text-center">
                                <div class="thankyoupage ml-auto mr-auto"><i class="far fa-check-circle fa-8x text-success mb-3" aria-hidden="true"></i>
                                    <h1 class="mt-3 mb-3 text-success h1">Thank You!</h1>
                                    <h3 class="mb-3" style="color: #1787c8;">Your request is received and we will contact you within 30 minutes..</h3>
                                    <a class="btn btn-lg btn-danger mt-3" href="Default">Go Back To Home Page</a></div>
                            </div>
                        </div>
                    </div>
                </section>
               <%-- <script>(function (i, s, o, g, r, a, m) { i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga'); ga('create', 'UA-118676497-1', 'auto'); ga('send', 'pageview');</script>
                <script type="text/javascript">window.$zopim || (function (d, s) { var z = $zopim = function (c) { z._.push(c) }, $ = z.s = d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) { z.set._.push(o) }; z._ = []; z.set._ = []; $.async = !0; $.setAttribute("charset", "utf-8"); $.src = "https://v2.zopim.com/?3Jrxl1bLOlVlO1Z5f66PEJtNm5Tog89F"; z.t = +new Date; $.type = "text/javascript"; e.parentNode.insertBefore($, e) })(document, "script");</script>
                <script type="text/javascript">var CaptchaCallback = function () { $('.g-recaptcha').each(function (index, el) { grecaptcha.render(el, { 'sitekey': '6LdcFhEUAAAAAF1Oda4G1ddPxzHRSG8VmNcnQZ_N' }); }); };</script>
                <script>(function ($) { $.fn.menumaker = function (options) { var cssmenu = $(this), settings = $.extend({ format: "dropdown", sticky: false }, options); return this.each(function () { $(this).find(".button").on('click', function () { $(this).toggleClass('menu-opened'); var mainmenu = $(this).next('ul'); if (mainmenu.hasClass('open')) { mainmenu.slideToggle().removeClass('open'); } else { mainmenu.slideToggle().addClass('open'); if (settings.format === "dropdown") { mainmenu.find('ul').show(); } } }); cssmenu.find('li ul').parent().addClass('has-sub'); multiTg = function () { cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>'); cssmenu.find('.submenu-button').on('click', function () { $(this).toggleClass('submenu-opened'); if ($(this).siblings('ul').hasClass('open')) { $(this).siblings('ul').removeClass('open').slideToggle(); } else { $(this).siblings('ul').addClass('open').slideToggle(); } }); }; if (settings.format === 'multitoggle') multiTg(); else cssmenu.addClass('dropdown'); if (settings.sticky === true) cssmenu.css('position', 'fixed'); resizeFix = function () { var mediasize = 1000; if ($(window).width() > mediasize) { cssmenu.find('ul').show(); } if ($(window).width() <= mediasize) { cssmenu.find('ul').hide().removeClass('open'); } }; resizeFix(); return $(window).on('resize', resizeFix); }); }; })(jQuery); (function ($) { $(document).ready(function () { $("#cssmenu").menumaker({ format: "multitoggle" }); }); })(jQuery);</script>
                <script type="javascript">function fbshareCurrentPage(){window.open("https://www.facebook.com/sharer/sharer.php?u="+escape(window.location.href)+"&t="+document.title,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;}</script>
                <noscript>
                    <div style="display: inline;">
                        <img height="1" width="1" style="border-style: none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/857122646/?guid=ON&amp;script=0" /></div>
                </noscript>--%>
                <footer>
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
                                <div class="col-sm-6 col-md-4 col-lg-3"><span class="footer-email"><i class="fas fa-envelope fa-lg"></i><a href="mailto:no-reply@orchidglobal.net">no-reply@orchidglobal.net</a></span></div>
                                <div class="col-sm-6 col-md-4 col-lg-3"><span class="footer-phone">24X7 <i class="fas fa-phone fa-lg"></i>+91 6290952054</span></div>
                                <div class="col-sm-6 col-md-4 col-lg-3"><span class="fotter-social-media">Connect with us: <a href="https://www.facebook.com/zenithleisureholidays/" target="_blank"><i class="fab fa-facebook-square fa-lg" aria-hidden="true"></i></a><a href="https://twitter.com/zenitholidays" target="_blank"><i class="fab fa-twitter-square fa-lg" aria-hidden="true"></i></a><a href="https://www.youtube.com/channel/UCDMpGfPzQBCD7Z2RwlTrtHQ" target="_blank"><i class="fab fa-youtube-square fa-lg" aria-hidden="true"></i></a><a href="https://plus.google.com/+ZenithholidaysIndia" target="_blank"><i class="fab fa-google-plus-square fa-lg" aria-hidden="true"></i></a><a href="https://www.linkedin.com/company/zenith-leisure-holidays-pvt-ltd/" target="_blank"><i class="fab fa-linkedin fa-lg" aria-hidden="true"></i></a><a href="https://www.instagram.com/zenithleisureholidays/" target="_blank"><i class="fab fa-instagram fa-lg" aria-hidden="true"></i></a></span></div>
                                <div class="col-sm-6 col-md-4 col-lg-3">
                                    <span class="footer-payment">WE ACCEPT
                                    <img src="img/payu.jpg" alt="" /></span>
                                </div>
                            </div>
                        </div>
                </footer>
                <div class="w-100 bg-white">
                    <div class="container ">
                        <div class="row">
                            <p class="col-sm-12 footer-payment">Members of</p>
                            <br />
                            <div class="col-xs-12 col-lg-3 col-sm-3 clear-padding">
                                <img src="imgimg3.png?version1.1" alt=""></div>
                            <div class="col-xs-12 col-lg-2 col-sm-3 clear-padding">
                                <img src="imgimg4.png?version1.1" alt=""></div>
                            <div class="col-xs-12 col-lg-2 col-sm-3 clear-padding">
                                <img src="imgimg5.png?version1.2" alt=""></div>
                            <div class="col-xs-12 col-lg-2 col-sm-3 clear-padding">
                                <img src="imgimg6.png?version1.1" alt=""></div>
                            <div class="col-xs-12 col-lg-1 col-sm-3 clear-padding">
                                <img src="imgimg7.png?version1.1" alt=""></div>
                            <div class="col-xs-12 col-lg-2 col-sm-3 clear-padding">
                                <img src="imgimg8.png?version1.1" alt=""></div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <p class="footr-copyright text-center">&copy; <%: DateTime.Now.Year %> - Zenithholidays.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>$(window).scroll(function () { if ($(this).scrollTop() > 10) { $('#task_flyout').addClass('fixed'); $('#task_flyout').removeClass('top-menu-row'); $('#task_flyout img').attr('src', 'img/logo.png'); } else { $('#task_flyout').addClass('top-menu-row'); $('#task_flyout').removeClass('fixed'); $('#task_flyout img').attr('src', 'img/logo.png') } });</script>
</body>
</html>
