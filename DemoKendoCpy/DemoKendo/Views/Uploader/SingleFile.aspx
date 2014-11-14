<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
        <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />
<%--<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>--%>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    
        <div id="example" class="k-content">
            <div class="configuration">
                <span class="infoHead">Information</span>
                <p>
                    The Upload can be used as a drop-in replacement
                    for file input elements.
                </p>
                <p>
                    This "synchronous" mode does not require
                    special handling on the server.
                </p>
            </div>
            <form method="post" action="<%= Url.Content("~/Uploader/SingleFileUpload") %>" style="width:45%">
                <div class="demo-section">
                    <input name="files" id="files" type="file" />
                    <p>
                        <input type="submit" value="Submit" class="k-button" />
                    </p>
                </div>
            </form>
            <script>
                $(document).ready(function() {
                $("#files").kendoUpload({
                select: onSelect,
                multiple: false
                });
            });
            function onSelect(e) {
                // alert(e.files.length);
                if ($('#files').parent().children('input[type=file]:not(#files)').length >= 1) {
                    e.preventDefault();
                    alert("Max files allowed: " + 1);
                }
                if (e.files.length > 1) {
                    alert("Please select max 1 files.");
                    e.preventDefault();
                }
                $.each(e.files, function(index, value) {
                //alert(value.extension);
                    if (value.extension != ".png") {
                        e.preventDefault();
                        alert("Please upload PNG image files");
                    }
                });
            }
 
            </script>
        </div>


</body>
</html>
