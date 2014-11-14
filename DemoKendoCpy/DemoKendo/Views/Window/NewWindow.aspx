<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>NewWindow</title>

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
            <div id="window">
                <div class="armchair"><%--<img src="../Content/Kendo/pageturn/ferrari.jpg" alt="Hello World" />--%>Hello World</div>
                <p>Josef Hoffmann studied architecture at the Academy of Fine Arts in Vienna, Austria, under Art Nouveau architect Otto Wagner, whose theories of functional, modern architecture profoundly influenced his works, and in 1896 he joined his office.</p>

                <p>In 1898, he established his own practice in Vienna. In 1897, inspired by Mackintosh and the Glasgow School, he was one of the founding members with Gustav Klimt, of an association of revolutionary artists and architects, the Vienna Secession.</p>

                <p>In 1903, he founded with architects Koloman Moser and Joseph Maria Olbrich, the Wiener Werkst&auml;tte for decorative arts.</p>
                <p>They aspired to the renaissance of the arts and crafts and to bring more abstract and purer forms to the designs of buildings and furniture, glass and metalwork, following the concept of total work of art. Hoffman's works combined functionality and simplicity of craft production with refined and innovative ornamental details and geometric elements. He is an important precursor of the Modern Movement and Art Deco. </p>
            </div>
			
			<div id="window2">
                <div class="armchair"><%--<img src="../Content/Kendo/pageturn/mercedes.jpg" alt="Hello Universe" />--%> Hello Universe</div>
                <p>Josef Hoffmann studied architecture at the Academy of Fine Arts in Vienna, Austria, under Art Nouveau architect Otto Wagner, whose theories of functional, modern architecture profoundly influenced his works, and in 1896 he joined his office.</p>

                <p>In 1898, he established his own practice in Vienna. In 1897, inspired by Mackintosh and the Glasgow School, he was one of the founding members with Gustav Klimt, of an association of revolutionary artists and architects, the Vienna Secession.</p>

                <p>In 1903, he founded with architects Koloman Moser and Joseph Maria Olbrich, the Wiener Werkst&auml;tte for decorative arts.</p>
                <p>They aspired to the renaissance of the arts and crafts and to bring more abstract and purer forms to the designs of buildings and furniture, glass and metalwork, following the concept of total work of art. Hoffman's works combined functionality and simplicity of craft production with refined and innovative ornamental details and geometric elements. He is an important precursor of the Modern Movement and Art Deco. </p>

            </div>

            <span id="undo" style="display:none" class="k-button">Click here to open 1st window.</span>

			<span id="undo2" style="display:none" class="k-button">Click here to open 2nd window.</span>
			
            <script>
                $(document).ready(function() {
				
					/////////////*********************************************/////////////////
                    var window = $("#window"),
                        undo = $("#undo");

                    undo.bind("click", function() {
                        window.data("kendoWindow").open();
                        //undo.hide();
                    });

                    if (!window.data("kendoWindow")) {
                        window.kendoWindow({
                            width: "500px",
                            actions: ["Custom", "Minimize", "Maximize", "Close"],
                            title: "About Hello World",
                            close: function() {
                                undo.show();
                            }
                        });
                    }
                    window.data("kendoWindow").wrapper.find(".k-i-custom").click(function(e){
                        alert("Custom action button clicked on 1st window (hello world)");
                        e.preventDefault();
                    });
					
					/////////////*********************************************/////////////////
					 var window2 = $("#window2"),
                        undo2 = $("#undo2");

                    undo2.bind("click", function() {
                        window2.data("kendoWindow").open();
                        //undo2.hide();
                    });

                    if (!window2.data("kendoWindow")) {
                        window2.kendoWindow({
                            width: "500px",
                            actions: ["Custom", "Minimize", "Maximize", "Close"],
                            title: "About Hello Universe",
                            close: function() {
                                undo2.show();
                            }
                        });
                    }
                    window2.data("kendoWindow").wrapper.find(".k-i-custom").click(function(e){
                        alert("Custom action button clicked on 2nd window (hello universe)");
                        e.preventDefault();
                    });
                });
            </script>

            <style scoped>
                #example
                {
                    min-height:500px;
                }
            
                .armchair {
                    float: left;
                    margin: 20px 30px;
                    text-align: center;
                }
                .armchair img {
                    display: block;
                    margin-bottom: 10px;
                }
            </style>
        </div>

</body>
</html>
