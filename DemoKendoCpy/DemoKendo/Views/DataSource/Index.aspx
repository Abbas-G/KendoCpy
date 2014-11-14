<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
        <%=Html.Label("Search Text")%>
        <%=Html.Editor("txtSearch")%>
        <input type="button" value="Search(title)" onclick="SearchUsers()" />
        <input type="button" value="Iterate" onclick="IterateThroughAllRows()" />
        <input type="button" value="reload" onclick="ReLoad()" />
         <input type="button" value="InsertNewRow" onclick="InsertNewRow()" />
         <input type="button" value="RemoveSelectedRow" onclick="RemoveSelectedRow()" />
         <input type="button" value="RemoveMultiSelectedRow" onclick="RemoveMultiSelectedRow()" />
         <input type="button" value="SaveRecords" onclick="Save()" />
<br />
        <div id="grid" class="k-content" >
        </div>

            <script>
                $(document).ready(function() {
                    loadData();
                });
                function loadData() {
                    var xhReq = new XMLHttpRequest();
                    alert("s");
                    xhReq.open("POST", "http://localhost:2088/DataSource/GetJsonOutputForMovies", false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);

                    $("#grid").kendoGrid({
                         sortable: true
                        , silectable: true
                        , selectable: "multiple row"//selectable: "multiple row",selectable: true,scrollable: true
                        , filterable: true //filteration only allow on string value
                        , pageable: true
                        , columns: [
                         { field: "id", title: "Id", filterable: false }
                       , { field: "rating", title: "Rating", filterable: false}
                      , { field: "year", title: "Year", filterable: true, type: "string"} //year datatype converted from interger to string
                      , { field: "title", title: "Title" }
                        , { title: "Action", template: '<a href="/DataSource/details/#=id#">Details</a>', filterable: false }
                        //, { title: "Action", template: '<a href="" onclick="RemoveSelectedRowByID(#=id#)">Delete</a>', filterable: false }
                      , { command: [{
                          name: "Details",
                          click: function(e) {
                              // e.target is the DOM element representing the button
                              var tr = $(e.target).closest("tr"); // get the current table row (tr)
                              // get the data bound to the current table row
                              var data = this.dataItem(tr);
                              alert("Details for: " + data.title);
                          }
                      },
                        { name: "delete" ,
                         click: function(e) {
                              // e.target is the DOM element representing the button
                              var tr = $(e.target).closest("tr"); // get the current table row (tr)
                              // get the data bound to the current table row
                              var data = this.dataItem(tr);

                              var grid = $("#grid").data("kendoGrid");
                              $.ajax({
                                  type: "POST",
                                  url: '<%= Url.Content("~/DataSource/DeleteRecords") %>',
                                  cache: false,
                                  data: { 'id': data.id },
                                  success: function(result) {
                                      alert(result.Value);
                                      grid.dataSource.remove(data); //on success delete selected row from rendo grid(client side)
                                  },
                                  error: function(msg) {
                                      alert("failed");
                                  }
                                 });
                              
                            }
                          }
                        ]
                    }

                        /*,{
                        field: "isDelete", title: "delete", template: "<input type=\"checkbox\"   #= isDelete ? checked='checked' : '' #  class=\"check_row\"/>",
                        headerTemplate: '<label>  <input type="checkbox" id="checkAll"/>Checked All</label>', sortable: false, filterable: false
                        }*/
                        ]
                       , dataSource: { page: 1/*set current page*/,
                                       pageSize:3,
                                       data: jsonObject
                                     }

                    });

                    $(".k-content").dblclick(DoubleClickAction);
                }
                
                function SearchUsers() {
                    $.ajax({
                    url: "/DataSource/SearchMovies"
                       , type: "GET"
                       , data: { searchString: $("#txtSearch").val() }
                       , success: function(result) {
                           $("#grid").data("kendoGrid").dataSource.data(JSON.parse(result));
                       }
                    });
                }

                function DoubleClickAction() {
                    var grid = $("#grid").data("kendoGrid");
                    var selectedRow = grid.dataItem(grid.select());
                    alert("You have double click on " + selectedRow.title + "(" + selectedRow.year + ")");
                }

                function ReLoad() {
                    /*var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/DataSource/GetJsonOutputForMovies", false);
                    xhReq.send(null);
                    var ReloadMovies = JSON.parse(xhReq.responseText);*/

                    var grid = $("#grid").data("kendoGrid");
                    grid.refresh();

                }

                function InsertNewRow() {
                    var grid = $("#grid").data("kendoGrid");
                    var ins = { id: 10, rating: 4, year: 2013 ,title:"World War 2"}; //id=1,rating=9.2,year=1995,title="The Godfather"
                    grid.dataSource.insert(ins);
                }

                function IterateThroughAllRows() {
                    var items = $("#grid").data("kendoGrid").dataSource.data();
                    for (i = 0; i < items.length; i++) {
                        alert(items[i].title +"("+items[i].year+")");
                    }
                }

                function RemoveSelectedRow() {
                    var grid = $("#grid").data("kendoGrid");
                    var selectedRow = grid.dataItem(grid.select());

                    $.ajax({
                        type: "POST",
                        url: '<%= Url.Content("~/DataSource/DeleteRecords") %>',
                        cache: false,
                        data: { 'id': selectedRow.id },
                        success: function(result) {
                            alert(result.Value);
                            grid.dataSource.remove(selectedRow); //on success delete selected row from rendo grid(client side)
                        },
                        error: function(msg) {
                            alert("failed");
                        }
                    });
                    //grid.dataSource.remove(selectedRow);
                }

                function RemoveMultiSelectedRow() {

                    var grid = $("#grid").data("kendoGrid");
                    var rows = grid.select();

                    rows.each(function(index, row) {
                        var selectedRow = grid.dataItem(row);
                        $.ajax({
                            type: "POST",
                            url: '<%= Url.Content("~/DataSource/DeleteRecords") %>',
                            cache: false,
                            data: { 'id': selectedRow.id },
                            success: function(result) {
                                alert(result.Value);
                            },
                            error: function(msg) {
                                alert("failed");
                            }
                        });
                    });

                    rows.each(function() {  //after deleting from serverside now delete Multi-selected row from rendo grid(client side)
                        grid.removeRow($(this).closest('tr'));
                    });
                }
                
//                function Save() {
//                    var gridData = $("#grid").data("kendoGrid").dataSource.data();
//                    $.ajax({
//                        type: "POST"
//                        , url: "/DataSource/SaveGridData"
//                        , data: JSON.stringify({ users: gridData.select(); })
//                        , contentType: "application/json",
//                        datatype: "json",
//                        success: function(result) {
//                            var data = JSON.parse(result);
//                            alert("success:" + data.msg);
//                        }                        
//                    });
//                }
            </script>
            <style scoped>
                .demo-section {
                    width: 600px;	
                }
                
                .metrotable {
                	width: 100%;
                	border-collapse: collapse;
                }
                
                .metrotable > thead > tr > th 
                {
                	font-size: 1.3em;
                	padding-top: 0;
                	padding-bottom: 5px;
                }
            </style>
 
</body>
</html>
