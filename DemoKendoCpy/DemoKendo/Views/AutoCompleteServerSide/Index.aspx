<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Server side Auto Complete</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <input name="name" id="name"  />
    </div>
    <script>
    $('#name').kendoAutoComplete({
    dataTextField: "ProductName",
    filter: "contains",
    minLength: 2,
    delay: 700,
    dataSource: new kendo.data.DataSource({
        type: "json",
        serverFiltering: true,
        transport: {
            read: {
                url: '<%=Url.Content("~/AutoCompleteServerSide/GetFood?")%>',
                data: function (options) {
                //alert(options.filter.filters[0].value);
                    return { serachterm: options.filter.filters[0].value };
                }
                //data:{ serachterm: $("#name").val() }
            },
            type: "POST",
            dataType: "json",
        }//,
        //schema: {data: "Data"}, if u have data like {"Data":[{"Id":48,"Name":"abc"}]}
        //or
        /*schema : { // if you expect null records from server side
            parse: function(data) {
                return data ? data : [];
            }*/
        
    })
});
    </script>
</body>
</html>
