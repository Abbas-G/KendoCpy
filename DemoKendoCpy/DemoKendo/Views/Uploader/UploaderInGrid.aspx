<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>File Uploader inside grid</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" title="custom_black" href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"
        id="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>

</head>
<body>
    <div id="grid">
    </div>

    <script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                    <label for="products">Search Products by Category:</label><input id="products" class="k-textbox"/>
                    <input type="button" value="search" onClick="ProductChange()" class="k-button"/>
                </div>           
    </script>

    <div id="details">
    </div>

    <script type="text/x-kendo-template" id="ViewDetail">
                <div id="details-container">
                    <h2>#= ProductName #</h2>
                    <em>#= Category #</em>
                    <dl>
                        <dt>#= FileUploader #</dt>
                    </dl>
                </div>
    </script>

    <script>
        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", '<%=Url.Content("~/Uploader/GetJsonOutputForFoodUniqueCategory")%>', false);
        xhReq.send(null);
        var GlobalSearchFOOD = JSON.parse(xhReq.responseText);
        var record = 0;
        var wnd, detailsTemplate;


        $(document).ready(function() {
            var crudServiceBaseUrl = '<%=Url.Content("~/Uploader")%>',

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
                            batch: true,
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
                                        Category: { type: "string", validation: { required: true} },
                                        FileUploader: { type: "file" }
                                    }
                                }
                            }
                        });

            $("#grid").kendoGrid({
                dataSource: dataSource,
                pageable: true,
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
                            { field: "Category", title: "Category", filterable: { ui: GroupFilter }, editor: ColumnGroupFilter },
                            { field: "FileUploader", title: "FileUploader", editor: ColumnGroupFileFilter },

                            { command: ["edit", "destroy"], title: "&nbsp;", width: "172px" },
                            { command: { text: "View Details", click: showDetails }, title: " ", width: "140px" }
                            ],
                editable: "inline",
                dataBinding: function() {
                    record = (this.dataSource.page() - 1) * this.dataSource.pageSize();

                },
                save: onSave
            });

            //this portion is added to perform add function when filteration is ON
            $(".k-grid-my-create", grid.element).on("click", function(e) {
                var grid = $("#grid").data("kendoGrid");
                grid.dataSource.filter({});
                grid.dataSource.sort({});
                grid.addRow();
            });
            //wnd = $("details").kendoWindow({ or
            wnd = $("<div />").kendoWindow({
                            title: "Message Box",
                            modal: true,
                            visible: false,
                            resizable: false,
                            width: 300
                        }).data("kendoWindow");

            detailsTemplate = kendo.template($("#ViewDetail").html());


        });


        function ColumnGroupFilter(container, options) {
            $('<input required="required" name="' + options.field + '"/>').appendTo(container).kendoComboBox({
                dataTextField: "Category",
                dataValueField: "Category",
                dataSource: GlobalSearchFOOD

            });
            $('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);
        }


        function ColumnGroupFileFilter(container, options) {
            //var flag = true;
            $('<input type="file" name="' + options.field + '" id="' + options.field + '"/>')
            // $('<input type="file" name="' + options.field + '" id="' + options.field + '"/>')
                        .appendTo(container)
                        .kendoUpload({
                            async: {
                                saveUrl: '<%= Url.Content("~/Uploader/UploadFile") %>'
                            },
                            //complete: onUploadComplete
                            upload: function(e) {
                                var grid = $("#grid").data("kendoGrid");
                                var item = grid.dataItem(this.element.closest("tr"));
                                //e.data = { id: item.id };
                            },
                            success: function(e) {
                                var grid = $("#grid").data("kendoGrid");
                                var FileUploader = e.response.FileUploader;
                                var item = grid.dataItem(this.element.closest("tr"));
                                item.FileUploader = FileUploader;
                                //$("input[type='file']").val = FileUploader;
                                //e.data = { FileUploader: item.FileUploader };
                            }
                        });

            //$('<span class="k-invalid-msg" data-for="' + options.field + '"></span>').appendTo(container);

        }

        function GroupFilter(e) {
            e.kendoDropDownList({
                dataSource: GlobalSearchFOOD,
                dataTextField: "Category",
                dataValueField: "Category"
            });
        }

        function onUploadComplete(e) {
            alert("Complete");
        }

        function ProductChange() {
            $.ajax({
                url: "/Uploader/SearchFOODbyCategory"
                       , type: "POST"
                       , data: { searchString: $("#products").val() }
                       , success: function(result) {
                           //$("#grid").data("kendoGrid").dataSource.data(JSON.parse(result)); //if return type is string
                           $("#grid").data("kendoGrid").dataSource.data(result);
                       }
            });
        }

        function onSave(e) {
            var currentProductName = e.model.ProductName;
            //alert(currentProductName);
            var xhReq = new XMLHttpRequest();
            xhReq.open("POST", '<%=Url.Content("~/Uploader/GetJsonOutputForGridDataSelect")%>', false);
            xhReq.send(null);
            var AllData = JSON.parse(xhReq.responseText);
            if (e.model.ProductID != null) {//unique data check at the time of edit, record check other that edit
            
                for (item in AllData) {
                    if (AllData[item].ProductName == currentProductName && AllData[item].ProductID != e.model.ProductID) {
                        e.preventDefault();
                        wnd.content(detailsTemplate({ ProductName: "Product Name '" + currentProductName + "' already exist",Category:"",FileUploader:"" }));
                        wnd.center().open();
                        break;
                    }
                }

            }
            else {//unique data check at the time of insert,
                for (item in AllData) {
                    if (AllData[item].ProductName == currentProductName) {
                        e.preventDefault();
                        wnd.content(detailsTemplate({ ProductName: "Product Name '" + currentProductName + "' already exist",Category:"",FileUploader:"" }));
                        wnd.center().open();
                        break;
                    }
                }
            }
        }

        function showDetails(e) {
            e.preventDefault();
            var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            wnd.content(detailsTemplate(dataItem));
            wnd.center().open();
        }
    </script>

</body>
</html>
