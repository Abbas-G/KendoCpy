<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

 <% using (Html.BeginForm("PartialViewNext","twoform")) {%>
<input type="submit" value="search" />
<%} %>