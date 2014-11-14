<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>PreventDefault</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <a href="http://css-tricks.com/return-false-and-prevent-default/" id="RT" >return false</a>
    
    <a href="http://css-tricks.com/return-false-and-prevent-default/" id="PD" >PreventDefault</a>
    
    <a href="http://css-tricks.com/return-false-and-prevent-default/" id="RF" >return true</a>
    </div>
    
    <script language="javascript">
        $("#PD").click(function(e) {
            e.preventDefault();
            e.stopPropagation();
        });
        
        $("#RT").click(function(e) {
            return false;
        });

        $("#RF").click(function(e) {
            return true;
        });
    </script>
</body>
</html>
