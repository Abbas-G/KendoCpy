<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<DemoKendo.Controllers.MyDateView>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Date and Aggregate function </title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
<h2>Date  and Aggregate function</h2>
<div id="window"></div>
<div id="grid" class="k-content"></div>


 <script type="text/x-kendo-template" id="editClientTemplate">
          <div id="details-container">
              <h2>#= City # #= City #</h2>
              <dl>
                  <dt><label>City: <input data-bind="value: City" /></label></dt>
                  <dt><label>Price: <input data-bind="value: Price" /></label></dt>
                  <dt><label>Date: <input data-bind="value: MyDate" /></label></dt>
              </dl>
          </div>
      </script>
    <script type="text/javascript">
        $(function() {
            var xhReq = new XMLHttpRequest();
            xhReq.open("POST", "http://localhost:2088/DataSource/GetJsonMydate", false);
            xhReq.send(null);
            var jsonObject = JSON.parse(xhReq.responseText);

            var dataSource = $("#grid").kendoGrid({
                         pageable: true
                        ,sortable: true
                        , silectable: true
                        , selectable: "multiple row"//selectable: "multiple row",selectable: true,scrollable: true
                        , filterable: true
                , columns: [
                { field: "Uniqueid", title: "UniqueId", filterable: true},
                { field: "City", title: "City", filterable: true, footerTemplate: "Total Count: #=count#",
                    groupHeaderTemplate: "Group by #= value # (Count: #= count#)"
                },
                { field: "Price", title: "Price", filterable: false, footerTemplate: "Total Count:#= count# ,Total Sum: #=sum#", groupFooterTemplate: "<div>Min: #= min # Max: #= max # Sum: #=sum#</div>"
                },
                { field: "MyDate", type: "date", /*format: "{0:h:mm:ss tt}",format: "{0:MM/dd/yyyy",*/format: "{0:MM/dd/yyyy h:mm:ss tt}" }
                 , { command: [{ text: "View Details", click: showDetails, title: " ", width: "140px" },
                               { text: "Delete", click: removeRow, title: " ", width: "140px" }, { text: "Edit", click: editRow, title: " ", width: "140px"}]
            }
                   //, { command: ["edit", "destroy"], title: "&nbsp;", width: "160px" }
            ],
                dataSource: { data: jsonObject, pageSize: 3
                          , group: {
                              field: "City", aggregates: [
                                        { field: "City", aggregate: "count" },
                                        { field: "Price", aggregate: "count" },
                                        { field: "Price", aggregate: "sum" },
                                        { field: "Price", aggregate: "min" },
                                        { field: "Price", aggregate: "max" }
                                     ]
                          }

                            , aggregate: [{ field: "City", aggregate: "count" },
                                          { field: "Price", aggregate: "count" },
                                          { field: "Price", aggregate: "sum" },
                                          { field: "Price", aggregate: "min" },
                                          { field: "Price", aggregate: "max" }
                                        ]
                                        /*, batch: true
                                        , schema: {
                                            model: {
                                            id: "ID",
                                                fields: {
                                                    City: { editable: true, nullable: true },
                                                    //ProductName: { validation: { required: true} },
                                                    Price: { type: "number", validation: { required: true, min: 1} },
                                                    MyDate: { type: "date" }//,
                                                    //UnitsInStock: { type: "number", validation: { min: 0, required: true} }
                                                }
                                            }
                                        }*/
                                    }
                 /*,editable: {
						mode: "popup",
						window: {
							modal: true,
							resizable: true,
							draggable: true,
							visible: true
						}//,
						//template: kendo.template($("#editClientTemplate").html())
					} 
                ,edit: function(e) {
					var title = e.model.City + " " + e.model.Price;
			        //if (!$(e.container).data("kendoWindow")) {
                    var wnd = $(e.container).data("kendoWindow");
			        wnd.setOptions({
				        title: title
				        //,close: onClose,
                          //  deactivate: onDeactivate
			        });
        			
			        wnd.bind("close", function () {
        		        alert("ad");
    		        });
			        //}
			        //else
 			        //$(e.container).data("kendoWindow").open();
                  }  */
                   
            });

            $(".k-content").dblclick(DoubleClickAction);
            
            
        });

        function DoubleClickAction() {
            var grid = $("#grid").data("kendoGrid");
            var selectedRow = grid.dataItem(grid.select());
            alert("You have double click on " + selectedRow.Price + "(" + selectedRow.City + ")");
        }
        function showDetails(e) {
            // e.target is the DOM element representing the button
            var tr = $(e.target).closest("tr"); // get the current table row (tr)
            // get the data bound to the current table row
            var data = this.dataItem(tr);
            alert("Details for: " + data.City);
        }

        function removeRow(e) {
            // e.target is the DOM element representing the button
            var tr = $(e.target).closest("tr"); // get the current table row (tr)
            // get the data bound to the current table row
            var data = this.dataItem(tr);
            var grid = $("#grid").data("kendoGrid");
            alert("Row with name " + data.City + " and Price " + data.Price + " deleted successfully");
            grid.dataSource.remove(data); 
        }
        function editRow(e) {
            // e.target is the DOM element representing the button
            var tr = $(e.target).closest("tr"); // get the current table row (tr)
            var data = this.dataItem(tr);
            var grid = $("#grid").data("kendoGrid");
            //alert("Row with Uniqueid " + data.Uniqueid + " and Price " + data.Price + " edited successfully");
            //$("#window").data("kendoWindow").close();
            var noteWindowDivId = "noteWindow" + data.Uniqueid;
            if (!$("#" + noteWindowDivId).data("kendoWindow")) {
                $("<div id=\"" + noteWindowDivId + "\" />").appendTo(document.body).kendoWindow({
                    draggable: true, 
                    resizable: true, 
                    title: data.Uniqueid,
                    scrollable: false,
                    modal: false,
                    content: {url: "/DataSource/Details",
                              data: { id: 1 }},
                    //center:true,
                    actions: ["Close"]
                });
                $('#' + noteWindowDivId).parent().css("top", "20%");
                $('#' + noteWindowDivId).parent().css("left", "10%");
                //$("#" + noteWindowDivId).data("kendoWindow").content("<textarea id=\"" + data.Uniqueid + "\" style=\"width: 100%; height: 100%\">" + data.Uniqueid + "</textarea>");
            }
            else
                $("#" + noteWindowDivId).data("kendoWindow").open();

            //grid.dataSource.remove(data); 
        }
        
        
        function onClose(e) {
            $("#undo").show();
            alert("event :: close");
        }
        function onDeactivate(e) {
            //$("#undo").show();
            alert("event :: onDeactivate");
        }

        function RemoveMultiSelectedRow() {
            var grid = $("#grid").data("kendoGrid");
            var rows = grid.select();
            
            rows.each(function(index, row) {
            var selectedRow = grid.dataItem(row);
            alert(selectedRow.City);
            });

            rows.each(function() {
            grid.removeRow($(this).closest('tr'));
            });
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

        function InsertNewRow() {
            var grid = $("#grid").data("kendoGrid");
            var ins = { id: 10, rating: 4, year: 2013, title: "World War 2" }; //id=1,rating=9.2,year=1995,title="The Godfather"
            grid.dataSource.insert(ins);
        }

        function IterateThroughAllRows() {
            var items = $("#grid").data("kendoGrid").dataSource.data();
            for (i = 0; i < items.length; i++) {
                alert(items[i].title + "(" + items[i].year + ")");
            }
        }

//        function Save() {
//            var gridData = $("#grid").data("kendoGrid").dataSource.data();
//            $.ajax({
//                type: "POST"
//                        , url: "/DataSource/SaveGridDataForUseOfDate"
//                        , data: JSON.stringify({ users: gridData })
//                        , contentType: "application/json",
//                datatype: "json",
//                success: function(result) {
//                    var data = JSON.parse(result);
//                    alert("success:" + data.msg);
//                }
//            });
//        }
</script>
<input type="button" value="RemoveMultiSelectedRow" onclick="RemoveMultiSelectedRow()" />
<%--<input type="button" value="Save" onclick="Save()" />--%>
</body>
</html>
