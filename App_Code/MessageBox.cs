using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// Summary description for MessageBox
/// </summary>
public class MessageBox
{
    // Lets keep the message coming from all the pages here
    static Dictionary<Page, Queue> pageTable = null;

    static MessageBox()
    {
        // Create the store
        pageTable = new Dictionary<Page, Queue>();
    }

    public static void Show(string str)
    {
        // Lets find out what page is sending the request
        Page page = HttpContext.Current.Handler as Page;

        // If a valid page is found
        if (page != null)
        {
            // Check if this page is requesing message show for the first time
            if (pageTable.ContainsKey(page) == false)
            {
                // Lets create a message queue dedicated for this page.
                pageTable.Add(page, new Queue());
            }

            // Let us add messages of this to the queue now
            pageTable[page].Enqueue(str);

            // Now let put a hook on the page unload where we will show our message
            page.Unload += new EventHandler(page_Unload);
        }
    }

    static void page_Unload(object sender, EventArgs e)
    {
        // Lets find out which page is getting unloaded
        Page page = sender as Page;

        // If a valid page is founf
        if (page != null)
        {
            // Extract the messages for this page and push them to client side
            //HttpContext.Current.Response.Write("<script>alert('" + pageTable[page].Dequeue() + "');</script>");
            HttpContext.Current.Response.Write("<script>popUp('" + pageTable[page].Dequeue() + "','Message');</script>");
        }
    }
    //public static void ShowMessage(object sender)
    //{
    //    string message = "alert('Hello! Mudassar.')";
    //    ScriptManager.RegisterClientScriptBlock((sender as Control), "alert", message, true);
    //}

    public static void ShowUp(object sender, string message)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("popUp('");
        sb.Append(message.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("','Message!!');");
        string str = sb.ToString();//"alert('" + message + "')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), sender.GetType(), "message", str, true);
    }
    public static void SuccessDiv(object sender, string message)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("SuccessDiv('");
        sb.Append(message.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("','Message!!');");
        string str = sb.ToString();//"alert('" + message + "')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), sender.GetType(), "message", str, true);
    }
    public static void FailiureDiv(object sender, string message)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("FailiureDiv('");
        sb.Append(message.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("','Message!!');");
        string str = sb.ToString();//"alert('" + message + "')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), sender.GetType(), "message", str, true);
    }
    public static void WarningDiv(object sender, string message)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("WarningDiv('");
        sb.Append(message.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("','Message!!');");
        string str = sb.ToString();//"alert('" + message + "')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), sender.GetType(), "message", str, true);
    }
    public static void PopUp(object sender, string message,string messageType)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("popUp('");
        sb.Append(message.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("','" + messageType);
        sb.Append("');");
        string str = sb.ToString();//"alert('" + message + "')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), sender.GetType(), "message", str, true);
    }
}
