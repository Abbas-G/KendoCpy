<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Basic</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div id="example" class="k-content">
            <div class="demo-section">
                <ul id="treeview">
                    <li data-expanded="true">
                        <span class="k-sprite folder"></span>
                        My Web Site
                        <ul>
                            <li data-expanded="true">
                                <span class="k-sprite folder"></span>images
                                <ul>
                                    <li><span class="k-sprite image"></span>logo.png</li>
                                    <li><span class="k-sprite image"></span>body-back.png</li>
                                    <li><span class="k-sprite image"></span>my-photo.jpg</li>
                                </ul>
                            </li>
                            <li data-expanded="true">
                                <span class="k-sprite folder"></span>resources
                                <ul>
                                    <li data-expanded="true">
                                        <span class="k-sprite folder"></span>pdf
                                        <ul>
                                            <li><span class="k-sprite pdf"></span>brochure.pdf</li>
                                            <li><span class="k-sprite pdf"></span>prices.pdf</li>
                                        </ul>
                                    </li>
                                    <li><span class="k-sprite folder"></span>zip</li>
                                </ul>
                            </li>
                            <li><span class="k-sprite html"></span>about.html</li>
                            <li><span class="k-sprite html"></span>contacts.html</li>
                            <li><span class="k-sprite html"></span>index.html</li>
                            <li><span class="k-sprite html"></span>portfolio.html</li>
                        </ul>
                    </li>
                </ul>
            </div>

            <script>
                $(document).ready(function() {
                    $("#treeview").kendoTreeView();
                });
            </script>

            <style scoped>
                .demo-section {
                    width: 200px;
                }

                #treeview .k-sprite {
                    background-image: url("/Content/icons/coloricons-sprite.png");
                }

                .rootfolder { background-position: 0 0; }
                .folder { background-position: 0 -16px; }
                .pdf { background-position: 0 -32px; }
                .html { background-position: 0 -48px; }
                .image { background-position: 0 -64px; }

            </style>
        </div>
</body>
</html>
