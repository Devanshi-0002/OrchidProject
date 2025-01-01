<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="PostBlog.aspx.cs" Inherits="PostBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="shortcut icon" href="img/z.png" />
    <title>Blog Admin </title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <%--<script type="text/javascript" src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript">
        tinymce.init({ selector: 'textarea', width: 500, });
    </script>--%>
    <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(function () { nicEditors.allTextAreas().html() });//.allTextAreas()
    </script>

    <style type="text/css">
        .form-control1 {
            display: block;
            width: 100%;
            height: auto;
            padding: 8px 10px;
            font-size: 14px;
            line-height: 1.428571;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 6px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

        .mce-panel {
            width: 100% !important;
            height: 100px !important;
        }

        .mce-edit-area1 {
            height: 300px !important;
            width: 100% !important;
        }

        .nav-tabs {
            background: #fff;
        }

        .Initial {
            display: block;
            padding: 4px 18px 4px 18px;
            float: left;
            /*background: url("../Images/InitialImage.png") no-repeat right top;*/
            color: Black;
            font-weight: bold;
        }

            .Initial:hover {
                color: red;
                background: url("../Images/SelectedButton.png") no-repeat right top;
            }

        .Clicked {
            float: left;
            display: block;
            /* background: url(../Images/SelectedButton.png) no-repeat right top; */
            padding: 6px 18px;
            /* color: Black; */
            font-weight: bold;
            color: White;
            background-color: #5bc0de;
            border-color: #46b8da;
            border-bottom-left-radius: 4px;
            border-top-left-radius: 4px;
        }
    </style>
</head>
<body style="background-color: azure;">
    <br />
    <form id="form1" runat="server">
        <div class="container" style="border: 1px solid rgba(0, 0, 0, 0.15); box-shadow: 0 0 10px rgba(0, 0, 0, 0.15); padding-top: 20px;">
            <center>
        <div class="btn-group">
         <asp:Button Text="Add Blog" BorderStyle="None" ID="Tab1" CssClass="btn btn-large btn-info" runat="server" OnClick="Tab1_Click" />
                    <asp:Button Text="Edit / Delete Blog" BorderStyle="None" ID="Tab2" CssClass="btn btn-large btn-info" runat="server" OnClick="Tab2_Click" />
                    <asp:Button Text="View Blog" BorderStyle="None" ID="Tab3" CssClass="btn btn-large btn-info" runat="server" OnClick="Tab3_Click" />
       </div>
            </center>
            <table width="100%" align="center">
                <tr>
                    <td>
                        <asp:MultiView ID="MainView" runat="server">
                            <asp:View ID="View1" runat="server">
                                <br />
                                <br />
                                <div class="containerr">
                                    <asp:Label ID="lbl_Category" CssClass="form-control1" runat="server" Text="Category" Font-Bold="True"></asp:Label>
                                    <asp:DropDownList ID="ddl_category" CssClass="form-control1" runat="server">
                                        <asp:ListItem Text="Honeymoon"></asp:ListItem>
                                        <asp:ListItem Text="Weekend Tours"></asp:ListItem>
                                        <asp:ListItem Text="Customized Holiday"></asp:ListItem>
                                        <asp:ListItem Text="Group Holidays"></asp:ListItem>
                                        <asp:ListItem Text="Theme Holidays"></asp:ListItem>
                                        <asp:ListItem Text="MICE Tours"></asp:ListItem>
                                        <asp:ListItem Text="News & Trending"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Label ID="lbl_Headline" CssClass="form-control1" runat="server" Text="Headline" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_Headline" CssClass="form-control1" runat="server"></asp:TextBox>
                                    <br />

                                    <asp:Label ID="lbl_postsummery" CssClass="form-control1" runat="server" Text="Summery of the post" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_postsummery" CssClass="form-control1 mce-panel" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lbl_postcontent" CssClass="form-control1" runat="server" Text="Detail Post" Font-Bold="True"></asp:Label>
                                    <asp:Panel ID="pnlEditor" runat="server">
                                        <asp:TextBox ID="RichTextBox1" runat="server" TextMode="MultiLine" CssClass="mce-edit-area1"></asp:TextBox>
                                        <br />
                                        <div class="col-sm-6">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                        </div>
                                        <br />
                                    </asp:Panel>

                                    <br />
                                    <asp:Label ID="Label1" CssClass="form-control1" runat="server" Text="Headline Background Image ( Please upload image 1490px X 400px )" Font-Bold="True"></asp:Label>
                                    <asp:FileUpload ID="fupbgimg" CssClass="form-control1" runat="server" ToolTip="Please upload image 1490 X 400 px" /><br />
                                    <asp:Label ID="lbl_authorimg" CssClass="form-control1" runat="server" Text="User Image" Font-Bold="True"></asp:Label>
                                    <asp:FileUpload ID="fup_authorimg" CssClass="form-control1" runat="server" /><br />
                                    <asp:Label ID="lbl_authorname" CssClass="form-control1" runat="server" Text="User Full Name" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_authorname" CssClass="form-control1" runat="server"></asp:TextBox><br />
                                    <asp:Label ID="lbl_authortype" CssClass="form-control1" runat="server" Text="User Type" Font-Bold="True"></asp:Label>
                                    <asp:DropDownList ID="ddl_usertype" CssClass="form-control1" runat="server">
                                        <asp:ListItem Text="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Blogger"></asp:ListItem>
                                        <asp:ListItem Text="Guest"></asp:ListItem>
                                    </asp:DropDownList><br />

                                    <asp:Label ID="lbl_tagarea" CssClass="form-control1" runat="server" Text="Area's to Tag" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_tagarea" CssClass="form-control1" placeholder="Separeted by comma(,)" runat="server"></asp:TextBox><br />
                                    <asp:Label ID="lbl_tagcloud" CssClass="form-control1" runat="server" Text="Cloud Tag" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_tagcloud" CssClass="form-control1" runat="server"></asp:TextBox>

                                    <asp:Label ID="lbl_title" CssClass="form-control1" runat="server" Text="Page Title" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_pagetitle" CssClass="form-control1" runat="server"></asp:TextBox>
                                    <asp:Label ID="lbl_MetaDescription" CssClass="form-control1" runat="server" Text="Meta Description" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_MetaDescription" CssClass="form-control1" runat="server"></asp:TextBox>
                                    <asp:Label ID="lbl_MetaKeywords" CssClass="form-control1" runat="server" Text="Meta Keywords" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txt_MetaKeywords" CssClass="form-control1" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Button ID="btn_post" runat="server" CssClass="btn-success btn" Text="Post" OnClick="btn_post_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btn_reset" runat="server" Text="Reset" CssClass="btn btn-danger" />
                                </div>
                            </asp:View>
                            <asp:View ID="View2" runat="server">

                                <br />
                                <div class="heading-top" style="text-align: center">
                                    <h3>Blog Details </h3>
                                    <br />
                                </div>
                                <div class="panel panel-primary" style="margin: 20px; overflow-y: auto;">
                                    <asp:GridView ID="enq_dtls" runat="server" AllowPaging="true" CssClass="table table-striped table-bordered table-hover" ForeColor="#428bca" PageSize="10" Width="100%" Font-Size="13px" GridLines="Both"
                                        AutoGenerateColumns="False" ShowFooter="false" ShowHeaderWhenEmpty="True" OnRowDataBound="enq_dtls_RowDataBound" OnRowDeleting="enq_dtls_RowDeleting" OnSelectedIndexChanging="enq_dtls_SelectedIndexChanging" OnRowCommand="enq_dtls_RowCommand" OnDataBound="enq_dtls_DataBound" OnPageIndexChanging="enq_dtls_PageIndexChanging">

                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Blog No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEnquiry_id" runat="server" Text='<%# Eval("blogNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Category">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblZoneg" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Headlines">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCorporateg" runat="server" Text='<%# Eval("headline") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Posted By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblenqdt" runat="server" Text='<%# Eval("authorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Posted Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("postDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:CommandField HeaderText="View" ShowSelectButton="True" SelectText="Show" ControlStyle-CssClass="btn-sm btn-warning" />
                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" SelectText="Remove" ControlStyle-CssClass="btn-sm btn-danger" />
                                        </Columns>
                                        <HeaderStyle ForeColor="#f2f2f2" BackColor="#2196F3" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFFFF" ForeColor="#333" />
                                        <AlternatingRowStyle BackColor="#f2f2f2" />
                                    </asp:GridView>

                                    <asp:FormView ID="Formview_opsenquirydetails" runat="server" Visible="false" HeaderText="View / Edit Enquiry Detail" PagerSettings-Mode="Numeric" HeaderStyle-Font-Size="14px"
                                        HeaderStyle-HorizontalAlign="Center" Width="100%" CellPadding="4" ForeColor="#333333" OnModeChanging="Formview_opsenquirydetails_ModeChanging">
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#2196f3" ForeColor="White"></HeaderStyle>

                                        <ItemTemplate>
                                            <table class="FormView">

                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Blog No. </td>
                                                    <td style="width: 200%;">
                                                        <asp:Label ID="txtedit_payment" runat="server" class="form-control1" Text='<%# Eval("blogNo") %>'></asp:Label>
                                                    </td>
                                                    <td style="width: 25%; text-align: center;">Category</td>
                                                    <td>
                                                        <asp:Label ID="txtedit_creditDay" class="form-control1" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Headline</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="txtedit_bankAC" runat="server" class="form-control1" Text='<%# Eval("headline") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Posted By</td>
                                                    <td style="width: 200%;">
                                                        <asp:Label ID="txtSales_initiator" runat="server" class="form-control1" Text='<%# Eval("authorName") %>'></asp:Label></td>
                                                    <td style="width: 25%; text-align: center;">User Type</td>
                                                    <td>
                                                        <asp:Label ID="txtEnquiry_date" runat="server" class="form-control1" Text='<%# Eval("authorType") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Date of Posting</td>
                                                    <td style="width: 200%;">
                                                        <asp:Label ID="txtedit_cmpyReg" runat="server" class="form-control1" Text='<%# Eval("postDate") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Blog Summery</td>
                                                    <td colspan="3">
                                                        <asp:Label ID="txtedit_note" runat="server" class="form-control1" Text='<%# Eval("postSummery") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Blog Details</td>
                                                    <td colspan="4">
                                                        <asp:Label ID="txtedit_vatNO" runat="server" class="form-control1" Text='<%# Eval("postContent") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 25%; text-align: center;">Tagged Area</td>
                                                    <td>
                                                        <asp:Label ID="txtedit_cstReg" class="form-control1" runat="server" Text='<%# Eval("tagArea") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btnEdit" runat="server" Style="float: right;" CssClass="btn btn-primary" Text="Edit Records" CommandName="Edit" OnClick="btnEdit_Click" />
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btnback" runat="server" Text="Close" Style="width: 100%;" CssClass="btn btn-primary" OnClick="btnback_Click" /></td>
                                                </tr>

                                            </table>
                                        </ItemTemplate>

                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <EditItemTemplate>
                                            <table class="table table-striped table-bordered table-hover">

                                                <tr>
                                                    <td style="width: 150px;">Category
                                                        <asp:Label ID="lbl_blogno" runat="server" Visible="false" Text='<%# Eval("blogNo") %>'></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:DropDownList ID="ddl_category" Text='<%# Eval("category") %>' class="form-control" runat="server">
                                                            <asp:ListItem Text="Honeymoon"></asp:ListItem>
                                                            <asp:ListItem Text="Weekend Tours"></asp:ListItem>
                                                            <asp:ListItem Text="Customized Holiday"></asp:ListItem>
                                                            <asp:ListItem Text="Group Holidays"></asp:ListItem>
                                                            <asp:ListItem Text="Theme Holidays"></asp:ListItem>
                                                            <asp:ListItem Text="MICE Tours"></asp:ListItem>
                                                            <asp:ListItem Text="News & Trending"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Headline</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txtedit_corporate" class="form-control" runat="server" Text='<%# Eval("headline") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Blog Summery</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txtEnquiry_date" runat="server" TextMode="MultiLine" class="form-control" Text='<%# Eval("postSummery") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Blog Details</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txtedit_desti" runat="server" class="form-control mce-edit-area1" TextMode="MultiLine" Text='<%# Eval("postContent") %>'></asp:TextBox>
                                                        <div class="col-sm-6">
                                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Background Image</td>
                                                    <td>
                                                        <asp:FileUpload ID="fup_bgimg" runat="server" /><asp:Label ID="lbl_bgimg" runat="server" Text='<%# Eval("bgImg") %>'></asp:Label></td>
                                                    <td style="width: 150px;">Author Image</td>
                                                    <td>
                                                        <asp:FileUpload ID="fup_authImg" runat="server" /><asp:Label ID="lbl_authImg" runat="server" Text='<%# Eval("authorImg") %>'></asp:Label></td>

                                                </tr>
                                                <tr>

                                                    <td style="width: 150px;">Posted By</td>
                                                    <td>
                                                        <asp:TextBox ID="txtedit_corp_cord" runat="server" class="form-control" Text='<%# Eval("authorName") %>'></asp:TextBox>
                                                    </td>

                                                    <td style="width: 150px;">User Type</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddloccurrence" runat="server" Text='<%# Eval("authorType") %>' class="form-control input-sm">

                                                            <asp:ListItem Text="Admin"></asp:ListItem>
                                                            <asp:ListItem Text="Blogger"></asp:ListItem>
                                                            <asp:ListItem Text="Guest"></asp:ListItem>
                                                        </asp:DropDownList>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Tagged Area</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txtSales_initiator" runat="server" class="form-control" Text='<%# Eval("tagArea") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Page Title</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txt_pagetitle_update" runat="server" class="form-control" Text='<%# Eval("pagetitle") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Meta Description</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txt_MetaDescription_update" runat="server" class="form-control" Text='<%# Eval("metacontent") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px;">Meta Keywords</td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="txt_MetaKeywords_update" runat="server" class="form-control" Text='<%# Eval("metakeyword") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                              
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btnupdate" Style="float: right; width: 50%;" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnupdate_Click" />
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btnback" Style="width: 50%;" CssClass="btn btn-primary" runat="server" Text="Back" OnClick="btnback_Click1" /></td>
                                                </tr>

                                            </table>
                                        </EditItemTemplate>

                                        <EditRowStyle Font-Bold="True" />
                                    </asp:FormView>
                                </div>



                            </asp:View>
                            <asp:View ID="View3" runat="server">
                                <br />
                                <br />
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GVblogview" AllowPaging="true" HeaderStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" ForeColor="#428bca" PageSize="25" Width="100%" Font-Size="12px" GridLines="Both"
                                                ShowFooter="false" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GVblogview_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Category">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblZoneg" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Headlines">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCorporateg" runat="server" Text='<%# Eval("headline") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Posted By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblenqdt" runat="server" Text='<%# Eval("authorName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Posted Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("postDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>


                                                </Columns>
                                                <HeaderStyle ForeColor="#f2f2f2" BackColor="#2196F3" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#FFFFFF" ForeColor="#333" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>

                                            <asp:ImageButton ID="imgbtn" ToolTip="Export to Excel" runat="server" OnClick="imgbtn_Click" Style="float: right; right: 45%; position: relative; width: 10%; margin: 5px 0 0  0;" ImageUrl="Img/Excel_btn.png" ImageAlign="Middle" />

                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
