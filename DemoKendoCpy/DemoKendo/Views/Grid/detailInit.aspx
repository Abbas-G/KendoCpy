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
    <a class="offline-button" href="../index.html">Back</a>
            <div id="example" class="k-content">
            <div id="grid"></div>

           
        </div>
		
    <script type="text/x-kendo-template" id="gridTemplate">
		   <div id="details"></div>
		</script>
		
   <script type="text/x-kendo-tmpl" id="template">
        <div class="product-view">
            <dl>
                <dt>Product Name</dt>
                <dd>${ProductName}</dd>
                <dt>Unit Price</dt>
                <dd>${kendo.toString(UnitPrice, "c")}</dd>
                <dt>Units In Stock</dt>
                <dd>${UnitsInStock}</dd>
                <dt>Discontinued</dt>
                <dd>${Discontinued}</dd>
            </dl>
            <div class="edit-buttons">
                <a class="k-button k-button-icontext k-edit-button" href="\\#"><span class="k-icon k-edit"></span>Edit</a>
                <a class="k-button k-button-icontext k-delete-button" href="\\#"><span class="k-icon k-delete"></span>Delete</a>
            </div>
        </div>
    </script>

    <script type="text/x-kendo-tmpl" id="editTemplate">
        <div class="product-view">
            <dl>
                <dt>Product Name</dt>
                <dd>
                    <input type="text" data-bind="value:ProductName" name="ProductName" required="required" validationMessage="required" />
                    <span data-for="ProductName" class="k-invalid-msg"></span>
                </dd>
                <dt>Unit Price</dt>
                <dd>
                    <input type="text" data-bind="value:UnitPrice" data-role="numerictextbox" data-type="number" name="UnitPrice" required="required" min="1" validationMessage="required" />
                    <span data-for="UnitPrice" class="k-invalid-msg"></span>
                </dd>
                <dt>Units In Stock</dt>
                <dd>
                    <input type="text" data-bind="value:UnitsInStock" data-role="numerictextbox" name="UnitsInStock" required="required" data-type="number" min="0" validationMessage="required" />
                    <span data-for="UnitsInStock" class="k-invalid-msg"></span>
                </dd>
                <dt>Discontinued</dt>
                <dd><input type="checkbox" name="Discontinued" data-bind="checked:Discontinued"></dd>
            </dl>
            <div class="edit-buttons">
                <a class="k-button k-button-icontext k-update-button" href="\\#"><span class="k-icon k-update"></span>Save</a>
                <a class="k-button k-button-icontext k-cancel-button" href="\\#"><span class="k-icon k-cancel"></span>Cancel</a>
            </div>
        </div>
    </script>

<script>
    var myModel = kendo.data.Model.define({
        id: "ProductID",
        fields: {
            ProductID: { editable: false, nullable: true },
            ProductName: { validation: { required: true} },
            UnitPrice: { type: "number", validation: { required: true, min: 1} },
            Discontinued: { type: "boolean" },
            UnitsInStock: { type: "number", validation: { min: 0, required: true} }
        }
    });

    $(document).ready(function() {

    var xhReq = new XMLHttpRequest();
    xhReq.open("POST", "http://localhost:2088/Grid/GetJsonOutputForGridDataSelect", false);
    //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
    xhReq.send(null);
    var jsonObject = JSON.parse(xhReq.responseText);
    
        var crudServiceBaseUrl = "http://demos.kendoui.com/service",
         dataSource = new kendo.data.DataSource({
             transport: {
                 read: {
                 url: "http://localhost:2088/Grid/GetJsonOutputForGridDataSelect",
                     dataType: "json"
                 }
             },
             batch: true,
             pageSize: 30,
             schema: {
                 model: myModel
             }
         });

        $("#grid").kendoGrid({
        dataSource: { data: jsonObject,
                        batch: true,
                        pageSize: 30,
                        schema: {
                            model: myModel
                        }
            },
            height: 400,
            detailInit: detailInit,
            detailTemplate: kendo.template($("#gridTemplate").html()),
            columns: [
            { field: "ProductName", title: "Product Name" },
            { field: "UnitPrice", title: "Unit Price", format: "{0:c}", width: "150px" },
            { field: "UnitsInStock", title: "Units In Stock", width: "150px" },
            { field: "Discontinued", width: "100px" }
        ]
        });
    });

    function detailInit(e) {
        var detailRow = e.detailRow,
     data = this.dataSource.data(),
    codeDetailData = e.data;

        detailRow.find("#details").kendoListView({
            dataSource: new kendo.data.DataSource({
                data: [codeDetailData.toJSON()],
                schema: {
                    model: myModel
                }
            }),
            save: function(e) {
                if (this.editable.end()) {
                    data.splice(data.indexOf(codeDetailData), 1, e.model);
                    alert(e.model.UnitPrice);
                    /*server coding over here*/
                }
            },
            template: kendo.template($("#template").html()),
            editTemplate: kendo.template($("#editTemplate").html())
        }).data("kendoListView");
    }
</script>



</body>
</html>
