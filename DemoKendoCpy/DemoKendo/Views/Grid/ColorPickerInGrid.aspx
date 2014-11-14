<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ColorPickerInGrid</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black" href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"
        id="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>

</head>
<body>
    <div>
    <div id="grid"></div>
    </div>
    <script>
        function createRandomData(n) {
            var data = [];
            for (var i = 0; i < n; i++) {
                var r = Math.floor(Math.random() * 255);
                var g = Math.floor(Math.random() * 255);
                var b = Math.floor(Math.random() * 255);
                var hex = (r * 65536 + g * 256 + b);
                hex = "#" + ("000000" + hex.toString(16)).substr(-6);
                var elem = { Id: i + 1, Color: hex };
                data.push(elem)
            }
            return data;
        }

        var ds = new kendo.data.DataSource({
            data: createRandomData(20),
            pageSize: 10,
            schema: {
                model: {
                    id: "Id",
                    fields: {
                        Id: { type: 'number' },
                        Color: { type: 'string' }
                    }
                }
            }
        });

        var grid = $("#grid").kendoGrid({
            dataSource: ds,
            editable: "popup", //inline
            pageable: true,
            columns: [
        { command: ["edit"] },
        { field: "Id", width: 100, title: "Id" },
        {
            field: "Color",
            width: 150,
            title: "Color",
            template: function(dataItem) {
                return "<div style='background-color: " + dataItem.Color + ";'>&nbsp;</div>";
            },
            editor: function(container, options) {
                // create an input element
                var input = $("<input/>");
                // set its name to the field to which the column is bound ('name' in this case)
                input.attr("name", options.field);
                // append it to the container
                input.appendTo(container);
                // initialize a Kendo UI AutoComplete
                input.kendoColorPicker({
                    value: options.model.Color,
                    buttons: false
                });
            }
        }
    ]
        }).data("kendoGrid");
    </script>
</body>
</html>
