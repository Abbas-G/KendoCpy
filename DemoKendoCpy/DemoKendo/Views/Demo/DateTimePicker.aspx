<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DateTimePicker</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
    
        <div id="example" class="k-content">
            <input id="datetimepicker" style="width:200px;" />
			<button id="get" class="k-button">Get value</button>
        <script>
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker").kendoDateTimePicker({
                    value:new Date()
                });
				
				var datetimepicker = $("#datetimepicker").data("kendoDateTimePicker");
				$("#get").click(function() {
                        alert(datetimepicker.value());
                    });
            });
        </script>
        <style scoped>
            #to-do {
                height: 52px;
                width: 221px;
                margin: 30px auto;
                padding: 91px 0 0 188px;
                background: url('../../content/web/datepicker/todo.png') transparent no-repeat 0 0;
            }
        </style>
        </div>
</body>
</html>
