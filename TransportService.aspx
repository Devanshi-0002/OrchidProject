<%@ Page Title="" Language="C#" MasterPageFile="~/InnerMasterPage.Master" ClientIDMode="Static" AutoEventWireup="true" CodeFile="TransportService.aspx.cs" Inherits="TransportService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <%--<script src="https://code.jquery.com/jquery-1.10.2.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.js" data-modules="effect effect-bounce effect-blind effect-bounce effect-clip effect-drop effect-fold effect-slide"></script>--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

    <div class="mini-search-row">
        <div class="container">
            <a style="color: white" href="Default.aspx">Home ></a><a style="color: white"> Holidays in india</a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 my-1">
                    <div class="row">
                        <div class="col-auto d-sm-block">
                            <img src="img/travel-icon.png" alt="" />
                        </div>
                        <div class="input-group col">
                            <asp:TextBox ID="txt_from" runat="server" placeholder="From eg. Kolkata, Delhi" class="form-control form-control-custom border-0 form-control-lg rounded-0"></asp:TextBox>
                            <span id="lbl_Pkg_Group_type" runat="server" style="display: none"></span>
                            <div class="input-group-prepend rounded-0 ">
                                <div class="input-group-text border-0 bg-white">
                                    <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 my-1">
                    <label class="sr-only" for="txtTo">To</label>
                    <div class="input-group">
                        <asp:TextBox ID="txt_to" runat="server" placeholder="To eg. Paris , Singapore" class="form-control form-control-custom border-0 form-control-lg rounded-0"></asp:TextBox>
                        <div class="input-group-prepend rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-map-marker-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 my-1">
                    <label class="sr-only" for="txtDate">Date</label>
                    <div class="input-group">
                        <input type="date" class="form-control border-0 form-control-lg rounded-0 form-control-custom" id="txtDate">
                        <div class="input-group-prepend  rounded-0 ">
                            <div class="input-group-text border-0 bg-white">
                                <i class="fas fa-calendar-alt fa-lg text-black-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-12 my-1">
                    <%--<button type="submit" class="btn btn-danger btn-block rounded-0 btn-lg">SEARCH</button>--%>
                    <%--<asp:LinkButton ID="linkbtn_search_India" runat="server" class="btn btn-danger btn-block rounded-0 btn-lg" Text="Search" OnClick="linkbtn_search_India_Click"></asp:LinkButton>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="dastination-slider-area d-sm-block">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner ">
                <div class="carousel-item destination-carousel-inner active animated  w-100">
                    <%--fadeInDown--%>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/thumb/test1.jpg?ver=1" class="d-block w-100 destination-slider-image" Style="object-fit: fill;" />
                </div>
                <div class="carousel-item destination-carousel-inner animated  w-100">
                    <%--fadeInDown--%>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/thumb/test2.jpg?ver=1" class="d-block w-100 destination-slider-image" Style="object-fit: fill;" />
                </div>
                <div class="carousel-item destination-carousel-inner animated  w-100">
                    <%--fadeInDown--%>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/thumb/test3.jpg?ver=1" class="d-block w-100 destination-slider-image" Style="object-fit: fill;" />
                </div>
                <div class="carousel-item destination-carousel-inner animated  w-100">
                    <%--fadeInDown--%>
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/thumb/test4.jpg?ver=1" class="d-block w-100 destination-slider-image" Style="object-fit: fill;" />
                </div>
                <a class="carousel-control-prev dastination-carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next dastination-carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <hr />
    <div class="dastination-body-area">
        <div class="container">
            <div class="row">

                <div class="col-lg-7">
                    <hr />
                    <h1 class="text-center">Transfer</h1>
                    <hr />
                    <div class="row text-uppercase">
                        <div class="col-sm-6">
                            <span>destination</span>
                            <div class="form-group">
                                <asp:DropDownList ID="ddldestination" runat="server" CssClass="form-control text-capitalize">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="1">Goa</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>transfer date *</span>
                            <div class="form-group">
                                <asp:TextBox ID="txttransfdate" runat="server" CssClass="form-control "></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>pick up *</span>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlpickup" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Goa Airport" Value="Goa Airport">Goa Airport</asp:ListItem>
                                    <asp:ListItem Text="Full Day Excursion 09:30 A.M.- 06:30 P.M." Value="Full Day Excursion 09:30 A.M.- 06:30 P.M.">Full Day Excursion 09:30 A.M.- 06:30 P.M.</asp:ListItem>
                                    <asp:ListItem Text="Madgaon Railway Station Goa" Value="Madgaon Railway Station Goa">Madgaon Railway Station Goa</asp:ListItem>
                                    <asp:ListItem Text="Thivim Railway Station Goa" Value="Thivim Railway Station Goa">Thivim Railway Station Goa</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>drop off *</span>
                            <div class="form-group">
                                <asp:DropDownList ID="ddldropoff" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="North Goa" Value="North Goa">North Goa</asp:ListItem>
                                    <asp:ListItem Text="South Goa" Value="South Goa">South Goa</asp:ListItem>
                                    <asp:ListItem Text="North or South Goa" Value="North or South Goa">North or South Goa</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>pick up location *</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtpickuploc" runat="server"  CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>drop off location *</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtdroploc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>Pick up Time *</span><div class="form-group">
                                <asp:TextBox ID="txtpickuptime" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <span>Adults</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtadults" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <span>Childs</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtchild" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>flight / train no</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtflight" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>Name</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtName" runat="server" onkeypress="return onlyAlphabetswithSpace(event,this);" CssClass="form-control"></asp:TextBox>
                               
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>Email id</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" runat="server" onblur="ValidateEmail(this);" TextMode="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <span>Mobile / Phone</span>
                            <div class="form-group">
                                <asp:TextBox ID="txtPhone" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-sm-6" style="padding-top: 3%;">
                            <asp:LinkButton ID="btnenq" runat="server" CssClass="btn btn-info form-control" Text="Enquire now" OnClick="btnenq_Click" Style="font-weight: 700; font-size: 16px;" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <asp:Image ID="nksbv" runat="server" ImageUrl="~/thumb/smallBus01.jpg" CssClass="img-thumbnail img-responsive" Style="width: 48%; margin-top: 10%;"/>
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/thumb/smallBus02.jpg" CssClass="img-thumbnail img-responsive" Style="width: 48%; margin-top: 10%;"/>
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/thumb/imgcar.jpg" CssClass="img-thumbnail img-responsive" Style="width: 57%; margin-top: 2%; margin-left: 20%;" />
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#txttransfdate').datepicker({
            dateFormat: 'dd/mm/yy',//check change
            minDate: 0,
            maxDate: +60,
            changeMonth: true,
            changeYear: true
        }).attr('readonly', 'true').
keypress(function (event) {
    if (event.keyCode == 8) {
        event.preventDefault();
    }

});
    </script>
    <script>
        function ValidateEmail(mail) {           
            var input = $('#txtEmail');
            var regExpression = /\b[a-zA-Z0-9\u00C0-\u017F._%+-]+@[a-zA-Z0-9\u00C0-\u017F.-]+\.[a-zA-Z]{2,}\b/;
            var isValid = regExpression.test(input.val());
            if (isValid) {
                return (true)
            }
            alert("You have entered an invalid email address!")
            return (false)
        }
        function onlyAlphabetswithSpace(e, t) {
            var arr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ";
            var code;
            if (window.event)
                code = e.keyCode;
            else
                code = e.which;
            var char = keychar = String.fromCharCode(code);
            if (arr.indexOf(char) == -1)
                return false;

        }
        //$(function () {
        //    debugger;
        //    $('#txttransfdate').datepicker({ minDate: -20, maxDate: "+1M +10D" });
        //});

        $("#btnenq").on('click', function (e) {
            
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var phone = $('#txtPhone').val();
            var date = $('#txttransfdate').val();
            var pickup = $('#txtpickuploc').val();
            var drop = $('#txtdroploc').val();
            var picktime = $('#txtpickuptime').val();
            var dest = $("#ddldestination").val()
            debugger;
            if (email === '') {
                alert("Please input Your Email");
                $('#txtEmail').addClass("is-invalid");
                e.preventDefault();
            }
            else
            {
                var input = $('#txtEmail');
                var regExpression = /\b[a-zA-Z0-9\u00C0-\u017F._%+-]+@[a-zA-Z0-9\u00C0-\u017F.-]+\.[a-zA-Z]{2,}\b/;
                var isValid = regExpression.test(input.val());
                if (isValid) {
                   // return (true)
                }
                else {
                    alert("You have entered an invalid email address!")
                    $('#txtEmail').addClass("is-invalid");
                    return (false)
                }
            }
            if (name === '') {
                alert("Please input Your name");
                $('#txtName').addClass("is-invalid");
                
                e.preventDefault();
            }
           
            else if (phone === '') {
                alert("Please input Your Phone no");
                $('#txtPhone').addClass("is-invalid");
                e.preventDefault();
            }
            
            else if (date === '') {
                alert("Please Choose your Travel Date");
                $('#txttransfdate').addClass("is-invalid");
                e.preventDefault();
            }
            else if (pickup === '') {
                alert("Please input Your Pickup Location");
                $('#txtpickuploc').addClass("is-invalid");
                e.preventDefault();
            }
            else if (drop === '') {
                alert("Please input Your Dropoff Location");
                $('#txtdroploc').addClass("is-invalid");
                e.preventDefault();
            }
            else if (picktime === '') {
                alert("Please input Your Pickup Time");
                $('#txtpickuptime').addClass("is-invalid");
                e.preventDefault();
            }
            else if (dest ==='0') {
                alert("Please Select Your Destination ");
                $('#ddldestination').addClass("is-invalid");
                e.preventDefault();
            }
            else {
                $('.validation').addClass("is-valid");
            }

        });
    </script>
</asp:Content>