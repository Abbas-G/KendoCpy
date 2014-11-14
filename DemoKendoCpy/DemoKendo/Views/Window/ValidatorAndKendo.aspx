<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.TestModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ValidatorAndKendo</title>
     <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.all.min.js")%>"></script>
</head>
<body>
    <div>
    <%using (Html.BeginForm("ValidatorAndKendo", "Window"))
      {%>
    
      Category:<input name="Category" id="Category" value="<%=Model.Category %>" />
      <%=Html.ValidationMessageFor(x=>x.Category) %>
      <br />
      
      Name :<input name="name" id="name" value="<%=Model.name %>" />
      <%=Html.ValidationMessageFor(x=>x.name) %>
      <br />
      
      Number :<input name="Number" id="Number" value="<%=Model.Number %>" maxlength="5" />
      <%=Html.ValidationMessageFor(x => x.Number)%>
      <br />
      
      Address :<input name="Address" id="Address" value="<%=Model.Address %>" />
      <%=Html.ValidationMessageFor(x => x.Address)%>
      <br />
      
      Date :<input name="FutureDate" id="FutureDate" value="<%=Model.FutureDate %>" />
      <%=Html.ValidationMessageFor(x => x.FutureDate)%>
      <br />
      
      Check : <%=Html.CheckBoxFor(x => x.IsRadio)%><%=Html.ValidationMessageFor(x=>x.IsRadio) %>
      <br />
      
      <input type="submit" value="submit" />
    
    <%} %>
    
    </div>
    
    <script>
        var xhReq = new XMLHttpRequest();
        xhReq.open("POST", '<%=Url.Content("~/Grid/GetJsonOutputForFoodUniqueCategory")%>', false);
        xhReq.send(null);
        var GlobalSearchFOOD = JSON.parse(xhReq.responseText);
        $(document).ready(function() {

            $("#Category").kendoDropDownList({
                dataTextField: "Category",
                dataValueField: "Category",
                optionLabel: "--Select--", //define in model
                dataSource: GlobalSearchFOOD
            });

            $("#Number").kendoNumericTextBox({
            format: "#",
            decimals: 0
            });
            $("#FutureDate").kendoDatePicker(); //default format "MM/dd/yyyy"



        });
    </script>
</body>
</html>
