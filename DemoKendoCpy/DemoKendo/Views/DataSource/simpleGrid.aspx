<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<DemoKendo.Controllers.MoviesObj>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>simpleGrid</title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>

        <table id="grid" class="k-content" >
    <tr>
        <th>
            rating
        </th>
        <th>
            year
        </th>
        <th>
            title
        </th>
        <th>Action</th>
        <th> dropdown</th>
    </tr>

<%foreach (var item in Model) { %>
    <tr>
        <td>
            <%=Html.DisplayFor(modelItem => item.rating)%>
        </td>
        <td>
            <%=Html.DisplayFor(modelItem => item.year)%>
        </td>
        <td>
            <%=Html.DisplayFor(modelItem => item.title)%>
        </td>
        <td>
            <%=Html.ActionLink("Details", "Details", new { id=item.id }) %>
        </td>
        <td><select id="name"><option value="1">1</option><option value="2">2</option></select> </td>
    </tr>
<%} %>

</table>

            <script>
                $(document).ready(function() {
                    $("#grid").kendoGrid({
                        pageable: true
                        , sortable: true
                        , silectable: true
                        , selectable: true//""multiple row"",scrollable: true
                         ,filterable: true
                        , dataSource: { pageSize: 10 }
                    });
                });
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
        </div>

</body>
</html>
