<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CascadingComboBox</title>

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


            <div class="demo-section">
                <h2>View Order Details</h2>
                <p>
                    <label for="categories">Categories:</label><input id="categories" style="width: 300px" onChange="CategoriesChange()"/>
                </p>
                <p>
                    <label for="products">Products:</label><input id="products" style="width: 300px" onchange="ProductChange()"/>
                </p>
                <p>
                    <label for="orders">Orders:</label><input id="orders"  style="width: 300px" onchange="OrderChange()"/>
                </p>

                <button class="k-button" id="get">View Order</button>
            </div>

            <style scoped>
                .demo-section {
                    width: 460px;
                    padding: 30px;
                }
                .demo-section h2 {
                    text-transform: uppercase;
                    font-size: 1.2em;
                    margin-bottom: 30px;
                }
                .demo-section label {
                    display: inline-block;
                    width: 120px;
                    padding-right: 5px;
                    text-align: right;
                }
                .demo-section .k-button {
                    margin: 20px 0 0 125px;
                }
                .k-readonly
                {
                    color: gray;
                }
            </style>

            <script>
                var categories;
                var products;
                var orders;
                $(document).ready(function() {

                    /**call jason method "public JsonResult GetJsonOutputForCustomMultiSelect()"**/
                    var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);

                    /**filled data in input with Id categories**/
                    categories = $("#categories").kendoComboBox({
                        placeholder: "Select category...",
                        dataTextField: "ContactName",
                        dataValueField: "CustomerID",
                        dataSource: jsonObject
                    }).data("kendoComboBox");

                    $("#get").click(function() {
                    var categoryInfo = "\nCategory: { id: " + categories.value() + ", name: " + categories.text() + " }",
                            productInfo = "\nProduct: { id: " + products.value() + ", name: " + products.text() + " }",
                            orderInfo = "\nOrder: { id: " + orders.value() + ", name: " + orders.text() + " }";

                    alert("Order details:\n" + categoryInfo + productInfo + orderInfo);
                    });
                });

                function CategoriesChange() {
                    document.getElementById('products').value = "";//remove previousl saveddata

                    /**call jason method "public JsonResult GetJsonOutputForProductByCustomerID(string CustomerID)"**/
                    var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/ComboBox/GetJsonOutputForProductByCustomerID?CustomerID=" + categories.value(), false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);

                    /**filled data in input with Id products**/
                    products = $("#products").kendoComboBox({
                        placeholder: "Select Product...",
                        dataTextField: "ProductName",
                        dataValueField: "ProductID",
                        dataSource: jsonObject
                    }).data("kendoComboBox");
                }

                function ProductChange() {
                    document.getElementById('orders').value = ""; //remove previousl saveddata

                    /**call jason method " public JsonResult GetJsonOutputForOrderByProductID(string ProductID)"**/
                    var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/ComboBox/GetJsonOutputForOrderByProductID?ProductID=" + products.value(), false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);

                    /**filled data in input with Id orders**/
                    orders = $("#orders").kendoComboBox({
                        placeholder: "Select Product...",
                        dataTextField: "OrderShipCity",
                        dataValueField: "OrderID",
                        dataSource: jsonObject
                    }).data("kendoComboBox");
                }
                function OrderChange() {
                    alert(orders.value());
                }
            </script>
        </div>

</body>
</html>
