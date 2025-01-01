<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="PackageCost.aspx.cs" Inherits="Admin_PackageCost" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"></script>
    <%--<link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />--%>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" runat="Server">
    <style type="text/css">
        .panel {
            margin-bottom: 20px;
        }

        .panel-body {
            padding: 15px;
        }

        .table1 {
            height: 280px;
        }

        .tbody {
            height: 290px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
    </style>
    <style>
        .inner_content {
            padding: 5px;
        }
    </style>
   
    <div class="panel">
        <br />
        <table style="width: 90%; background-color: yellow" class="table" align="center" border="0">

            <tr align="center">
                <td colspan="4">
                    <b style="font-size: 16px">Select Package Name & Add Package Cost</b><asp:DropDownList ID="ddlPackagetype" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlPackagetype_SelectedIndexChanged"></asp:DropDownList>

                </td>
            </tr>
        </table>

        <asp:Repeater ID="rep_pkgCost" runat="server">
            <ItemTemplate>
                <div class="panel-body table-responsive">
                    <center>
               
               <%-- <asp:UpdatePanel ID="upnlcost" runat="server">
                    <ContentTemplate>--%>
               
                                        <%--<td id="pkgcode" runat="server" style="width: 10%" align="left"><b>Package Code</b></td>
                                        <td style="width: 15%; background-color: rgba(128, 128, 128, 0.19)">
                                            <asp:Label ID="lblpkgcode" runat="server"></asp:Label></td>--%>
                                    <%--</tr>--%>
                        <table style="width: 90%" class="table" align="center" border="1">
                          
                                    <tr align="right">
                                        <td colspan="4">
                                            <asp:Label ID="Label1" runat="server" Text="Please enter all cost in INR" Style="font-size: small; font-weight: 600; color: red"></asp:Label></td>
                                    </tr>
                                                             
                               <tr runat="server">
                                <%-- <td style="width: 10%"><b>Select Boarding Point</b></td>
                                <td style="width: 15%">
                                    <asp:DropDownList ID="ddlbordingpoint" runat="server" class="form-control"></asp:DropDownList></td>--%>
                                <td style="width: 10%" align="left"><b>Departure  Date</b></td>
                                <td style="width: 15%">
                                    <asp:Label ID="lbl_DepartureDate" runat="server" Text='<%# Eval("Departure_Date") %>'  class="form-control" ></asp:Label>

                                    <asp:Label ID="lblpkgid" runat="server" Text='<%# Eval("pkg_id") %>' Visible="false"></asp:Label>

                                   <%-- <span style="color:green; font-style:initial">Add Departure Date eg: 10/08/2018,15/08/2018,20/08/2018</span>--%>
                                    <%--<asp:FilteredTextBoxExtender ID="ftbtxtDepartureDate" runat="server" TargetControlID="txt_DepartureDate" FilterType="Numbers, Custom" ValidChars='.,/-'></asp:FilteredTextBoxExtender>--%>
                                   <%-- <asp:CalendarExtender ID="CalendarExtendertxtDepartureDate" runat="server" Format="dd/MM/yyyy" CssClass="CSajax__calendar" TargetControlID="txt_DepartureDate" />--%>
                                    <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txt_DepartureDate" ForeColor="Red" ValidationGroup="savepkgcost" ErrorMessage="* Please enter Departure  Date!" />--%>
                                    <span id="lblDepartureDate_Check" runat="server" Visible="false"></span>
                                </td>
                                 <td style="width: 10%" align="left"><b>HUB</b></td>
                                <td style="width: 15%">
                                    <asp:Label ID="lblHUB" runat="server" Text='<%# Eval("HUB_StartingFrom") %>' class="form-control" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 10%" align="left"><b>Hotel Twin Room Cost</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_TwinRoomCost" runat="server" Text='<%# Eval("TwinRoom_Cost") %>' CssClass="form-control"></asp:TextBox></td>
                                <td style="width: 10%"><b>Hotel Triple Room Cost</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_TripleRoomCost" runat="server" Text='<%# Eval("TripleRoom_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_TripleRoomCost" />
                            </tr>

                            <tr>
                                <td style="width: 10%" align="left"><b>Hotel Single Room Cost</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_SingleRoomCost" runat="server" Text='<%# Eval("SingleRoom_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="ftetxtcredit" runat="server"  FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_SingleRoomCost" />
                                <asp:RequiredFieldValidator runat="server" ID="reqPackageCode" ControlToValidate="txt_SingleRoomCost" ForeColor="Red" ValidationGroup="savepkgcost" ErrorMessage="* Please enter Single Room Cost!" />

                                <td style="width: 10%" align="left"><b>Child With Bed Cost </b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtChild_WBed_Cost" runat="server" Text='<%# Eval("Child_WBed_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="ftxtxtChild_WBed_Cost" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txtChild_WBed_Cost" />

                            </tr>
                            <tr>
                                <td style="width: 10%" align="left"><b>Child Without Bed Cost </b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txtChild_WOBed_Cost" runat="server" Text='<%# Eval("Child_WOBed_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="ftxtxtChild_WOBed_Cost" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txtChild_WOBed_Cost" />

                                <td style="width: 10%" align="left"><b>INF Cost </b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_INFcost" runat="server" Text='<%# Eval("INF_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="ftxtxtExtrabed_Cost" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_INFcost" />
                            </tr>
                            
                            <tr>
                                <td style="width: 10%" align="left"><b>Visa Cost</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_VisaCost" runat="server" Text='<%# Eval("Visa_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_VisaCost" />

                                <td style="width: 10%" align="left"><b>Airfare Cost</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_AirfareCost" runat="server" Text='<%# Eval("Airfare_Cost") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_AirfareCost" />
                            </tr>
                            <tr>
                                <td style="width: 10%" align="left"><b>Auto SP % 1</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_AutoSP1" runat="server" Text='<%# Eval("AutoSP1") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_AutoSP1" />

                                <td style="width: 10%" align="left"><b>Auto SP Allocation 1</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_SPAllocation1" runat="server" Text='<%# Eval("AutoSPAllocation1") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_SPAllocation1" />
                            </tr>
                            <tr>
                                <td style="width: 10%" align="left"><b>Auto SP % 2</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_AutoSP2" runat="server" Text='<%# Eval("AutoSP2") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_AutoSP2" />

                                <td style="width: 10%" align="left"><b>Auto SP Allocation 2</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_SPAllocation2" runat="server" Text='<%# Eval("AutoSPAllocation2") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_SPAllocation2" />
                            </tr>

                            <tr>
                                <td style="width: 10%" align="left"><b>Auto SP % 3</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_AutoSP3" runat="server" Text='<%# Eval("AutoSP3") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_SPAllocation3" />
                                <td style="width: 10%" align="left"><b>Auto SP Allocation 3</b></td>
                                <td style="width: 15%">
                                    <asp:TextBox ID="txt_SPAllocation3" runat="server" Text='<%# Eval("AutoSPAllocation3") %>'  CssClass="form-control"></asp:TextBox></td>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_SPAllocation3" />
                            </tr>
                         
                           
                        </table>
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </center>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Panel ID="pnl_save" runat="server" Visible="false" Style="float: right">

            <asp:Button ID="btnsavecost" runat="server" Text="Save" class="btn btn-success" ValidationGroup="savepkgcost" OnClick="btnsavecost_Click"></asp:Button>&nbsp;&nbsp;
                                    <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-default" OnClick="btnreset_Click"></asp:Button>
        </asp:Panel>
        <br />
        <table style="width: 90%;" class="table" align="center" border="0">
            <tr align="left">
                <td colspan="4">
                    <b style="font-size: 16px">All Packages Cost Details :</b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GV_Costdetails" runat="server" AllowSorting="True" PageSize="20" AutoGenerateColumns="False" Width="90%"
            CssClass="table-responsive" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Both">
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle Width="2%" HorizontalAlign="left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Package Name" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblmenuid" runat="server" Text='<%# Eval("Pkg_name") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="40%" HorizontalAlign="left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="TwinRoom_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblmenuid" runat="server" Text='<%# Eval("TwinRoom_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="TripleRoom_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPkg_name" runat="server" Text='<%# Eval("TripleRoom_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="SingleRoom_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPkg_code" runat="server" Text='<%# Eval("SingleRoom_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Child_WBed_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPkg_duration" runat="server" Text='<%# Eval("Child_WBed_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Child_WOBed_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPkg_details" runat="server" Text='<%# Eval("Child_WOBed_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="INF Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblPkg_Itineray" runat="server" Text='<%# Eval("INF_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Visa_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("Visa_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Airfare_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("Airfare_Cost") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AutoSP % 1" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP1") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="AutoSP % 2 " HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP2") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AutoSP % 3 " HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP3") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pkg_Cost" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("totalTwin") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle Width="5%" HorizontalAlign="right" />
                </asp:TemplateField>

                <%-- <asp:TemplateField HeaderText="AutoSP1" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="AutoSPAllocation1" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSPAllocation1") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="AutoSP2" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP2") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AutoSPAllocation2" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSPAllocation2") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="AutoSP3" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSP3") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AutoSPAllocation3" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblTerms_Condtition" runat="server" Text='<%# Eval("AutoSPAllocation3") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Left" />
                </asp:TemplateField>--%>
            </Columns>

            <%--<FooterStyle CssClass="gridfooterstyle"></FooterStyle>--%>
            <%-- <FooterStyle BackColor="#CCCCCC" />--%>
            <HeaderStyle Height="25px" BackColor="#0066cc" ForeColor="White" Font-Bold="True" />
            <%-- <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />--%>
        </asp:GridView>
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>

