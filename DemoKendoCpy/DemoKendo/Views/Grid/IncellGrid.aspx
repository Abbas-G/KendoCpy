<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>IncellGrid</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <div id="grid"></div>
    </div>
    <script>
       // var testData = [{ "UserId": 14, "UserName": "Alex", "Unit": "test", "Email": "alex@hotmail.com", "Indienst": "13/2/2014", "Uitdienst": "28/2/2014", "Roles": "Administrator" }, { "UserId": 12, "UserName": "Chris", "Unit": "second", "Email": "chris@hotmail.com", "Indienst": "2/2/2014", "Uitdienst": "14/2/2014", "Roles": "Administrator" }, { "UserId": 15, "UserName": "Random", "Unit": "second", "Email": "Rad@Rand.com", "Indienst": "20/2/2014", "Uitdienst": "30/12/2014", "Roles": "Consultant" }, { "UserId": 13, "UserName": "Wouter", "Unit": "test", "Email": "bb@mail", "Indienst": "26/2/2014", "Uitdienst": "26/10/2014", "Roles": "Accounting"}];
        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", '<%=Url.Content("~/Grid/GetJsonOutputForFoodUniqueCategory")%>', false);
        xhReq.send(null);
        var GlobalSearchFOOD = JSON.parse(xhReq.responseText);
        var record = 0;

        var globFlag = true;
        $(document).ready(function() {
            var crudServiceBaseUrl = '<%=Url.Content("~/Grid")%>';
            $("#grid").kendoGrid({
                columns: [
                            { title: "&nbsp;", template: "#= ++record #", width: 30 },
                            { field: "ProductName", title: "Product Name" },
                            { field: "UnitPrice", title: "Unit Price", format: "{0:c}" },
                            { field: "UnitsInStock", title: "Units In Stock" },
                            { field: "Discontinued", width: "100px" },
                            { field: "Category", title: "Category", filterable: { ui: GroupFilter }, editor: ColumnGroupFilter },
                { command: ["destroy"], title: "&nbsp;", width: "172px" }
                            ],
                editable: "incell"
            ,
                dataSource: {
                    //change() gets called on ds.sync(),
                    //so since sync() won't fire our update() method
                    //we do it ourselves
                    change: function(e) {
                        var ds = $("#grid").data('kendoGrid').dataSource;

                        if (e.action == "itemchange") {
                            var dataItem = ds.getByUid(e.items[0].uid);
                            ds.transport.update(dataItem);
                            alert(dataItem);
                        }
                        if (e.action == "remove") {
                            var dataItem = ds.getByUid(e.items[0].uid);
                            ds.transport.destroy(dataItem);
                            alert(dataItem);
                        }
                    },
                    transport: {
                        //                    read: function() {
                        //                        $("#grid").data("kendoGrid").dataSource.data(testData);
                        //                    }
                        read: {
                            url: crudServiceBaseUrl + "/GetJsonOutputForGridDataSelect",
                            dataType: "json",
                            type: "POST"
                        },
                        update: function(dataItem) {
                            alert('gets fired update!');
                            //console.log(dataItem);
                            //TODO: Save logic
                        },
                        destroy: function(dataItem) {
                            alert('gets fired now!');
                            //console.log(dataItem);
                            //TODO: Save logic
                        },
                        parameterMap: function(options, operation) {
                            if (operation !== "read" && options.models) {
                                return { models: kendo.stringify(options.models) };
                            }
                        }
                    }
                }
,
                schema: {
                    model: {
                        id: "ProductID",
                        fields: {
                            ProductID: { editable: false, nullable: true },
                            ProductName: { validation: { required: true, validationMessage: "Please enter time"} },
                            UnitPrice: { type: "number", validation: { required: true, min: 1} },
                            Discontinued: { type: "boolean" },
                            UnitsInStock: { type: "number", validation: { min: 0, required: true} },
                            Category: { type: "string", validation: { required: true} }
                        }
                    }
                },
                edit: function(e) {
                      //if ( globFlag ) {
                       //   this.closeCell();
                      //}
                  }
            });


            $(".k-grid-my-create", grid.element).on("click", function(e) {
                var grid = $("#grid").data("kendoGrid");
                grid.dataSource.filter({});
                grid.dataSource.sort({});
                grid.addRow();
            });
        });

            function ColumnGroupFilter(container, options) {
                $('<input required="required" name="' + options.field + '"/>').appendTo(container).kendoComboBox({
                    dataTextField: "Category",
                    dataValueField: "Category",
                    dataSource: GlobalSearchFOOD

                });
                $('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);
            }

            function GroupFilter(e) {
                e.kendoDropDownList({
                    dataSource: GlobalSearchFOOD,
                    dataTextField: "Category",
                    dataValueField: "Category"
                });
            }

            function ProductChange() {
                $.ajax({
                    url: crudServiceBaseUrl+"/SearchFOODbyCategory"
                       , type: "POST"
                       , data: { searchString: $("#products").val() }
                       , success: function(result) {
                           //$("#grid").data("kendoGrid").dataSource.data(JSON.parse(result)); //if return type is string
                           $("#grid").data("kendoGrid").dataSource.data(result);
                       }
                });
            }
    </script>
</body>
</html>
