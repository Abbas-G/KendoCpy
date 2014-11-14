<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>InlineEditing</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <div>
    <div id="viewSCtable" style="width: 75%"></div>

<script type="text/javascript" charset="UTF-8">
        $(document).ready(function () {

            var UserGroup = [{
                UserGroupName: "Guest",
                Status: "Active",
                NoOfUsers: 4,
                CreatedDate: "2013-04-24T00:00:00",
                Description: "Can be used  by Guest for"
            }, {
                UserGroupName: "Exportor",
                Status: "Active",
                NoOfUsers: 4,
                CreatedDate: "2013-04-24T00:00:00",
                Description: "Can be used  by Guest for"

            }, {
                UserGroupName: "Sales",
                Status: "Active",
                NoOfUsers: 4,
                CreatedDate: "2013-04-24T00:00:00",
                Description: "Can be used  by Guest for"

            }];
            function getUserGroup() {
                return UserGroup;
            }

            var element = $("#viewSCtable").kendoGrid({
                dataSource: {
                    data: getUserGroup(),
                    schema: {
                        model: {
                            fields: {
                                UserGroupName: { type: "string" },
                                Status: { type: "string" },
                                NoOfUsers: { type: "number" },
                                CreatedDate: { type: "string" },
                                Description: { type: "string" }
                            }
                        }
                    },
                    pageSize: 10
                },
                dataBound: function () {
                },
                scrollable: true,
                sortable: {
                    mode: "multiple",
                    allowUnsort: true
                },
                reorderable: true,
                refreshable: true,
                resizable: true,
                pageable: {
                    input: true,
                    numeric: false,
                    pageSizes: true
                },
                sortable: true,
                //filterable: {
                //    extra: false,
                //    operators: {
                //        string: {
                //            startswith: "Starts with",
                //            contains: "Contains"
                //        }
                //    }
                //},

                columns: [
                    { field: "UserGroupName", title: "User Group Name", width: "12%", attributes: { style: "text-align:left;" } },
                    { field: "Status", title: "Status", width: "10%", attributes: { style: "text-align:left;" } },
                    { field: "Description", title: "Description", width: "25%", attributes: { style: "text-align:left;" },
                    template: '<span>#: Description #<img src="../Content/icons/trash1.png" title="Edit Description" style="float:right;width:9%;cursor: pointer;" onclick="onEdit(this.row)"/></span>'
                    },
                    { field: "NoOfUsers", title: "No of Users", width: "10%" },
                    { command: [{ name: "destroy", width: "1%", template: "<a href='javascript: void(0)' onclick='deleteRow(this)' title='Edit'>Edit</a> / <a href='javascript: void(0)' onclick='deleteRow(this)' title='Delete'>Delete</a>" }], title: "Action" },
                ],
            });
        });

        function deleteRow(element) {
            grid = $("#viewSCtable").data("kendoGrid");
            grid.removeRow($(element).closest("tr"));
        }
        function onEdit(e) {

            var selected = grid.select();
            if (selected && selected.length > 0) {
                $.each(selected, function (idx, elem) {
                    grid.editRow(grid.select());
                });
            }
        }

</script>
    </div>
</body>
</html>
