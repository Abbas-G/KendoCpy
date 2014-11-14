<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <%--<link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />--%>
<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>

     <script id="delete-confirmation" type="text/x-kendo-template">
     hello #= firstName # #= lastName #
     <input type="email" id="email" name="email" class="k-textbox" placeholder="e.g. myname@example.net"  required data-email-msg="Email format is not valid" />
    <p class="delete-message">Message Send Successfully!</p>
    <button class="delete-confirm k-button">Ok</button>
    <button class="send-confirm k-button">Send</button>
    </script>
    
    <script>
        SuccessMessageBox();

        function SuccessMessageBox() {
            var kendoWindow = $("<div />").kendoWindow({
                title: "Confirm",
                resizable: false,
                modal: true
            });

            var scriptTemplate = kendo.template($("#delete-confirmation").html());
            var scriptData = { firstName: "John", lastName: "Doe" };
            //$("#script").html(scriptTemplate(scriptData));
            
            
            kendoWindow.data("kendoWindow")
                    .content(scriptTemplate(scriptData))
                    .center().open();

            kendoWindow.find(".delete-confirm,.delete-cancel,.send-confirm")
                    .click(function() {
                        if ($(this).hasClass("delete-confirm")) {
                            alert("delete");
                            kendoWindow.data("kendoWindow").close();
                        }
                        if ($(this).hasClass("send-confirm")) {
                            //alert("send");
                            var isValid = true;
                            var validatorEmail = $("#email").kendoValidator().data("kendoValidator");
                            if (!validatorEmail.validate()) {
                                //alert(document.getElementById("email").value);
                                isValid = false;
                            }
                            if (isValid) 
                                kendoWindow.data("kendoWindow").close();
                                

                        }


                    })
            .end()
        }
    
    </script>
</body>
</html>
