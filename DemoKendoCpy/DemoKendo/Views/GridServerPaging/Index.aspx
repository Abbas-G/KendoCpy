<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Server grid</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min2.js")%>"></script>
</head>
<body>
    <div id="grid"></div>
    
    
    <script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                    <label for="products">Search Products by Category:</label><input id="products" class="k-textbox"/>
                    <input type="button" value="search" onClick="ProductChange()" class="k-button"/>
                </div>
                
 </script>
     <script>
         var xhReq = new XMLHttpRequest();
         xhReq.open("POST", '<%=Url.Content("~/GridServerPaging/GetJsonOutputForFoodUniqueCategory")%>', false);
         xhReq.send(null);
         var GlobalSearchFOOD = JSON.parse(xhReq.responseText);
         var record = 0;

         $(document).ready(function() {
             var crudServiceBaseUrl = '<%=Url.Content("~/GridServerPaging")%>',

                        dataSource = new kendo.data.DataSource({
                            transport: {
                                read: {
                                    url: crudServiceBaseUrl + "/GetJsonOutputForGridDataSelect",
                                    dataType: "json",
                                    type: "POST"
                                },
                                update: {
                                    url: crudServiceBaseUrl + "/GetJsonOutputForGridDataUpdatePopup",
                                    dataType: "json",
                                    type: "POST"
                                },
                                destroy: {
                                    url: crudServiceBaseUrl + "/GetJsonOutputForGridDataDeletePopup",
                                    dataType: "json",
                                    type: "POST"
                                },
                                create: {
                                    url: crudServiceBaseUrl + "/GetJsonOutputForGridDataCreatePopup",
                                    dataType: "json",
                                    type: "POST"
                                },
                                parameterMap: function(options, operation) {
                                    if (operation !== "read" && options.models) {
                                        return { models: kendo.stringify(options.models) };
                                    }
                                }
                            },
                            //batch: true,
                            pageSize: 3,
                            schema: {data: "data", // records are returned in the "data" field of the response
                                     total: "total",
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
                            serverPaging: true,
                            serverSorting: true,
                            serverFiltering: true
                        });

             $("#grid").kendoGrid({
                 dataSource: dataSource,
                 pageable: {
                    refresh: true,
                    pageSize: true
                },
                 filterable: { extra: false },
                 sortable: true,
                 toolbar: [{
                     name: "my-create",
                     text: "Add new record"
                 }, { text: "", template: kendo.template($("#template").html())}],
                 columns: [
                            { title: "&nbsp;", template: "#= ++record #", width: 30 },
                            { field: "ProductName", title: "Product Name" },
                            { field: "UnitPrice", title: "Unit Price", format: "{0:c}" },
                            { field: "UnitsInStock", title: "Units In Stock" },
                            { field: "Discontinued", width: "100px" },
                            { field: "Category", title: "Category", filterable: { ui: GroupFilter }, editor: ColumnGroupFilter },
                            { command: ["edit", "destroy"], title: "&nbsp;", width: "172px"}],
                 editable: "inline",
                 dataBinding: function() {
                     record = (this.dataSource.page() - 1) * this.dataSource.pageSize();

                 }
             });

             $(".k-grid-my-create", grid.element).on("click", function(e) {
                 var grid = $("#grid").data("kendoGrid");

                 //disable filter when creating records
                 grid.dataSource.filter({});
                 grid.dataSource.sort({});
                 //add record using Grid API

                 //edit on first
                 grid.addRow();

                 /*//edit on last record
                 var dataSource = grid.dataSource;
                 var total = dataSource.data().length;
                 dataSource.insert(total, {});
                 dataSource.page(dataSource.totalPages());
                 grid.editRow(grid.tbody.children().last());*/
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
                    url: "/GridServerPaging/SearchFOODbyCategory"
                       , type: "POST"
                       , data: { searchString: $("#products").val() }
                       , success: function(result) {
                        //$("#grid").data("kendoGrid").dataSource.data(JSON.parse(result)); //if return type is string
                        $("#grid").data("kendoGrid").dataSource.data(result);
                       }
                    });
                }
                
                function createNew() {
                var grid = $("#grid").data("kendoGrid");
                grid.dataSource.filter({});
                grid.dataSource.sort({});
                //add record using Grid API
                grid.addRow();
            }

            
            </script>
            
  <!-- this style is add to solve "validation msg hidding in the bottom of grid" by changing validation style-->          
  <style>
#grid .k-tooltip-validation {
    margin-top: 0 !important;
    display: block;
    position: static;
    padding: 0;
}
  
#grid .k-callout {
    display: none;
}
            </style>
</body>
</html>
