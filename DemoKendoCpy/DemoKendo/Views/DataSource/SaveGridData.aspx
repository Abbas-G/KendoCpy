<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<DemoKendo.Controllers.MoviesObj>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SaveGridData</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
<% using (Html.BeginForm())
       { %>
<h2>SaveGridData</h2>
<div id="grid"></div>
   <%} %>
    <script type="text/javascript">
       // var users = '<%=Model%>';
        var users = [
         { id: 1, rating: 3, year: 1997, title: "Rock" }
        , { id: 2, rating: 5, year: 1999, title: "X-Man" }, { id: 10, rating: 2, year: 2013, title: "World War 2" }
    ];

       /* var users = [
         { UserId: 1, FirstName: "Hasibul", LastName: "Haque", Email: "hasibul@xyz.com" }
        , { UserId: 2, FirstName: "Jhon", LastName: "Smith", Email: "jhon@xyz.com" }
    ];*/
        $(function() {
        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", "http://localhost:2088/DataSource/GetJsonOutputForMovies", false);
        xhReq.send(null);
        var jsonObject = JSON.parse(xhReq.responseText);
        
            $("#grid").kendoGrid({
            dataSource: { data: users }
            });
        });


        function Save() { // working in mvc3 & framework 4
            var gridData = $("#grid").data("kendoGrid").dataSource.data();
            var a = "abs;"
            //alert(gridData[0].title);
            /*$.ajax({
                type: "POST"
            , url: "/DataSource/SaveGridData"
            , data: JSON.stringify({ users: gridData })
            ,dataType: 'json'
            ,contentType: 'application/json; charset=utf-8'
            , success: function(result) {
                alert(result.count + " record(s) found");
            }
            });*/

            
            /*$.ajax({
            url: '/DataSource/SaveGridData', // PersonsController, AddPerson Action
            data: JSON.stringify({ users: gridData }),
                type: 'POST',
                success: function(data, status) {
                    alert('Method called successfully!');
                }
            });*/

            var myEntries =  [{ ParamA: "A", ParamB: "B" },
                            { ParamA: "C", ParamB: "D"}];

            /*$.ajax({
                type: 'POST',
                url: '/DataSource/SaveGridData',
                cache: false,
                data: JSON.stringify({ users: myEntries }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            });*/

            $.ajax({
                type: "POST",
                url: '<%= Url.Content("~/DataSource/SaveGridData") %>',
                cache: false,
                data: JSON.stringify({ users: myEntries }),
                success: function(result) {
                alert(result.count);
                },
                error: function(msg) {
                    alert("failed");
                }
            });
        }

</script>


<input type="button" onclick="Save()" value="Post Grid Data"/>
</body>
</html>
