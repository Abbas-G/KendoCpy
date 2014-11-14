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
    <div>
    
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
        var aa = { fsFolder: 'Rutila and the Ngarluma Aboriginal Corporation Complete Native Title Agreement (2)' };
            $.ajax({
                type: "POST",
                url: 'http://localhost:8159/Service/PDFTOHTMLService/PDFTOHTMLService.asmx/getHtmlDetailJSON',
                data: JSON.stringify(aa),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: htmlSuccess,
                error: htmlFail
            });
        });

        function htmlSuccess(jsondata) {
            var myData = jsondata.d; // data.d is a JSON formatted string, to turn it into a JSON object
            alert(myData.url);
        }

        function htmlFail(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.responseText + ' , ' + textStatus + ' , ' + errorThrown);
        }
    </script>
</body>
</html>
