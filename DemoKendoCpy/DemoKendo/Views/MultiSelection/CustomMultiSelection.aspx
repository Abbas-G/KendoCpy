<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CustomMultiSelection</title>

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
                <h2>Select Customers</h2>
                <select id="customers"></select>
            </div>
            
            <button id="getValue" class="k-button">Get values</button>
            
           <%-- <%=ViewData["MultiSelectScript"]%>--%>
            
            <script>
                $(document).ready(function() {

                    var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);
                    
                    /* pLease Note , here jsonObject store values from jason url, values are
                    [{"CustomerID":"ALFKI","ContactName":"Aaa","CompanyName":"TiaSol"},
                    {"CustomerID":"ANATR","ContactName":"Bbb","CompanyName":"TiaSol"},
                    {"CustomerID":"ANTON","ContactName":"Ccc","CompanyName":"TiaSol"},
                    {"CustomerID":"AROUT","ContactName":"Ddd","CompanyName":"TiaSol"}] */
                

                    $("#customers").kendoMultiSelect({
                        dataTextField: "ContactName",
                        dataValueField: "CustomerID",
                        // define custom template
                        itemTemplate: '<img src=\"../../content/kendo/peoples/${data.CustomerID}.jpg\" alt=\"${data.CustomerID}\" />' +
                                      '<h3>${ data.ContactName }</h3>' +
                                      '<p>${ data.CompanyName }</p>',
                        tagTemplate: '<img class="tag-image" src=\"../../content/kendo/peoples/${data.CustomerID}.jpg\" alt=\"${data.CustomerID}\" />' +
                                      '#: data.ContactName #',
                        /*dataSource: {
                        transport: {
                        read: jsonObject
                        }
                        },*/
                        dataSource: jsonObject,
                        height: 300
                    });

                    var customers = $("#customers").data("kendoMultiSelect");
                    customers.wrapper.attr("id", "customers-wrapper");

                    var multiSelect = $("#customers").data("kendoMultiSelect"),
                                        setValue = function(e) {
                                            if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                                                multiSelect.value($("#CustomerID").val().split(","));
                                            }
                                        },
                                        setSearch = function(e) {
                                            if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                                                multiSelect.search($("#word").val());
                                            }
                                        };

                    $("#getValue").click(function() {
                        alert(multiSelect.value());
                    });

                });
            </script>

            <style scoped>
                .demo-section {
                    width: 400px;
                    margin: 30px auto 50px;
                    padding: 30px;
                }
                .demo-section h2 {
                    text-transform: uppercase;
                    font-size: 1.2em;
                    margin-bottom: 10px;
                }
                .tag-image {
                    width: auto;
                    height: 18px;
                    margin-right: 5px;
                    vertical-align: top;
                }
                #customers-list .k-item {
                    overflow: hidden; /* clear floated images */
                }
                #customers-list img {
                    -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    box-shadow: 0 0 2px rgba(0,0,0,.4);
                    float: left;
                    margin: 5px 20px 5px 0;
                }
                #customers-list h3 {
                    margin: 30px 0 10px 0;
                    font-size: 2em;
                }
                #customers-list p {
                    margin: 0;
                }
            </style>
        </div>

</body>
</html>
