<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="assets/slider/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="assets/slider/css/elastislide.css" />
    <link rel="stylesheet" type="text/css" href="assets/slider/css/custom.css" />
     <script type="text/javascript" src="assets/slider/js/modernizr.custom.17475.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container demo-1">
        <div class="main">
            <ul id="carousel" class="elastislide-list">
                <asp:Repeater ID="mylist" runat="server">
                    <ItemTemplate>
                        <li><a href="#">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("bgImg")%>' />
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="assets/slider/js/jquerypp.custom.js"></script>
    <script type="text/javascript" src="assets/slider/js/jquery.elastislide.js"></script>
      
    <script type="text/javascript">
        $('#carousel').elastislide();
    </script>
    </form>
</body>
</html>
