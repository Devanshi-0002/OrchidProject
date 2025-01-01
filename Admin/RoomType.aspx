<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="RoomType.aspx.cs" Inherits="Admin_RoomType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" runat="Server">
    <div class="panel">

        <div class="panel-body table-responsive">
            <center><h4>Add Room Type And Boarding Place</h4>
        <br /><br />
         <table style="width:70%" class="table" border="1">
        <tr>
            <td style="width:20% ;display:none"><b>Room Type Name :</b></td>
            <td style="width:25% ;display:none" ><asp:TextBox ID="txtroomname" runat="server"  CssClass="form-control" ></asp:TextBox></td>
            <td style="width:10%" rowspan="2" ></td>
            <td style="width:20%" ><b>Boarding Place :</b></td>
            <td style="width:25%" ><asp:TextBox ID="txtBoarding_place" runat="server" CssClass="form-control" ></asp:TextBox></td>
                       
        </tr>
             <%-- <asp:UpdatePanel ID="upnl" runat="server" ><ContentTemplate>--%>
         <tr id="trsave" runat="server" align="right"> 
             
             <td colspan="2" style="width:40%;display:none" ><asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-success" OnClick="btnsave_Click"></asp:Button>
                  
             <asp:Button ID="btnreset" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="btnreset_Click"></asp:Button></td>
             

            <td colspan="2" style="width:40%" ><asp:Button ID="btnBoarding_placesave" runat="server" Text="Save" class="btn btn-success" OnClick="btnBoarding_placesave_Click"></asp:Button>
               <asp:Button ID="btnBoarding_placereset" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="btnBoarding_placereset_Click"></asp:Button></td>
        </tr>

             <%-- </ContentTemplate></asp:UpdatePanel>--%>
    </table></center>
        </div>
    </div>
    <br />

    <center>  <hr />
           <asp:Label ID="lblshoedetail" runat="server" Text="Show All Boarding/HUB Details" style="font-size: medium; font-weight: 700; font-style: italic" ></asp:Label>
          
       <%--<h6>Update</h6>--%>
       <asp:Panel ID="pnlupdate" runat="server" style="width:70%">
           <asp:UpdatePanel ID="upnlrommtype" runat="server"><ContentTemplate>
        <table style="width:40% ;display:none" align="left" >
            <tr>
                 <td>
                    <asp:GridView ID="GvroomType" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle" ItemStyle-Wrap="true" EmptyDataText="No Information Found..."
                     HorizontalAlign="Center" AllowPaging="True" DataKeyNames="Room_id" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="Room_id" HeaderText="Sl. No" InsertVisible="False" ReadOnly="True" SortExpression="Room_id" />
                            <asp:BoundField DataField="Room_type" HeaderText="Room Type" SortExpression="Room_type" />
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                       
                        <PagerStyle CssClass="gridpagerstyle" />
                    </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Room_id], [Room_type] FROM [tbl_Room_type] ORDER BY [Room_id]"></asp:SqlDataSource>
                  </td>
            </tr>
        </table> 
               </ContentTemplate></asp:UpdatePanel>  
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>    
        <table style="width:70%" align="left">
            <tr>
            <td ><asp:GridView ID="gvbordingpoint" runat="server" AllowSorting="True" AutoGenerateColumns="False" Visible="true"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle"
                    ItemStyle-Wrap="true" EmptyDataText="No Information Found. Please make Package"
                     HorizontalAlign="Center" DataKeyNames="Boarding_id" DataSourceID="SqlDataSource1">
                <Columns>
                    
                    <asp:BoundField DataField="Boarding_id" HeaderText="Sl No." InsertVisible="False" ReadOnly="True" SortExpression="Boarding_id" />
                    <asp:BoundField DataField="Boarding_place" HeaderText="Boarding Place" SortExpression="Boarding_place" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
               
                <PagerStyle CssClass="gridpagerstyle" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tbl_boarding_pt] WHERE [Boarding_id] = @original_Boarding_id AND (([Boarding_place] = @original_Boarding_place) OR ([Boarding_place] IS NULL AND @original_Boarding_place IS NULL))" InsertCommand="INSERT INTO [tbl_boarding_pt] ([Boarding_place]) VALUES (@Boarding_place)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Boarding_id], [Boarding_place] FROM [tbl_boarding_pt]" UpdateCommand="UPDATE [tbl_boarding_pt] SET [Boarding_place] = @Boarding_place WHERE [Boarding_id] = @original_Boarding_id AND (([Boarding_place] = @original_Boarding_place) OR ([Boarding_place] IS NULL AND @original_Boarding_place IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Boarding_id" Type="Int32" />
                        <asp:Parameter Name="original_Boarding_place" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Boarding_place" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Boarding_place" Type="String" />
                        <asp:Parameter Name="original_Boarding_id" Type="Int32" />
                        <asp:Parameter Name="original_Boarding_place" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                 </td>
             </tr>
        </table> </ContentTemplate></asp:UpdatePanel>  
       </asp:Panel> 
     </center>
</asp:Content>

