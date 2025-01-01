<%@ Page Title="" Language="C#" MasterPageFile="/InnerMasterPage.Master" AutoEventWireup="true" CodeFile="payment-failed.aspx.cs" Inherits="payment_failed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div class="container-fluid pl-0 pr-0">
        <div class="row">
            <section class="w-100">
                <center>
                    <br /><br /><br />
                    <div class="thankyoupage ml-auto mr-auto">
                        <i class="fa fa-exclamation-triangle fa-4x text-danger mb-3" aria-hidden="true"></i>
                        <br /><br /><br />
                        <h2 style="color:red">Your transaction is failed !</h2>
                        <br />
                        <h2 style="color:red">Network unavailable, please try again...</h2>
                        <br /><br /><br /><br /><br /><br /><br />
                    </div>
                        </center>
            </section>
        </div>
    </div>
</asp:Content>

