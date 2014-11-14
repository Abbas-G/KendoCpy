<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LocalData</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <div id="example" class="k-content">

            <div class="demo-section">
                <strong>Inline data (default settings)</strong>
                <div id="treeview-left"></div>
            </div>

            <div class="demo-section">
                <strong>Inline data</strong>
                <div id="treeview-right"></div>
            </div>

            <script>
                var inlineDefault = new kendo.data.HierarchicalDataSource({
                    data: [
                        { text: "Furniture", imageUrl: "/content/icons/ok.png", items: [
                            { text: "Tables & Chairs", imageUrl: "/content/icons/ok.png", items: [{ text: "wooden", imageUrl: "/content/icons/ok.png" }, { text: "metal", imageUrl: "/content/icons/ok.png"}] },
                            { text: "Sofas",imageUrl: "/content/icons/ok.png" },
                            { text: "Occasional Furniture" ,imageUrl: "/content/icons/ok.png"}
                        ]
                        },
                        { text: "Decor",expanded: true, imageUrl: "/content/icons/ok.png", items: [
                            { text: "Bed Linen" ,imageUrl: "/content/icons/ok.png"},
                            { text: "Curtains & Blinds" ,imageUrl: "/content/icons/ok.png"},
                            { text: "Carpets" ,imageUrl: "/content/icons/ok.png"}
                        ]
                        }
                    ]
                    }); //use imageUrl: "../../content/web/treeview/search.png" instead of spriteCssClass: "folder"

                $("#treeview-left").kendoTreeView({
                    checkboxes: {
                        checkChildren: true
                    },
                    dataSource: inlineDefault
                });

                var inline = new kendo.data.HierarchicalDataSource({
                    data: [
                        { categoryName: "Storage", subCategories: [
                            { subCategoryName: "Wall Shelving" },
                            { subCategoryName: "Floor Shelving" },
                            { subCategoryName: "Kids Storage" }
                        ] },
                        { categoryName: "Lights", subCategories: [
                            { subCategoryName: "Ceiling", subCategories: [{ subCategoryName: "100mAh" }, { subCategoryName: "50mAh"}] },
                            { subCategoryName: "Table" },
                            { subCategoryName: "Floor" }
                        ] }
                    ],
                    schema: {
                        model: {
                            children: "subCategories"
                        }
                    }
                });

                $("#treeview-right").kendoTreeView({
                    dataSource: inline,
                    dataTextField: [ "categoryName", "subCategoryName" ]
                });
            </script>

            <style scoped>
                #example {
                    text-align: center;
                }

                .demo-section {
                    display: inline-block;
                    vertical-align: top;
                    width: 220px;
                    text-align: left;
                    margin: 0 2em;
                }
            </style>
            
        </div>
    </div>
</body>
</html>
