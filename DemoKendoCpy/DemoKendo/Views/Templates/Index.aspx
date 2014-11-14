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

    <div  id="content"></div>
   <script id="template" type="text/x-kendo-template">
            <div class="categoryBox">
                <div>
                    <strong>
                        #= username #
                    </strong>                    
                    <a class="box-link" href="http://www.google.co.in">
                        Read More
                    </a>
                </div>
            </div>
            </script>

<script type="text/javascript">


    $(document).ready(function() {
        var template = kendo.template($("#template").html());
        var dataSource = new kendo.data.DataSource({
            transport: {
                read: {
                    type: "POST",
                    url: "http://mobile.ajenti.com.au/iPhone/SmartGrid/Login",
                    contentType: 'application/json; charset=utf-8',
                    datatype: "json",
                    data: { username: 'kireip.demo', password: 'kireip.d3m0' }
                }
            }
        });

        dataSource.bind("change", function() {
            $("#content").html(kendo.render(template, dataSource.view()));
        });

        dataSource.read();
        //console.log(dataSource.view());

    });
            
        </script>

<style scoped>

</style>
</body>
</html>
