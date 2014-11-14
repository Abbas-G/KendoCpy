<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Batch</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" title="custom_black" href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"
        id="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>

</head>
</head>
<body>
    <div id="example" class="k-content">
        <div id="grid">
        </div>
        <table id="target" class="k-widget k-grid">
            <thead>
                <tr>
                    <th class="k-header" colspan="2" rowspan="4">
                        Drop inside this area
                        &nbsp;<br /><br /><br />
                    </th>
                </tr>
            </thead>
        </table>

        <script>
            $(document).ready(function() {

                dataSource = new kendo.data.DataSource({
                    transport: {
                        read: {
                            url: "http://localhost:2088/BatchEditting/GetJsonOutputForGridDataSelect?q='abc'",
                            dataType: "json",
                            type: "POST"
                        },
                        update: {
                            url: "http://localhost:2088/BatchEditting/GetJsonOutputForGridDataUpdate",
                            dataType: "json",
                            type: "POST"
                        },
                        destroy: {
                            url: "http://localhost:2088/BatchEditting/GetJsonOutputForGridDataDelete",
                            dataType: "json",
                            type: "POST"
                        },
                        create: {
                            url: "http://localhost:2088/BatchEditting/GetJsonOutputForGridDataCreate",
                            dataType: "json",
                            type: "POST"
                        },
                        parameterMap: function(options, operation) {
                            if (operation !== "read" && options.models) {
                                alert(kendo.stringify(options.models));
                                return { models: kendo.stringify(options.models) };
                            }
                        }
                    },
                    batch: true,
                    pageSize: 20,
                    schema: {
                        model: {
                            id: "ProductID",
                            fields: {
                                ProductID: { editable: false, nullable: true },
                                ProductName: { validation: { required: true} },
                                UnitPrice: { type: "number", validation: { required: true, min: 1} },
                                Discontinued: { type: "boolean" },
                                UnitsInStock: { type: "number", validation: { min: 0, required: true} }
                            }
                        }
                    }
                });

                var grid = $("#grid").kendoGrid({
                    dataSource: dataSource,
                    navigatable: true,
                    pageable: true,
                    height: 430,
                    toolbar: ["create", "save", "cancel"],
                    columns: [
                            "ProductName",
                            { field: "ProductID", title: "ProductID" },
                            { field: "UnitPrice", title: "Unit Price", format: "{0}", width: 110 },
                            { field: "UnitsInStock", title: "Units In Stock", width: 110 },
                            { field: "Discontinued", width: 110 },
                            { command: "destroy", title: "&nbsp;", width: 90}],
                    editable: true/*,
                        dragstart: function() { aler("drag start"); },
                        dragend: function() { alert("drag end"); }*/
                }).data('kendoGrid');

                /*grid.table.kendoDraggable({
                filter: "tbody > tr:not(.k-grid-edit-row)",
                group: "gridGroup",
                hint: function(e) {
                return $('<div class="k-grid k-widget"><table><tbody><tr>' + e.html() + '</tr></tbody></table></div>');
                }
                });*/

                grid.table.kendoDraggable({
                    filter: "tbody > tr:not(.k-grid-edit-row)",
                    // group: "gridGroup",
                    hint: function(e) {
                        item = $('<div class="k-grid k-widget" style="background-color: lightblue; color: black;"><table><tbody><tr>' + e.html() + '</tr></tbody></table></div>');
                        return item;
                    }
                });
                $("#target").kendoDropTarget({
                    drop: function(e) {
                        //alert("as");
                    //alert(e.model.ProductID);
                        //e.dropTarget.append($(e.draggable.currentTarget).clone());
                    }
                });

                /* grid.table.kendoDropTarget({
                group: "gridGroup",
                drop: function(e) {
                e.draggable.hint.hide();
                var target = dataSource.getByUid($(e.draggable.currentTarget).data("uid")),
                dest = $(document.elementFromPoint(e.clientX, e.clientY));

                            if (dest.is("th")) {
                return;
                }

                            dest = dataSource.getByUid(dest.parent().data("uid"));

                            if (target.get("Id") !== dest.get("Id")) {
                var tmp = target.Priority;
                target.Priority = dest.Priority;
                dest.Priority = tmp;

                                dataSource.sort({ field: "Priority", dir: "asc" });
                }
                }
                });*/
            });
        </script>

    </div>
</body>
</html>
