<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.master" AutoEventWireup="true" CodeFile="my-profile.aspx.cs" Inherits="my_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">

    <div class="container-fluid pl-0 pr-0">
        <div class="row">

            <div class="mini-search-row">
                <div class="container">
                    <div class="row">
                        <div class="col-auto p-0">
                            <img src="img/travel-icon.png" alt="">
                        </div>
                        <div class="col my-1">
                            <label class="sr-only" for="txtFrom">From</label>
                            <div class="input-group">
                                <input type="text" class="form-control form-control-custom form-control-lg border-0 rounded-0" id="txtFrom" placeholder="Kolkata">
                                <div class="input-group-prepend rounded-0 ">
                                    <div class="input-group-text border-0 bg-white">
                                        <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col my-1">
                            <label class="sr-only" for="txtTo">To</label>
                            <div class="input-group">
                                <input type="text" class="form-control form-control-custom border-0 form-control-lg rounded-0" id="txtTo" placeholder="Bali">
                                <div class="input-group-prepend rounded-0 ">
                                    <div class="input-group-text border-0 bg-white">
                                        <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col my-1">
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
                        <div class="col my-1">
                            <button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item active">My Profile</li>
                        </ol>
                    </nav>
                    <%--<ul>
                            <li class="pre_active">Home</li>
                            <li class="active">My Profile</li>
                        </ul>--%>
                </div>
                <div class="row">
                    <div class="tab-content col-12" id="v-pills-tabContent">
                        <div class="tab-pane show active">
                            <div class="content-inner">
                                <div class="panel profile">
                                    <div class="panel-body clearfix pt15 pb15 profile-page">

                                        <div class="user-profile col-sm-2 col-xs-12 lg" style="float: left;">
                                            <i class="ico-profile"></i>
                                        </div>
                                        <div class="profile-info clearfix" style="display: grid;">
                                            <div class="col-sm-10 col-md-10 col-xs-12 p0 mb5">
                                                <span class="fs-lg text-dark ng-binding"><span id="username" runat="server"></span></span>
                                                <asp:LinkButton ID="btn_Edit" runat="server" Text="Edit" class="button primary fr" OnClick="btn_Edit_Click"> <i class="fas fa-pen ml5"></i></asp:LinkButton>
                                            </div>
                                            <div class="col-lg-6 col-md-10 col-xs-12 p0 mb5">
                                                <p class="fs-sm mt5">
                                                    <i class="fas fa-envelope mr10"></i>
                                                    <a href="#" class="ng-binding"><span id="usermailid" runat="server"></span></a>
                                                </p>
                                                <p class="fs-sm mt5 ng-binding">
                                                    <i class="fas fa-phone mr10"></i>
                                                    + <span id="userMobileno" runat="server"></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body clearfix pt15 pb15 profile-page" id="div_showedit" runat="server" visible="false">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left;">User Name:<span class="text-blue">*</span></div>

                                                    <div class="col-lg-3 col-sm-4 form-group" style="float: left;">
                                                        <input id="txt_firstname" runat="server" class="input block " type="text" placeholder="First Name" ng-model="editProfile.userVO.name" required="" name="firstName">
                                                    </div>
                                                    <div class="col-lg-3 col-sm-4 form-group" style="float: left;">
                                                        <input id="txt_lastsname" runat="server" class="input block " type="text" placeholder="Last Name" ng-model="editProfile.userVO.lastName" required="" name="lastName">
                                                        <span class="error ng-binding"></span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">User ID:</div>
                                                    <div class="col-lg-8 col-sm-11" style="float: left; margin-bottom: 10px;">
                                                        <input id="txt_email" runat="server" class="input block ng-pristine ng-untouched ng-valid" type="text" placeholder="Enter the email" disabled="" name="email">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left;">Password:</div>
                                                    <div class="col-lg-4 col-sm-11 mb5" style="float: left; margin-bottom: 10px;">
                                                        <input id="txt_password" runat="server" class="input block" type="text" value="text" name="password">
                                                    </div>
                                                   <%-- <div class="col-lg-4 col-sm-9 link mb5 mt10" style="float: left;">
                                                        <a class=" text-blue">Change Password</a>
                                                    </div>--%>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left;">Phone:<span class="text-blue">*</span></div>

                                                    <div class="col-lg-4 col-sm-7 form-group" style="float: left;">
                                                        <input id="txt_phone" runat="server" class="input block" type="number" placeholder="Enter the Phone Number" name="mobile" ng-disabled="true">
                                                    </div>
                                                  <%--  <div class="col-lg-4 col-sm-9 link mt10" style="float: left;">
                                                        <a class=" text-blue">Change Phone No.</a>

                                                    </div>--%>
                                                </div>

                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">Country:</div>
                                                    <div class="col-lg-8 col-sm-11" style="float: left; margin-bottom: 10px;">
                                                        <div class="select-box" style="width: 200px;">
                                                            <asp:DropDownList ID="ddl_Country" runat="server">
                                                                <asp:ListItem Text="India"></asp:ListItem>
                                                                <asp:ListItem Text="UK"></asp:ListItem>
                                                                <asp:ListItem Text="US"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">State:</div>
                                                    <div class="col-lg-8 col-sm-11" style="float: left; margin-bottom: 10px;">
                                                        <div class="select-box" style="width: 200px;">
                                                            <input id="txt_state" runat="server" class="input block " type="text" placeholder="Enter the State" name="State">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">City:</div>
                                                    <div class="col-lg-2 col-sm-6 rsp-ml8" style="float: left; margin-bottom: 10px;">
                                                        <input id="txt_city" runat="server" class="input block" type="text" placeholder="Enter the City" name="city">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 mb5">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">Pin Code:</div>
                                                    <div class="col-lg-4 col-sm-6 rsp-mr8" style="float: left; margin-bottom: 10px;">
                                                        <input id="txt_pincode" runat="server" class="input block " type="text" placeholder="Enter the pincode" name="pincode">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="col-lg-2 col-sm-12 mb5" style="float: left; margin-bottom: 10px;">Address:</div>
                                                    <div class="col-lg-8 col-sm-12 mt15 p0" style="float: left; margin-bottom: 10px;">
                                                        <textarea id="txt_address" runat="server" class="input block" placeholder="Enter address" rows="5" name="address"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-12">
                                                <div class="col-lg-2 col-sm-3"></div>
                                                <div class="col-lg-2 col-sm-3"></div>
                                                <div class="col-lg-2 col-lg-3" style="float: left;">
                                                    <asp:LinkButton ID="lnkbtn_editSave" runat="server" CssClass="button primary bordered block" Text="Submit" OnClick="lnkbtn_editSave_Click"></asp:LinkButton>
                                                </div>
                                                <div class="col-lg-2 col-lg-3" style="float: left;">
                                                    <%--<button class="button primary bordered block">Cancel</button>--%>
                                                    <asp:LinkButton ID="lnkbtn_Cancel" runat="server" Text="Cancel" class="button primary bordered block" OnClick="lnkbtn_Cancel_Click"></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </div>
</asp:Content>
