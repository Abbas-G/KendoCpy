<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DemoKendo.Models.CategoryModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
        <script src="<%= Url.Content("~/Scripts/MicrosoftMvcValidation.debug.js") %>" type="text/javascript"></script>

    <script src="<%= Url.Content("~/Scripts/jquery.validate.js") %>" type="text/javascript"></script>
</head>
<body>
 <% Html.EnableClientValidation(); %>
<%using (Html.BeginForm()){
      string cm1 = Model.CategoryName;%>
<%= Html.ValidationSummary(true) %>
    <%=Html.DropDownListFor(model => model.CategoryName, new SelectList(Model.CategoryList, "Value", "Text"),"select",null)%>
    
    <div>
    <%=Html.DropDownListFor(model => model.CateName, new SelectList(Model.CategoryList, "Value", "Text"), "select", null)%><%= Html.ValidationMessageFor(m => m.CateName)%>
    </div>
    <br />
    number:<%= Html.TextBoxFor(m => m.Number)%><%= Html.ValidationMessageFor(m => m.Number)%>
    <input type="submit" value="Send"  onclick="onSubmit()" />
<%} %>
    <script>
    $(document).ready(function() {
    $("#CateName").kendoDropDownList({
            index:1
        });

        $("#Number").kendoNumericTextBox();
    });

    function onSubmit() {

      
        var validatorOption = $("#Option").kendoValidator({ validateOnBlur: false }).data("kendoValidator");
        var validatorNumber = $("#Number").kendoValidator({ validateOnBlur: false }).data("kendoValidator");
        if (!validatorOption.validate()) {
            //validatorMessage.hideMessages();
            //document.getElementById("MessageValidator").style.display = "block";
           // document.getElementById("MessageValidator").style.color = "red";
            isValid = false;
        }
        else {
            //document.getElementById("MessageValidator").style.display = "none";
        }

        if (!validatorNumber.validate())
            isValid = false;

        if (isValid == true) {
          // document.forms[0].submit();
       }
        //for server side 
       document.forms[0].submit();
    }
    </script>
</body>
</html>
