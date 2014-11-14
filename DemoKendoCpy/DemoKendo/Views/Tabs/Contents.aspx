<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>

    <div id="example" class="k-content">
    <div class="wrapper">
        <div id="tabstrip">
            <ul>
                <li class="k-state-active">Dimensions &amp; ListView</li>
                <li>Uploader</li>
                <li>Window</li>
            </ul>
        </div>
    </div>
 
</div>

<script>
    $(document).ready(function () {
        $("#tabstrip").kendoTabStrip({
            animation: { open: { effects: "fadeIn"} },
            contentUrls: [
                        '<%= Url.Content("~/ListView/ProjectsList") %>',
                        '<%= Url.Content("~/Uploader/MultiFile") %>',
                        '<%= Url.Content("~/Window/Validator") %>'
                    ]
        });
    });
</script>

    

<style scoped>

</style>
</body>
</html>
