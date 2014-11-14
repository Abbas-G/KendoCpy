<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
            <div class="configuration">
                <span class="infoHead">Information</span>
                <p>
                    The Upload can be used as a drop-in replacement
                    for file input elements.
                </p>
                <p>
                    This "synchronous" mode does not require
                    special handling on the server.
                </p>
            </div>
            <form method="post" action="<%= Url.Content("~/Uploader/MultiFileUpload") %>" style="width:45%">
                <div class="demo-section">
                    <input name="files" id="files" type="file" />
                    
                    <p>
                        <input type="submit" value="Submit" class="k-button" />
                    </p>
                </div>
            </form>
            <%--<input name="upload" id="upload" type="file" />
            <script id="fileTemplate" type="text/x-kendo-template">
                <div>
                    <p>Name: #=name#</p>
                    <p>Size: #=size# bytes</p>
                    <p>Extension: #=files[0].extension#</p>
                    <button type='button' class='k-upload-action' style='position: absolute; top: 0; right: 0;'></button>
                </div>
            </script>--%>
            <script>
                var maxFiles = 3;
                $(document).ready(function() {

                    $("#files").kendoUpload({
                        multiple: true,
                        select: function(e) {
                            if ($('#files').parent().children('input[type=file]:not(#files)').length >= maxFiles) { // when we select multi file using ctrl
                                e.preventDefault();
                                alert("Max files allowed: " + maxFiles);
                            }
                            if (e.files.length > maxFiles) { // when more than 3 are listed means listing restricted to 3
                                alert("Please select max " + maxFiles + " files.");
                                e.preventDefault();
                            }
                            $.each(e.files, function(index, value) {
                                //alert(value.extension);
                                if (value.extension != ".png") {
                                    e.preventDefault();
                                    alert("Please upload PNG image files");
                                }
                            });
                            alert(getFileInfo(e));
                          //  alert(e.target.result);
                        }
                    });

                    //                    $("#upload").kendoUpload({
                    //                        template: "<div><p>Name: #=name#</p>" +
                    //              "<p>Size: #=size# bytes</p><p>Extension: #=files[0].extension#</p>" +
                    //              "<button type='button' class='k-upload-action' style='position: absolute; top: 0; right: 0;'></button>" +
                    //              "</div>",
                    //                        showFileList: true
                    //                    }); 

                });

            function getFileInfo(e) {
                return $.map(e.files, function(file) {
                    var info = file.name;

                    // File size is not available in all browsers, please note that its not availble in ie
                    if (file.size > 0) {
                        info += " (" + Math.ceil(file.size / 1024) + " KB)";
                    }
                    return info;
                }).join(", ");
            }


            /*function onUpload(e) {
                alert(e.files.length);
                if (e.files.length > 2) {
                    alert("Please select max 2 files.");
                    e.preventDefault();
                }
            }*/
                
            </script>
        </div>


</body>
</html>
