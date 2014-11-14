<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


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
    <div>
    <a href='<%=Url.Action("Check", "CheckAjaxRequest", new { items = "asd" })%>' >Normal call</a>
    <a href='#' onclick="CallByAjax()">Ajax call</a>
    </div>
    
    <% using (Html.BeginForm())
    {%>
    <%=Html.AntiForgeryToken()%>
      
      <input type="submit" value="Submit" />     
    <%}%>

    <script>
        function CallByAjax() {
            var items = "fsf";
            
            var url = '<%= Url.Content("~/CheckAjaxRequest/Check?items=' + items + '")%>';
           

            alert(url);
         $.ajax({
             type: "POST",
             url: '<%= Url.Content("~/CheckAjaxRequest/Check") %>',
             cache: false,
             data: { 'items': 'abs' },
             success: function(result) {
                alert("success : return value "+result);
                window.location.href = result;
                 
             },
             error: function(msg) {
                 alert("failed");
             }
         });
         
         
    }
    </script>
</body>
</html>
