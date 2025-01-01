<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="ThemeBucket" />
   <link href="../img/favicon.gif" rel="shortcut icon" type="image/x-icon" />
    <title>:: OrchidGlobal</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="CSS/PopUpStyle.css" rel="stylesheet" />
    <script src="js/PopScript.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        .back_bg
        {
            /*background-image:url("https://www.virginholidays.co.uk/.imaging/Phone/dam/0cd95d29-4687-4577-9f8a-e0e21bb0a8ca.jpg");*/  
            background-image:url("images/admin_back.jpg");           
            background-size:cover;
            background-repeat:no-repeat;
        }
    </style>
</head>
<body class="back_bg">


    <div class="container">

        <form id="form1" runat="server" class="form-signin" style="background-color:#31769a">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title" style="color:#f0ad4e">Login</h1>
                <img src="images/orchidglobal.png" alt="" style="height: 78px;" />
            </div>
            <div class="login-wrap">
                <input id="txtLoginId" runat="server" type="text" class="form-control" placeholder="User ID" autofocus />
                <input id="txtPassword" runat="server" type="password" class="form-control" placeholder="Password" />

                <asp:DropDownList ID="ddlcmpname" CssClass="form-control" runat="server" Visible="false" AppendDataBoundItems="true">
                    <asp:ListItem>--Select Company Name--</asp:ListItem>
                </asp:DropDownList>
                <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AccountingPackageConnectionString %>" 
                SelectCommand="SELECT [Comp_Name], [Cmp_Id] FROM [Company]">
            </asp:SqlDataSource>--%>
                <asp:Button class="btn btn-lg btn-login btn-block fa fa-check" type="submit" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"></asp:Button>

                <%-- <div class="registration">
                Not a member yet?
                <a class="" href="#">
                    Signup
                </a>
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me" /> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>

                </span>
            </label>--%>
            </div>

            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Forgot Password ?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Enter your e-mail address below to reset your password.</p>
                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-primary" type="button">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal -->

        </form>

    </div>



    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- Placed js at the end of the document so the pages load faster -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%--<script src="js/modernizr.min.js"></script>--%>
</body>
</html>
