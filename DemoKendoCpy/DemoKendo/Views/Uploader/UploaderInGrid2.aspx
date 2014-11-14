<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>File Uploader inside grid 2</title>
    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <table id="grid" style="width: 100%"></table>
	
	<script type="text/javascript">
	
	var localData = [
		{Id: 1, StatusText: "Status 1", CommissionTypeText: "Commission 1"},
		{Id: 2, StatusText: "Status 2", CommissionTypeText: "Commission 2"},
		{Id: 3, StatusText: "Status 3", CommissionTypeText: "Commission 3"},
		{Id: 4, StatusText: "Status 4", CommissionTypeText: "Commission 4"},
		{Id: 5, StatusText: "Status 5", CommissionTypeText: "Commission 5"}
	];
	
	var uploadInput = '<form method="post" action="#"><div><input name="upload" type="file" /></div></form>';

	var radioBtns = '<form><input type="radio" name="sex" value="male" /> Male<br /><input type="radio" name="sex" value="female" /> Female</form>';

	var dataSource = new kendo.data.DataSource( {
		data: localData,
		schema: {
			model: {
				fields: {
					Id: { type: "number" },
					StatusText: { type: "string" },
					CommissionTypeText: { type: "string" }
				}
			}
		}
	});

	$("#grid").kendoGrid({
		dataSource: dataSource,
		dataBound: function(e) {
			$("input[type='file']").kendoUpload();
		},
		scrollable: true,
		height: 500,
		columns: [
			{
				field: "Id",
				title: "Id",
				filterable: false
			},
			{
				field: "StatusText",
				title: "StatusText"
			},
			{
				field: "CommissionTypeText",
				title: "CommissionTypeText"
			},
			{
				title: "Upload",
				filterable: false,
				sortable: false,
				template: "#= uploadInput #"
			},
			{
				title: "Radio Buttons",
				filterable: false,
				sortable: false,
				template: "#= radioBtns #"
			}
		]
	});
	
	</script>
</body>
</html>
