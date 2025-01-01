<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" ClientIDMode="Static" AutoEventWireup="true" CodeFile="suggestionbox.aspx.cs" Inherits="suggestionbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900" rel="stylesheet" />
    <style>
        td, th {
            width: 50%;
        }

        body, html {
            font-family: 'Lato', sans-serif;
        }

        .container {
        }

        .bg-white {
            position: relative;
        }

        #modalContainer {
            background-color: rgba(0, 0, 0, 0.3);
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: 10000;
            background-image: url(tp.png); /* required by MSIE to prevent actions on lower z-index elements */
        }

        #alertBox {
            position: relative;
            width: 350px;
            min-height: 110px;
            margin-top: 50px;
            border: 1px solid #666;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: 20px 30px;
            padding-bottom: 18px;
        }

        #modalContainer > #alertBox {
            position: fixed;
        }

        #alertBox h1 {
            margin: 0;
            font: bold 0.9em verdana,arial;
            background-color: #3073BB;
            color: #FFF;
            border-bottom: 1px solid #000;
            padding: 2px 0 2px 5px;
        }

        #alertBox p {
            text-align: center;
            padding: 20px 0;
            font-size: 13px;
        }

        #alertBox #closeBtn {
            display: block;
            position: relative;
            margin: 5px auto;
            padding: 7px;
            border: 0 none;
            width: 70px;
            font: 0.7em verdana,arial;
            text-transform: uppercase;
            text-align: center;
            color: #FFF;
            background-color: #357EBD;
            border-radius: 3px;
            text-decoration: none;
        }

        /* unrelated styles */

        #mContainer {
            position: relative;
            width: 600px;
            margin: auto;
            padding: 5px;
        }

        h1, h2 {
            margin: 0;
            padding: 4px;
        }

        code {
            font-size: 1.2em;
            color: #069;
        }

        #credits {
            position: relative;
            margin: 25px auto 0px auto;
            width: 350px;
            font: 0.7em verdana;
            border-top: 1px solid #000;
            border-bottom: 1px solid #000;
            height: 90px;
            padding-top: 4px;
        }

            #credits img {
                float: left;
                margin: 5px 10px 5px 0px;
                border: 1px solid #000000;
                width: 80px;
                height: 79px;
            }

        .important {
            background-color: #F5FCC8;
            padding: 2px;
        }

        code span {
            color: green;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="box-shadow: 0 0 250px #000;">
        <header>
            <div class="row border-bottom pb-3 bg-white">
                <div class="col-8">
                    <h2 class="pt-4 text-info">Dear Orchidians,</h2>
                </div>
                <div class="col text-right">
                    <img class="img-fluid" src="http://www.orchidglobal.net/Orchid1/images/logo.jpg" />
                </div>
            </div>
        </header>
        <div class="container">
            <table id="Table1" runat="server" class="table table-bordered table-striped">
                <tr>
                    <td colspan="2">
                        <div class="srch-tab-line">
                            <label>
                                Though perhaps unnoticed, we all possess with wealth of experience, talent to make changes, insight knowledge of many process, and many creative ideas that are just waiting for the right opportunity to be shared. So, here we come…..	
"WHAT AN IDEA" - an employee feedback programme, where you can put you ideas under the following parameters</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="srch-tab-line">
                            <label>1. Cost Saving </label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Cost Saving" />
                        </div>
                    </td>
                    <td>
                        <div class="srch-tab-line">
                            <label>2. Quality, Productivity or Process Improvement</label>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Quality, Productivity or Process Improvement" />
                            <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtLastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLastName" ValidationGroup="subinq" ErrorMessage="Please Enter last Name!" />--%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="srch-tab-line">
                            <label>3. Revenue Generation </label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Revenue Generation" TextMode="MultiLine" />
                            <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtLastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLastName" ValidationGroup="subinq" ErrorMessage="Please Enter last Name!" />--%>
                            <div class="clear"></div>
                        </div>
                    </td>
                    <td>
                        <div class="srch-tab-line">
                            <label>4. Morale Enhancement and Employee Motivation</label>
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Morale Enhancement and Employee Motivation" />
                            <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtLastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLastName" ValidationGroup="subinq" ErrorMessage="Please Enter last Name!" />--%>
                            <div class="clear"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Before, you put your ideas here, just ask yourself once " How the idea will impact the company"</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="font-weight-bold">AS WE ALL KNOW TOGETHER WE WIN……</p>
                    </td>
                </tr>
            </table>
            <div class="row">
                <div class="col-sm-12 col-xs-12 form_contact">
                    <table id="tblbody1" runat="server" class="table table-bordered table-striped">
                        <tr>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Name </label>
                                    <asp:TextBox ID="txtFastName" runat="server" type="text" CssClass="form-control" placeholder="Name" />
                                    <%-- <asp:RequiredFieldValidator runat="server" ID="rfvtxtFastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtFastName" ValidationGroup="subinq" ErrorMessage="Please Enter First Name!" />--%>
                                </div>
                            </td>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Emai</label>
                                    <asp:TextBox ID="txtLastName" runat="server" type="text" CssClass="form-control" placeholder="Emai" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtLastName" ForeColor="Red" Font-Size="12px" ControlToValidate="txtLastName" ValidationGroup="subinq" ErrorMessage="Please Enter last Name!" />--%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Department </label>
                                    <asp:TextBox ID="txtDestination" runat="server" type="text" CssClass="form-control" placeholder="Department" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvDestination" ForeColor="Red" Font-Size="12px" ControlToValidate="txtDestination" ValidationGroup="subinq" ErrorMessage="Please Enter Destination!" />--%>
                                </div>
                            </td>
                            <td>
                                <div class="srch-tab-line">
                                    <label>Location</label>
                                    <asp:TextBox ID="txtPhoneno" runat="server" type="text" CssClass="form-control" placeholder="Location" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="srch-tab-line" id="tdreturn" runat="server" visible="true">
                                    <label>YOUR IDEA</label>
                                    <asp:TextBox ID="txtMoreDetails" runat="server" type="text" CssClass="form-control" Style="height: 50px;" TextMode="MultiLine" Rows="3" placeholder="Your Idea" />
                                    <%--<asp:RequiredFieldValidator runat="server" ID="rfvtxtMoreDetails" ForeColor="Red" Font-Size="12px" ControlToValidate="txtMoreDetails" ValidationGroup="subinq" ErrorMessage="Please Enter Details!" />--%>
                                </div>
                            </td>


                        </tr>
                        <tr>
                            <td colspan="2" id="tdbookbtn" runat="server" class="text-right">
                                <asp:LinkButton ID="btncontact" runat="server" Text="Click Here To Submit" class="btn btn-success btn-lg" ValidationGroup="subinq" OnClientClick="alert('Your Suggestion Successfully Submitted');return false;" />
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>

    <script>
        var ALERT_TITLE = "Thank You";
        var ALERT_BUTTON_TEXT = "Ok";

        if (document.getElementById) {
            window.alert = function (txt) {
                createCustomAlert(txt);
            }
        }

        function createCustomAlert(txt) {
            d = document;

            if (d.getElementById("modalContainer")) return;

            mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
            mObj.id = "modalContainer";
            mObj.style.height = d.documentElement.scrollHeight + "px";

            alertObj = mObj.appendChild(d.createElement("div"));
            alertObj.id = "alertBox";
            if (d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
            alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
            alertObj.style.visiblity = "visible";

            h1 = alertObj.appendChild(d.createElement("h1"));
            h1.appendChild(d.createTextNode(ALERT_TITLE));

            msg = alertObj.appendChild(d.createElement("p"));
            //msg.appendChild(d.createTextNode(txt));
            msg.innerHTML = txt;

            btn = alertObj.appendChild(d.createElement("a"));
            btn.id = "closeBtn";
            btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
            btn.href = "#";
            btn.focus();
            btn.onclick = function () { removeCustomAlert(); return false; }

            alertObj.style.display = "block";

        }

        function removeCustomAlert() {
            document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
        }
    </script>
</asp:Content>

