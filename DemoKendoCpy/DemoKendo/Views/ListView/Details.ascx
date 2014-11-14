<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DemoKendo.Controllers.ProjectObj>" %>

<fieldset>
    <legend>Movies Detail</legend>

    <div class="display-label">Project No</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.PNo)%>
    </div>

    <div class="display-label">Project Number</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.PName)%>
    </div>

    <div class="display-label">Summary</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.PShortSummary)%>
    </div>
    
    <div class="display-label">Created Date</div>
    <div class="display-field">
        <%=Html.DisplayFor(model => model.CreatedDate)%>
    </div>
</fieldset>

