<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>InsideGridClick</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
<input type=button onclick="checkAllbox()" value="Check all check box" />
    <div id="grid"></div>
    <div id="details"></div>
    <script>
        $(document).ready(function() {
            var data = [
    { name: "aaa", quantity: 1 },
    { name: "bbb", quantity: 4 },
    { name: "ccc", quantity: 9 }
];

            var grid = $('#grid').kendoGrid({
                dataSource: data,
                columns: [
        { field: 'name', template: '<a href="\\#" class="k-button link">#= name #</a>' },
        { field: 'quantity' },
        { title: "Submit", width: 60, template: "<input class='check_row nsa-checkbox' type='checkbox' />" }
    ]
            }).data('kendoGrid');

            grid.table.on('click', '.link', function(e) {
                showDetails.call(grid, e);
            });

            $('#grid').on('change', '.nsa-checkbox', function(e) {
                // "this" is your checkbox
                var myCheckbox = $(this);

                // To get the item, you must access the data-uid attribute in the row that wraps the checkbox.
                var myDataItem = $("#grid").data("kendoGrid").dataSource.getByUid(myCheckbox.closest('tr').attr('data-uid'));
                alert(myDataItem.name);

                // Have fun
            });

            

        });
    function showDetails(e) {
        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        document.getElementById('details').innerHTML = dataItem.quantity;
    }

    function checkAllbox() {
        $('.nsa-checkbox:checked').each(function(index, checkbox) {
        var myCheckbox = $(this);
        var myDataItem = $("#grid").data("kendoGrid").dataSource.getByUid(myCheckbox.closest('tr').attr('data-uid'));
        alert(myDataItem.name);
        }) 
    }
    </script>
</body>
</html>
