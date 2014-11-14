<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Custom tools</title>

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
    <textarea id="editor" rows="10" cols="30" style="width:100%;height:400px">
         
            &lt;p&gt;Features include:&lt;/p&gt;
            &lt;ul&gt;
                &lt;li&gt;Text formatting &amp; alignment&lt;/li&gt;
                &lt;li&gt;Bulleted and numbered lists&lt;/li&gt;
                &lt;li&gt;Hyperlink and image dialogs&lt;/li&gt;
                &lt;li&gt;Cross-browser support&lt;/li&gt;
                &lt;li&gt;Identical HTML output across browsers&lt;/li&gt;
                &lt;li&gt;Gracefully degrades to a &lt;code&gt;textarea&lt;/code&gt; when JavaScript is turned off&lt;/li&gt;
            &lt;/ul&gt;
    </textarea>
    
 <textarea id="value" style="width: 200px;" rows="4" cols="20">new value</textarea>
                        <button id="set" class="k-button">Set value</button>
						<button id="get" class="k-button">Get value1</button>
<input type="button" value="Get value2" onclick="displayData()" />
    <script>
        $("#editor").kendoEditor({
            tools: [
                "bold",
                "italic",
                "underline",
                "strikethrough",
                "fontName",
                "fontSize",
                "foreColor",
                "backColor",
                "justifyLeft",
                "justifyCenter",
                "justifyRight",
                "justifyFull",
                "insertUnorderedList",
                "insertOrderedList",
                "indent",
                "outdent",
                "formatBlock",
                "createLink",
                "unlink",
                "insertImage",
                "subscript",
                "superscript",
                "viewHtml"
            ]
        });
        function displayData() {
            var editor = $("#editor").data("kendoEditor");
            var a = editor.value(); //document.getElementById("editor");
            alert(a);
        }
        var editor = $("#editor").data("kendoEditor");

        $("#get").click(function() {
            alert(editor.value());
        });

        $("#set").click(function() {
            editor.value($("#value").val());
        });
    </script>
</div>

</body>
</html>
