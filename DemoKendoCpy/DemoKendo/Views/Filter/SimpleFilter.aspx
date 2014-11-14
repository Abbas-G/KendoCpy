<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>SimpleFilter</title>

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

            <div class="configuration k-widget k-header">
                <span class="configHead">API Functions</span>
                <ul class="options">
                    <li>
                        <input id="value" type="text" class="k-textbox" />
                        <button id="set" class="k-button">Set value</button>
                    </li>
                    <li>
                        <button id="get" class="k-button">Get value</button>
                    </li>
                    <li>
                        <input id="word" value="B" class="k-textbox" />
                        <button id="search" class="k-button">Find starting with</button>
                    </li>
                </ul>
            </div>

            <div id="colors">
               <label for="input">Primary color</label>
               <input id="input" />
            </div>

            <script>
                $(document).ready(function() {
                    var data = [
                        "Red-violet",
                        "Red",
                        "Red-orange",
                        "Orange",
                        "Yellow-orange",
                        "Yellow",
                        "Yellow-green",
                        "Green",
                        "Blue-green",
                        "Blue",
                        "Blue-violet",
                        "Violet"
                    ];

                    $("#input").kendoAutoComplete(data);

                    var autocomplete = $("#input").data("kendoAutoComplete"),
                        setValue = function(e) {
                            if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode)
                                autocomplete.value($("#value").val());
                        },
                        setSearch = function(e) {
                            if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode)
                                autocomplete.search($("#word").val());
                        };

                    $("#set").click(setValue);
                    $("#value").keypress(setValue);
                    $("#search").click(setSearch);
                    $("#word").keypress(setSearch);

                    $("#get").click(function() {
                        alert(autocomplete.value());
                    });
                });
           </script>
            <style scoped>
                #colors {
                    width: 366px;
                    height: 180px;
                    padding: 114px 0 0 0;
                    background: url('../../content/web/autocomplete/palette.png') transparent no-repeat right 0;
                    margin: 30px 0 30px 120px;
                    text-align: center;
 				}
                #colors label {
                    display: block;
                    color: #333;
                    padding-bottom: 5px;
 				}
                #input {
                    margin-right: 50px;
                }
                .configuration {
                    height: 410px;
                    margin-bottom: -21px;
                }
                .configuration .k-textbox {
                    width: 40px;
                }
            </style>
        </div>

</body>
</html>
