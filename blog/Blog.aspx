<%@ Page Title="" Language="C#" MasterPageFile="~/blog/BlogMaster.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/slider/css/demo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid sliderarea slideshow-container" id="slideshow">
        <asp:Repeater ID="mylist" runat="server" OnItemCommand="mylist_ItemCommand">
                                <ItemTemplate>
                                    <div id="" class="mySlides fade">
                                    <a>
                                        <div class="homepageslidingcaption1">
                                            <h3>
                                                <asp:Label ID="headline" runat="server" Text='<%#Eval("headline")%>'></asp:Label></h3>
                                            
                                            <hr>
                                            <div class="homepage-post-summary ">
                                                <%#Eval("postSummery") %>
                                            </div>
                                            <div class="col-md-12">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>
                                                <asp:Label ID="postdate" runat="server" Text='<%#Eval("postDate") %>'></asp:Label>
                                                | <i class="fa fa-user" aria-hidden="true"></i>
                                                <asp:Label ID="postedby" runat="server" Text='<%#Eval("authorName") %>'></asp:Label>
                                                <%--<a href="Blogdetails.aspx" >Read More</a>--%>
                                  &nbsp; &nbsp;
                                            </div>
                                            <div class="col-md-12">
                                                <%--<asp:HyperLink ID="HyperLink1" runat="server" CssClass="clicknowbutton" href='<%# GetRouteUrl("RouteForArticle", new {id = Eval("blogNo"), Title= GetTitle(Eval("headline"))})%>' Text="Read More ..">  </asp:HyperLink>--%>
                                                <%--<asp:LinkButton ID="LinkButton1" CssClass="clicknowbutton" CommandName="readmore" Text="Read More .." PostBackUrl='<%# GetRouteUrl("RouteForArticle", new {id = Eval("blogNo"), Title= GetTitle(Eval("headline"))})%>' runat="server"></asp:LinkButton>--%>
                                                <asp:Button ID="Button1" runat="server" CssClass="clicknowbutton" Text="Read More .." CommandName="readmore" />
                                            </div>
                                        </div>
                                       
                                        <asp:Image ID="Image1" runat="server" CssClass="img-responsive-new"  ImageUrl='<%#Eval("bgImg")%>' title='' />
                                            
                                        <asp:Label ID="bno" runat="server" Text='<%#Eval("blogNo")%>' Visible="false"></asp:Label>
                                        <asp:Label ID="ta" runat="server" Text='<%#Eval("category")%>' Visible="false"></asp:Label>
                                        
                                    </a>
                                         </div>
                                           
                                </ItemTemplate>
                            </asp:Repeater>
                                            <a class="prev" id="nav-left" onclick="plusSlides(-1)">&#10094;</a>
                                            <a class="next" id="nav-right" onclick="plusSlides(1)">&#10095;</a>
                                        </div>

        

    <section class="body-content">
        <div class="container">
            <div class="themecategoty">
                <div class="row">
                    <ul class="ch-grid">
                        <div class="col-md-3 dec-padding">
                            <li>
                                <div class='bordered large-square'>
                                    <div class="hovereffect">
                                        <div class="caption-area">
                                            <i class="fa fa-heart fa-1x" aria-hidden="true"></i>
                                            <%--<span>HoneyMoon</span>--%>
                                            <asp:Label ID="lbl_hm" runat="server" Text="HoneyMoon"></asp:Label>
                                        </div>
                                        <a href="#">
                                            <img src="images\6.jpg" alt="" class="img-responsive" /></a>

                                        <div class="overlay">
                                            <h2>HoneyMoon</h2>
                                            <asp:LinkButton ID="btn_details" CssClass="info" runat="server" OnClick="btn_details_Click">Click Here to Enter</asp:LinkButton>
                                            <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="col-md-6 dec-padding">
                            <div class="img-slider-area">
                           <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                              <!-- Indicators -->
                              <!-- Wrapper for slides -->
                              <div class="carousel-inner " role="listbox">
                                <div class="item active">
                                  <img src="Img/bali.jpg" alt="..." class="img-responsive">
                                  <div class="carousel-caption">
                                    ...
                                  </div>
                                </div>
                                <div class="item">
                                  <img src="Img/cambodia.jpg" alt="..." class="img-responsive">
                                  <div class="carousel-caption">
                                    ...
                                  </div>
                                </div>
                                <div class="item">
                                  <img src="Img/moscow.jpg" alt="..." class="img-responsive">
                                  <div class="carousel-caption">
                                    ...
                                  </div>
                                </div>
				<div class="item">
                                  <img src="Img/tashkent.jpg" alt="..." class="img-responsive">
                                  <div class="carousel-caption">
                                    ...
                                  </div>
                                </div>
				<div class="item">
                                  <img src="Img/vietnam.jpg" alt="..." class="img-responsive">
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
                        </div>
                        <div class="col-md-3 dec-padding">
                            <li>
                                <div class='bordered large-square'>
                                    <div class="hovereffect">
                                        <div class="caption-area">
                                            <i class="fa fa-wpexplorer fa-1x" aria-hidden="true"></i>
                                            <%--  <span>Weekend Tours</span>--%>
                                            <asp:Label ID="lbl_wt" runat="server" Text="Weekend Tours"></asp:Label>
                                        </div>
                                        <a href="#">
                                            <img src="images\5.jpg" alt="" class="img-responsive" /></a>
                                        <div class="overlay">
                                            <h2>Tours & Travels</h2>
                                            <asp:LinkButton ID="lb_wt" CssClass="info" runat="server" OnClick="lb_wt_Click">Click Here to Enter</asp:LinkButton>
                                            <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                    </ul>
                </div>
                <div class="row">
                    <ul class="ch-grid">
                        <div class="col-md-3 dec-padding">
                            <li>
                                <div class='bordered large-square'>
                                    <div class="hovereffect">
                                        <div class="caption-area">
                                            <i class="fa fa-map-signs fa-1x" aria-hidden="true"></i>
                                            <span id="ch" runat="server">Customized Holiday</span>
                                            <%--<asp:Label ID="lbl_ch" runat="server" Text="Customized Holiday"></asp:Label>--%>
                                        </div>
                                        <a href="#">
                                            <img src="images\4.jpg" alt="" class="img-responsive" /></a>
                                        <div class="overlay">
                                            <h2>Tours & Travels</h2>
                                            <asp:LinkButton ID="lb_ch" CssClass="info" runat="server" OnClick="lb_ch_Click">Click Here to Enter</asp:LinkButton>
                                            <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="col-md-3 dec-padding">
                            <li>
                                <div class='bordered large-square'>
                                    <div class="hovereffect">
                                        <div class="caption-area">
                                            <i class="fa fa-users fa-1x" aria-hidden="true"></i>
                                            <span id="gh" runat="server">Group Holidays</span>
                                        </div>
                                        <a href="#">
                                            <img src="images\3.jpg" alt="" class="img-responsive" /></a>
                                        <div class="overlay">
                                            <h2>Tours & Travels</h2>
                                            <asp:LinkButton ID="lb_gh" CssClass="info" runat="server" OnClick="lb_gh_Click">Click Here to Enter</asp:LinkButton>
                                            <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="col-md-3 dec-padding">
                            <li>
                                <div class='bordered large-square'>
                                    <div class="hovereffect">
                                        <div class="caption-area">
                                            <i class="fa fa-camera fa-1x" aria-hidden="true"></i>
                                            <span id="th" runat="server">Theme Holidays</span>
                                        </div>
                                        <a href="#">
                                            <img src="images\2.jpg" alt="" class="img-responsive" /></a>
                                        <div class="overlay">
                                            <h2>Tours & Travels</h2>
                                            <asp:LinkButton ID="lb_th" CssClass="info" runat="server" OnClick="lb_th_Click">Click Here to Enter</asp:LinkButton>
                                            <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </div>
                        <div class="col-md-3 dec-padding">
                            <ul>
                                <li>
                                    <div class='bordered large-square'>
                                        <div class="hovereffect">
                                            <div class="caption-area">
                                                <i class="fa fa-handshake-o fa-1x" aria-hidden="true"></i>
                                                <span id="mt" runat="server">MICE Tours</span>
                                            </div>
                                            <a href="#">
                                                <img src="images\1.jpg" alt="" class="img-responsive" /></a>
                                            <div class="overlay">
                                                <h2>Tours & Travels</h2>
                                                <%--<a class="info" href="#">Click Here to Enter</a>--%>
                                                <asp:LinkButton ID="lb_mt" CssClass="info" runat="server" OnClick="lb_mt_Click">Click Here to Enter</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="homepage-latest-news">
        <div class="container-fluid">
            <div class="">
                <div class="col-md-10">
                    <h1 class="headline-post"><i class="fa fa-lightbulb-o latest-news-icon" aria-hidden="true"></i>News & Trending</h1>
                </div>
                <div class="col-md-2">
                    <nav>
                        <ul class="control-box pager Carousel-pointer-homepage">
                            <li><a data-slide="prev" href="#Carousel" class=""><i class="glyphicon glyphicon-chevron-left"></i></a></li>
                            <li><a data-slide="next" href="#Carousel" class=""><i class="glyphicon glyphicon-chevron-right"></i></a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-xs-12 ">
                    <div class="related-post">
                        <div class="carousel slide" id="Div1">
                            <div class="carousel-inner">
                                <ul> <%--class="thumbnails "--%>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="rep1_ItemCommand">
                                        <ItemTemplate>
                                            <li class="col-md-2 col-sm-6 col-xs-6" style="padding: 0 5px; display:block;">
                                                <div class="fff ">
                                                    <div class="thumbnail">
                                                        <div class="latest-post-category">
                                                            <a href="#"><span>News & Trending</span></a>
                                                        </div>
                                                        <a href="#">
                                                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive" Height="200px" ImageUrl='<%#Eval("bgImg")%>' title='' /></a>
                                                    </div>
                                                    <div class="caption">
                                                        <div class="col-lg-12 clear-padding">
                                                            <span class="caption-date"><i class="fa fa-calendar" aria-hidden="true"></i>
                                                                <asp:Label ID="postdate" runat="server" Text='<%#Eval("postDate") %>'></asp:Label></span>
                                                            <span class="caption-author">
                                                                <asp:Label ID="postedby" runat="server" Text='<%#Eval("authorName") %>'></asp:Label><a href="#">
                                                                    <img src='<%#Eval("authorImg") %> ' /></a></span>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <h4>
                                                                <asp:Label ID="headline" runat="server" Text='<%#Eval("headline")%>'></asp:Label></h4>
                                                        </div>
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-mini" Text="» Read More" CommandName="readmore" />
                                                        <%--<span class="latest-post-caption-view-count"><i class="fa fa-eye" aria-hidden="true"></i> 522</span>--%>
                                                        <asp:Label ID="bno" runat="server" Text='<%#Eval("blogNo")%>' Visible="false"></asp:Label>
                                                        <asp:Label ID="ta" runat="server" Text='<%#Eval("category")%>' Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>

                            </div>
                            <!-- /.control-box -->
                        </div>
                        <!-- /#Carousel -->
                    </div>
                </div>
                <!-- /.col-xs-12 -->
            </div>
        </div>
    </section>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            //setTimeout(showSlides, 5000); // Change image every 5 seconds
        }
        
</script>
    
</asp:Content>

