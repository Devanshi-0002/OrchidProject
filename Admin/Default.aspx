<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="keywords" content="Zenith" />
    <meta name="description" content="" />
    <meta name="author" content="Zenith" />
    <link rel="shortcut icon" href="../img/favicon.gif" type="image/png" />
    <title>::Orchid-Admin::</title>
    <!--icheck-->
    <link href="css/minimal.css" rel="stylesheet" />
    <link href="css/square.css" rel="stylesheet" />
    <link href="css/red.css" rel="stylesheet" />
    <link href="css/blue.css" rel="stylesheet" />
    <!--dashboard calendar-->
    <link href="css/clndr.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="css/morris.css" />
    <!--common-->
    <link href="css/style.css?v2" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="CSS/Stylegrid.css" rel="stylesheet" type="text/css" />
    <link href="CSS/AjaxStyling.css" rel="stylesheet" />
    <link href="CSS/PopUpStyle.css" rel="stylesheet" />
    <script src="js/PopScript.js"></script>
    <link href="CSS/jquery-te-1.4.0.css" rel="stylesheet" />
    <%--<link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/GlobalStyle.css?ver10" rel="stylesheet" />--%>
    <script src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"></script>
    <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon" />

</head>
<body class="sticky-header left-side-collapsed">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrmngr" runat="server">
        </asp:ScriptManager>
        <section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">
        <div class="left-side-inner">
            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="images/user-avatar.png" class="media-object" />
                    <div class="media-body">
                        <h4><a id="a1user" runat="server" href="#">John Doe</a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                  <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                  <li><a href="Change_Password.aspx"><i class="fa fa-cog"></i> <span>Change Password</span></a></li>
                  <li><a href="logout.aspx"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->

      <ul class="nav nav-pills nav-stacked custom-nav">
        <li><a href="Default.aspx"><i class="fa fa-home"></i><span>Home</span></a></li>
        <li class="nav-active"><a href="Country.aspx"><i class="fa fa-globe"></i><span>Add Country / State</span></a></li>
        <li class="nav-active"><a href="RoomType.aspx"><i class="fa fa-plane "></i><span>Add Room & Bording Point</span></a></li>
        <li class="nav-active"><a href="Destination.aspx"><i class="fas fa-map"></i><span>Destination</span></a></li>
        <li class="nav-active"><a href="Theme.aspx"><i class="fa fa-text-height"></i><span>Theme</span></a></li>
        <li class="nav-active"><a href="Addpackages.aspx"><i class="fas fa-suitcase"></i><span>Package Master</span></a></li>
        <li class="nav-active"><a href="PackageCost.aspx"><i class="fas fa-rupee-sign"></i><span>Package Cost</span></a></li>
        <li class="nav-active"><a href="Tax_Master.aspx"><i class="fa fa-paperclip"></i><span>Tax Master</span></a></li>
        <li class="nav-active"><a href="editpackage.aspx"><i class="fas fa-edit"></i><span>Update Package</span></a></li>
        <%--<li class="nav-active"><a href="UpdatePage.aspx"><i class="fa fa-file"></i><span>Update All Master Details</span></a></li>
        <li class="nav-active"><a href="Update-OverView.aspx"><i class="fa fa-eye"></i><span>Update Over View</span></a></li>
        <li class="nav-active"><a href="Update-Inclusion.aspx"><i class="fa fa-chain-broken"></i><span>Update Inclusion & Exclusion</span></a></li>
        <li class="nav-active"><a href="Update-Termcondition.aspx"><i class="fa fa-cogs"></i><span>Update Terms & Conditions</span></a></li>
        <li class="nav-active"><a href="UpdateImage.aspx"><i class="fa fa-image"></i><span>Update Image</span></a></li>
        <li class="nav-active"><a href="HomePageSlider.aspx"><i class="fa fa-sliders"></i><span>Home Page Slider</span></a></li>
        <li class="nav-active"><a href="Blog.aspx"><i class="fa fa-rss"></i><span>Blog</span></a></li>
        <li id="menuid" visible="false" runat="server" class="nav-active"><a href="MenuPage.aspx"><i class="fa fa-bars"></i><span>Menu Details</span></a></li>--%>
        <li><a href="logout.aspx"><i class="fas fa-power-off" style="color:red"></i><span >LogOut</span></a></li>
      </ul>
 <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn menu-collapsed"><i class="fa fa-bars"></i></a>
            
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="images/user-avatar.png" alt="" />
                            <b id="auser" runat="server" ></b>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="Comming.aspx"><i class="fa fa-user"></i>  Profile</a></li>
                            <li><a href="Comming.aspx"><i class="fa fa-cog"></i>Change Password</a></li>
                            <li><a href="logout.aspx"><i class="fa fa-sign-out"></i> Log Out</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->
        </div>
      
    <div class="page-heading">
        <h5 align="center">
        <center>
            <asp:Label ID="lblcompname" Font-Bold="true" ForeColor="Green" 
               runat="server" style="color: #6699FF; "></asp:Label>
       </center>
        </h5>
    </div>
<!-- page heading end-->

  <!--body wrapper start-->
    <div class="wrapper">
     <div class="row">
         <div class="col-md-12">
        <div class="row">
           <div class="col-md-6">
                <div class="panel">
                  
                    <div class="panel-heading" style="font-size:15px; text-align:center">Group Domestic Packages</div>
                    <div class="panel-body" style="height:315px; overflow-y:scroll; overflow-x:hidden; padding:0px">
                     <ul class="dropdown-list normal-list" style="margin-left:5px; padding-left:0px">
                            <asp:Label ID="lblcostcenterid" runat="server" Visible="false" ></asp:Label>
                            <asp:Repeater ID="rptDomesticPackagesDetails" runat="server" >
                                <ItemTemplate>
                                 <li class="new" style=" list-style:none; padding:5px;">
                                <asp:LinkButton ID="lnkcostcentername" runat="server" ForeColor="#000000">
                                        <span class="desc" style="margin-left:5px">
                                       <span class="name"><b><%# Container.ItemIndex+1 %>.</b>&nbsp;<span class="name"><%# Eval("Pkg_name")%><span class="pull-right" style="font-weight:bolder; font-size:12px;" ><%# Eval("Per_Unit_Cost")%></span></span></span></span></asp:LinkButton></li>
                                 </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>
                    </div>
                   <%-- <div class="panel-footer"><div class="text-center"><a href="Comming.aspx"><strong>Off Line Package Available</strong></a></div></div>--%>
                </div>
            </div>

           <div class="col-md-6">
                <div class="panel">
                  
                    <div class="panel-heading" style="font-size:15px; text-align:center">Group International Packages</div>
                    <div class="panel-body" style="height:315px; overflow-y:scroll; overflow-x:hidden; padding:0px">
                     <ul class="dropdown-list normal-list" style="margin-left:5px; padding-left:0px">
                            <asp:Label ID="Label9" runat="server" Visible="false" ></asp:Label>
                            <asp:Repeater ID="rptGroupInternationalPackages" runat="server" >
                                <ItemTemplate>
                                 <li class="new" style=" list-style:none; padding:5px;">
                                <asp:LinkButton ID="lnkcostcentername" runat="server" ForeColor="#000000">
                                        <span class="desc" style="margin-left:5px">
                                       <span class="name"><b><%# Container.ItemIndex+1 %>.</b>&nbsp;<span class="name"><%# Eval("Pkg_name")%><span class="pull-right" style="font-weight:bolder; font-size:12px;" ><%# Eval("Per_Unit_Cost")%></span></span></span></span></asp:LinkButton></li>
                                 </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>
                    </div>
                    <%--<div class="panel-footer"><div class="text-center"><a href="Comming.aspx"><strong>Off Line Package Available</strong></a></div></div>--%>
                </div>
            </div>
       </div>
      </div>
       <div class="col-md-12">
        <div class="row">
           <div class="col-md-6">
             <div class="panel">
                    <div class="panel-heading" style="font-size:15px; text-align:center">Customized Domestic Packages</div>
                    <div class="panel-body" style="height:315px; overflow-y:scroll; overflow-x:hidden; padding:0px">
                     <ul class="dropdown-list normal-list" style="margin-left:5px; padding-left:0px">
                      <asp:Label ID="lbllgrid" runat="server" Visible="false" ></asp:Label>
                        <asp:Repeater ID="rptPackageDetails" runat="server">
                                <ItemTemplate>
                                 <li class="new" style=" list-style:none; padding:5px;">
                                 <asp:LinkButton ID="lnkbledgerid" runat="server" ForeColor="#000000" CommandName='<%# Eval("Pkg_name")%>' CommandArgument='<%# Eval("Pkg_id") %>'
                                    style="text-align:left; font-size:10px;">
                                    <span class="desc" style="margin-left:5px">
                                    <span class="name"><b><%# Container.ItemIndex+1 %>.</b>&nbsp;<span class="name"><%# Eval("Pkg_name")%><span class="pull-right" style="font-weight:bolder; font-size:12px;" ><%# Eval("Per_Unit_Cost")%></span></span></span></span></asp:LinkButton>
                                 </li>
                                </ItemTemplate>
                            </asp:Repeater>
                     </ul>
                    </div>
                   <%-- <div class="panel-footer" ><div class="text-center"><a href="Comming.aspx"><strong>Package Details</strong></a></div></div>--%>
                </div>
            </div>
           <div class="col-md-6">
             <div class="panel">
                    <div class="panel-heading" style="font-size:15px; text-align:center">Customized International Packages</div>
                    <div class="panel-body" style="height:315px; overflow-y:scroll; overflow-x:hidden; padding:0px">
                     <ul class="dropdown-list normal-list" style="margin-left:5px; padding-left:0px">
                     
                            <asp:Repeater ID="Rptonlinepkgavailable" runat="server" >
                                <ItemTemplate>
                                 <li class="new" style=" list-style:none; padding:5px;">
                                 <asp:LinkButton ID="lnkbledgeridDrl" runat="server" ForeColor="#000000" CommandName='<%# Eval("Pkg_name")%>' CommandArgument='<%# Eval("Pkg_id") %>' 
                                        style="text-align:left; font-size:10px;">
                                        <span class="desc" style="margin-left:5px">
                                       <span class="name"><b><%# Container.ItemIndex+1 %>.</b>&nbsp;<span class="name"><%# Eval("Pkg_name")%><span class="pull-right" style="font-weight:bolder; font-size:12px;" ><%# Eval("Per_Unit_Cost")%></span></span></span></span></asp:LinkButton></li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>
                    </div>
                    <%--<div class="panel-footer" ><div class="text-center"><a href="Comming.aspx"><strong>On Line Package Available</strong></a></div></div>--%>
                </div>
            
            </div>
    </div>
      </div>
       
    </div>
        </div>
        <!--footer section start-->
       <%-- <footer class="sticky-footer">
           <span class="style1">CopyRight:<span class="style2">Zenithholidays</span></span>
        </footer>--%>
       
</section>
        <!-- Placed js at the end of the document so the pages load faster -->
        <script src="js/jquery-1.10.2.min.js"></script>

        <script src="js/bootstrap.min.js"></script>

        <script src="js/jquery.sparkline.js"></script>
        <script src="js/sparkline-init.js"></script>

        <script src="js/clndr.js"></script>
        <script src="js/evnt.calendar.init.js"></script>
        <script src="js/moment-2.2.1.js"></script>
        <script src="js/underscore-min.js"></script>
        <!--common scripts for all pages-->
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
