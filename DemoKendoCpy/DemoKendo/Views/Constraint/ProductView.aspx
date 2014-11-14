<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.ProductViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ProductView</title>
</head>
<body>
    <div>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%= Html.Encode(Model.Description) %></div>
        
        <div class="display-label">CouponCode</div>
        <div class="display-field"><%= Html.Encode(Model.CouponCode) %></div>
        
    </fieldset>
    <p>
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>
    </div>
</body>
</html>
