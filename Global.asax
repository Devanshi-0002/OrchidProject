<%@ Application Language="C#" %>
<%@ Import Namespace="NewZenith" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }
 void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Session["search"] = "";
        Session["cat_dtls"] = "";
        Session["category"] = "";
        Session["bno"] = "";
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
</script>
