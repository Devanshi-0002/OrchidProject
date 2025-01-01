<%@ Page Title="" Language="C#" MasterPageFile="~/blog/BlogMaster.master" AutoEventWireup="true" CodeFile="Categorydetails.aspx.cs" Inherits="Categorydetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="sorry" runat="server" visible="false" style="color: red; text-align: center; height: 500px;">
        <br />
        <br />
        <br />
        <h1>&#9785 SORRY NO MATCHING FOUND &#9785 </h1>
    </div>
    <br />
    <br />
    <br />

    <div class="container">
        <asp:Repeater ID="rep1" runat="server" OnItemCommand="rep1_ItemCommand">
            <ItemTemplate>
                <div class="col-md-3">
                    <div class="category-box hover01 column">
                        <figure>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("bgImg") %>' CssClass="img-responsive" /></figure>
                        <div class="category-text-area">
                            <div class="col-md-4">
                                <span class="category-calender"><i class="fa fa-calendar" aria-hidden="true"></i>
                                    <asp:Label ID="postdate" runat="server" Text='<%#Eval("postDate") %>'></asp:Label></span>
                            </div>
                            <div class="col-md-8">
                                <span class="category-user"><i class="fa fa-user" aria-hidden="true"></i>
                                    <asp:Label ID="postedby" runat="server" Text='<%#Eval("authorName") %>'></asp:Label>
                                </span>
                            </div>
                        </div>
                        <div class="category-headline">
                            <p>  <asp:Label ID="headline" runat="server" Text='<%#Eval("headline")%>'></asp:Label> </p>
                            <asp:Label ID="bno" runat="server" Text='<%#Eval("blogNo") %>' Visible="false"></asp:Label>
                        </div>
                 <%--<asp:HyperLink ID="HyperLink1" runat="server" CssClass="category-readmore-botton" CommandName="readmore" href='<%# GetRouteUrl("RouteForArticle", new {id = Eval("blogNo"), Title= GetTitle(Eval("headline"))})%>' Text="Read More ..">  </asp:HyperLink>--%>

                        <asp:Button ID="Button1" runat="server" CssClass="category-readmore-botton" Text="Read More .." CommandName="readmore" />
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

