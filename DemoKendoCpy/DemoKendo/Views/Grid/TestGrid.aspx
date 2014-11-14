<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TestGrid</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black" href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"
        id="stylesheet" />
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>

</head>
<body>
    <a id="button" href="#">Click me</a>
<div id="grid"></div>

<script>
    var dataSource, grid;
    $(document).ready(function () {
        dataSource = new kendo.data.DataSource({
            data: [
                { category: "Beverages", name: "Chai", price: 18},
                { category: "Seafood", name: "Konbu", price: 6}
            ],
        })

        grid = $("#grid").kendoGrid({
            dataSource: dataSource,
            editable: true,
        }).data("kendoGrid");

        $('#button').click(function (e) {
            var data = grid.dataItem("tr:eq(1)");
            data.set('category', 'Merchandice');
        });
    });
</script>
</body>
</html>
