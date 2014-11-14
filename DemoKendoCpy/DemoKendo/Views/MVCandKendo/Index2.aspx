<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.CategoryModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index2</title>
            <script src="<%= Url.Content("~/Scripts/MicrosoftMvcValidation.debug.js") %>" type="text/javascript"></script>
<script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Scripts/jquery.validate.js") %>" type="text/javascript"></script>
</head>
<body>
   <% Html.EnableClientValidation(); %>
<%using (Html.BeginForm()){
      string cm1 = Model.CategoryName;%>
<%= Html.ValidationSummary(true) %>
    <%=Html.DropDownListFor(model => model.CategoryName, new SelectList(Model.CategoryList, "Value", "Text"),"select",null)%><%= Html.ValidationMessageFor(m => m.CategoryName)%>
    
    <div>     
    <%=Html.DropDownList("CateName",  new SelectList(Model.CategoryList, "Value", "Text",Model.CateName), "select", null)%><%= Html.ValidationMessageFor(m => m.CateName)%>
    </div>
    <br />
    number:<%= Html.TextBoxFor(m => m.Number)%><%= Html.ValidationMessageFor(m => m.Number)%>
    <input type="submit" value="Send"/>
<%} %>
</body>
</html>
