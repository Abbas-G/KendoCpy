<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>

    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>

</head>
<body>
    <div>
        <div id="grid1"></div>      
        <input type="button" value="Submit" onclick="Move()" />
        <div id="grid2" ></div>
   
    </div>

    <script>
        $(document).ready(function() {
        
            var data1 = [
         { id: 1, rating: 3, year: 1997, title: "Rock" }
        , { id: 2, rating: 5, year: 1999, title: "X-Man" }
        , { id: 3, rating: 4, year: 2011, title: "World War Z" }
    ];

            var grid1=$("#grid1").kendoGrid({
                sortable: true
                        , silectable: true
                        , selectable: "multiple row"
                        , filterable: true 
                        , pageable: true
                        , columns: [
                        { template: "<input type='checkbox' class='checkbox' />", width: "40px" }
                        ,{
                        field: "N0.",
                            title: "N0.",
                            template: "<span class='srno'></span>",
                            width:50
                        }
                         ,{ field: "id", title: "Id", filterable: false }
                       , { field: "rating", title: "Rating", filterable: false }
                      , { field: "year", title: "Year", filterable: true, type: "string"}
                      , { field: "title", title: "Title" }
                        ]
                       , dataSource: { page: 1,
                           pageSize: 5,
                           data: data1
                       }
                       ,dataBound: function () {
            var rows = this.items();
            $(rows).each(function () {
                var index = $(this).index() + 1;
                var rowLabel = $(this).find(".srno");
                $(rowLabel).html(index);
            });
        }

                   }).data("kendoGrid");
                   grid1.table.on("click", ".checkbox", selectRow);
            
            var data2 = [
         { id: 101, rating: 6, year: 2012, title: "The Impossible" }
        , { id: 102, rating: 8, year: 2013, title: "Escape" }
        , { id: 103, rating: 7, year: 2013, title: "Gravity" }
    ];
            $("#grid2").kendoGrid({
                sortable: true
                        , silectable: true
                        , selectable: "multiple row"
                        , filterable: true 
                        , pageable: true
                        , columns: [
                         { field: "id", title: "Id", filterable: false }
                       , { field: "rating", title: "Rating", filterable: false }
                      , { field: "year", title: "Year", filterable: true, type: "string"} 
                      , { field: "title", title: "Title" }
                        ]
                       , dataSource: { page: 1,
                           pageSize: 5,
                           data: data2
                       }

            });

        });

        function Move() {
            var grid1 = $("#grid1").data("kendoGrid");
            var rows = grid1.select();

            rows.each(function(index, row) {
                var selectedRow = grid1.dataItem(row);
                //-move to grid2
                var grid2 = $("#grid2").data("kendoGrid");
                var ins = { id: selectedRow.id, rating: selectedRow.rating, year: selectedRow.year, title: selectedRow.title }; //id=1,rating=9.2,year=1995,title="The Godfather"
                grid2.dataSource.insert(ins);
            });

            rows.each(function() {
                grid1.removeRow($(this).closest('tr'));
            });
        }

        function selectRow() {
            var checked = this.checked,
				row = $(this).closest("tr");
            if (checked) {
                //-select the row
                row.addClass("k-state-selected");

            } else {
                //-remove selection
                row.removeClass("k-state-selected");
            }
        }  
    </script>

</body>
</html>
