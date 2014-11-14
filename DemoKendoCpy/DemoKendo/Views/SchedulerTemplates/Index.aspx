<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Templates</title>
    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.rtl.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendoNew/styles/kendo.default.min.css")%>" rel="stylesheet" />
    <script src="<%= Url.Content("~/Content/kendoNew/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendoNew/js/kendo.web.min.js")%>"></script>
</head>
<body>

    <div id="scheduler">
    </div>
  <script id="editor" type="text/x-kendo-template">
   <center><h3>Edit meeting</h3></center>
   <div class="MeetingEditor">
       <label>Title: <input type="text" class="k-input" name="title" data-bind="value:title" required/></label>
   </div>
  <div class="MeetingEditor">
       <label>Start: <input data-role="datetimepicker" name="start" required/></label>
   </div>
   <div class="MeetingEditor">
       <label>End: <input data-role="datetimepicker" name="end" required/></label>
   </div>
   <div class="MeetingEditor">
       <label>Description: <textarea class="k-input" data-value-field="description"   name="description" /></label>
   </div>
   <div class="MeetingEditor">
       <label>IsAllDay: 	<input type="checkbox" 
				name="isAllDay" 
				data-type="boolean" 
				data-bind="value:isAllDay"/></label>
   </div>
   <div class="MeetingEditor">
       <label>Description: <input name="Category" 
				data-bind="value:Category" 
				data-value-field="Category" 
				data-text-field="Category" 
				data-source="GlobalSearchFOOD" 
				data-role="dropdownlist" />		
		    <span class="k-invalid-msg" data-for="Category"></label>
   </div>
    </script>
    
    <script id="popup_editor" type="text/x-kendo-template">
			<p>Custom editor template</p>
			<div class="k-edit-label">
				<label>Title</label>
			</div>
			<input type="text" class="k-input k-textbox" name="title" data-bind="value:title" required/>
			<span class="k-invalid-msg" data-for="title"></span>
						
			<div class="k-edit-label">
				<label>Start</label>
			</div>
			<input type="text" name="start" data-bind="value:start" data-role="datetimepicker"  required  />
			<span class="k-invalid-msg" data-for="start"></span>
			
			<div class="k-edit-label">
				<label>End</label>
			</div>
			<input type="text" name="end" data-bind="value:end" data-role="datetimepicker"  required  />
			<span class="k-invalid-msg" data-for="end"></span>
			
			<div class="k-edit-label">
				<label>isAllDay</label>
			</div>
			<input type="checkbox" 
				name="isAllDay" 
				data-type="boolean" 
				data-bind="value:isAllDay"/>
				
				<br/>
				
			<div class="k-edit-label">
				<label>Category</label>
			</div>
			<input name="Category" 
				data-bind="value:Category" 
				data-value-field="Category" 
				data-text-field="Category" 
				data-source="GlobalSearchFOOD" 
				data-role="dropdownlist" />		
		    <span class="k-invalid-msg" data-for="Category"></span>
				<br/>

		</script>

    <script id="event-template" type="text/x-kendo-template">

    <div class="meetin-template #if(taskID=='1'){# red-background #}else{# blue-background #}#" >
        <div>#: title #</div>
        Status : #: description #
    </div>
</script>
    
  
    
    <script>

        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", '<%=Url.Content("~/Grid/GetJsonOutputForFoodUniqueCategory")%>', false);
        xhReq.send(null);
        var GlobalSearchFOOD = JSON.parse(xhReq.responseText);
        
        $("#scheduler").kendoScheduler({
            date: new Date("2014/10/11"),
            editable: {
            template: $("#editor").html()
            },

            eventTemplate: $("#event-template").html(),
            height: 600,
            timezone: "Etc/UTC",
            views: [
            "day",
            { type: "week", selected: true },
            "month",
            "agenda"
        ],
            dataSource: {
                batch: true,
                transport: {
                    read: {
                    url: '<%=Url.Content("~/SchedulerTemplates/GetSchedulerDataSelect")%>',
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
                            return { models: kendo.stringify(options.models) };
                        }
                    }
                },
                schema: {
                    model: {
                        id: "taskID",
                        fields: {
                            taskID: { from: "TaskID", type: "number" },
                            title: { from: "Title", defaultValue: "No title", validation: { required: true} },
                            start: { type: "date", from: "Start" },
                            end: { type: "date", from: "End" },
                            startTimezone: { from: "StartTimezone" },
                            endTimezone: { from: "EndTimezone" },
                            description: { from: "Description" },
                            Category:{from: "Category" },
                            recurrenceId: { from: "RecurrenceID" },
                            recurrenceRule: { from: "RecurrenceRule" },
                            recurrenceException: { from: "RecurrenceException" },
                            ownerId: { from: "OwnerID", defaultValue: 1 },
                            isAllDay: { type: "boolean", from: "IsAllDay" }
                        }
                    }
                }
            },
            edit: function(e) {  // prevent edit reference http://stackoverflow.com/questions/25193030/is-there-a-way-to-disable-a-specific-event-in-kendo-ui-scheduler/25193856#25193856
                /*if (e.event.taskID === 2) {
                    e.preventDefault();
                }*/
                //if (e.event.taskID != 0) { //Create mode only no edit
                 //   e.preventDefault();
               // }
            } /*, 
        resources: [
            {
                field: "attendee", //create a dropdown for extra features
                dataSource: [
                    { text: "Alex", value: 1, color: "#f8a398" },
                    { text: "Bob", value: 2, color: "#51a0ed" }
                ],
                title: "Attendee"
            },
            {
                field: "roomId",
                name: "room",
                dataSource: [
                    { text: "Meeting Room 101", value: 1, color: "#6eb3fa" },
                    { text: "Meeting Room 201", value: 2, color: "#f58a8a" }
                ],
                title: "Room"
            }
        ]*/
        });

        // Get reference to the kendo.ui.Scheduler instance
        var scheduler = $("#scheduler").data("kendoScheduler");
        scheduler.view("week"); // Go to week view
    </script>
    <style>
    .MeetingEditor
    {
        margin-left: 2%;
        margin-bottom: 4%;
        clear: both;
        }
    .red-background{
  		background-color: red;
  	}
  	.blue-background{
  		background-color: blue;
  	}
  	.meetin-template {
      	-webkit-border-radius: 5px;
      	-moz-border-radius: 5px;
      	border-radius: 5px;
    }
  	.red-background{
  		background-color: red;
  	}
  	.blue-background{
  		background-color: blue;
  	}
    </style>
</body>
</html>
