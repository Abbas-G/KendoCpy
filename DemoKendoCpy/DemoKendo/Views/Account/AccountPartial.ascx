<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DemoKendo.Models.AccountModel>" %>

<%=ViewData["message"]%>
<% using (Ajax.BeginForm("Index", "Account", null, new AjaxOptions { UpdateTargetId = "TargetDiv" }))
   {%>
   <%= Html.ValidationSummary(true, "") %>
    <div>
    Username: <%=Html.TextBoxFor(x => x.Username)%><%=Html.ValidationMessageFor(x => x.Username)%>
    <br />
    Password: <%=Html.PasswordFor(x => x.Password)%><%=Html.ValidationMessageFor(x => x.Password)%>
    <br />
    Re-type Password: <%=Html.PasswordFor(x => x.ConfirmPassword)%><%=Html.ValidationMessageFor(x => x.ConfirmPassword)%>
    <br />
    </div>
    <button type="submit" > cliick</button>
    <%} %>