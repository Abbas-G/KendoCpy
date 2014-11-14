<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Events</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div id="example" class="k-content">
            <div id="treeview" class="demo-section" style="width: 200px"></div>
            
            <script>
                $(document).ready(function() {
                    function onSelect(e) {
                        alert("Selecting: " + this.text(e.node));
                    }

                    function onChange(e) {
                        alert("Selection changed");
                    }

                    function onCollapse(e) {
                        alert("Collapsing " + this.text(e.node));
                    }

                    function onExpand(e) {
                        alert("Expanding " + this.text(e.node));
                    }

                    function onDragStart(e) {
                        alert("Started dragging " + this.text(e.sourceNode));
                    }

                    function onDrag(e) {
                        alert("Dragging " + this.text(e.sourceNode));
                    }

                    function onDrop(e) {
                        alert(
                        "Dropped " + this.text(e.sourceNode) +
                        " (" + (e.valid ? "valid" : "invalid") + ")"
                        );
                    }

                    function onDragEnd(e) {
                        alert("Finished dragging " + this.text(e.sourceNode));
                    }

                    function onNavigate(e) {
                        alert("Navigate " + this.text(e.node));
                    }

                    $("#treeview").kendoTreeView({
                        dataSource: [
                            { text: "Furniture", expanded: true, items: [
                                { text: "Tables & Chairs" },
                                { text: "Sofas" },
                                { text: "Occasional Furniture" }
                            ] },
                            { text: "Decor", items: [
                                { text: "Bed Linen" },
                                { text: "Curtains & Blinds" },
                                { text: "Carpets" }
                            ] },
                            { text: "Storage" }
                        ],
                        select: onSelect,
                        change: onChange,
                        collapse: onCollapse,
                        expand: onExpand,
                        dragAndDrop: true,
                        /* drag & drop events */
                        dragstart: onDragStart,
                        drag: onDrag,
                        drop: onDrop,
                        dragend: onDragEnd,
                        navigate: onNavigate
                    });
                });
            </script>
        </div>
</body>
</html>
