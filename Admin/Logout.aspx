<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>thank you</title>
    <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon" />
    <%--<script type="text/javascript" language="javascript">
        window.history.forward(1);
        document.attachEvent("onkeydown", my_onkeydown_handler);
        function my_onkeydown_handler() {
            switch (event.keyCode) {
                case 116: // F5;
                    event.returnValue = false;
                    event.keyCode = 0;
                    window.status = "We have disabled F5";
                    break;
            }
        }
</script>--%>
     <style>
        .back_bg
        {
            background-image:url("images/Thank-You-For-Signing-Up.jpg");
            background-size:cover;
            background-repeat:no-repeat;
        }
    </style>
</head>
<body class="back_bg">
    
    <form id="form1" runat="server">
    <div align="center" >
        <br />
        <img src="../Image/orchidglobal.png" alt="" style="height:80px" />
        <hr />
       <a href="Login.aspx"><b>Go Back to Login Page..</b></a>
    </div>
       
    </form>
</body>
</html>
