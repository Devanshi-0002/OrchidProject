<%@ Page Title="" Language="C#" MasterPageFile="~/blog/BlogMaster.master" AutoEventWireup="true" CodeFile="Blogdetails.aspx.cs" Inherits="Blogdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .author-details a {
            color:#fff !important;
        }
        .author-details p {
            margin:10px 0 !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>

    </script>
    <section class="innerpage-body">
        <div id="sorry" runat="server" visible="false" style="color: red; text-align: center; height: 300px;">
            <br />
            <br />
            <br />
            <h1>&#9785 SORRY NO MATCHING FOUND &#9785 </h1>
        </div>
        <div ID="blankpage" runat="server">
        <asp:Repeater ID="DataList1" runat="server">
            <ItemTemplate>
                <div class="innerpage-bg-image">
                    <div class="innerpage-headline">

                        <h3><i class="fa fa-tags" aria-hidden="true"></i><span><%#Eval("category")%></span> </h3>
                        <h1 id="headline" runat="server" class="text-center"><%#Eval("headline") %></h1>
                    </div>
                    <%--<img src="img/8.jpg" alt="" class="img-responsive"/>--%>
                    <asp:Image ID="Image1" runat="server" CssClass="img-responsive post-bg-image" ImageUrl='<%#Eval("bgImg") %>' />
                    <div class="author-details">
                        <%--<img src="img/icon.jpg" alt=""/>--%>
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("authorImg") %>' />
                        <%--<h3 id="authorname" runat="server"> </h3>--%>
                        <h3><%#Eval("authorName") %>(<%#Eval("authortype") %>)</h3>
                        <p>
                            <span id="postdate" runat="server"><%#Eval("postDate") %> </span>| share : 
                            <a href="javascript:fbshareCurrentPage()" target="_blank" alt="Share on Facebook"><i class="fa fa-facebook-square fa-lg" aria-hidden="true"></i></a>
                            <a class="tweet" href="javascript:tweetCurrentPage()" target="_blank" alt="Tweet this page"><i class="fa fa-twitter-square fa-lg" aria-hidden="true"></i></a>

                            <%--<g:plus action="share"></g:plus>--%>
                            <a href="javascript:(
                              function(){
                              var w=480;var h=380;
                              var x=Number((window.screen.width-w)/2);
                              var y=Number((window.screen.height-h)/2);
                              window.open('https://plus.google.com/share?url='+encodeURIComponent(location.href)+'
                                &title='+encodeURIComponent(document.title),'','width='+w+',height='+h+',left='+x+',top='+y    +',
                                scrollbars=no');
                              })();">
                            <i class="fa fa-google-plus google" aria-hidden="true"></i>
                        </a>
                        </p>
                    </div>

                </div>
                <div class="container">
                    <div class="col-lg-8">
                        <div class="post-area">
                            <blockquote>
                                <span id="summery" runat="server"><%#Eval("postSummery") %> </span>
                            </blockquote>
                            <p id="postcontent" runat="server"><%#Eval("postContent") %> </p>
                            <hr />
                            <div class="post-tag">
                                <p>Tag Area:</p>
                                <%--<asp:LinkButton ID="tag1" runat="server"><%# Eval("tagArea")%></asp:LinkButton>--%>
                                 <asp:Label ID="Label1" runat="server" ><%# Eval("tagArea")%></asp:Label>
                                <%--<a id="tagarea" runat="server"><%#Eval("tagArea")%> </a>--%>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
            <br />
        <div class="col-lg-4 ">
          <%--  <div class="sidebar-area sidebar-subscribe-area">
                <h4 class="text-center">NEWSLETTER</h4>
                <div class="col-md-8 left-side-subscribe">
                    <span>Subscribe Us</span>
                    <p>Subscribe to our mailing list to get the updates to your inbox.</p>
                </div>
                <div class="col-md-4">
                    <i class="fa fa-envelope-o fa-4x subscribe-icon" aria-hidden="true"></i>
                </div>
                <div class="col-md-12">
                    <div class="subscribe-email-area">
                        <input type="email" name="" class="form-control subscribe-email-input-area" placeholder="Your Email ID" value="" />
                        <a href="#" class="subscribe-button">Go</a>
                    </div>
                </div>
            </div>--%>
            <div class="sidebar-area" style="display:none;">
                <h4 class="text-center">Best Packages</h4>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <!-- <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  </ol> -->

                    <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/Switzerland1.jpg" />
                            <%--<img src="img/1.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                              <asp:Image ID="Image2" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/AUSTRALIA1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image3" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/Berlin1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image4" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/Europe1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image5" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/Langkawi1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image6" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/Maldives1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image7" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/NEWZEALAND1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image8" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/SINGAPORE1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
			<div class="item">
                              <asp:Image ID="Image9" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/SouthAfrica1.jpg" />
                            <%--<img src="img/3.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                              <asp:Image ID="Image10" runat="server" CssClass="img-responsive post-bg-image" ImageUrl="img/SPAIN1.jpg" />
                            <%--<img src="img/5.jpg" alt="..." class="img-responsive" />--%>
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="sidebar-area recent-post">
                <h4 class="text-center">Recent Post</h4>
                <asp:Repeater ID="rep_rp" runat="server" OnItemCommand="rep_rp_ItemCommand">
                    <ItemTemplate>
                        <div class="row single-recent-post">

                            <div class="col-md-3 col-sm-3 col-xs-3">
                                 <asp:Image ID="Image5" runat="server" CssClass="img-responsive"  style="width:50px;height:50px;" ImageUrl='<%#Eval("authorImg") %>' />
                                <%--<img src='<%#Eval("authorImg") %>' alt="" class="img-responsive" style="width:50px;height:50px;" />--%>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 left-clear-padding">
                                <span><i class="fa fa-calendar" aria-hidden="true"></i> <%#Eval("postDate") %> </span>
                                <asp:LinkButton ID="LinkButton1" runat="server">
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("headline") %>'></asp:Label> </asp:LinkButton></a>
                <asp:Label ID="lbl_blgNO" runat="server" Visible="false" Text='<%#Eval("blogNo") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%--   <div class="row single-recent-post">
          <div class="col-md-4">
            <img src="img/icon.jpg" alt="" class="img-responsive recent-post-image"/>
          </div>
          <div class="col-md-8 left-clear-padding">
            <span>19 May 2017</span>
            <a href="#">A Road Trip To The Surreal Landscapes Of Tawang In Arunachal Pradesh!</a>
          </div>
        </div>
        <div class="row single-recent-post">
        <div class="col-md-4">
          <img src="img/icon.jpg" alt="" class="img-responsive recent-post-image"/>
        </div>
        <div class="col-md-8 left-clear-padding">
          <span>19 May 2017</span>
          <a href="#">A Road Trip To The Surreal Landscapes Of Tawang In Arunachal Pradesh!</a>
        </div>
      </div>--%>
            </div>
            <div class="sidebar-area">
                <h4 class="text-center">Category</h4>
                <asp:Repeater ID="rep_cat" runat="server" OnItemCommand="rep_cat_ItemCommand">
                    <ItemTemplate>
                        <div class="category-area">
                            <asp:LinkButton ID="LinkButton2" CssClass="category-style" runat="server" Text='<%#Eval("category") %>' CommandArgument='<%#Eval("category") %>'></asp:LinkButton>
                            <span><%#Eval("number") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%-- <div class="category-area category-area1">
            <a href="#" class="">Business <span>10</span></a>
          </div>
          <div class="category-area category-area2">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>
          <div class="category-area category-area3">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>
          <div class="category-area category-area4">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>
          <div class="category-area category-area5">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>
          <div class="category-area category-area6">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>
          <div class="category-area category-area7">
            <a href="#" class="category-style">Business <span>10</span></a>
          </div>--%>
            </div>
           <%-- <div class="sidebar-area">
                <h4 class="text-center">Tags Cloud</h4>
                <div class="post-tag">
                    <a>Travel</a>
                    <a>Tour</a>
                    <a>Destinations</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                    <a>Travel</a>
                </div>
            </div>--%>
           <%-- <div class="sidebar-area">
                <h4 class="text-center">Advertisement</h4>
                <a href="http://www.zenithholidays.com/">
                    <img src="http://placehold.it/300/002d4e/ffffff?text=Advertisement" /></a>
            </div>--%>
        </div>
        </div>
        <!-- End Container (Don't Remove it) -->
       

        <div class="container-fluid" style="background:#f2f2f2;">

            <div class="col-xs-12 related-post">
                <h1 class="headline-post"><i class="fa fa-lightbulb-o latest-news-icon" aria-hidden="true"></i>Related Post</h1>
                <div class="carousel slide" id="myCarousel">
                    <div class="carousel-inner">
                        <div class="item active">
                            <ul class="thumbnails">
                                
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>
                                                <li class="col-sm-3">
                                    <div class="fff">
                                                <div class="thumbnail">
                                                    <a href="#">
                                                         <asp:Image ID="Image1" runat="server"  style="height:170px; width:100%;" alt="" ImageUrl='<%#Eval("bgImg") %>' />
                                                        <%--<img src='<%#Eval("bgImg")%>' style="height:170px; width:100%;" alt="" />--%></a>
                                                    <div class="caption">
                                                         <div class="col-lg-4 clear-padding">
                                                        <span class="caption-date"><i class="fa fa-calendar" aria-hidden="true"></i>
                                                            <asp:Label ID="postdate" runat="server" Text='<%#Eval("postDate") %>'></asp:Label></span>
                                                             </div>
                                                        <div class="col-lg-8 clear-padding">
                                                        <span class="caption-author">
                                                            <asp:Label ID="postedby" runat="server" Text='<%#Eval("authorName") %>'></asp:Label>
                                                             <asp:Image ID="Image3" runat="server"  alt="" ImageUrl='<%#Eval("authorImg") %>' />
                                                            <%--<img src='<%#Eval("authorImg") %> ' /></span>--%>
                                                    </div>
                                                        <br />
                                                    <h4><asp:Label ID="headline" runat="server" Text='<%#Eval("headline")%>'></asp:Label></h4>
                                                   
                                                    <asp:Label ID="bno" runat="server" Text='<%#Eval("blogNo")%>' Visible="false"></asp:Label>
                                                    <asp:Label ID="category" runat="server" Text='<%#Eval("category")%>' Visible="false"></asp:Label>
                                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-mini" Text="» Read More" CommandName="readmore" />
                                                </div>
                                                </div>
                                                 </div>
                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                   
                               
                            </ul>
                        </div>
                    </div>


                    <nav style="display:none;">
                        <ul class="control-box pager">
                            <li><a data-slide="prev" href="#myCarousel" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
                            <li><a data-slide="next" href="#myCarousel" class=""><i class="glyphicon glyphicon-chevron-right"></i></a></li>
                        </ul>
                    </nav>
                    <!-- /.control-box -->
                </div>
                <!-- /#myCarousel -->
            </div>
            <!-- /.col-xs-12 -->
        </div>
        </div>
    </section>
</asp:Content>

