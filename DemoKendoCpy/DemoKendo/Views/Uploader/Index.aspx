<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <title></title>

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />
<%--<link rel="stylesheet" type="text/css" title="custom_black"  href="<%= Url.Content("~/Content/kendo/style/CustomThemes/custom_black.css")%>"  id="stylesheet"/>--%>
    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    
        <div id="example" class="k-content">
            <div class="configuration" style="width: 300px">
                <span class="infoHead">Information</span>
                <p>
                    This example shows how to handle events triggered by kendoUpload.
                </p>
            </div>
            <div style="width:45%">
                <div class="demo-section">                    
                    <input name="files" id="files" type="file" />
                </div>                
            </div>
            <div class="demo-section" style="margin-top: 50px;">
                <h3 class="title">Console log
                </h3>
                <div class="console"></div>
            </div>
            <script>
                function onSelect(e) {
                    if ($('#files').parent().children('input[type=file]:not(#files)').length >= 2) {
                        e.preventDefault();
                        alert("Max files allowed: " + 2);
                    }
                    if (e.files.length > 1) {
                        alert("Please select max 1 files.");
                        e.preventDefault();
                    }
                    kendoConsole.log("Select :: " + getFileInfo(e));
                }

                function onUpload(e) {
                    e.data = { codeID: $("#id").val() };
                    kendoConsole.log("Upload :: " + getFileInfo(e));
                }

                function onSuccess(e) {
                   // var response = e.response.data();
                    //alert(response);
                    kendoConsole.log("Success (" + e.operation + ") :: " + getFileInfo(e));
                }

                function onError(e) {
                    kendoConsole.log("Error (" + e.operation + ") :: " + getFileInfo(e));
                }

                function onComplete(e) {
                    kendoConsole.log("Complete");
                }

                function onCancel(e) {
                    var Fname = $.map(e.files, function(file) {
                        var info = file.name;
                        return info;
                    }).join(", ");
                    
                    alert(Fname);
                    kendoConsole.log("Cancel :: " + getFileInfo(e));
                }

                function onRemove(e) {
                    kendoConsole.log("Remove :: " + getFileInfo(e));
                }

                function onProgress(e) {
                    kendoConsole.log("Upload progress :: " + e.percentComplete + "% :: " + getFileInfo(e));
                }

                function getFileInfo(e) {
                    return $.map(e.files, function(file) {
                        var info = file.name;

                        // File size is not available in all browsers
                        if (file.size > 0) {
                            info += " (" + Math.ceil(file.size / 1024) + " KB)";
                        }
                        return info;
                    }).join(", ");
                }

                $(document).ready(function() {
                    $("#files").kendoUpload({
                        async: {
                        saveUrl: '<%= Url.Content("~/Uploader/Upload") %>',
                        //removeUrl: '<%= Url.Content("~/Uploader/Delete") %>',
                        autoUpload: false
                        },
                        cancel: onCancel,
                        complete: onComplete,
                        error: onError,
                        progress: onProgress,
                        remove: onRemove,
                        select: onSelect,
                        success: onSuccess,
                        upload: onUpload,
                        multiple: true
                    });
                });
            </script>
        </div>


</body>
</html>
