<%@ Page Title="" Language="C#" MasterPageFile="~/blog/BlogMaster.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container errorpage-area">
        <div class="row">
            <div id="sorry" runat="server"  style="color: red; text-align: center; height: 500px;">
        <br />
        <br />
        <br />
                <span style="font-size:160px;">&#9785</span>
        <h1> WE ARE SORRY NO MATCHING FOUND </h1>
       <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server"><span class="btn-success btn"> Click here to return<br /> <span style=" text-align:center; font-size:36px;margin:-5px;">&#9786</span></span></asp:LinkButton>
    </div>
    <br />
    <br />
    <br />
        </div>
    </div>
</asp:Content>

