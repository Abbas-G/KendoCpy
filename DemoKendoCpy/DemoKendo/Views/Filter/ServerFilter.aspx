<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ServerFilter</title>

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
                <h2>Customers</h2>
                <input id="customers" style="width: 400px;"/>
                <p>
                    Start typing to find a customer.
                </p>
            </div>

            <script>
                $(document).ready(function() {
                
                var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);
                    
                    var autocomplete = $("#customers").kendoAutoComplete({
                        minLength: 1,
                        dataTextField: "ContactName",
                        template: '<img src=\"../../content/kendo/peoples/${data.CustomerID}.jpg\" alt=\"${data.CustomerID}\" />' +
                                '<h3>${ data.ContactName }</h3>' +
                                '<p>${ data.CompanyName }</p>',
                        dataSource: jsonObject,
                        height: 370,
                        separator: ", "
                    }).data("kendoAutoComplete");
                });
            </script>

            <style scoped>
                .demo-section {
                    width: 400px;
                    margin: 35px auto 50px;
                    padding: 30px;
                }
                .demo-section h2 {
                    text-transform: uppercase;
                    font-size: 1.2em;
                    margin-bottom: 10px;
                }
                #customers-list .k-item {
                    overflow: hidden; /* clear floated images */
                }
                #customers-list img {
                    -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    box-shadow: 0 0 2px rgba(0,0,0,.4);
                    float: left;
                    margin: 5px 20px 5px 0px;
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
