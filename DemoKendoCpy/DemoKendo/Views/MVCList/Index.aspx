<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.User>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
     <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <%using (Html.BeginForm()){%>
		    
      <%=Html.DropDownListFor(model => model.Name, (SelectList)ViewData["list"], "---Select---")%>
      
      <%--<%= Html.DropDownList("Name", (SelectList)ViewData["list"], "Any", new { Style = "width:80px;" })%>--%>

      <input type="submit" value="submit" />
      <%}%>
    </div>

</body>
</html>
