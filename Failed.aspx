<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Failed.aspx.cs" Inherits="Failed" MasterPageFile="/InnerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div class="container-fluid pl-0 pr-0">
        <div class="row">
            <div class="mini-search-row">
                <div class="container" style="text-align: center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <h1 style="color: red">Your payment has failed</h1>
                    <br />
                   <h3 style="color: white">Please try again !</h3> 
                            <a href="default.aspx" style="color:greenyellow">Click Here</a>
                    <br />
                    <asp:TextBox ID="txt_transectionid" Visible="false" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="txt_status" runat="server" Visible="false"></asp:TextBox><br />
                    <asp:TextBox ID="txt_amount" runat="server" Visible="false"></asp:TextBox><br />
                    <asp:TextBox ID="txt_net_amount_debit" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txt_name" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txt_email" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txt_mobile" runat="server" Visible="false"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
