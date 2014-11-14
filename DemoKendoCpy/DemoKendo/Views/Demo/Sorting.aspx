<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sorting</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
            <script type="text/javascript">
            var orders1 = [{
    OrderID : 10248,
    OrderDate : new Date(1996, 6, 4, 0, 0, 0, 0),
    Freight : 32.3800,
    ShipCountry : "France"
}, {
    OrderID : 10249,
    OrderDate : new Date(1996, 6, 5, 0, 0, 0, 0),
    Freight : 11.6100,
    ShipCountry : "Germany"
}, {
    OrderID : 10250,
    OrderDate : new Date(1996, 6, 8, 0, 0, 0, 0),
    Freight : 65.8300,
    ShipCountry : "Brazil"
}, {
    OrderID : 10251,
    OrderDate : new Date(1996, 6, 8, 0, 0, 0, 0),
    Freight : 41.3400,
    ShipCountry : "France"
}];
//alert(new Date(1996, 6, 8, 0, 0, 0, 0));
            </script>
    <%--<%=ViewData["orderScript"]%>--%>
        <div id="example" class="k-content">

            <div class="demo-section">
                <h3>Grid with single column sorting enabled</h3>
                <div id="singleSort"></div>
            </div>

            <div class="demo-section">
                <h3>Grid with multiple column sorting enabled</h3>
                <div id="multipleSort"></div>
            </div>

            <script>
                $(document).ready(function() {
                
                var xhReq = new XMLHttpRequest();
                xhReq.open("POST", "http://localhost:2088/Demo/getJsonOrders", false);
                //xhReq.open("GET", "http://localhost:2088/Demo/getJsonOrders", false);
                xhReq.send(null);
                var jsonOrders = JSON.parse(xhReq.responseText);
                
                
                    $("#singleSort").kendoGrid({
                        dataSource: {
                        data: jsonOrders,
                            pageSize: 5
                        },
                        sortable: {
                            mode: "single",
                            allowUnsort: false
                        },
                        pageable: {
                            buttonCount: 5
                        },
                        scrollable: false,
                        columns: [
                            {
                                field: "ShipCountry",
                                title: "Ship Country",
                                width: 200
                            },
                            {
                                field: "Freight",
                                width: 200
                            },
                            {
                                field: "OrderDate",
                                title: "Order Date",
                                type: "date",
                                format: "{0:dd/MM/yyyy}"
                            }
                        ]
                    });

                    $("#multipleSort").kendoGrid({
                        dataSource: {
                        data: jsonOrders,
                            pageSize: 5
                        },
                        sortable: {
                            mode: "multiple",
                            allowUnsort: true
                        },
                        pageable: {
                            buttonCount: 5
                        },
                        scrollable: false,
                        columns: [
                            {
                                field: "ShipCountry",
                                title: "Ship Country",
                                width: 200
                            },
                            {
                                field: "Freight",
                                width: 200
                            },
                            {
                                field: "OrderDate",
                                title: "Order Date",
                                type: "date",
                                format: "{0:d}"
                            }
                        ]
                    });
                });
            </script>
            <style scoped="scoped">
                .demo-section {
                    width: 600px;
                }
                .demo-section h3 {
                    margin: 5px 0 15px 0;
                    text-align: center;
                }
            </style>
        </div>
</body>
</html>
