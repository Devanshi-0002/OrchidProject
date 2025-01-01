using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using blog;

using Zenithholidays;

public partial class PostBlog : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    DataSet ds = new DataSet();
    public void showGridView()
    {
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 1);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (m_sMessage.IndexOf("Error") != 0)
        {
            enq_dtls.DataSource = ds;
            enq_dtls.DataBind();
            GVblogview.DataSource = ds;
            GVblogview.DataBind();
            ds.Clear();
        }
        else
        {
            throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
        }
    }
    public void ShowBlogByid(int bno)
    {
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 2);
        m.dt.Rows.Add("@blogNo", bno);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (m_sMessage.IndexOf("Error") != 0)
        {
            enq_dtls.DataSource = ds;
            enq_dtls.DataBind();
            Formview_opsenquirydetails.DataSource = ds;
            Formview_opsenquirydetails.DataBind();
            ds.Clear();
        }
        else
        {
            throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
        }
    }
    public void update()
    {
        //string filePath = "";
        FileUpload fup_bgimg = (Formview_opsenquirydetails.FindControl("fup_bgimg") as FileUpload);
        FileUpload fup_authImg = (Formview_opsenquirydetails.FindControl("fup_authImg") as FileUpload);
       
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 1);
        m.dt.Rows.Add("@blogNo", Convert.ToInt32((Formview_opsenquirydetails.FindControl("lbl_blogno") as Label).Text));
        m.dt.Rows.Add("@category", (Formview_opsenquirydetails.FindControl("ddl_category") as DropDownList).Text);
        m.dt.Rows.Add("@headline", (Formview_opsenquirydetails.FindControl("txtedit_corporate") as TextBox).Text);
        m.dt.Rows.Add("@postSummery", (Formview_opsenquirydetails.FindControl("txtEnquiry_date") as TextBox).Text);
        m.dt.Rows.Add("@postContent", (Formview_opsenquirydetails.FindControl("txtedit_desti") as TextBox).Text);
        m.dt.Rows.Add("@authorName", (Formview_opsenquirydetails.FindControl("txtedit_corp_cord") as TextBox).Text);
        m.dt.Rows.Add("@authortype", (Formview_opsenquirydetails.FindControl("ddloccurrence") as DropDownList).Text);
        m.dt.Rows.Add("@tagArea", (Formview_opsenquirydetails.FindControl("txtSales_initiator") as TextBox).Text);

        m.dt.Rows.Add("@pagetitle", (Formview_opsenquirydetails.FindControl("txt_pagetitle_update") as TextBox).Text);
        m.dt.Rows.Add("@metacontent", (Formview_opsenquirydetails.FindControl("txt_MetaDescription_update") as TextBox).Text);
        m.dt.Rows.Add("@metakeyword", (Formview_opsenquirydetails.FindControl("txt_MetaKeywords_update") as TextBox).Text);
        if (fup_bgimg.HasFile)
        {
            m.dt.Rows.Add("@bgImg", fileUploader(fup_bgimg));
        }
        else
        {
            m.dt.Rows.Add("@bgImg", (Formview_opsenquirydetails.FindControl("lbl_bgimg") as Label).Text);
        }
        if (fup_authImg.HasFile)
        {
            m.dt.Rows.Add("@authorImg", fileUploader(fup_authImg));
        }
        else
        {
            m.dt.Rows.Add("@authorImg", (Formview_opsenquirydetails.FindControl("lbl_authImg") as Label).Text);
        }
        m_sMessage = m.OperateData("sp_blogposting", (int)Operation.Update);

        string script = "window.onload = function(){ alert('";
        script += "Your Blog has been Updated Successfully.";
        script += "');";
        script += "window.location = '";
        script += Request.Url.AbsoluteUri;
        script += "'; }";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SuccessMessage", script, true);
        Formview_opsenquirydetails.Visible = false;
        showGridView();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tab1.CssClass = "Clicked";
            MainView.ActiveViewIndex = 0;
        }
        showGridView();
       // txt_postdate.Text = DateTime.Now.ToString();
    }
    public string fileUploader(FileUpload fup)
    {
        string path = "";
        if (fup.FileName.Length > 0)
        {
            string folderPath = Server.MapPath("images/");
            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }
            //Save the File to the Directory (Folder).
            string filepath = Path.GetFileNameWithoutExtension(fup.FileName).ToString() + Path.GetExtension(fup.FileName).ToString();
            path = "Admin/images/" + filepath;
            fup.PostedFile.SaveAs(Server.MapPath("images/" + filepath));///Admin/images/banner.jpg
            return path;
        }
        return null;
    }
    protected void btn_post_Click(object sender, EventArgs e)
    {
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 1);
        m.dt.Rows.Add("@bgImg", fileUploader(fupbgimg));
        m.dt.Rows.Add("@category", ddl_category.Text);
        m.dt.Rows.Add("@headline", txt_Headline.Text);
        m.dt.Rows.Add("@authorImg", fileUploader(fup_authorimg));
        m.dt.Rows.Add("@authorName", txt_authorname.Text);
        m.dt.Rows.Add("@authortype ", ddl_usertype.Text);
        // m.dt.Rows.Add("@postDate", txt_postdate.Text);
        // m.dt.Rows.Add("@postUpdateDate", DateTime.Now);
        m.dt.Rows.Add("@postSummery", txt_postsummery.Text);
        m.dt.Rows.Add("@postContent", RichTextBox1.Text);
        m.dt.Rows.Add("@tagArea", txt_tagarea.Text);
        m.dt.Rows.Add("@tagCloud", txt_tagcloud.Text);
        m.dt.Rows.Add("@pagetitle", txt_pagetitle.Text);
        m.dt.Rows.Add("@metacontent", txt_MetaDescription.Text);
        m.dt.Rows.Add("@metakeyword", txt_MetaKeywords.Text);
        m_sMessage = m.OperateData("sp_blogposting", (int)Operation.Insert);
        if (m_sMessage.IndexOf("Error") != 0)
        {
            string script = "window.onload = function(){ alert('";
            script += "Your Blog has been Saved Successfully.";
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SuccessMessage", script, true);
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Your post Submited Sucessfuly.');", true);
            //txt_Headline.Text = txt_authorname.Text = txt_postsummery.Text = RichTextBox.Text = txt_tagarea.Text = txt_tagcloud.Text = "";
        }
    }
     protected void btnUpload_Click(object sender, EventArgs e)
    {
        FileUpload fup = (Formview_opsenquirydetails.FindControl("FileUpload1") as FileUpload);
        TextBox tb = (Formview_opsenquirydetails.FindControl("txtedit_desti") as TextBox);        
        if (FileUpload1.HasFile)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string FilePath = "images/" + DateTime.Now.ToString("ddMMyyyhhmmss") + FileName;
            FileUpload1.SaveAs(Server.MapPath(FilePath));
            RichTextBox1.Text += string.Format("<img src = '{0}' alt = '{1}' />", ("../../Admin/"+FilePath), FileName);//"../admin/" +
        }
        else if (fup.HasFile)
        {

string FileName = Path.GetFileName(fup.PostedFile.FileName);
            string FilePath = "images/" + DateTime.Now.ToString("ddMMyyyhhmmss") + FileName;
            fup.SaveAs(Server.MapPath(FilePath));
            tb.Text += string.Format("<img src = '{0}' alt = '{1}' />", ("../../Admin/"+FilePath), FileName);

            
        }
    }
    protected void enq_dtls_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            Formview_opsenquirydetails.Visible = true;
            string lblEnquiry_id = ((Label)(enq_dtls.Rows[e.NewSelectedIndex]).Cells[0].FindControl("lblEnquiry_id")).Text;
            ShowBlogByid(Convert.ToInt32(lblEnquiry_id));
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnback_Click1(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    
    protected void Formview_opsenquirydetails_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        try
        {
            //string lblQuery_status;
            string lblEnquiry_id;
            if (e.CancelingEdit)
            {
                //ChequeBookIssue_Multiview.ActiveViewIndex = -1;
            }
            switch (e.NewMode)
            {
                case FormViewMode.Edit:
                   
                        lblEnquiry_id = ((Label)Formview_opsenquirydetails.FindControl("txtedit_payment")).Text;
                        Formview_opsenquirydetails.ChangeMode(FormViewMode.Edit);
                        ShowBlogByid(Convert.ToInt32(lblEnquiry_id));
                   
                    break;
            }
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btnupdate_Click(object sender, EventArgs e)   
    {       
            update();    
    }
    protected void enq_dtls_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    protected void enq_dtls_DataBound(object sender, EventArgs e)
    {

       
    }

    protected void Tab1_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "btn btn-large btn-info active";
        Tab2.CssClass = "btn btn-large btn-info";
        Tab3.CssClass = "btn btn-large btn-info";
        MainView.ActiveViewIndex = 0;
    }

    protected void Tab2_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "btn btn-large btn-info";
        Tab2.CssClass = "btn btn-large btn-info active";
        Tab3.CssClass = "btn btn-large btn-info";
        MainView.ActiveViewIndex = 1;
    }

    protected void Tab3_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "btn btn-large btn-info";
        Tab2.CssClass = "btn btn-large btn-info";
        Tab3.CssClass = "btn btn-large btn-info active";
        MainView.ActiveViewIndex = 2;
    }
    protected void enq_dtls_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        enq_dtls.PageIndex = e.NewPageIndex;
        showGridView();
        
    }
 protected void GVblogview_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVblogview.PageIndex = e.NewPageIndex;
        showGridView();
    }
    protected void btnUpload_Click1(object sender, EventArgs e)
    {

    }
    protected void enq_dtls_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string lblEnquiry_id = ((Label)(enq_dtls.Rows[e.RowIndex]).Cells[0].FindControl("lblEnquiry_id")).Text;
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 1);
        m.dt.Rows.Add("@blogNo", Convert.ToInt32(lblEnquiry_id));
        m_sMessage = m.OperateData("sp_blogposting", (int)Operation.Delete);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Your Blog has been Deleted Successfully.');", true);        
        showGridView();
    }
    protected void enq_dtls_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                foreach (Control control in cell.Controls)
                {
                    LinkButton button = control as LinkButton;
                    if (button != null && button.CommandName == "Delete")
                    {
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return false;";
                    }
                  
                }
            }
        }
    }
    private void ExportToExcelSheet(DataSet dt)
    {
        //Get the data we want to export.
        //DataTable dt = GetData();
        //Create a dummy GridView and Bind the data source we have.
        GridView grdExportData = new GridView();
        grdExportData.AllowPaging = false;
        grdExportData.DataSource = dt;
        grdExportData.DataBind();
        string filename = "BlogDetails_@_" + DateTime.Now.ToString("dd-MM-yyyyhh:mm:ss tt");
        //Clear the response and add the content types and headers to it.
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=" + filename + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //We need this string writer and HTML writer in order to render the grid inside it.
        StringWriter swExportData = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(swExportData);

        //Lets render the Grid inside the HtmlWriter and then automatically we will have it converted into eauivalent string.
        grdExportData.RenderControl(hw);

        //Write the response now and you will get your excel sheet as download file
        Response.Output.Write(swExportData.ToString());
        Response.Flush();
        Response.End();
    }
    protected void imgbtn_Click(object sender, ImageClickEventArgs e)
    {
        string m_sMessage = "";
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@p_SubOpMode", 1);
        m.pfn_GetData("sp_blogposting", ref ds);
        if (m_sMessage.IndexOf("Error") != 0)
        {
            ExportToExcelSheet(ds);
            ds.Clear();
        }
        else
        {
            throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
        }
    }
}