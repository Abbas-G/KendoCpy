<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <div id="div1">
    <% using (Html.BeginForm()) {%>
<input type="submit" value="submit" />
<%} %>
    </div>
    
    <div id="div2">
    <%Html.RenderAction("PartialView1", "twoform"); %>
    </div>
</body>
</html>
