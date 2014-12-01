<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CascadingComboBox2</title>
    
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <div>
                <p>
                    <label for="categories">Categories:</label><input id="categories" style="width: 300px" />
                </p>
                <p>
                    <label for="products">Products:</label><input id="products" style="width: 300px"/>
                </p>
                <p>
                    <label for="orders">Orders:</label><input id="orders"  style="width: 300px"/>
                </p>
                
                <input type="button" value="getvalue" onclick="getCatvalue()" />
                
    <script>
        var categories;
        var products;
        var orders;
        $(document).ready(function() {
            
            categories=$("#categories").kendoDropDownList({
                optionLabel: "Select category...",
                dataTextField: "ContactName",
                dataValueField: "CustomerID",
                dataSource: {
                    serverFiltering: true,
                    transport: {
                        read:{ url:'<%=Url.Content("~/MultiSelection/GetJsonOutputForCustomMultiSelect")%>',
                        dataType: "json",
                        type: "POST"}
                    }
                }
            }).data("kendoDropDownList");

            products = $("#products").kendoDropDownList({
                autoBind: false,
                cascadeFrom: "categories",
                optionLabel: "Select product...",
                dataTextField: "ProductName",
                dataValueField: "ProductID",
                dataSource: new kendo.data.DataSource({
                    serverFiltering: true,
                    transport: {
                    read: { url: '<%=Url.Content("~/ComboBox/GetJsonOutputForProductByCustomerID")%>',
                    data: function (options) {
                        //alert(categories.value());
                        return { CustomerID: categories.value()};
                    },
                    dataType: "json",
                    type: "POST"}
                    }
                })
            }).data("kendoDropDownList");

            orders = $("#orders").kendoDropDownList({
                autoBind: false,
                cascadeFrom: "products",
                optionLabel: "Select order...",
                dataTextField: "OrderShipCity",
                dataValueField: "OrderID",
                dataSource: new kendo.data.DataSource({
                    serverFiltering: true,
                    transport: {
                    read: { url: '<%=Url.Content("~/ComboBox/GetJsonOutputForOrderByProductID")%>',
                    data: function(options) {
                        //alert(products.value());
                        return { ProductID: products.value() };
                    },
                    dataType: "json",
                    type: "POST"}
                    }
                })
            }).data("kendoDropDownList");
        });
        function getCatvalue() {
            //alert(document.getElementById("categories"));
            alert(categories.value() + " :" + products.value() + " : " + orders.value());
        }

    </script>
    </div>
</body>
</html>
