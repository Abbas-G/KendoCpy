﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SimpleMultiSelection</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
    <div id="example" class="k-content" role="application">
    <div class="demo-section">
        <h2>Invite Attendees</h2>
        <label for="required">Required</label>
        <select id="required" multiple="multiple" data-placeholder="Select attendees...">
            <option>Steven White</option>
            <option>Nancy King</option>
            <option>Anne King</option>
            <option>Nancy Davolio</option>
            <option>Robert Davolio</option>
            <option>Michael Leverling</option>
            <option>Andrew Callahan</option>
            <option>Michael Suyama</option>
            <option selected>Anne King</option>
            <option>Laura Peacock</option>
            <option>Robert Fuller</option>
            <option>Janet White</option>
            <option>Nancy Leverling</option>
            <option>Robert Buchanan</option>
            <option>Margaret Buchanan</option>
            <option selected>Andrew Fuller</option>
            <option>Anne Davolio</option>
            <option>Andrew Suyama</option>
            <option>Nige Buchanan</option>
            <option>Laura Fuller</option>
        </select>
        <label for="optional">Optional</label>
        <select id="optional" multiple="multiple" data-placeholder="Select attendees...">
            <option>Steven White</option>
            <option>Nancy King</option>
            <option>Anne King</option>
            <option>Nancy Davolio</option>
            <option>Robert Davolio</option>
            <option>Michael Leverling</option>
            <option>Andrew Callahan</option>
            <option>Michael Suyama</option>
            <option>Anne King</option>
            <option>Laura Peacock</option>
            <option>Robert Fuller</option>
            <option>Janet White</option>
            <option>Nancy Leverling</option>
            <option>Robert Buchanan</option>
            <option>Margaret Buchanan</option>
            <option>Andrew Fuller</option>
            <option>Anne Davolio</option>
            <option>Andrew Suyama</option>
            <option>Nige Buchanan</option>
            <option>Laura Fuller</option>
        </select>
        <button class="k-button" id="get">Send Invitation</button>
    </div>
    <style scoped>
        .demo-section {
            width: 350px;
            min-height: 140px;
            padding: 30px 30px 80px;
        }
        .demo-section h2 {
            font-weight: normal;
        }
        .demo-section label {
            display: inline-block;
            margin: 15px 0 5px 0;
        }
        .demo-section select {
            width: 350px;
        }
        #get {
            float: right;
            margin: 25px auto 0;
        }
    </style>
    <script>
        $(document).ready(function() {
            // create MultiSelect from select HTML element
            var required = $("#required").kendoMultiSelect().data("kendoMultiSelect");
            var optional = $("#optional").kendoMultiSelect().data("kendoMultiSelect");

            $("#get").click(function() {
                alert("Attendees:\n\nRequired: " + required.value() + "\nOptional: " + optional.value());
            });
        });
    </script>
</div>

</body>
</html>
