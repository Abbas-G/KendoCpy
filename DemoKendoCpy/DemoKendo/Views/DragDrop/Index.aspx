<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <div id="grid"></div>
    
    <center>
    <span class='trash'>
        <div id="droptarget" style=" height:110px;width:110px">
			<span class='lid'></span>
			<span class='can'></span>
	    </div>
	</span>
	</center>
    
    <script>
        var data = [
    { id: 1, text: "text 1", position: 0 },
    { id: 2, text: "text 2", position: 1 },
    { id: 3, text: "text 3", position: 2 }
]

        var dataSource = new kendo.data.DataSource({
            data: data,
            schema: {
                model: {
                    id: "id",
                    fields: {
                        id: { type: "number" },
                        text: { type: "string" },
                        position: { type: "number" }
                    }
                }
            }
        });

        var grid = $("#grid").kendoGrid({
            dataSource: dataSource,
            scrollable: false,
            //editable: true,
            //silectable: true,
            //selectable: "multiple row",
            columns: ["id", "text", "position"]
        }).data("kendoGrid");

        grid.table.kendoDraggable({
            filter: "tbody > tr",
            group: "gridGroup",
            threshold: 100,
            hint: function(e) {
                return $('<div class="k-grid k-widget"><table><tbody><tr>' + e.html() + '</tr></tbody></table></div>');
            }
        });

        

        grid.table.kendoDropTarget({
            group: "gridGroup",
            drop: function(e) {
                e.draggable.hint.hide();
                var target = dataSource.getByUid($(e.draggable.currentTarget).data("uid")),
            dest = $(document.elementFromPoint(e.clientX, e.clientY));

                if (dest.is("th")) {
                    return;
                }
                dest = dataSource.getByUid(dest.parent().data("uid"));

                //not on same item
                if (target.get("id") !== dest.get("id")) {
                    //reorder the items
                    var tmp = target.get("position");
                    target.set("position", dest.get("position"));
                    dest.set("position", tmp);

                    dataSource.sort({ field: "position", dir: "asc" });
                }
            }
        });
        $(document).ready(function() {
            $("#droptarget").kendoDropTarget({
                group: "gridGroup",
                drop: function(e) {
                   // if (confirm("Are you sure?")) {
                        e.draggable.hint.hide();
                        var target = dataSource.getByUid($(e.draggable.currentTarget).data("uid"))
                        //alert("id :" + target.get("id") + " uid :" + $(e.draggable.currentTarget).data("uid"));

                        var dataRow = $('#grid').data("kendoGrid").dataSource.getByUid($(e.draggable.currentTarget).data("uid"));
                        $('#grid').data("kendoGrid").dataSource.remove(dataRow);
                    //}
                }
            });
        });

    </script>
    <style>
    p {font-size:22px; margin-top:200px; margin-left:10px; font-family: 'Proxima Nova Regular', 'Helvetica Neue', Arial, Helvetica, sans-serif; color:#ccc; border-top:1px dotted #222; padding-top:20px;}
			a {color:crimson; text-decoration:none;}
			.trash, .lid, .can {margin:0; padding:0; }
			.lid, .can {display:block;}
			.lid {
				width: 100px; /*16px*/
				height: 20px; /*5px*/
				background: url('<%= Url.Content("~/Content/icons/trash.png") %>')	no-repeat 0px 0px;  /*background: url(http://appemo.com/trash/trash.png)	no-repeat 0px 0px; */
				-webkit-transition: all .2s linear;
				-moz-transition: all .2s linear;
				-o-transition: all .2s linear;
				transition: all .2s linear;
			}
			.can {
				width:100px; /*16px*/
				height:100px; /*12px*/
				background: url('<%= Url.Content("~/Content/icons/trash.png") %>')	no-repeat 0px -25px; /*background: url(http://appemo.com/trash/trash.png)	no-repeat 0px -5px;*/
			}
			.trash:hover .lid{
				-webkit-transform:rotate(-45deg) translate(-2px,-5px);
				-moz-transform:rotate(-45deg) translate(-2px,-5px);
				-o-transform:rotate(-45deg) translate(-2px,-5px);
				transform:rotate(-45deg) translate(-2px,-5px);
				
			}
			#droptarget:hover 
			{
			    background-color:#FF7F7F;
			}
    </style>
</body>
</html>
