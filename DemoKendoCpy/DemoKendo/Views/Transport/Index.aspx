<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <div>
    <div id="grid"></div>
    <input id="ddlWorker"  name="Worker" class:"validate[required] inputLong" style="width: 400px;" value="@workerPosId" required  />

    
    <script>
        var dropdownlist;
        $(document).ready(function() {

            var xhReq = new XMLHttpRequest();
            xhReq.open("POST", "http://localhost:2088/DataSource/GetJsonOutputForWorker", false);
            //xhReq.open("GET", "http://localhost:2088/MultiSelection/GetJsonOutputForCustomMultiSelect", false);
            xhReq.send(null);
            var jsonObject = JSON.parse(xhReq.responseText);

            /*dropdownlist = $("#ddlWorker").kendoDropDownList({
            dataTextField: "workerName",
            dataValueField: "workerID",
            autoBind: false,
            optionLabel: {
            workerName: "--- Please Assign A Worker ---",
            workerID: ""

                },
            template:
            '<h5>${ data.workerName }</h5>' +
            '#if(data.AvailableDay_LookID) {#<p>${ data.AvailableDay_LookID }</p>#}#' +
            '#if(data.StartTime && data.EndTime) {#<p>${ data.StartTime } - ${ data.EndTime }</p>#}#',
            dataSource: jsonObject,

                open: function() {
            var raw = dropdownlist.dataSource.data();
            var length = raw.length;
            if (length < 1)
            alert("kendodropdown have zero data");
            else
            alert(length);
            }
            }).data("kendoDropDownList");*/


            var dropdownlist = $("#ddlWorker").kendoDropDownList({
                dataTextField: "workerName",
                dataValueField: "workerID",
                autoBind: false,


                optionLabel: {
                    workerName: "--- Please Assign A Worker ---",
                    workerID: ""

                },
                // define custom template
                template:
                                      '<h5>${ data.workerName }</h5>' +
'#if(data.AvailableDay_LookID) {#<p>${ data.AvailableDay_LookID }</p>#}#' +
'#if(data.StartTime && data.EndTime) {#<p>${ data.StartTime } - ${ data.EndTime }</p>#}#',

                dataSource: {
                    transport: {
                        read: {
                            url: "http://localhost:2088/DataSource/GetJsonOutputForWorker",
                            dataType: "json",
                            type: "POST"
                        }
                    }
                }
                }).data("kendoDropDownList");

                /*dropdownlist.dataSource.one("change", function() {
                var raw = dropdownlist.dataSource.data();
                var length = raw.length;
                if (length < 1)
                alert("kendodropdown have zero data");
                else
                alert(length);
                });*/
                dropdownlist.dataSource.bind("change", function(e) {
                    var raw = dropdownlist.dataSource.data();
                    var length = raw.length;
                    if (length < 1) {
                        alert("kendodropdown have zero data");
                    }
                });

                $("#grid").kendoGrid({
                    dataSource: {
                        type: "json",
                        serverPaging: true,
                        pageSize: 20,
                        transport: { read: { url: "http://localhost:2088/DataSource/GetJsonOutputForMovies", dataType: "json", type: "POST"} }
                ,
                        schema: {
                            model: {
                                id: "id",
                                fields: {
                                    ProductID: { editable: false, nullable: true },
                                    title: { type: "string", validation: { required: true} },
                                    rating: { type: "number", validation: { required: true, min: 1} },
                                    year: { type: "number", validation: { min: 0, required: true} },
                                    isDelete: { type: "boolean" }

                                }
                            }
                        }
                    },
                    //toolbar: kendo.template($("#searchTemplate").html()),
                    //height: 500,
                    pageable: true,
                    columns: [
                            { field: "title", title: "title", template: '<a href="" onclick="showName();"># if( title==null) {#<span>no value<span># } else {#<span>#: title#<span>#} #</a>' },
                            { field: "year", title: "year" },
                            { field: "rating", title: "rating" },
                            { field: "isDelete", title: "isDelete" }
                            ]
                });

            });

    function showName(a) {
        alert(a);
    }
    function checkData() {
        var raw = dropdownlist.dataSource.data();
        var length = raw.length;
        if (length < 1)
            alert("kendodropdown have zero data");
        else
            alert(length);
    }
    
    </script>
    </div>
</body>
</html>
