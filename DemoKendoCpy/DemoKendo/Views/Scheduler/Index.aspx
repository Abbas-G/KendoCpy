<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>

    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.rtl.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.default.min.css")%>" rel="stylesheet" />
    <script src="<%= Url.Content("~/Content/kendoNew/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendoNew/js/kendo.web.min.js")%>"></script>
    <%--<script src="<%= Url.Content("~/Content/kendoNew/cultures/kendo.culture.en-US.min.js")%>"></scr--%>ipt>
</head>
<body>
    <div>
    <%--<div class="configuration-horizontal">
        <div class="config-section">
            <span class="configHead">Current Date</span>
            <input id="date" />
        </div>
        <div class="config-section">
            <span class="configHead">Current View</span>
            <select id="views">
                <option value="agenda">Agenda</option>
                <option value="day">Day</option>
                <option value="month">Month</option>
                <option value="week">Week</option>
            </select>
        </div>
    </div>--%>
    <div id="scheduler"></div>
    </div>
    <script>
$(function() {
    $("#scheduler").kendoScheduler({
        //date: new Date("2013/6/13"),
    //startTime: new Date("2013/6/13 7:00"),
    date: new Date("2014/10/11"),
    //startTime: new Date("2014/10/11 7:00 AM"),
         height: 600,
        timezone: "Etc/UTC",
        views: [
            "day",
            { type: "week", selected: true },
            "month",
            "agenda"
        ],
        timezone: "Etc/UTC",
        dataSource: {
            batch: true,
            transport: {
            read: {
            url: '<%=Url.Content("~/Scheduler/GetSchedulerDataSelect")%>',
                    //url: "http://demos.telerik.com/kendo-ui/service/tasks",
                    dataType: "json"
                },
                update: {
                    url: '<%=Url.Content("~/Scheduler/GetSchedulerDataUpdate")%>',
                    dataType: "json"
                },
                create: {
                    url: '<%=Url.Content("~/Scheduler/GetSchedulerDataCreate")%>',
                    dataType: "json"
                },
                destroy: {
                    url: '<%=Url.Content("~/Scheduler/GetSchedulerDataDelete")%>',
                    dataType: "json"
                },
                parameterMap: function(options, operation) {
                    if (operation !== "read" && options.models) {
                        return {models: kendo.stringify(options.models)};
                    }
                }
            },
            schema: {
                model: {
                    id: "taskID",
                    fields: {
                        taskID: { from: "TaskID", type: "number" },
                        title: { from: "Title", defaultValue: "No title", validation: { required: true } },
                        start: { type: "date", from: "Start" },
                        end: { type: "date", from: "End" },
                        startTimezone: { from: "StartTimezone" },
                        endTimezone: { from: "EndTimezone" },
                        description: { from: "Description" },
                        recurrenceId: { from: "RecurrenceID" },
                        recurrenceRule: { from: "RecurrenceRule" },
                        recurrenceException: { from: "RecurrenceException" },
                        ownerId: { from: "OwnerID", defaultValue: 1 },
                        isAllDay: { type: "boolean", from: "IsAllDay" }
                    }
                }
            }
        }
    });

    var scheduler = $("#scheduler").data("kendoScheduler");
    //kendo.culture("en-US");
    /*$("#date").kendoDatePicker({
        //value: new Date("2013/6/13"),
        change: function() {
            scheduler.date(this.value());
        }
    });

    $("#views").kendoDropDownList({
        value: scheduler.view().name,
        change: function() {
            scheduler.view(this.value());
        }
    });*/
});
</script>
</body>
</html>
