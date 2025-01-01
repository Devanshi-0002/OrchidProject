<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Country.aspx.cs" Inherits="Admin_Country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" runat="Server">
    <div class="panel-body table-responsive">
        <center><h4>Add Country/State</h4>
       <br />
         <table style="width:90%" class="table" border="1">
       <%-- <tr><td style="width:20%" ><asp:Label ID="lblhdrname" runat="server" Text="Add Domestic City"></asp:Label></td></tr>--%>
        <tr>
            <td style="width:10%" ><b>Country Name :</b></td>
            <td style="width:25%" ><asp:TextBox ID="txtcountry" runat="server"  CssClass="form-control" ></asp:TextBox></td>
            <td style="width:10%" ><b>Select Country :</b></td>
            <td style="width:25%"><asp:DropDownList ID="ddlcountry" runat="server" CssClass="form-control"></asp:DropDownList >
            
            </td>
                                     
        </tr>
            
         <tr> 
           <td colspan="2"></td>
           <td style="width:20%" ><b>State Name :</b></td>
           <td style="width:25%" ><asp:TextBox ID="txtstate" runat="server"  CssClass="form-control" ></asp:TextBox></td>    
            
        </tr>
             <tr align="right">               
              <td colspan="2"><asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-success" OnClick="btnsave_Click" ></asp:Button>
                             <asp:Button ID="btnResetcountry" runat="server" Text="Reset"  CssClass="btn btn-default" ></asp:Button>

              </td>
              <td colspan="2"><asp:Button ID="btnsavestate" runat="server" Text="Save" class="btn btn-success" OnClick="btnsavestate_Click"></asp:Button>
                              <asp:Button ID="btnResetstate" runat="server" Text="Reset"  CssClass="btn btn-default"></asp:Button>
              </td>            
             </tr>
     <%-- </ContentTemplate></asp:UpdatePanel>--%>
    </table>
          <br />
          <hr />
          
          <asp:Label ID="lblshoedetail" runat="server" Text="Show All Details" style="font-size: medium; font-weight: 700; font-style: italic" ></asp:Label>
        <asp:Panel ID="pnlupdate" runat="server" style="width:90%" class="table" border="1">
           <asp:UpdatePanel ID="upnlrommtype" runat="server"><ContentTemplate>
        <table style="width:40%" class="table" align="left">
            <tr>
                 <td>
                    <asp:GridView ID="GvDomesticDestination" runat="server" AllowSorting="True" PageSize="50" AutoGenerateColumns="False"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle" ItemStyle-Wrap="true" EmptyDataText="No Information Found..."
                     HorizontalAlign="Center" AllowPaging="True" DataKeyNames="Country_Id" DataSourceID="SqlDataSource2">
                        <Columns>
                            
                            <asp:TemplateField HeaderText="SL No.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Country_Id" HeaderText="Country_Id" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="Country_Id" />
                            <asp:BoundField DataField="Country_Name" HeaderText="Country Name" SortExpression="Country_Name" />
                        </Columns>
                        <PagerStyle CssClass="gridpagerstyle" />
                    </asp:GridView>
                 
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Country] WHERE [Country_Id] = @Country_Id" InsertCommand="INSERT INTO [tbl_Country] ([Country_Name]) VALUES (@Country_Name)" SelectCommand="SELECT [Country_Id], [Country_Name] FROM [tbl_Country]" UpdateCommand="UPDATE [tbl_Country] SET [Country_Name] = @Country_Name WHERE [Country_Id] = @Country_Id">
                         <DeleteParameters>
                             <asp:Parameter Name="Country_Id" Type="Int32" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="Country_Name" Type="String" />
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="Country_Name" Type="String" />
                             <asp:Parameter Name="Country_Id" Type="Int32" />
                         </UpdateParameters>
                     </asp:SqlDataSource>
                     <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                     </asp:EntityDataSource>
                 
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                 
                  </td>
            </tr>
        </table> 
               </ContentTemplate></asp:UpdatePanel>  
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>    
        <table style="width:40%" class="table" align="right">
            <tr>
            <td ><asp:GridView ID="gvInternationalDestination" runat="server" AllowSorting="True" AutoGenerateColumns="false" PageSize="10"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle"
                    ItemStyle-Wrap="true" EmptyDataText="No Information Found. Please make Package"
                     HorizontalAlign="Center" DataKeyNames="State_Id" DataSourceID="SqlDataSource4">
               
                <Columns>
                     <asp:TemplateField HeaderText="SL No.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="left" />
                            </asp:TemplateField>
                    <asp:BoundField DataField="State_Id" HeaderText="State_Id" InsertVisible="False" ReadOnly="True" SortExpression="State_Id" Visible="false" />
                    <asp:BoundField DataField="Country_id" HeaderText="Country_id" SortExpression="Country_id" Visible="false" />
                    <asp:BoundField DataField="State_Name" HeaderText="State Name" SortExpression="State_Name" />
                </Columns>
                <PagerStyle CssClass="gridpagerstyle" />
               
               </asp:GridView>
                 
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tbl_States] WHERE [State_Id] = @State_Id" InsertCommand="INSERT INTO [tbl_States] ([Country_id], [State_Name]) VALUES (@Country_id, @State_Name)" SelectCommand="SELECT [State_Id], [Country_id], [State_Name] FROM [tbl_States]" UpdateCommand="UPDATE [tbl_States] SET [Country_id] = @Country_id, [State_Name] = @State_Name WHERE [State_Id] = @State_Id">
                     <DeleteParameters>
                         <asp:Parameter Name="State_Id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Country_id" Type="Int32" />
                         <asp:Parameter Name="State_Name" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Country_id" Type="Int32" />
                         <asp:Parameter Name="State_Name" Type="String" />
                         <asp:Parameter Name="State_Id" Type="Int32" />
                     </UpdateParameters>
                </asp:SqlDataSource>
                 
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                 
                 </td>
             </tr>
        </table> </ContentTemplate></asp:UpdatePanel>  
       </asp:Panel>
          </center>
    </div>
</asp:Content>

