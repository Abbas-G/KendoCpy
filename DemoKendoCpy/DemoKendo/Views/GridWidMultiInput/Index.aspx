<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>InlineEditing2</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div id="grid"></div>
    <script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                    <label for="products">Search Products by Category:</label><input id="products" class="k-textbox"/>
                    <input type="button" value="search" onClick="ProductChange()" class="k-button"/>
                </div>     
                <button type="button" id="btnExport"  class="k-button" onClick="ExportToCSV()" >Export to csv!</button>
 </script>
 
 <script id="MultiSelectTemplate" type="text/x-kendo-template">
                    <strong>
                        #= Category #
                    </strong>                    
            </script>
     <script>
         var xhReq = new XMLHttpRequest();
         xhReq.open("POST", '<%=Url.Content("~/GridWidMultiInput/GetJsonOutputForFoodUniqueCategory")%>', false);
         xhReq.send(null);
         var GlobalSearchFOOD = JSON.parse(xhReq.responseText); //here previously data was like [{category:"asd"},{category:"asd"}] but now ["Surati", "Mumbai", "Chinese", "South Indian"]
         var record = 0;
        // var food = ["Surati", "Mumbai", "Chinese", "South Indian"];

         $(document).ready(function() {
             var crudServiceBaseUrl = '<%=Url.Content("~/GridWidMultiInput")%>',

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

                                        //var result = jQuery.parseJSON(kendo.stringify(options.models));
                                        //                                        var myJSONObject = { "bindings": [
                                        //                                                { "ircEvent": "PRIVMSG", "method": "newURI", "regex": "^http://.*" },
                                        //                                                { "ircEvent": "PRIVMSG", "method": "deleteURI", "regex": "^delete.*" },
                                        //                                                { "ircEvent": "PRIVMSG", "method": "randomURI", "regex": "^random.*" }
                                        //                                            ]
                                        //                                        };
                                        //                                        var obj = JSON.parse(JSON.stringify(myJSONObject));
                                        //                                        alert(obj.bindings[0].method);

                                        // var myJsonstr = { "d": { "inCount": 13, "stFirstFile": "/DemoMP3PDF/BHTML/Westpac/01.HTML"} };
                                        //var obj = JSON.parse(JSON.stringify(myJsonstr));
                                        //alert(obj.d.inCount);

                                        //                                        alert(JSON.stringify(options.models));
                                        //                                        var obj = JSON.parse(JSON.stringify(options.models));
                                        //                                        alert(obj[0].ProductName);
                                        return { models: kendo.stringify(options.models) };
                                    }
                                }
                            },
                            batch: true,
                            serverPaging: false,
                            pageSize: 3,
                            schema: {
                                model: {
                                    id: "ProductID",
                                    fields: {
                                        ProductID: { editable: false, nullable: true },
                                        ProductName: { validation: { required: true, validationMessage: "Please enter time"} },
                                        UnitPrice: { type: "number", validation: { required: true, min: 1} },
                                        Discontinued: { type: "boolean" },
                                        UnitsInStock: { type: "number", validation: { min: 0, required: true} },
                                        Category: { validation: { required: true}} // type: "string" is remove as we need to use array for multiselect
                                    }
                                }
                            }
                        });

             $("#grid").kendoGrid({
             dataSource: dataSource,
                dataBound: onDataBound, // Added for user permission
                dataBinding: onDataBinding, //Added for user permission
                 /*pageable: {
                 input: true,
                 numeric: false
                 },*/
                 pageable: {
                     refresh: true,
                     pageSizes: true
                 },
                 //height: 430,
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
                            { field: "Category", title: "Category", filterable: { ui: GroupFilter }, editor: foodEditor, template: "#= Category.join(', ') #" },
                            { command: ["edit", "destroy"], title: "&nbsp;", width: "172px"}],
                 editable: "inline",
                 dataBinding: function() {
                     record = (this.dataSource.page() - 1) * this.dataSource.pageSize();

                 },
                 edit: function(e) {
                     if (!e.model.ProductID) {
                         // $(".k-grid-update").html("<span class=\"k-icon k-update\"></span>Create");
                         //or
                         $(e.container).parent().find(".k-grid-update").html('<span class="k-icon k-update"></span>Create');
                         $(e.container).parent().find(".k-grid-cancel").html('<span class="k-icon k-cancel"></span>Cancel');
                     }
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

             /*$('#grid').data().kendoGrid.dataSource.bind('change', function(e) { 
             
             });*/
             hidetoolbar();
         });


/********************Hide Add updete tool bar on user permission****/
         function onDataBound(arg) {
             hidetoolbar();
         }

         function onDataBinding(arg) {
             hidetoolbar();
         }

        function hidetoolbar(){
            //if(user.Role.Permission != "Edit"){
//            $("#grid .k-add").parent().hide();
//            $("#grid .k-update").parent().hide();
//            $("#grid .k-cancel").parent().hide();
//                //OR
//            $("#grid .k-add").parent().remove();
//            $("#grid .k-update").parent().remove();
//            $("#grid .k-cancel").parent().remove();
            //}
            if ("Admin" == "Edit") {
            $("#grid .k-grid-edit").parent().hide();
            $("#grid .k-grid-my-create").hide();
            }
            
        }
        /********************Hide Add updete tool bar on user permission****/

                /*function ColumnGroupFilter(container, options) {
                    $('<input required="required" name="' + options.field + '"/>').appendTo(container).kendoComboBox({
                        dataTextField: "Category",
                        dataValueField: "Category",
                        dataSource: GlobalSearchFOOD

                    });
                    $('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);
                }*/

                /*function ColumnGroupFilter(container, options) {
                    $('<input required="required" name="' + options.field + '"/>').appendTo(container).kendoDropDownList({
                        dataTextField: "Category",
                        dataValueField: "Category",
                        dataSource: GlobalSearchFOOD

                    });
                    $('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);
                }*/


        function foodEditor(container, options) {
            $("<select required='required'  multiple='multiple' " +
      "data-bind='value : Category'/>").appendTo(container).kendoMultiSelect({
            dataSource: GlobalSearchFOOD//,
            //dataTextField: "Category",
            //dataValueField: "Category"
        });
        $('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);
        }

               
        function GroupFilter(e) {
                    e.kendoDropDownList({
                        dataSource: GlobalSearchFOOD//,
                        //dataTextField: "Category",
                        //dataValueField: "Category"
                    });
                }

       function ProductChange() {
                    $.ajax({
                    url: "/GridWidMultiInput/SearchFOODbyCategory"
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


            function ExportToCSV()  {
                var dataSource = $("#grid").data("kendoGrid").dataSource;
                var filteredDataSource = new kendo.data.DataSource({
                    data: dataSource.data(),
                    filter: dataSource.filter()
                });

                filteredDataSource.read();
                var data = filteredDataSource.view();

                var result = "data:application/vnd.ms-excel,";

                result += "<table><tr><th>ProductID</th><th>ProductName</th><th>UnitPrice</th><th>Discontinued</th><th>UnitsInStock</th><th>Category</th></tr>";

                for (var i = 0; i < data.length; i++) {
                    result += "<tr>";

                    result += "<td>";
                    result += data[i].ProductID;
                    result += "</td>";

                    result += "<td>";
                    result += data[i].ProductName;
                    result += "</td>";

                    /*result += "<td>";
                    result += kendo.format("{0:MM/dd/yyyy}", data[i].OrderDate);
                    result += "</td>";*/

                    result += "<td>";
                    result += data[i].UnitPrice;
                    result += "</td>";

                    result += "<td>";
                    result += data[i].Discontinued;
                    result += "</td>";

                    result += "<td>";
                    result += data[i].UnitsInStock;
                    result += "</td>";

                    result += "<td>";
                    result += data[i].Category;
                    result += "</td>";

                    result += "</tr>";
                }

                result += "</table>";
                if (window.navigator.msSaveBlob) {
                    window.navigator.msSaveBlob(new Blob([result]), 'export.csv');
                } else {
                    window.open(result);
                }


                e.preventDefault();
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
