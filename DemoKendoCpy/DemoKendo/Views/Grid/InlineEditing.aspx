<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>InlineEditing</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
    <div id="AddNew">
				
                    <label for="ProductNameform" class="required">Your Name</label>
                    <input type="text" id="ProductNameform" name="ProductNameform" class="k-textbox" placeholder="Product name" required validationMessage="Please enter Product name" />
               <br />
                    <label for="UnitPriceforms">Unit in price</label>
                    <input id="UnitPriceforms" name="UnitPriceforms" type="text" value="0"required validationMessage="Please enter unit in price"  />
                    <span class="k-invalid-msg" data-for="UnitPriceforms"></span>
                <br />
                    <label for="UnitStockform">Unit in stock</label>
                    <input id="UnitStockform" name="UnitStockform" type="text"  value="0" />
                    <span class="k-invalid-msg" data-for="UnitStockform"></span>
                <br />
						<label for="Discontinuedform">Discontinued</label>
                        <input type="radio" name="Discontinuedform" value="true" checked> True
    					<input type="radio" name="Discontinuedform" value="false" > False
				<br />
                    <label for="Categoryform">Food Category</label>
                   	<input id="Categoryform" style="width: 300px" required validationMessage="Please select food ategory" />
                    <span class="k-invalid-msg" data-for="time"></span>
               <br />
                    <button class="k-button" type="button" name="Submit" id="Submit" >Add New Record</button>
					<button class="k-button" type="button" name="cancel" id="cancel" onclick="clearRecords()">Clear</button>
               <br />
                <input type="email" name="email" />
                 <div class="status">
                </div>
	</div>
            <div id="example" class="k-content">
            	
            <div id="grid"></div>
<script id="grid_toolbar" type="text/x-kendo-template">
      <button class="k-button" id="grid_toolbar_queryBtn">Query</button>
</script>

<script type="text/x-kendo-template" id="template">
                <div class="toolbar">
                    <label for="products">Search Products by Category:</label><input id="products" style="width: 250px" onchange="ProductChange()"/>
                    <label for="Theme">Theme Switcher:</label><input id="theme_ddl" value="1" onchange="onThemeChange()"/>
                </div>
                
 </script>
 
            <script>

                var GlobalSearchFOOD;
                var pSize=3;
                $(document).ready(function() {

                    var xhReq = new XMLHttpRequest();
                    xhReq.open("POST", "http://localhost:2088/Grid/GetJsonOutputForGridDataSelect", false);
                    //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    xhReq.send(null);
                    var jsonObject = JSON.parse(xhReq.responseText);

                    var dataSource = new kendo.data.DataSource({
                        page: 1/*set current page*/,
                        pageSize: pSize,
                        transport: {
                            read: {
                                url: "http://localhost:2088/Grid/GetJsonOutputForGridDataSelect",
                                dataType: "json",
                                type: "POST"
                            },
                            update: { // this function will be call on any kendo update
                                url: "http://localhost:2088/Grid/GetJsonOutputForGridDataUpdate",
                                dataType: "json",
                                type: "POST"
                            },
                            destroy: { // this function will be call on any kendo deletion
                                url: "http://localhost:2088/Grid/GetJsonOutputForGridDataDelete",
                                dataType: "json",
                                type: "POST"
                            }
                            /*update: function(options) {
                            // make JSONP request to http://demos.kendoui.com/service/products/update
                            $.ajax({
                            url: "http://localhost:2088/Grid/GetJsonOutputForGridDataSelectbyName",
                            dataType: "json", // "jsonp" is required for cross-domain requests; use "json" for same-domain requests
                            type: "POST",
                            // send the updated data items as the "models" service parameter encoded in JSON
                            data: {
                            models: kendo.stringify(options.data.models)
                            },
                            success: function(result) {
                            // notify the data source that the request succeeded
                            options.success(result);
                            },
                            error: function(result) {
                            // notify the data source that the request failed
                            options.error(result);
                            }
                            });
                            }*/
                            /*,
                            parameterMap: function(data, type) {
                            /* if (type !== "read" && type.models) {
                            // send take as "$top" and skip as "$skip"
                            //alert("as");
                            //return { models: kendo.stringify(data.UnitPrice) };
                            alert(data.UnitPrice);
                            }*/
                            //alert(kendo.stringify(data));
                            //return kendo.stringify(data);

                            /*}*/
                        },
                        schema: {
                            model: {
                                id: "ProductID",
                                fields: {
                                    ProductID: { editable: false, nullable: true },
                                    ProductName: { validation: { required: true} },
                                    UnitPrice: { type: "number", validation: { required: true, min: 1} },
                                    Discontinued: { type: "boolean" },
                                    UnitsInStock: { type: "number", validation: { min: 0, required: true} },
                                    Category: { validation: { required: true} }
                                }
                            }
                        }
                    });

                    $("#grid").kendoGrid({
                        dataSource: dataSource,
                        pageable: true
                        , sortable: true
                        , silectable: true
                        , selectable: "multiple row"//selectable: "multiple row",selectable: true,scrollable: true
                        //, navigatable: true//to enable keyboard navigation
                        , buttonCount: 1
                        , filterable: {
                            extra: false /*or extra: true or ( for edit option add "message" tag as below)
                            messages: {
                                and: "and",
                                or: "or",
                                filter: "Apply",
                                clear: "Original",
                                info: "Filter by: ",
                            }*/
                        },
                        height: 430,
                        toolbar: [{ text: "", template: kendo.template($("#template").html()) }
                                  , { text: "", template: kendo.template($("#grid_toolbar").html()) }
                                  , { text: "create", template: "<a href='javascript: void(0)' class='abutton create' onclick='createRow()' title='Add New Row'>create</a>" }
                                  ],
                        //toolbar: ["create"],
                        columns: [
                            { field: "ProductName", title: "ProductName" },
                            { field: "UnitPrice", title: "Unit Price", format: "{0:c}" },
                            { field: "UnitsInStock", title: "Units In Stock" },
                            { field: "Discontinued" },
                            { field: "Category", title: "Category", filterable: { ui: GroupFilter }, editor: ColumnGroupFilter },
                            { command: [{ name: "edit", text: { edit: "Edit", update: "Save", cancel: "Cancel"}/*, template: kendo.template($("#edit_template").html())*/ }
                            ], title: 'Edit', width: "70px"
                            },
                            { command: [{ text: "Delete", click: removeRow, /* template: "<a href='javascript: void(0)' class='abutton delete' onclick='deleteRow(this)' title='button delete'>button delete</a>",*/title: " ", width: "140px"}], title: 'Delete' }
                            ],
                        editable: "inline"
                        // , editable: true
                        /*,
                        columnMenu: {
                        messages: {
                        columns: "Choose columns",
                        filter: "Apply filter",
                        sortAscending: "Sort (asc)",
                        sortDescending: "Sort (desc)"
                        }
                        }*/
                        , save: function(e) {
                            alert("save :"+e.model.ProductID + " : " + e.model.ProductName + " : " + e.model.UnitPrice + " : " + e.model.UnitsInStock + " : " + e.model.Discontinued + " : " + e.model.Category);
                            /***{server code here for edit record}***/

                            /****/
                            var grid = $("#grid").data("kendoGrid");
                            var selectedRow = grid.select();
                            var selectedRowIndex = selectedRow.index();             // incorrect selected row index returned
                            var currentPage = grid.dataSource.page();
                            var pagesize = grid.dataSource.pageSize() - 1;
                            var CountPage = pSize * currentPage - pagesize;
                            //alert(selectedRowIndex + (currentPage == 1) ? 0 : CountPage - 1);
                            var Item2;
                            if (currentPage == 1)
                                Item2 = $('#grid').data().kendoGrid.dataSource.data()[selectedRowIndex];
                            else
                                Item2 = $('#grid').data().kendoGrid.dataSource.data()[selectedRowIndex + (CountPage - 1)];

                            //Item2.set("ProductID", e.model.ProductID);
                            Item2.set("ProductName", "hi");
                            Item2.set("UnitPrice", "0210");

                        }
                        , error: function(e) { alert("error"); }

                    });
                    /**Custom grid top button click event**/
                    $("#grid_toolbar_queryBtn").click(function(e) {
                        alert("query button clicked!");
                    });

                    /**Custom grid top search button***/

                    xhReq.open("POST", "http://localhost:2088/Grid/GetJsonOutputForFoodUniqueCategory", false);
                    //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
                    xhReq.send(null);
                    var SearchFOOD = JSON.parse(xhReq.responseText);
                    GlobalSearchFOOD = SearchFOOD;

                    var products = $("#products").kendoComboBox({
                        placeholder: "Select food Category...",
                        dataTextField: "Category",
                        dataValueField: "Category",
                        dataSource: SearchFOOD
                    }).data("kendoComboBox");


                    /**Custom grid top theme switcher click event**/
                    var Themedata = [
                        { text: "Black (default)", value: "custom_black" },
                        { text: "Metro Black", value: "custom_metro_black" },
                        { text: "Pink Black", value: "custom_pink_black" },
                        { text: "Moon Light", value: "custom_moon_light" },
                        { text: "Blue Opal", value: "custom_blue_opal" },
                        { text: "Grey Yellow", value: "custom_gray_yellow" },
                        { text: "Grey Blue", value: "custom_gray_blue" }
                    ];
                    $("#theme_ddl").kendoDropDownList({
                        dataTextField: "text",
                        dataValueField: "value",
                        dataSource: Themedata,
                        //change: onThemeChange,
                        index: 0
                    });

                    /*****Add new content form script**/
                    var Categoryform = $("#Categoryform").kendoComboBox({
                        placeholder: "Select food Category...",
                        dataTextField: "Category",
                        dataValueField: "Category",
                        dataSource: SearchFOOD
                    }).data("kendoComboBox");

                    $("#UnitPriceforms").kendoNumericTextBox();
                    $("#UnitPriceforms").kendoNumericTextBox({
                        culture: "de-DE"
                    });
                    $("#UnitStockform").kendoNumericTextBox();
                    var validator = $("#AddNew").kendoValidator().data("kendoValidator"),
                    status = $(".status");

                    $("#Submit").click(function() {

                        if (validator.validate()) {
                            alert("Product name :" + $('#ProductNameform').val() + " Discontinue :" + $('input[name="Discontinuedform"]:checked').val() + " PriceUnit :" + $('#UnitPriceforms').val() + " UnitStock :" + $('#UnitStockform').val() + " Food Category :" + $('#Categoryform').val());
                            var grid = $("#grid").data("kendoGrid");
                            var ins = { ProductID: 102, ProductName: $('#ProductNameform').val(), UnitPrice: $('#UnitPriceforms').val(), UnitsInStock: $('#UnitStockform').val(), Discontinued: $('input[name="Discontinuedform"]:checked').val(), Category: $('#Categoryform').val() }; //id=1,rating=9.2,year=1995,title="The Godfather"
                            grid.dataSource.insert(ins);
                            status.text("Records added successdully").removeClass("invalid").addClass("valid");
                            /**server code here **/
                            /*if success then*/
                            $("#AddNew").data("kendoWindow").close();
                        } else {
                            status.text("Oops! There is invalid data in the form.")
                                .removeClass("valid")
                                .addClass("invalid");
                        }
                    });

                    /*****end**/

                    /***add new reords window***/
                    var window = $("#AddNew");

                    if (!window.data("kendoWindow")) {
                        window.kendoWindow({
                            width: "350px",
                            actions: ["Custom", "Minimize", "Maximize", "Close"],
                            title: "Add New Record",
                            close: function() {
                            }
                        });
                    }
                    window.data("kendoWindow").wrapper.find(".k-i-custom").click(function(e) {
                        alert("Custom action button clicked on 1st window (hello world)");
                        e.preventDefault();
                    });
                    $('#AddNew').parent().css("top", "20%");
                    $('#AddNew').parent().css("left", "10%");
                    $("#AddNew").data("kendoWindow").close();
                    /***end**/

                });

            function ProductChange() {
                //alert($("#products").val());
                $.ajax({
                    url: "/Grid/SearchFOODbyCategory"
                       , type: "GET"
                       , data: { searchString: $("#products").val() }
                       , success: function(result) {
                          $("#grid").data("kendoGrid").dataSource.data(JSON.parse(result));
                       }
                });
            }

            function onThemeChange() {
                var path = '<%=Url.Content("~/Content/kendo/style/CustomThemes/")%>'
                var value = $("#theme_ddl").val();
                document.getElementById('stylesheet').href = path + value + '.css';
                var grid = $("#grid").data("kendoGrid");
                grid.refresh();
                //document.getElementById("themefrm").submit();
            }

            function removeRow(e) {
                // e.target is the DOM element representing the button
                var tr = $(e.target).closest("tr"); // get the current table row (tr)
                // get the data bound to the current table row
                var data = this.dataItem(tr);
                var grid = $("#grid").data("kendoGrid");
                alert("Row with ProductID :" + data.ProductID + " and ProductName :" + data.ProductName + " deleted successfully");
                /*server coding here*/
                grid.dataSource.remove(data);
            }

            function createRow() {
                /**clear previous record **/
                clearRecords();
                $("#AddNew").data("kendoWindow").open();
            }

            function clearRecords() {
                /**clear previous record **/
                document.getElementById("ProductNameform").value = "";
               // document.getElementById("UnitPriceforms").value = 0;
                //document.getElementById("UnitStockform").value = 0;                
                $("#Categoryform").data("kendoComboBox").value("");
                $("#AddNew").data("kendoWindow").element.find("span.k-tooltip-validation").hide();
                $(".status").text("").removeClass("invalid").addClass("valid");
            }
            
            function ColumnGroupFilter(container, options) {
                $('<input name="' + options.field + '"/>').appendTo(container).kendoComboBox({
                
                    placeholder: "Select food Category...",
                        dataTextField: "Category",
                        dataValueField: "Category",
                        dataSource: GlobalSearchFOOD
                    
                });
            }

            function GroupFilter(e) {
                e.kendoDropDownList({
                dataSource: GlobalSearchFOOD,
                dataTextField: "Category",
                        dataValueField: "Category"
                });
            }
            </script>
           
 
            <style>
                /*Style build-in commands*/
    .abutton,
    div.k-grid .k-grid-edit,
    div.k-grid .k-grid-delete,
    div.k-grid .k-grid-cancel,
    div.k-grid .k-grid-update  {
        display:inline-block;
        width:16px;
        height:16px;
        text-align:center;
        text-indent:-444px;
        min-width:0;
        border:0;
    }

    div.k-grid .k-grid-edit {
        background: url('<%=Url.Content("~/Content/icons/edit.png")%>');
    }

    div.k-grid .k-grid-delete {
        background: url('<%=Url.Content("~/Content/icons/cancel.png")%>');
    }

    div.k-grid .k-grid-cancel {
        background: url('<%=Url.Content("~/Content/icons/cancel.png")%>');
    }

    div.k-grid .k-grid-update {
        background: url('<%=Url.Content("~/Content/icons/ok.png")%>');
    }


    /*Style custom buttons*/
    .abutton.delete {
        background: url('<%=Url.Content("~/Content/icons/cancel.png")%>');
    }

    .abutton.edit {
       background: url('<%=Url.Content("~/Content/icons/edit.png")%>');
    }

    .abutton.update {
        background: url('<%=Url.Content("~/Content/icons/ok.png")%>');
    }

    .abutton.cancel {
        background: url('<%=Url.Content("~/Content/icons/cancel.png")%>');
    }

    .abutton.create {
        background: url('<%=Url.Content("~/Content/icons/add.png")%>');
    }
                .valid {
                    color: green;
                }

                .invalid {
                    color: red;
                }
            </style>
         </div>
       
       
       <%--  theme swicther via submit button refrecing whole page insead of only grid
       <form id="themefrm" action="">
<input type="submit"
  onclick="changeStyle('custom_black');return false;"
  name="theme" value="Black Theme" id="Black"/>
<input type="submit"
  onclick="changeStyle('custom_metro_black');return false;"
  name="theme" value="Metro Black Theme" id="MetroBlack"/>
</form>
      
        <script>
            /***switch style***/
            function changeStyle(style) {
            var path='<%=Url.Content("~/Content/kendo/style/")%>'
            document.getElementById('stylesheet').href = path+style+'.css';
            }
        </script>--%>
</body>
</html>
