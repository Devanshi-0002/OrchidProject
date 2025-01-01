<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Destination.aspx.cs" Inherits="Admin_Destination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" runat="Server">
    <div class="panel">

        <div class="panel-body table-responsive">
            <center><h4>Add Domestic/International Destination</h4>
       <br />
         <table style="width:90%" class="table" border="1">
       <%-- <tr><td style="width:20%" ><asp:Label ID="lblhdrname" runat="server" Text="Add Domestic City"></asp:Label></td></tr>--%>
        <tr>
            <td style="width:25%" ><b>Country :</b></td>
            <td style="width:25%" ><asp:DropDownList ID="ddlcountryDomestic" runat="server" class="form-control">
                                   <asp:ListItem Value="1">India</asp:ListItem>
                                   </asp:DropDownList></td>
            <td style="width:25%" ><b>Select Country :</b></td>
            <td style="width:25%" ><asp:DropDownList ID="dllcountry" runat="server" class="form-control"></asp:DropDownList></td>
                       
        </tr>
            
         <tr> 
             <td style="width:25%" ><b>Select Domestic Regional :</b></td>
            <td style="width:25%" ><asp:DropDownList ID="ddldomestinRegional" runat="server" class="form-control">
                   <asp:ListItem Value="0">Select--</asp:ListItem>
                    <asp:ListItem Value="1">North</asp:ListItem>
                    <asp:ListItem Value="2">South</asp:ListItem>
                    <asp:ListItem Value="3">East</asp:ListItem>
                    <asp:ListItem Value="4">West</asp:ListItem>
                  </asp:DropDownList></td>
            <td style="width:25%" ><b>Select International Regional :</b></td>
            <td style="width:25%" ><asp:DropDownList ID="ddlinternationalRegional" runat="server" class="form-control">
                    <asp:ListItem Value="0">Select--</asp:ListItem>
                    <asp:ListItem Value="1">Africa & Middle East</asp:ListItem>
                    <asp:ListItem Value="2">America</asp:ListItem>
                    <asp:ListItem Value="3">Asia</asp:ListItem>
                    <asp:ListItem Value="4">Australia</asp:ListItem>
                    <asp:ListItem Value="5">New Zealand</asp:ListItem>
                    <asp:ListItem Value="6">Europe</asp:ListItem>
                  </asp:DropDownList></td>
        </tr>
        <tr>
                <td style="width:25%" ><b>Domestic City Name :</b></td>
                <td style="width:25%" ><asp:TextBox ID="txtdomesticcityname" runat="server"  CssClass="form-control" ></asp:TextBox></td>

               <td style="width:25%" ><b>International City Name :</b></td>
            
               <td style="width:25%" ><asp:TextBox ID="txtInternationalCityname" runat="server"  CssClass="form-control" ></asp:TextBox></td>  
              
       </tr>

             <tr>
                <td style="width:25%" ><b>Domestic City Image 1 :</b></td>
                <td style="width:25%" >
                    <asp:FileUpload ID="Domestic_Cityimage1" runat="server" />
                </td>

               <td style="width:25%" ><b>International City Image 1 :</b></td>
            
               <td style="width:25%" ><asp:FileUpload ID="International_Cityimage1" runat="server" /></td>  
              
       </tr>
              <tr>
                <td style="width:25%" ><b>Domestic City Image 2 :</b></td>
                <td style="width:25%" >
                    <asp:FileUpload ID="Domestic_Cityimage2" runat="server" />
                </td>

               <td style="width:25%" ><b>International City Image 2 :</b></td>
            
               <td style="width:25%" ><asp:FileUpload ID="International_Cityimage2" runat="server" /></td>  
              
       </tr>
             <tr>
                <td style="width:25%" ><b>Domestic City Image 3 :</b></td>
                <td style="width:25%" >
                    <asp:FileUpload ID="Domestic_Cityimage3" runat="server" />
                </td>

               <td style="width:25%" ><b>International City Image 3 :</b></td>
            
               <td style="width:25%" ><asp:FileUpload ID="International_Cityimage3" runat="server" /></td>  
              
       </tr>
        <tr>     
                <td colspan="2" colspan="2" align="right"><asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-success" OnClick="btnsave_Click"></asp:Button>
                                <asp:Button ID="Button1" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="Button1_Click"></asp:Button></td>    
                 <td colspan="2" align="right"><asp:Button ID="btnBoarding_placesave" runat="server" Text="Save" class="btn btn-success" OnClick="btnBoarding_placesave_Click" ></asp:Button>
                                   <asp:Button ID="btnResetinternational" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="btnResetinternational_Click"></asp:Button>
                 </td>
             
             </tr>
     <%-- </ContentTemplate></asp:UpdatePanel>--%>
    </table>
          <br />
          <hr />
          <asp:Label ID="lblshoedetail" runat="server" Text="Show All Details" style="font-size: medium; font-weight: 700; font-style: italic" ></asp:Label>
        <asp:Panel ID="pnlupdate" runat="server" style="width:90%" class="table" border="1">
           <asp:UpdatePanel ID="upnlrommtype" runat="server"><ContentTemplate>
        <table style="width:45%" class="table" align="left">
            <tr>
                 <td>
                    <asp:GridView ID="GvDomesticDestination" runat="server" AllowSorting="false" AutoGenerateColumns="False"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle" ItemStyle-Wrap="true" EmptyDataText="No Information Found..."
                     HorizontalAlign="Center" DataKeyNames="Domestic_Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Domestic_Id" HeaderText="Sl. No" InsertVisible="False" ReadOnly="True" SortExpression="Domestic_Id" />
                            <asp:BoundField DataField="Domestic_Name" HeaderText="Domestic Name" SortExpression="Domestic_Name" />
                            <asp:CommandField />
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                       </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Domestic_Id], [Domestic_Name] FROM [tbl_Domestic] ORDER BY [Domestic_Id]"></asp:SqlDataSource>
                  </td>
            </tr>
        </table> 
               </ContentTemplate></asp:UpdatePanel>  
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>    
        <table style="width:45%" class="table" align="right">
            <tr>
            <td ><asp:GridView ID="gvInternationalDestination" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle"
                    ItemStyle-Wrap="true" EmptyDataText="No Information Found. Please make Package"
                     HorizontalAlign="Center" DataKeyNames="International_Id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="International_Id" HeaderText="Sl. No" InsertVisible="False" ReadOnly="True" SortExpression="International_Id" />
                    <asp:BoundField DataField="International_Name" HeaderText="International Name" SortExpression="International_Name" />
                    <asp:CommandField />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <PagerStyle CssClass="gridpagerstyle" />
               </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [International_Id], [International_Name] FROM [tbl_International] ORDER BY [International_Id]"></asp:SqlDataSource>
                 </td>
             </tr>
        </table> </ContentTemplate></asp:UpdatePanel>  
       </asp:Panel>
          </center>
        </div>
    </div>
</asp:Content>

