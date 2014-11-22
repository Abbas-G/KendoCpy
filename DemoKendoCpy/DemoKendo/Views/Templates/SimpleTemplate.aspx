<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SimpleTemplate</title>
    
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    
<%--<div id="component" 
     data-bind="source: model" 
     data-template="editortTemplate" 
/>

<script id="editortTemplate" type="text/x-kendo-template">
    <h2>Object Id: #: data.id #</h2>
    </script>--%>
<script id="string" type="text/x-kendo-template">
    <h2>Object Id: #: data.id #</h2>
    <label>String</label>
    <input type="text"  value=#: data.name # />
</script>

<script id="number" type="text/x-kendo-template">
    <label>Number</label>
    <input type="number" data-role="numerictextbox" value=#: data.age #  />
</script>

<script id="date" type="text/x-kendo-template">
    <label>Date</label>
    <input type="date" data-role="datepicker" data-parse-formats="YYYY-MM-DDThh:mm:ss"   data-bind="value:data.dob"  />
</script>

<script id="editor" type="text/x-kendo-template">
    <h2>Object Id: #: data.id #</h2>
    <ul class="fields">
        <li data-template="string" data-bind="value: data.name"></li>
        <li data-template="number" data-bind="value: data.age"></li>
        <li data-template="date" data-bind="value: data.dob"></li>
    </ul>
</script>

<%--<script id="editor" type="text/x-kendo-template">
    <h2>Object Id: #: data.id #</h2>
    </script>--%>

<div id="component"
     data-bind="source: model"
     data-template="date" />
     
<script>
    $(function() {
        var viewModel = new kendo.observable({
        model: { id: 1, age: 23, name: 'Smith', dob: '"1980-01-01T00:00:00Z"' }
    });

    var viewModel1 = new kendo.observable({
         id: 1, age: 23, name: 'Smith', dob: '"1980-01-01T00:00:00Z"' }
    );
        var component = $("#component");
        kendo.bind(component, viewModel);
    });
</script>
</body>
</html>
