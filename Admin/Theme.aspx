<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Theme.aspx.cs" Inherits="Admin_Theme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" Runat="Server">
    <div class="panel">

    <div class="panel-body table-responsive">
      <center><h4>Add New Theme</h4>
          <br />
         <table style="width:50%" class="table" border="1">
        <tr>
            <td  style="width:20%" ><b>Theme</b></td>
            <td style="width:25%" ><asp:TextBox ID="txttheme" runat="server"  CssClass="form-control" ></asp:TextBox></td>          
        </tr>
             <%-- <asp:UpdatePanel ID="upnl" runat="server" ><ContentTemplate>--%>
         <tr id="trsave" runat="server" align="right"> 
             
             <td colspan="2" style="width:40%" ><asp:Button ID="btnsavetheme" runat="server" Text="Save" class="btn btn-success" OnClick="btnsavetheme_Click"></asp:Button>
                  
             <asp:Button ID="btnreset" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="btnreset_Click"></asp:Button></td>
        </tr>
     <%-- </ContentTemplate></asp:UpdatePanel>--%>
    </table>
          <br />
          <hr />
          <asp:Label ID="lblshoedetail" runat="server" Text="Show All Details" style="font-size: medium; font-weight: 700; font-style: italic" ></asp:Label>
          <asp:Panel ID="pnlupdate" runat="server" style="width:50%">
           <asp:UpdatePanel ID="upnltheam" runat="server"><ContentTemplate>
        <table style="width:100%" align="left">
            <tr>
                 <td>
                    <asp:GridView ID="GvroomType" runat="server" AllowSorting="True" AutoGenerateColumns="False" PageSize="20"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle" ItemStyle-Wrap="true" EmptyDataText="No Information Found..."
                     HorizontalAlign="Center" AllowPaging="True" DataKeyNames="Theme_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:TemplateField HeaderText="SL No.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Theme_id" HeaderText="Sl. No" InsertVisible="False" ReadOnly="True" SortExpression="Theme_id" Visible="false" />
                            <asp:BoundField DataField="Theme_type" HeaderText="Theme Type" SortExpression="Theme_type" />
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                        <PagerStyle CssClass="gridpagerstyle" />
                    </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Theme_id], [Theme_type] FROM [tbl_Pkg_Theme] ORDER BY [Theme_id]"></asp:SqlDataSource>
                  </td>
            </tr>
        </table> 
               </ContentTemplate></asp:UpdatePanel>  
              </asp:Panel>
      </center> 
    </div>
    </div>
</asp:Content>

