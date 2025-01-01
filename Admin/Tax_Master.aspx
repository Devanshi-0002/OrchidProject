<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Tax_Master.aspx.cs" Inherits="Admin_Tax_Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPHMainContent" Runat="Server">
<div class="panel">
    <div class="panel-body table-responsive">
      <center><h4>Add Tax Value</h4>
       <br />
       <table style="width:40%" class="table" border="1">
        <tr> 
            <td style="width:20%" ><b>Tax Percentage :</b></td>
            <td style="width:25%" ><asp:TextBox ID="txt_taxPercentage" runat="server"  CssClass="form-control" ></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="ftrtxt_taxPercentage" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="txt_taxPercentage" /> 
            </td>
           
        </tr>
             <tr align="right">
              <td colspan="2"><asp:Button ID="btnsavetax" runat="server" Text="Save" class="btn btn-success" OnClick="btnsavetax_Click"></asp:Button>
                  <asp:Button ID="btnclear" runat="server" Text="Reset"  CssClass="btn btn-default" OnClick="btnclear_Click"></asp:Button></td>
             </tr>
     <%-- </ContentTemplate></asp:UpdatePanel>--%>
    </table>
          <br />
          <hr />
          <asp:Label ID="lblshoedetail" runat="server" Text="Show Tax Details" style="font-size: medium; font-weight: 700; font-style: italic" ></asp:Label>
          <asp:Panel ID="pnlupdate" runat="server" style="width:60%">
           <asp:UpdatePanel ID="upnltheam" runat="server"><ContentTemplate>
            <table style="width:100%" align="left">
            <tr>
               <td>
                 <asp:GridView ID="Gvtax" runat="server" AllowSorting="True" AutoGenerateColumns="False" Font-Size="10"
                    Width="100%" PagerStyle-CssClass="gridpagerstyle" ItemStyle-Wrap="true" EmptyDataText="No Information Found..."
                     HorizontalAlign="Center" AllowPaging="True" DataKeyNames="Taxid" DataSourceID="SqlDataSource1">
                       
                        <Columns>
                            <asp:BoundField DataField="Taxid" HeaderText="Sl. No" InsertVisible="False" ReadOnly="True" SortExpression="Taxid" />
                            <asp:BoundField DataField="Taxvalue" HeaderText="Tax value" SortExpression="Taxvalue" />
                            <asp:BoundField DataField="Createdby" HeaderText="Created By" SortExpression="Createdby" ReadOnly="True" />
                            <asp:BoundField DataField="Createddate" HeaderText="Created Date" SortExpression="Createddate" ReadOnly="True" />
                            <asp:BoundField DataField="Updatedby" HeaderText="Updated By" SortExpression="Updatedby" ReadOnly="True" />
                            <asp:BoundField DataField="Lastupdatetime" HeaderText="Last update time" SortExpression="Lastupdatetime" ReadOnly="True" />
                            <asp:CommandField />
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                        <PagerStyle CssClass="gridpagerstyle" />
                    </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Taxid], [Taxvalue], [Createdby], [Createddate], [Updatedby], [Lastupdatetime] FROM [tbl_TaxMaster] ORDER BY [Taxid]"></asp:SqlDataSource>
               </td>
            </tr>
        </table> 
            </ContentTemplate></asp:UpdatePanel>  
          </asp:Panel>
         </center> 
    </div>
</div>
</asp:Content>

