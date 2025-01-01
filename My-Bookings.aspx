<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.master" AutoEventWireup="true" CodeFile="My-Bookings.aspx.cs" Inherits="My_Bookings" %>

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
               <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item active">My Booking</li>
                        </ol>
                    </nav>
                <div class="row marT0">
                    <div class="tab-content col-12" id="v-pills-tabContent">

                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel with-nav-tabs">
                                        <div class="panel-heading">
                                            <ul class="nav nav-tabs dastination-nav-tabs" role="tablist">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#home" role="tab">Holidays</a>
                                                </li>
                                                <li class="nav-item rounded-0">
                                                    <a data-toggle="tab" href="#Hotel" role="tab">Hotel</a>
                                                </li>
                                                <li class="nav-item rounded-0">
                                                    <a data-toggle="tab" href="#Transfer" role="tab">Transfer</a>
                                                </li>
                                                <li class="nav-item rounded-0">
                                                    <a  data-toggle="tab" href="#Sightseeing" role="tab">Sightseeing</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <div class="dastination-package-main">
                                                    <div class="tab-content pr-0 dastination-tab-content">
                                                        <div class="tab-pane active " id="home" role="tabpanel">
                                                            <asp:GridView ID="GV_mybooking" runat="server" AllowSorting="True" PageSize="20" AutoGenerateColumns="False" Width="100%"
                                                                CssClass="table gridstyle" AlternatingRowStyle-CssClass="gridaltstyle" FooterStyle-CssClass="gridfooterstyle" HeaderStyle-CssClass="gridheaderstyle" PagerStyle-CssClass="gridpagerstyle">
                                                                <AlternatingRowStyle CssClass="gridaltstyle"></AlternatingRowStyle>
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="#">
                                                                        <ItemTemplate>
                                                                            <%# Container.DataItemIndex+1 %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="2%" HorizontalAlign="left" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Your Holidays Package Name" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblmenuid" runat="server" Text='<%# Eval("Package_name") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="30%" HorizontalAlign="left" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Departure City" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblmenuid" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Departure Date" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPkg_name" runat="server" Text='<%# Eval("Travel_Date") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Booking Code" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPkg_code" runat="server" Text='<%# Eval("Booking_Code") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Room Configuration" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPkg_duration" runat="server" Text='<%# Eval("Total_Room") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PAX / Age" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPkg_Itineray" runat="server" Text='<%# Eval("Details") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Amount" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPkg_details" runat="server" Text='<%# Eval("Pkg_total_amount") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Booking Status" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTerms_Condtition" runat="server" Text='Successful'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="5%" HorizontalAlign="right" />
                                                                    </asp:TemplateField>

                                                                    <%-- <asp:TemplateField HeaderText="Airfare_Cost" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("Airfare_Cost") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="5%" HorizontalAlign="right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AutoSP % 1" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP1") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="5%" HorizontalAlign="center" />
                                                            </asp:TemplateField>--%>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                        <div class="tab-pane " id="Hotel" role="tabpanel">
                                                            <iframe src="http://www.onlinezenithholidays.com/ManageBooking.aspx" class="europetours-iframe" height="500" width="100%"></iframe>
                                                        </div>
                                                        <div class="tab-pane " id="Transfer" role="tabpanel">
                                                            <iframe src="http://www.onlinezenithholidays.com/ManageBooking.aspx" class="europetours-iframe" height="500" width="100%"></iframe>
                                                        </div>
                                                        <div class="tab-pane " id="Sightseeing" role="tabpanel">
                                                            <iframe src="http://www.onlinezenithholidays.com/ManageBooking.aspx" class="europetours-iframe" height="500" width="100%"></iframe>
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
    </div>
</asp:Content>

