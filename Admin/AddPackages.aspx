<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" ClientIDMode="Static" AutoEventWireup="true" ValidateRequest="false" EnableEventValidation="false" CodeFile="AddPackages.aspx.cs" Inherits="Admin_AddPackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

   <%-- <link href="css/demo.css" rel="stylesheet" />--%>
    <link href="CSS/jquery-te-1.4.0.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/GlobalStyle.css?ver10" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"></script>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style>
        .jqte_tool.jqte_tool_1 .jqte_tool_label {
            height: 25px;
        }

        a {
            text-decoration: none !important;
        }

        #CheckBoxList1themetype label:hover {
            position: relative;
        }

        .checkboxnew input[type="checkbox"]:hover, .checkboxnew input[type="checkbox"]:active, .checkboxnew input[type="checkbox"]:focus {
            -webkit-appearance: checkbox !important;
        }

        .checkboxnew label {
            font-weight: normal;
            font-size: 13px;
            margin-left: 5px;
            margin-bottom: 0;
            position: relative;
            top: -2px;
        }

        .nav-link:hover {
            background: red !important;
            color: #fff;
        }

            .nav-link:hover .nav-link:active {
                color: #fff;
            }

        .nav-item.active .nav-link, .nav-link:focus {
            background-color: #dc3545 !important;
            color: #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" runat="Server">

    <div class="container-fluid">
        <div class="row mt-3 ml-5 mr-5" style="display:none">
            <div class="col-5">
                <span class="font-weight-bold" style="color: red">Select Existing Package for Add New HUB/Departure Date</span><%--//for Multipul HUB/Departure Date--%>
            </div>
            <div class="col">
                <asp:DropDownList ID="ddlselectpkg" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlselectpkg_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <hr class="w-100" />
        <div class="col-12" style="text-align: center">
            <h4 runat="server" id="lbl_addnewpackage">Create New Packages</h4>
            <h4 runat="server" id="lbl_HUBDepartureDatee" visible="false">Add New HUB Or Departure Date</h4>
        </div>
        <hr class="w-100" />
        <div class="row ml-5 mr-5">
            <div class="col">
                <div class="row">
                    <div class="col-4 mt-2">
                        <asp:Label runat="server" CssClass="font-weight-bold">Package Name<span style="color:red">*</span></asp:Label>
                    </div>
                    <div class="col">
                        <%--<asp:UpdatePanel ID="fks" runat="server"><ContentTemplate>--%>
                        <asp:TextBox runat="server" ID="txtpackagename" CssClass="form-control" OnTextChanged="txtpackagename_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <%--<span id="lbl_packagenameCkeck" runat="server" Visible="false"></span>--%>
                        <%-- </ContentTemplate></asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <div class="col-4 mt-2">
                        <asp:Label runat="server" CssClass="font-weight-bold">Sub Package Name<span style="color:red">*</span></asp:Label>
                    </div>
                    <div class="col">
                        <asp:TextBox runat="server" ID="txt_SubPackageName" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <hr class="w-100" />
        </div>

        <asp:Panel ID="pnlupdatedata" runat="server">

            <div class="row mt-3 ml-5 mr-5">
                <div class="col" id="divpkgcode" runat="server" style="display: none">
                    <div class="row">
                        <div class="col-4 mt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Package Code<span style="color:red">*</span></asp:Label>

                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtpackagecode" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col-4 mt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Meta Title<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_MetaTitle" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">Meta Keywords</asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_MetaKeywords" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-12 ml-5 mr-5">
                <div class="col">
                    <div class="row">
                        <div class="col-2 pt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Meta Description</asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txt_MetaDescription" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <hr class="w-100" />
            </div>
            <div class="row mt-12 ml-5 mr-5">
                <div class="col">
                    <div class="row">
                        <div class="col-2 pt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Old URL Name</asp:Label>
                        </div>
                        <div class="col-8 pt-2">
                            <asp:TextBox runat="server" ID="txt_URLAlias" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-3 ml-5 mr-5">
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Select Valid From Date<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtFromDate" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">Select Valid To Date<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtDurationToDate" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>

            <div class="row mt-3 ml-5 mr-5" style="display: none">
                <%-- <div class="col">
                <div class="row">
                    <div class="col-4 pt-2 ">
                        <asp:Label runat="server" CssClass="font-weight-bold">Starting From<span style="color:red">*</span></asp:Label>
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlstartingfrom" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </div>--%>
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">Select Tax %<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddltaxvalues" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-3 ml-5 mr-5">
                <div class="col-4">
                    <div class="row">
                        <div class="col-auto pt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Package Type<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col row ">
                            <asp:DropDownList runat="server" ID="ddlpackagetype" CssClass="form-control" OnSelectedIndexChanged="ddlpackagetype_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Group</asp:ListItem>
                                <asp:ListItem Value="2">Customized</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col-auto pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">Group<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <asp:DropDownList runat="server" ID="ddlgroup" Visible="false" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="1">Domestic</asp:ListItem>
                                        <asp:ListItem Value="2">International</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="col ">
                    <div class="row">
                        <div class="col-auto mt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Zone<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <%-- <asp:DropDownList ID="ddlcustomized" runat="server" Visible="false" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlcustomized_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select--</asp:ListItem>
                                    <asp:ListItem Value="1">Domestic</asp:ListItem>
                                    <asp:ListItem Value="2">International</asp:ListItem>
                                    <%-- <asp:ListItem Value="3">Weekend</asp:ListItem>--%>
                            <%--</asp:DropDownList>--%>

                            <asp:DropDownList ID="ddlweekend" runat="server" AutoPostBack="true" Visible="false" CssClass="form-control" OnSelectedIndexChanged="ddlweekend_SelectedIndexChanged">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">North</asp:ListItem>
                                <asp:ListItem Value="2">South</asp:ListItem>
                                <asp:ListItem Value="3">East</asp:ListItem>
                                <asp:ListItem Value="4">West</asp:ListItem>
                            </asp:DropDownList>

                            <asp:DropDownList ID="ddlinternational" runat="server" AutoPostBack="true" Visible="false" CssClass="form-control" OnSelectedIndexChanged="ddlinternational_SelectedIndexChanged">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Africa & Middle East</asp:ListItem>
                                <asp:ListItem Value="2">America</asp:ListItem>
                                <asp:ListItem Value="3">Asia</asp:ListItem>
                                <asp:ListItem Value="4">Australia</asp:ListItem>
                                <asp:ListItem Value="5">New Zealand</asp:ListItem>
                                <asp:ListItem Value="6">Europe</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-3 ml-5 mr-5">
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Destination <span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:DropDownList ID="ddlDestinationdomestic" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList><%--for domestic--%>
                            <asp:DropDownList ID="ddlDestinationInternational" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList><%--for international--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">City Included</asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtCityIncluded" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-3 ml-5 mr-5">
                <div class="col-12 pt-2">
                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" CssClass="font-weight-bold">Package Inclusion<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col row">
                            <div class="custom-control custom-checkbox pr-2">
                                <input type="checkbox" class="custom-control-input" id="chkbhotel" runat="server" />
                                <label class="custom-control-label" for="chkbhotel">Hotel</label>
                            </div>
                            <div class="custom-control custom-checkbox pr-2">
                                <input type="checkbox" class="custom-control-input" id="chkbFlight" runat="server" />
                                <label class="custom-control-label" for="chkbFlight">Flight</label>
                            </div>
                            <div class="custom-control custom-checkbox pr-2">
                                <input type="checkbox" class="custom-control-input" id="chkbTransfer" runat="server" />
                                <label class="custom-control-label" for="chkbTransfer">Transfer</label>
                            </div>
                            <div class="custom-control custom-checkbox pr-2">
                                <input type="checkbox" class="custom-control-input" id="chkbRestaurant" runat="server" />
                                <label class="custom-control-label" for="chkbRestaurant">Restaurant</label>
                            </div>
                            <div class="custom-control custom-checkbox pr-2">
                                <input type="checkbox" class="custom-control-input" id="chkSightseeing" runat="server" />
                                <label class="custom-control-label" for="chkSightseeing">Sightseeing</label>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
            <div class="row mt-3 ml-5 mr-5">
                <div class="col-2">
                    <asp:Label runat="server" CssClass="font-weight-bold">Theme Type<span style="color:red">*</span></asp:Label>
                </div>
                <div class="col ">
                    <div class="form-check pr-2 w-100">
                        <asp:CheckBoxList ID="CheckBoxList1themetype" runat="server" CssClass="table checkboxnew" RepeatColumns="3" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" DataTextField="Theme_type" DataValueField="Theme_id"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Theme_id], [Theme_type] FROM [tbl_Pkg_Theme]"></asp:SqlDataSource>
                    </div>
                </div>
                <%--<div class="custom-control custom-checkbox pr-2">
                            <input type="checkbox" class="custom-control-input" id="Checkbox1" runat="server" />
                            <label class="custom-control-label" for="chkbhotel">Hotel</label>
                        </div>--%>
                <hr class="w-100" />
            </div>
            <div class="row mt-12 ml-5 mr-5">
                <div class="col">
                    <div class="row">
                        <div class="col-auto pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">Package Duration Night/Day<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:DropDownList ID="ddlNoofdays" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlNoofdays_SelectedIndexChanged">
                                <asp:ListItem Value="1">--Select No Of days --</asp:ListItem>
                                <asp:ListItem Value="2">1N/2D</asp:ListItem>
                                <asp:ListItem Value="3">2N/3D</asp:ListItem>
                                <asp:ListItem Value="4">3N/4D</asp:ListItem>
                                <asp:ListItem Value="5">4N/5D</asp:ListItem>
                                <asp:ListItem Value="6">5N/6D</asp:ListItem>
                                <asp:ListItem Value="7">6N/7D</asp:ListItem>
                                <asp:ListItem Value="8">7N/8D</asp:ListItem>
                                <asp:ListItem Value="9">8N/9D</asp:ListItem>
                                <asp:ListItem Value="10">9N/10D</asp:ListItem>
                                <asp:ListItem Value="11">10N/11D</asp:ListItem>
                                <asp:ListItem Value="12">11N/12D</asp:ListItem>
                                <asp:ListItem Value="13">12N/13D</asp:ListItem>
                                <asp:ListItem Value="14">13N/14D</asp:ListItem>
                                <asp:ListItem Value="15">14N/15D</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <hr class="w-100" />
            </div>
        </asp:Panel>

        <div class="row mt-3 ml-5 mr-5">
            <div class="col">
                <div class="col">
                    <div class="row">
                        <div class="col-4 pt-2 ">
                            <asp:Label runat="server" CssClass="font-weight-bold">HUB (Starting From)<span style="color:red">*</span></asp:Label>
                        </div>
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlstartingfrom" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <div class="col-4 pt-2 ">
                        <asp:Label runat="server" CssClass="font-weight-bold">Departure Date<span style="color:red">*</span></asp:Label>
                    </div>
                    <div class="col">
                        <asp:TextBox runat="server" ID="txt_DepartureDate" CssClass="form-control date datepicker" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
            <hr class="w-100" />
        </div>
    </div>
    <asp:Repeater ID="rep1" runat="server" ClientIDMode="Static">
        <ItemTemplate>
            <!-- reapeater data for day wise itenary Starts--->
            <div class="container mt-3">
                <div class="row">
                    <div class="col">
                        <h3 class="font-weight-bold pt-3 pb-3">

                            <div class="row">
                                <div class="col-4">
                                    <span class="text-danger">Day
                                        <asp:Label ID="lblday" CssClass="text-danger" runat="server" Text="1"></asp:Label>
                                        :</span>
                                </div>
                                <div class="col-auto">
                                    <div class="form-row mb-0">
                                        <span class="col-auto ">Date</span>
                                        <div class="col-auto">
                                            <asp:TextBox ID="txtdate" runat="server" CssClass="form-control date " TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto text-right">
                                    <div class="form-group row mb-0">
                                        <span class="col-auto ">Time</span>
                                        <div class="col-auto">
                                            <asp:TextBox ID="txttime" runat="server" type="text" CssClass="form-control " TextMode="Time"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </h3>
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs text-center tab-custom">
                            <li class="nav-item active">
                                <a class="nav-link" data-toggle="tab" href="#home">Flight</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#home">Transfer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#home">Hotels</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#home">Sightseeing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#home">Meals & Restaurant</a>
                            </li>

                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content admin-tab-content-custom ">
                            <div class="tab-pane container active" id="home">
                                <h1 class="h4 font-weight-bold">Flight Details One</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Flight Name</asp:Label>
                                        <asp:TextBox ID="txtflightname1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">From</asp:Label>
                                        <asp:TextBox ID="txtfrom1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Depature Date & Time</asp:Label>
                                        <asp:TextBox ID="txtdepdate1" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-1">
                                        <asp:Label runat="server">Stop(s)</asp:Label>
                                        <asp:TextBox ID="txtstops1" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">To</asp:Label>
                                        <asp:TextBox ID="txtto1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Arrival Date & Time</asp:Label>
                                        <asp:TextBox ID="txtarrival" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Flight Details Two</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Flight Name</asp:Label>
                                        <asp:TextBox ID="txtflight2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">From</asp:Label>
                                        <asp:TextBox ID="txtfrom2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Depature Date & Time</asp:Label>
                                        <asp:TextBox ID="txtdepdate2" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-1">
                                        <asp:Label runat="server">Stop(s)</asp:Label>
                                        <asp:TextBox ID="txtstops2" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">To</asp:Label>
                                        <asp:TextBox ID="txtto2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Arrivale Date & Time</asp:Label>
                                        <asp:TextBox ID="txtarrival2" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane container fade" id="home">
                                <div class="row">
                                    <div class="col-auto">
                                        <asp:Label runat="server" CssClass="font-weight-bold">Transfer #1</asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txttransfer1_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <hr class="w-100" />
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <asp:Label runat="server" CssClass="font-weight-bold">Transfer #2</asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txttransfer2_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <hr class="w-100" />
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <asp:Label runat="server" CssClass="font-weight-bold">Transfer #3</asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txttransfer3_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <hr class="w-100" />
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <asp:Label runat="server" CssClass="font-weight-bold">Transfer #4</asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txttransfer4_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <hr class="w-100" />
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <asp:Label runat="server" CssClass="font-weight-bold">Transfer #5</asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txttransfer5_1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <hr class="w-100" />
                                </div>
                            </div>
                            <div class="tab-pane container fade" id="home">
                                <h3 class="font-weight-bold h4">Hotel Details One</h3>
                                <div class="row">

                                    <div class="col">
                                        <asp:Label runat="server">Duration</asp:Label>
                                        <asp:TextBox ID="txtduration" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-3">
                                        <asp:Label runat="server">Hotel Name</asp:Label>
                                        <asp:TextBox ID="txthotelname" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Room Type</asp:Label>
                                        <asp:TextBox ID="txt_RoomType" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:DropDownList ID="ddlroomtype" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1" Text="Single"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Double"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Triple"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Quad"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Queen"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="King"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Twin"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Studio"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Meal Type</asp:Label>
                                        <asp:DropDownList ID="ddlmealtype" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Room only"></asp:ListItem>
                                            <asp:ListItem Text="Breakfast"></asp:ListItem>
                                            <asp:ListItem Text="Lunch"></asp:ListItem>
                                            <asp:ListItem Text="Dinner"></asp:ListItem>
                                            <asp:ListItem Text="Half Board"></asp:ListItem>
                                            <asp:ListItem Text="Full Board"></asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Hotel Star</asp:Label>
                                        <asp:DropDownList ID="ddlhotelstar" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="2 Star"></asp:ListItem>
                                            <asp:ListItem Text="3 Star"></asp:ListItem>
                                            <asp:ListItem Text="4 Star"></asp:ListItem>
                                            <asp:ListItem Text="5 Star"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-2">
                                        <asp:Label runat="server">Check In</asp:Label>
                                        <asp:TextBox ID="txtindate" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Check Out</asp:Label>
                                        <asp:TextBox ID="txtcheckout" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 1</asp:Label>
                                        <asp:FileUpload ID="hotelimg1" runat="server" />

                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 2</asp:Label>
                                        <asp:FileUpload ID="hotelimg1B" runat="server" />
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 3</asp:Label>
                                        <asp:FileUpload ID="hotelimg1C" runat="server" />
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        Hotel Image 1
                                        <asp:Label ID="lbl_hotelimg1" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        Hotel Image 2
                                        <asp:Label ID="lbl_hotelimg1B" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        Hotel Image 3
                                        <asp:Label ID="lbl_hotelimg1C" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <hr />
                                <h3 class="font-weight-bold h4">Hotel Details Two</h3>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label runat="server">Duration</asp:Label>
                                        <asp:TextBox ID="txtduration2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-3">
                                        <asp:Label runat="server">Hotel Name</asp:Label>
                                        <asp:TextBox ID="txthotelname2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Room Type</asp:Label>
                                        <asp:TextBox ID="txt_RoomType2" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:DropDownList ID="ddlroomtype2" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">Roop Type</asp:ListItem>
                                            <asp:ListItem Value="1"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Meal Type</asp:Label>
                                        <asp:DropDownList ID="ddlmealtype2" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Room only"></asp:ListItem>
                                            <asp:ListItem Text="Breakfast"></asp:ListItem>
                                            <asp:ListItem Text="Lunch"></asp:ListItem>
                                            <asp:ListItem Text="Dinner"></asp:ListItem>
                                            <asp:ListItem Text="Half Board"></asp:ListItem>
                                            <asp:ListItem Text="Full Board"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Hotel Star</asp:Label>
                                        <asp:DropDownList ID="ddlhotelstar2" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="2 Star"></asp:ListItem>
                                            <asp:ListItem Text="3 Star"></asp:ListItem>
                                            <asp:ListItem Text="4 Star"></asp:ListItem>
                                            <asp:ListItem Text="5 Star"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-2">
                                        <asp:Label runat="server">Check In</asp:Label>
                                        <asp:TextBox ID="txtindate2" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Check Out</asp:Label>
                                        <asp:TextBox ID="txtcheckout2" runat="server" CssClass="form-control date" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 1</asp:Label>
                                        <asp:FileUpload ID="hotelimg2" runat="server" />
                                        <asp:Label ID="lbl_hotelimg2" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 2</asp:Label>
                                        <asp:FileUpload ID="hotelimg2B" runat="server" />
                                        <asp:Label ID="lbl_hotelimg2B" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Hotel Image 3</asp:Label>
                                        <asp:FileUpload ID="hotelimg2C" runat="server" />
                                        <asp:Label ID="lbl_hotelimg2C" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane container fade" id="home">
                                <h1 class="h4 font-weight-bold">Shighseeing Details One</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Place Name</asp:Label>
                                        <asp:TextBox ID="txtplacename1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">sightseeing area</asp:Label>
                                        <asp:TextBox ID="txtss1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server"> Time</asp:Label>
                                        <asp:TextBox ID="txttime1" type="text" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Shighseeing Details Two</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Place Name</asp:Label>
                                        <asp:TextBox ID="txtplacename2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">sightseeing area</asp:Label>
                                        <asp:TextBox ID="txtss2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Time</asp:Label>
                                        <asp:TextBox ID="txttime2" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Shighseeing Details Three</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Place Name</asp:Label>
                                        <asp:TextBox ID="txtplacename3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">sightseeing area</asp:Label>
                                        <asp:TextBox ID="txtss3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Time</asp:Label>
                                        <asp:TextBox ID="txttime3" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Shighseeing Details Four</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Place Name</asp:Label>
                                        <asp:TextBox ID="txtplacename4" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">sightseeing area</asp:Label>
                                        <asp:TextBox ID="txtss4" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Time</asp:Label>
                                        <asp:TextBox ID="txttime4" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Shighseeing Details Five</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Place Name</asp:Label>
                                        <asp:TextBox ID="txtplacename5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">sightseeing area</asp:Label>
                                        <asp:TextBox ID="txtss5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server"> Time</asp:Label>
                                        <asp:TextBox ID="txttime5" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane container fade" id="home">
                                <h1 class="h4 font-weight-bold">Meal Type One</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Meal Type</asp:Label>
                                        <asp:TextBox ID="txtmealtype1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Meals Included</asp:Label>
                                        <asp:TextBox ID="txtmealinclude1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Meals Time</asp:Label>
                                        <asp:TextBox ID="txtmealtime1" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Meal Type Two</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Meal Type</asp:Label>
                                        <asp:TextBox ID="txtmealtype2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Meals Included</asp:Label>
                                        <asp:TextBox ID="txtmealinclude2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Meals Time</asp:Label>
                                        <asp:TextBox ID="txtmealtime2" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                                <h1 class="h4 font-weight-bold">Meal Type Three</h1>
                                <div class="row mb-3">
                                    <div class="col">
                                        <asp:Label runat="server">Meal Type</asp:Label>
                                        <asp:TextBox ID="txtmealtype3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label runat="server">Meals Included</asp:Label>
                                        <asp:TextBox ID="txtmealinclude3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label runat="server">Meals Time</asp:Label>
                                        <asp:TextBox ID="txtmealtime3" type="text" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="w-100" />
                            </div>

                        </div>
                    </div>
                    <hr class="w-100" />
                </div>
            </div>
            <!-- reapeater data for day wise itenary Ends--->
        </ItemTemplate>
    </asp:Repeater>
    <div class="container pb-5 pt-5">
        <asp:Panel ID="pnlupdatedata2" runat="server">

            <div class="row">
                <div class="col-12">
                    <h5 class="font-weight-bold">Highlights<span style="color: red">*</span></h5>
                    <asp:TextBox ID="txthighlights" TextMode="MultiLine" runat="server" CssClass="textEditor" onblur="Test()"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <h5 class="font-weight-bold">Overview<span style="color: red">*</span></h5>
                    <asp:TextBox ID="txtoverview" TextMode="MultiLine" runat="server" CssClass="textEditor" onblur="Test()"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <h5 class="font-weight-bold">Inclusion<span style="color: red">*</span></h5>
                    <asp:TextBox ID="txtinclution" TextMode="MultiLine" runat="server" CssClass="textEditor"
                        onblur="Test()"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <h5 class="font-weight-bold">Exclusion<span style="color: red">*</span></h5>
                    <asp:TextBox ID="txt_Exclusion" TextMode="MultiLine" runat="server" CssClass="textEditor"
                        onblur="Test()"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <h5 class="font-weight-bold">Payment Policy<span style="color: red">*</span></h5>
                <div class="col-12">
                    <asp:HiddenField ID="hdText" runat="server" />
                    <asp:TextBox ID="txt_PaymentPolicy" TextMode="MultiLine" runat="server" CssClass="textEditor1"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <h5 class="font-weight-bold">Cancellation Policy<span style="color: red">*</span></h5>
                <div class="col-12">
                    <asp:TextBox ID="txt_CancellationPolicy" TextMode="MultiLine" runat="server" CssClass="textEditor1"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <h5 class="font-weight-bold">Terms & Conditions<span style="color: red">*</span></h5>
                <div class="col-12">
                    <asp:TextBox ID="txttandc" TextMode="MultiLine" runat="server" CssClass="textEditor1"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <h5 class="font-weight-bold">Itinerary Detailed<span style="color: red">*</span></h5>
                <div class="col-12">
                    <asp:TextBox ID="txt_ItineraryDetailed" TextMode="MultiLine" runat="server" CssClass="textEditor1"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12 mb-3">
                    <asp:Label runat="server" CssClass="h5 font-weight-bold ">For Thumbnails<span style="color:red; font-size:11px">* (Image Size 285*300) </span></asp:Label>
                </div>
                <div class="col">
                    <asp:FileUpload ID="PkgImg1" runat="server" />
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-12 mb-3">
                    <asp:Label runat="server" CssClass="h5 font-weight-bold ">For Slider<span style="color:red; font-size:11px">(Image Size 1200*400)</span></asp:Label>
                </div>
                <div class="col-3">
                    Image 1<span style="color: red">*</span>
                    <asp:FileUpload ID="PkgImg2" runat="server" />
                </div>
                <div class="col-3">
                    Image 2<span style="color: red">*</span>
                    <asp:FileUpload ID="PkgImg3" runat="server" />
                </div>
                <div class="col-3">
                    Image 3<span style="color: red">*</span>
                    <asp:FileUpload ID="PkgImg4" runat="server" />
                </div>
                <div class="col-3">
                    Image 4
                <asp:FileUpload ID="PkgImg5" runat="server" />
                </div>
            </div>
            <br />
            <hr />
        </asp:Panel>
        <div class="row">
            <div class="col-10">
                <asp:LinkButton ID="btnsave2" runat="server" CssClass="btn btn-lg btn-info" Visible="false" Text="Save Itinerary" Style="float: right;" OnClick="btnsave2_Click"></asp:LinkButton>
                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-lg btn-success" OnClick="btnsave_Click" Text="Save" Style="float: right;" />
            </div>
            <div class="col-2">
                <asp:Button ID="btnclear" runat="server" CssClass="btn btn-lg btn-danger" Text="Clear/Back" OnClick="btnclear_Click" />
            </div>
        </div>
    </div>

    <%--<script src="JS/jquery-1.10.2.min.js"></script>--%>

    <script src="JS/jquery-te-1.4.0.min.js"></script>
    <script type="text/javascript">
        $('.textEditor1').jqte();
        $(".textEditor").jqte({
            blur: function () {
                document.getElementById('<%=hdText.ClientID %>').value = document.getElementById('<%=txtoverview.ClientID %>').value;
            }
        });
    </script>
    <script>
        $(document).ready(function () {
            //$(".datedynamic").each(function (i) {
            //    $(this).attr('class', 'date' + (i + 1));
            //    var i = 1;   i++;
            //});
            //$('[class^="date"]').each(function () {
            //    var date = $(this);
            //    $(date).datepicker({
            //        dateFormat: "dd/mm/yy",
            //        changeMonth: true,
            //        changeYear: true
            //    })
            //});

            //$(".date").datepicker({
            //    dateFormat: "dd/mm/yy",
            //    changeMonth: true,
            //    changeYear: true
            //});
        });
        //$("#txtdate").each(function (i) {
        //    $(".date"+(i+1)).datepicker({
        //        dateFormat: "dd/mm/yy",
        //        changeMonth: true,
        //        changeYear: true
        //    });
        //});
        //});
    </script>
    <script>

        $(document).ready(function () {
            $(".nav-link").each(function (i) {
                $(this).attr('href', "#home" + (i + 1));

            });
            $(".tab-pane").each(function (i) {
                $(this).attr('id', "home" + (i + 1));

            });
            //$('#txtdate').datepicker({
            //    //format: {
            //    //    /*
            //    //     * Say our UI should display a week ahead,
            //    //     * but textbox should store the actual date.
            //    //     * This is useful if we need UI to select local dates,
            //    //     * but store in UTC
            //    //     */
            //    //    toDisplay: function (date, format, language) {
            //    //        var d = new Date(date);
            //    //        d.setDate(d.getDate() - 7);
            //    //        return d.toISOString();
            //    //    },
            //    //    toValue: function (date, format, language) {
            //    //        var d = new Date(date);
            //    //        d.setDate(d.getDate() + 7);
            //    //        return new Date(d);
            //    //    }
            //    //}
            //});
        });


    </script>
    <script>
        $("#btnsave").on('click', function (e) {
            var packagename = $('#txtpackagename').val();
            var SubPackageName = $('#txt_SubPackageName').val();
            //var packagecode = $('#txtpackagecode').val();
            var MetaTitle = $('#txt_MetaTitle').val();
            //var MetaDescription = $('#txt_MetaDescription').val();
            //var MetaKeywords = $('#txt_MetaKeywords').val();
            var FromDate = $('#txtFromDate').val();
            var DurationToDate = $('#txtDurationToDate').val();
            var startingfrom = $('#ddlstartingfrom').val();
            var taxvalues = $('#ddltaxvalues').val();
            var packagetype = $('#ddlpackagetype').val();
            var group = $('#ddlgroup').val();
            var Noofdays = $('#ddlNoofdays').val();
            var overview = $('#txtoverview').val();
            var inclution = $('#txtinclution').val();
            var Exclusion = $('#txt_Exclusion').val();
            var PaymentPolicy = $('#txt_PaymentPolicy').val();
            var CancellationPolicy = $('#txt_CancellationPolicy').val();
            var ItineraryDetailed = $('#txt_ItineraryDetailed').val();
            var tandc = $('#txttandc').val();
            var Img1 = $('#PkgImg1').val();
            var Img2 = $('#PkgImg2').val();
            var Img3 = $('#PkgImg3').val();
            var Img4 = $('#PkgImg4').val();

            if (packagename === '') {
                alert("Please input Package Name");
                $('#txtpackagename').addClass("is-invalid");
                e.preventDefault();
            }
            else if (SubPackageName === '') {
                alert("Please input Sub Package Name");
                $('#txt_SubPackageName').addClass("is-invalid");
                e.preventDefault();
            }
                //else if (packagecode === '') {
                //    alert("Please input  Package Code");
                //    $('#txtpackagecode').addClass("is-invalid");
                //    e.preventDefault();
                //}
            else if (MetaTitle === '') {
                alert("Please input Meta Title");
                $('#txt_MetaTitle').addClass("is-invalid");
                e.preventDefault();
            }

                //else if (MetaDescription === '') {
                //    alert("Please input Meta Description");
                //    $('#txt_MetaDescription').addClass("is-invalid");
                //    e.preventDefault();
                //}
                //else if (MetaKeywords === '') {
                //    alert("Please input Meta Keywords");
                //    $('#txt_MetaKeywords').addClass("is-invalid");
                //    e.preventDefault();
                //}
            else if (FromDate === '') {
                alert("Please Select Valid From Date");
                $('#txtFromDate').addClass("is-invalid");
                e.preventDefault();
            }
            else if (DurationToDate === '') {
                alert("Please Select Valid To Date");
                $('#txtDurationToDate').addClass("is-invalid");
                e.preventDefault();
            }
            else if (startingfrom === '--Select--') {
                alert("Please Select Starting from");
                $('#ddlstartingfrom').addClass("is-invalid");
                e.preventDefault();
            }
            else if (taxvalues === '--Select--') {
                alert("Please Select Tax");
                $('#ddltaxvalues').addClass("is-invalid");
                e.preventDefault();
            }
            else if (packagetype === '0') {
                alert("Please Select Package type");
                $('#ddlpackagetype').addClass("is-invalid");
                e.preventDefault();
            }
            else if (group === '0') {
                alert("Please Select Group");
                $('#ddlgroup').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Noofdays === '1') {
                alert("Please Select Package Duration Night/Day");
                $('#ddlNoofdays').addClass("is-invalid");
                e.preventDefault();
            }
            else if (overview === '') {
                alert("Please input Highlights/Overview");
                $('#txtoverview').addClass("is-invalid");
                e.preventDefault();
            }
            else if (inclution === '') {
                alert("Please input Inclusion");
                $('#txtinclution').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Exclusion === '') {
                alert("Please input Exclusion");
                $('#txt_Exclusion').addClass("is-invalid");
                e.preventDefault();
            }
            else if (PaymentPolicy === '') {
                alert("Please input Payment Policy");
                $('#txt_PaymentPolicy').addClass("is-invalid");
                e.preventDefault();
            }
            else if (CancellationPolicy === '') {
                alert("Please input Cancellation Policy");
                $('#txt_CancellationPolicy').addClass("is-invalid");
                e.preventDefault();
            }
            else if (tandc === '') {
                alert("Please input Terms & Conditions");
                $('#txttandc').addClass("is-invalid");
                e.preventDefault();
            }
            else if (ItineraryDetailed === '') {
                alert("Please input ItineraryDetailed");
                $('#txt_ItineraryDetailed').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Img1 === '') {
                alert("Please upload Image For Thumblails");
                $('#PkgImg1').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Img2 === '') {
                alert("Please upload Image For Slider 1");
                $('#PkgImg2').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Img3 === '') {
                alert("Please upload Image For Slider 2");
                $('#PkgImg3').addClass("is-invalid");
                e.preventDefault();
            }
            else if (Img4 === '') {
                alert("Please upload Image For Slider 3");
                $('#PkgImg4').addClass("is-invalid");
                e.preventDefault();
            }
            else {
                $('.validation').addClass("is-valid");
            }



            //else if (!$("#checkbox1").is(":checked")) {
            //    alert("Checkbox is Not unchecked.");
            //    $('#checkbox1').addClass("is-invalid");
            //    e.preventDefault();
            //}
            //else if (!$("#checkbox2").is(":checked")) {
            //    alert("Checkbox is Not unchecked.");
            //    $('#checkbox2').addClass("is-invalid");
            //    e.preventDefault();
            //}

        });

    </script>
</asp:Content>

