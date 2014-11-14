﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MultiSelection</title>

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
    <div class="configuration-horizontal">
        <div class="config-section">
        <span class="configHead">API Functions</span>
        <ul class="options">
            <li>
                <button id="enable" class="k-button">Enable</button> <button id="disable" class="k-button">Disable</button>
            </li>
            <li>
                <button id="readonly" class="k-button">Readonly</button>
            </li>
            <li>
                <button id="open" class="k-button">Open</button> <button id="close" class="k-button">Close</button>
            </li>
            <li>
                <button id="getValue" class="k-button">Get values</button>
            </li>
        </ul>
        </div>
        <div class="config-section">
        <span class="configHead">Filter</span>
        <ul class="options">
            <li>
                <select id="filter">
                    <option value="startswith">Starts with</option>
                    <option value="contains">Contains</option>
                    <option value="eq">Equal</option>
                </select>
            </li>
            <li>
                <input id="word" value="The" class="k-textbox" style="width: 149px; margin: 0;" />
            </li>
            <li>
                <button id="find" class="k-button">Find item</button>
            </li>
        </ul>
        </div>
        <div class="config-section">
        <span class="configHead">Select</span>
        <ul class="options">
            <li>
                <input id="value" value="1,2" class="k-textbox" style="width: 40px; margin: 0;" /> <button id="setValue" class="k-button">Select by value</button>
            </li>
        </ul>
        </div>
    </div>

    <div class="demo-section">
        <select id="products" data-placeholder="Abbas Select Values here...."></select>
    </div>
    <%=ViewData["MultiSelectScript"]%>
    <script>
        $(document).ready(function() {
        var data1 = [
        {text: "12 Angry Men", value:"1"},
        {text: "Il buono, il brutto, il cattivo.", value:"2"},
        {text: "Inception", value:"3"},
        {text: "One Flew Over the Cuckoo's Nest", value:"4"},
        {text: "Pulp Fiction", value:"5"},
        {text: "Schindler's List", value:"6"},
        {text: "The Dark Knight", value:"7"},
        {text: "The Godfather", value:"8"},
        {text: "The Godfather: Part II", value:"9"},
        {text: "The Shawshank Redemption", value:"10"},
        {text: "The Shawshank Redemption 2", value:"11"}
        ];

        $("#products").kendoMultiSelect({
            dataTextField: "text",
            dataValueField: "value",
            dataSource: data
        })
        .closest(".k-widget")
        .attr("id", "products_wrapper");

        $("#filter").kendoDropDownList({
            change: filterTypeOnChanged
        });

        var multiSelect = $("#products").data("kendoMultiSelect"),
            setValue = function(e) {
                if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                    multiSelect.value($("#value").val().split(","));
                }
            },
            setSearch = function (e) {
                if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode) {
                    multiSelect.search($("#word").val());
                }
            };

        $("#enable").click(function() {
            multiSelect.enable();
        });

        $("#disable").click(function() {
            multiSelect.enable(false);
        });

        $("#readonly").click(function() {
            multiSelect.readonly();
        });

        $("#open").click(function() {
            multiSelect.open();
        });

        $("#close").click(function() {
            multiSelect.close();
        });

        $("#getValue").click(function() {
            alert(multiSelect.value());
        });

        $("#setValue").click(setValue);
        $("#value").keypress(setValue);

        $("#find").click(setSearch);
        $("#word").keypress(setSearch);

        function filterTypeOnChanged() {
            multiSelect.options.filter = $("#filter").val();
        }
    });
    </script>
    <style scoped>
        .configuration .k-textbox {
            width: 40px;
        }
        .demo-section {
            width: 660px;
            padding: 30px;
            text-align: center;
        }
        .k-button {
            min-width: 80px;
        }
        .configuration-horizontal .options li {
            padding: 3px 0;
        }
    </style>
</div>

</body>
</html>
