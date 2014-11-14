<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Multi AutoComplete with no Duplication</title>
    
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <div>
    <input id="AutoCompltd"/>
    </div>
    <script>
        $(document).ready(function() {
        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", '<%=Url.Content("~/MultiSelection/GetJsonOutputForCustomMultiSelect")%>', false);
        //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
        xhReq.send(null);
        var jsonObject = JSON.parse(xhReq.responseText);


        // create a datasource bound to the local data	   
        var LocalDS = new kendo.data.DataSource({
        data: jsonObject
        });

        var getFilters = function(filter) {

            // create an empty array
            var filters = [];

            // add the default autocomplete filter to the filters array
            filters.push(filter);

            // split the values into an array
            values = autoComplete.value().split(", ");

            // pop off the last one as its not a selected value
            values.pop();

            // loop through the selected values and add them to
            // the filter criteria to be sent to the server
            $.each(values, function(index, item) {
            filters.push({ field: "ContactName", ignoreCase: true, operator: "neq", value: item });
            });

            return filters;
        };

        var autoComplete = $("#AutoCompltd").kendoAutoComplete({
        minLength: 1,
        dataTextField: "ContactName",
            separator: ", ",
            dataSource: {
                transport: {
                    read: function(options, operation) {

                        // read from the local datasource
                        LocalDS.read();

                        // filter the local datasource
                        LocalDS.filter({ logic: "and", filters: getFilters(options.data.filter.filters[0]) });

                        // pass the result of the local data source to the options
                        // success method
                        options.success(LocalDS.view());
                    }
                },
                serverFiltering: true
            }
        }).data("kendoAutoComplete");

        

            
        });

       
              
    </script>
</body>
</html>
