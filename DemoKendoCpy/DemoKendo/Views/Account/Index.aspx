<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
    <script src="<%= Url.Content("~/Scripts/MicrosoftAjax.debug.js") %>" type="text/javascript"></script>

    <script src="<%= Url.Content("~/Scripts/MicrosoftMvcAjax.debug.js") %>" type="text/javascript"></script>
</head>
<body>
    <div id="TargetDiv">
    <%=Html.Action("AccountPartial", "Account")%>
    </div>
</body>
</html>
