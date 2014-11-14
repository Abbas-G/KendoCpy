<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DemoKendo.Controllers.MoviesObj>" %>
<h2>Details</h2>

<fieldset>
    <legend>Movies Detail</legend>

    <div class="display-label">Rating</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.rating)%>
    </div>

    <div class="display-label">Year</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.year)%>
    </div>

    <div class="display-label">Title</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.title)%>
    </div>
</fieldset>
<p>
    <%=Html.ActionLink("Back to List(index)", "Index")%>
    <%=Html.ActionLink("Back to List(SimpleGrid)", "simpleGrid")%>
</p>
