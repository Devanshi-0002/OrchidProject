<%@ Page Language="C#" AutoEventWireup="true" CodeFile="success.aspx.cs" Inherits="success" MasterPageFile="/InnerMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div class="container-fluid pl-0 pr-0">
        <div class="row">
            <div class="mini-search-row">
                <div class="container" style="text-align: center">
                    <%-- <div class="row">
                        <img src="Image/Payment-Received.jpg">
                        <br />
                        <br />
                        <br />
                    </div>--%><br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <h1 style="color: white">Thank you,</h1>
                    <h4 style="color: #3ef93e">Your Payment has been Successfully Received</h4>
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

