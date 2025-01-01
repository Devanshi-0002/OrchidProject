<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .h3h
        {
            color:#00a5db;
        }
    </style>
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
                    <div class="hotel_bread_crumbs">
                        <ul>
                            <li class="pre_active">Home</li>
                            <li class="active">Contact us</li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 heading">
                        <h2 class="text-center">Contact us</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-9 col-xs-12 form_contact">
                        <table id="tblbody1" runat="server" class="table">
                        <tr>
                            <td>
                                <div class="srch-tab-line">
                                    <label>First Name </label>
                                    <asp:TextBox ID="txtFastName" runat="server" type="text" CssClass="form-control" placeholder="First Name" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtFastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtFastName" ValidationGroup="subinq" ErrorMessage="Please Enter First Name!" />
                                    <div class="clear"></div>
                                </div>
                            </td>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Last Name</label>
                                    <asp:TextBox ID="txtLastName" runat="server" type="text" CssClass="form-control" placeholder="Last Name" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtLastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLastName" ValidationGroup="subinq" ErrorMessage="Please Enter last Name!" />--%>
                                    <div class="clear"></div>
                                </div>
                            </td>

                            <td>
                                <div class="srch-tab-line">
                                    <label>Destination </label>
                                    <asp:TextBox ID="txtDestination" runat="server" type="text" CssClass="form-control" placeholder="Destination" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvDestination" ForeColor="Red" Font-Size="12px" ControlToValidate="txtDestination" ValidationGroup="subinq" ErrorMessage="Please Enter Destination!" />--%>
                                    <div class="clear"></div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Phone number</label>
                                    <asp:TextBox ID="txtPhoneno" runat="server" type="text" CssClass="form-control" placeholder="Phone number" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtPhoneno" ForeColor="Red" Font-Size="12px" ControlToValidate="txtPhoneno" ValidationGroup="subinq" ErrorMessage="Please Enter Your Phone number!" />
                                </div>
                            </td>

                            <td>
                                <div class="srch-tab-line">
                                    <label>Email-ID</label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email" />
                                    <asp:RequiredFieldValidator ID="rfvtxtEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" Font-Size="12px" ValidationGroup="subinq" ErrorMessage="Please Enter E-mail Id !"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="revtxtEmail" runat="server" Display="Dynamic" Font-Size="12px" ForeColor="Red" ValidationGroup="saveenq" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" ControlToValidate="txtEmail" ErrorMessage="Valid E-mail address is required."></asp:RegularExpressionValidator>--%>
                                </div>
                            </td>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Your City </label>
                                    <asp:TextBox ID="txtLocation" runat="server" type="text" CssClass="form-control" placeholder="Type City, State, Country Name" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtLocation" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLocation" ValidationGroup="subinq" ErrorMessage="Please Enter City!" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Likely Travel Date</label>
                                    <asp:TextBox ID="datepicker" runat="server" name="dateOfTravel" TextMode="Date" class="form-control" placeholder="Select Travel Date" />
                                    <%-- <asp:TextBox ID="datepicker" runat="server" type="text" CssClass="ui-datepicker"  placeholder="Select Travel Date" />--%>
                                    

                                    <asp:TextBox ID="txtTraveldate" runat="server" Visible="false" type="text" CssClass="form-control" class="ui-datepicker" placeholder="Select Travel Date" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtTraveldate" ForeColor="Red" Font-Size="12px" ControlToValidate="datepicker" ValidationGroup="subinq" ErrorMessage="Select Travel Date!" />
                                    <%--<i class="fa fa-calendar" aria-hidden="true"></i>--%>
                                </div>
                            </td>

                            <td>
                                <div class="srch-tab-line">
                                    <div class="srch-tab-left transformed">
                                        <label>No of Adults</label>
                                        <div class="select-wrapper">
                                            <asp:DropDownList ID="ddladults" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="11">11</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="srch-tab-line">
                                    <label>No of Child</label>
                                    <div class="select-wrapper">
                                        <asp:DropDownList ID="ddlchild" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="1">0</asp:ListItem>
                                            <asp:ListItem Value="2">1</asp:ListItem>
                                            <asp:ListItem Value="3">2</asp:ListItem>
                                            <asp:ListItem Value="4">3</asp:ListItem>
                                            <asp:ListItem Value="5">4</asp:ListItem>
                                            <asp:ListItem Value="6">5</asp:ListItem>
                                            <asp:ListItem Value="7">6</asp:ListItem>
                                            <asp:ListItem Value="8">7</asp:ListItem>
                                            <asp:ListItem Value="9">8</asp:ListItem>
                                            <asp:ListItem Value="10">9</asp:ListItem>
                                            <asp:ListItem Value="11">10</asp:ListItem>
                                            <asp:ListItem Value="12">11</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="srch-tab-line" id="tdreturn" runat="server" visible="true">
                                    <label>Details</label>
                                    <asp:TextBox ID="txtMoreDetails" runat="server" type="text" CssClass="form-control" Style="height: 50px;" TextMode="MultiLine" Rows="3" placeholder="Details" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtMoreDetails" ForeColor="Red" Font-Size="12px" ControlToValidate="txtMoreDetails" ValidationGroup="subinq" ErrorMessage="Please Enter Details!" />--%>
                                </div>
                            </td>
                      
                            <td id="tdbookbtn" runat="server">
                                <br /> <br />
                                <asp:LinkButton ID="btncontact" runat="server" Width="100%" Text="Send" class="btn btn-success btn-lg" ValidationGroup="subinq" OnClick="btncontact_Click" />
                                <%--<asp:Button ID="btncloseEnquiry" runat="server" Text="Close" CssClass="no" />--%></td>
                        </tr>
                    </table>
                        <%--<div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputEmail1">First Name <span class="red">*</span></label>
                                <input type="text" class="form-control" id="txtfirstName" runat="server" aria-describedby="emailHelp" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputPassword1">Last Name <span class="red">*</span></label>
                                <input type="password" class="form-control" id="txtlastName" runat="server" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputEmail1">Destination</label>
                                <input type="email" class="form-control" id="txt_Destination" runat="server" aria-describedby="emailHelp" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputPassword1">Phone Number <span class="red">*</span></label>
                                <input type="text" class="form-control" id="txt_PhoneNumber" runat="server" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputEmail1">Email-ID <span class="red">*</span></label>
                                <input type="email" class="form-control" id="txt_EmailID" runat="server" aria-describedby="emailHelp" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputPassword1">Your City <span class="red">*</span></label>
                                <input type="text" class="form-control" id="txt_YourCity " runat="server" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="exampleInputEmail1">Likely Travel Date <span class="red">*</span></label>
                                <input type="text" class="form-control" id="txt_datepicker" runat="server"  aria-describedby="emailHelp" placeholder="">
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="col-sm-6 pa0">
                                    <label for="exampleInputPassword1">No of Adults <span class="red">*</span></label>
                                    <select>
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                                <div class="col-sm-6 pa0">
                                    <label for="exampleInputPassword1">No of Child <span class="red">*</span></label>
                                    <select>
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group col-sm-12">
                                <label for="exampleInputEmail1">Details </label>
                                <textarea style="width: 100%;" rows="4"></textarea>
                            </div>


                            <div class="form-group col-sm-12 submit">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>--%>
                    </div>
                    <div class="col-sm-3 col-xs-12 cont_info">
                        <h3>Email</h3>
                        enquiry@orchiddmc.net

                        <h3>Phone Number</h3>
                        +91 6290952054
                        <h3>Address</h3>
                        Unit No: 716-718, 7th Floor, Krishna Building, 224 AJC Bose Road,Kolkata – 700017
                    </div>
                </div>
                <div class="row marTB5">
                    <section id="fvszv">
                        <div class="row work-row">
                            <div class="container-fluid container-fluid-width">
                                <div class="col-md-11">
                                    <div style="Width: 100%">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <h3 class="h3h">UAE</h3>
                                                    <br />
                                                    <p style="margin-top:0;">MO4, Al Jawahara Building, Near ADCB Bank, Khalid Bin Al Waleed Street, P.O Box 124856,<br/> Dubai, UAE</p>
                                                    <a href="enquiry@orchiddmc.net">Email: enquiry@orchiddmc.net</a>
                                                    <br />
                                                    <br />
                                                </td>
                                                <td>

                                                    <h3 class="h3h">Thailand</h3>
                                                    <br />
                                                    <p style="margin-top:0;">128/72, Phyathai Plaza Building, 7th Floor, Phyathai Road, Khet Ratchathewi, Bangkok – 10400, THAILAND</p>

                                                    <a href="enquiry@orchiddmc.net">Email: enquiry@orchiddmc.net</a>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h3 class="h3h">Bangladesh</h3>
                                                    <br />
                                                    <p style="margin-top:0;">Bashati Dream, 
					Flat: C- 6, Suit – 2 , Gulshan-1, Road-20, Dhaka 1212</p>
                                                    <a href="enquiry@orchiddmc.net">Email: enquiry@orchiddmc.net</a>

                                                </td>
                                                <td>

                                                    <h3 class="h3h">Singapore</h3>
                                                    <br />
                                                    <p style="margin-top:0;">#02-21 Jalan Besar Plaza 101 Kitchener Road <br/>Singapore 208511</p>
                                                    <br />
                                                    <a href="enquiry@orchiddmc.net">Email: enquiry@orchiddmc.net</a>
                                                    <br /><br />
                                                </td>
                                            </tr>

                                           <%-- <tr>
                                                <td>
                                                    <h3 class="h3h">COCHIN</h3>
                                                    <br />
                                                    1117/ 1320, Kannadisseril House
                                                    Kadavanthara kaloor Road
                                                    Cochin – 682 017<br />
                                                    Phone: 048-42207101/201/501/601<br />
                                                    <br />

                                                </td>
                                                <td>
                                                    <h3 class="h3h">HYDERABAD</h3>
                                                    <br />
                                                    201,  Pavani Estates, 
                                                    6-2-976, Raj Bhavan Road
                                                    Khairatabad, Hyderabad – 500 004<br />
                                                    Phone: 040-49094000
                                                        <br />
                                                    <a href="mailto:hyderabad@zenithholidays.com">Email: hyderabad@zenithholidays.com</a>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <h3 class="h3h">KOLKATA</h3>
                                                     <br />
                                                    Annapurna Building - 1st Floor
                                                    68 Ballygunge Circular Rd
                                                    Kolkata – 700 019<br />
                                                    Phone: 033 40143900-39<br />
                                                    <a href="mailto:Kolkata@zenithholidays.com">Email: Kolkata@zenithholidays.com</a>
                                                </td>
                                                <td>
                                                   
                                                    <h3 class="h3h">KOLKATA</h3>
                                                    <br />
                                                    N.P 222, 5th Floor,Satya Narayan Apartment , Sector-V
                                                    <br />
                                                    Salt Lake, Electronic Complex, Kolkata 700102
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td>
                                                     <br />
                                                    <h3 class="h3h">NEW DELHI</h3> <br />
                                                    Zenith Leisure holidays Limited
                                                    Unit No. 101, First Floor,
                                                    Block-E, Local shopping centre,
                                                    Vikaspuri, near Dushehra Ground,
                                                    New Delhi- 110018<br />
                                                    Phone: 011-40450000<br />
                                                    <a href="mailto:delhi@zenithholidays.com">Email: delhi@zenithholidays.com</a>

                                                </td>
                                                <td>
                                                     <br />
                                                    <h3 class="h3h">NEW DELHI</h3> <br />
                                                    NEW DELHI
                                                    Zenith Leisure holidays Limited
                                                    401, DDA Building 5
                                                    District Center, JanakPuri
                                                    New Delhi- 100 058<br />
                                                    Phone: 011-45120000<br />
                                                    <a href="mailto:delhi@zenithholidays.com">Email: delhi@zenithholidays.com</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <h3 class="h3h">NEW DELHI</h3>
                                                    <br />
                                                    Flat No Gf-24,Ground Floor, Indraprakash Building 
                                                    <br />
                                                    Barahkhamba Road, New Delhi 110001
                                                </td>
                                                <td>
                                                     <br />
                                                    <h3 class="h3h">MUMBAI</h3><br />
                                                    608 - Shivai Plaza Plot 79/A3
                                                    Marol Industrial Co Op Society Ltd
                                                    Off AndheriKurla Road, Marol
                                                    Andheri (EAST), Mumbai – 400 059<br />
                                                    Phone:  022-40369000-22<br />
                                                    <a href="mailto:mumbai@zenithholidays.com">Email: mumbai@zenithholidays.com</a>
                                                    <br />
                                                </td>
                                               
                                            </tr>

                                            <tr>
                                                <td>
                                                    <br />
                                                    <h3 class="h3h">THANE</h3>
                                                    <br />
                                                    S/13, Ground Floor, Dev Prayag CHS, Bhakti Mandir Road 
                                                    <br />
                                                    Hari Niwas Pachpakhadi, Thane, Maharashtra 400602
                                                </td>
                                                <%--<td>
                                                    <br />
                                                    <h3>Hyderabad</h3>
                                                    <br />
                                                    Unit No 201, H No 6-2-976, Pavani Estates
                                                    <br />
                                                    Khairatabad,Hyderabad, Telangana,500004
                                                </td>--%>

                                                <%--<td>
                                                    <br />
                                                    <h3 class="h3h">BHOPAL</h3>
                                                    <br />
                                                    Plot No-6,V.N.V.Plaza, M P Nagar,Zone-Ii
                                                    <br />
                                                    Bank Street, Bhopal, Madhya Pradesh 462011
                                                </td>
                                            </tr>

                                            <tr>
                                                 <td>
                                                    <br />
                                                    <h3 class="h3h">CHANDIGARH</h3>
                                                    <br />
                                                    SCO 291, Sector 35D,Chandigarh
                                                    <br />
                                                    Punjab -160035 
                                                </td>
                                                <td>
                                                    <br />
                                                    <h3 class="h3h">GURUGRAM</h3>
                                                    <br />
                                                    218&219,1st Floor,Central Arcade Market
                                                    <br />
                                                    DLF City Phase 2,Gurgaon, Haryana
                                                </td>
                                            </tr>

                                            <tr>
                                                 
                                                 <td>
                                                    <br />
                                                    <h3 class="h3h">PATNA</h3>
                                                    <br />
                                                    Shop No A-02, Grand Plaza, Frazer Road, Patna
                                                    <br />
                                                    Bihar 800001
                                                </td>
                                               <td>
                                                    <br />
                                                    <h3 class="h3h">RANCHI</h3>
                                                    <br />
                                                    Shop No 301, 3rd Floor,Bansal Arcade, Pee Pee Compound
                                                    <br />
                                                    Ranchi Jharkhand 834001
                                                </td>

                                            </tr>

                                            <tr>
                                                
                                                <td>
                                                    <br />
                                                    <h3 class="h3h">VADODARA</h3>
                                                    <br />
                                                    224 Trivia Complex Mr. Natubhai Circle Vadodara
                                                    <br />
                                                    Gujarat
                                                </td>
                                            
                                            <td>
                                                    <br />
                                                    <h3 class="h3h">GOA CENTRAL</h3>
                                                    <br />
                                                    G-56, Ground Floor, PMC House No.12/135/56 <br />
                                                    Block B, Alfran Plaza Panji, Goa -403001
                                                    
                                                </td></tr>
												<tr>
                                                
                                                <td>
                                                    <br />
                                                    <h3 class="h3h">GOA SOUTH</h3>
                                                    <br />
                                                    H.No.234/3/21-CG-5, Tivim Sirsaim<br\>
                                                    North Goa-403 502
                                                    
                                                </td>
                                            
                                            <td>
                                                    <br />
                                                    <h3 class="h3h">VIZAG</h3>
                                                    <br />
                                                    Das Arcade 30-15-133/1, Main Road,<br />
													Dhabagardens, Visakhapatnam,<br />
                                                    Andhra Pradesh- 530 020<br />
													0891-2554335
                                                    </td></tr>--%>
												
												
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <%--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Mail to Customer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--%>
    <div id="divsss" runat="server" visible="false" title="rntmarker_46925">
        <table id="tblbody" runat="server" style="FONT-FAMILY: Segoe UI,Verdana,sans-serif" border="1" cellspacing="0" cellpadding="0" width="610" align="center">
            <tbody>
                <tr>
                    <td bgcolor="#F5F5F5">
                        <table style="FONT-FAMILY: Segoe UI,Verdana,sans-serif" cellpadding="5" width="700" align="center">
                            <tbody>
                                <tr>
                                    <td bgcolor="#FFFFFF">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td valign="top" width="560"><a title="Zenith" style="TEXT-DECORATION: underline" href="http://Zenithholidays.com/" target="_blank">
                                                        <img src="http://www.zenithholidays.com/images/logo.png" style="FLOAT: right; MARGIN: 0px 0px 15px 15px" width="150" class="CToWUd" /></a>
                                                        <table style="FONT-FAMILY: Segoe UI,Verdana,sans-serif" cellpadding="1" width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <p style="FONT-SIZE: 12pt; MARGIN: 0px; LINE-HEIGHT: 18px"></p>
                                                                        <table style="FONT-FAMILY: Segoe UI,Verdana,sans-serif" cellpadding="1" width="100%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="BORDER-TOP: #d0d0d0 1px solid">
                                                                                        <h1 style="FONT-SIZE: 11pt; FONT-WEIGHT: bold; COLOR: #848484; MARGIN: 10px 0px 5px">Subject</h1>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div style="MARGIN: 0px 0px 0px 15px"><span style="FONT-WEIGHT: bold">Zenith Holidays Web Enquiry</span></div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="BORDER-TOP: #d0d0d0 1px solid">
                                                                        <p id="phello" runat="server" style="FONT-SIZE: 12pt">Hello  ,</p>
                                                                        <br />
                                                                        <p class="MsoNormal" style="MARGIN: 0in 0in 10pt; LINE-HEIGHT: normal">
                                                                            <span style="FONT-SIZE: 12pt; FONT-FAMILY: Segoe UI">Thank you for showing interest in our Holiday Packages. Our support team will get back to you within 1 hour with the required information.</span>
                                                                        </p>
                                                                        <br />
                                                                        <%--<span style="WHITE-SPACE:normal;TEXT-TRANSFORM:none;WORD-SPACING:0px;FLOAT:none;COLOR:rgb(34,34,34);FONT:16px 'Segoe UI',sans-serif;DISPLAY:inline!important;LETTER-SPACING:normal;BACKGROUND-COLOR:rgb(255,255,255);TEXT-INDENT:0px">We are committed to providing you a satisfactory resolution. One of our Customer Service team members will reply to your email within the next 1 hours.</span></span></span></p>--%>
                                                                        <p class="MsoNormal" style="MARGIN: 0cm 0cm 10pt; LINE-HEIGHT: normal">
                                                                            <span style="FONT-SIZE: 12pt; FONT-FAMILY: Segoe UI">We look forward to being of service to you and thank you for choosing Zenithholidays.com<br />
                                                                                <br />
                                                                                Zenith Customer Service&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mail:web@Zenithholidays.com
                                                                                <br />
                                                                                zenithholidays.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No: (+91) 8100 667733</span>
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>

