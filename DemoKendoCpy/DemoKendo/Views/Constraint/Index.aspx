<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.ProductViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
</head>
<body>
    <div>
    -------------------1st Example-----------------
        <ul>
            <li><%= Html.ActionLink("this-is-a-slug", "Content", new {slug = "this-is-a-slug"}) %></li>
            <li><%= Html.ActionLink("another-slug", "Content", new { slug = "another-slug" })%></li>
        </ul>
        <br/>
    -------------------2nd Example-----------------
     <% using (Html.BeginForm("ProductView", "Constraint"))
        {%>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(product => product.Id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(product => product.Id) %>
                <%= Html.ValidationMessageFor(product => product.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(product => product.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(product => product.Name) %>
                <%= Html.ValidationMessageFor(product => product.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(product => product.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(product => product.Description) %>
                <%= Html.ValidationMessageFor(product => product.Description) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(product => product.CouponCode) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(product => product.CouponCode) %>
                <%= Html.ValidationMessageFor(product => product.CouponCode) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>
    </div>
</body>
</html>
