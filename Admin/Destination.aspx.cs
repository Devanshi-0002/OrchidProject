using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
public partial class Admin_Destination : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login_Id"] == null || Session["LoginRef_Id"] == null || Session["UserPassword"] == null || Session["User_Category_Id"] == null || Session["ReportingHd"] == null)
            {
                Response.Redirect("Login.aspx");             
                Session.Clear();
                Session.RemoveAll();
            }
            else
            {
                FillCountry(ref dllcountry);
            }
        }
    }
    public void FillCountry(ref DropDownList ddlcont)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Fill_Country");
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            ddlcont.DataSource = ds;
            ddlcont.DataTextField = "Country_Name";
            ddlcont.DataValueField = "Country_Id";
            ddlcont.DataBind();
            ddlcont.Items.Insert(0, "--Select--");
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_DomesticCity");
            cmd.CommandType = CommandType.StoredProcedure;
            if (ddldomestinRegional.SelectedIndex > 0 & txtdomesticcityname.Text!="")
            {
                cmd.Parameters.AddWithValue("@Domestic_Regional", ddldomestinRegional.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@Domestic_Name", txtdomesticcityname.Text);
                if (Domestic_Cityimage1.HasFile)
                {
                    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + Domestic_Cityimage1.FileName).ToString() + Path.GetExtension(Domestic_Cityimage1.FileName).ToString();
                    string path = "~/img_destination/" + filepath;
                    Domestic_Cityimage1.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                    cmd.Parameters.AddWithValue("@Dom_image1", path.Trim());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Dom_image1",  "");
                }
                if (Domestic_Cityimage2.HasFile)
                {
                    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + Domestic_Cityimage2.FileName).ToString() + Path.GetExtension(Domestic_Cityimage2.FileName).ToString();
                    string path = "~/img_destination/" + filepath;
                    Domestic_Cityimage2.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                    cmd.Parameters.AddWithValue("@Dom_image2", path.Trim());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Dom_image2", "");
                }
                if (Domestic_Cityimage3.HasFile)
                {
                    string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + Domestic_Cityimage3.FileName).ToString() + Path.GetExtension(Domestic_Cityimage3.FileName).ToString();
                    string path = "~/img_destination/" + filepath;
                    Domestic_Cityimage3.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                    cmd.Parameters.AddWithValue("@Dom_image3", path.Trim());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Dom_image3", "");
                }
                x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                if (x > 0)
                {
                    //ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Record Save Successfully.');", true);
                    MessageBox.ShowUp(sender, "Domestic City Save Successfully.");
                    txtdomesticcityname.Text = "";
                    ddldomestinRegional.SelectedIndex = -1;
                }
                else
                {
                    MessageBox.PopUp(sender, " Domestic City Save Failed....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, " Please Fill all the Fields ....", "Error!!");
                //MessageBox.PopUp(sender, " Please Fill the name....", "Error!!");
            }

        }
        catch (Exception ex) { throw ex;}
       
    }
    protected void btnBoarding_placesave_Click(object sender, EventArgs e)
    {
         try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_International");
            cmd.CommandType = CommandType.StoredProcedure;
            if (dllcountry.SelectedIndex > 0)
            {
                if (ddlinternationalRegional.SelectedIndex > 0 & txtInternationalCityname.Text != "")
                {
                    cmd.Parameters.AddWithValue("@International_Regional", ddlinternationalRegional.SelectedItem.Text.Trim());
                    cmd.Parameters.AddWithValue("@International_Name", txtInternationalCityname.Text);
                    cmd.Parameters.AddWithValue("@CounrtyID", dllcountry.SelectedValue.ToString());
                    if (International_Cityimage1.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + International_Cityimage1.FileName).ToString() + Path.GetExtension(International_Cityimage1.FileName).ToString();
                        string path = "~/img_destination/" + filepath;
                        International_Cityimage1.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                        cmd.Parameters.AddWithValue("@Inter_image1", path.Trim());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Inter_image1", "");
                    }
                    if (International_Cityimage2.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + International_Cityimage2.FileName).ToString() + Path.GetExtension(International_Cityimage2.FileName).ToString();
                        string path = "~/img_destination/" + filepath;
                        International_Cityimage2.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                        cmd.Parameters.AddWithValue("@Inter_image2", path.Trim());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Inter_image2", "");
                    }
                    if (International_Cityimage3.HasFile)
                    {
                        string filepath = Path.GetFileNameWithoutExtension(DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + International_Cityimage3.FileName).ToString() + Path.GetExtension(International_Cityimage3.FileName).ToString();
                        string path = "~/img_destination/" + filepath;
                        International_Cityimage3.PostedFile.SaveAs(Request.MapPath("~/img_destination/") + filepath);
                        cmd.Parameters.AddWithValue("@Inter_image3", path.Trim());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Inter_image3", "");
                    }
                    x = Dataacces.Dataconnection.ExecuteQuery(cmd);
                    if (x > 0)
                    {
                        MessageBox.ShowUp(sender, "International City Save Successfully.");
                        txtInternationalCityname.Text = "";
                        ddlinternationalRegional.SelectedIndex = -1;
                        dllcountry.SelectedIndex = -1; 
                    }
                    else
                    {
                        MessageBox.PopUp(sender, "International City Save Failed....", "Error!!");
                    }
                }
                else
                {
                    MessageBox.PopUp(sender, "Please Fill all the Fields....", "Error!!");
                }
            }
            else
            {
                MessageBox.PopUp(sender, "Please Select  Country Name....", "Error!!");
            }

        }
        catch (Exception ex) { throw ex;}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtdomesticcityname.Text = "";
        ddldomestinRegional.SelectedItem.Text = "Select--";
    }
    protected void btnResetinternational_Click(object sender, EventArgs e)
    {
        txtInternationalCityname.Text = "";
        ddlinternationalRegional.SelectedItem.Text = "Select--";
    }
}