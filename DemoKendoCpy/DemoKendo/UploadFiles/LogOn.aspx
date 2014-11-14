<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<NHPWHS.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogOn</title>
    <link href="<%= Url.Content("~/Content/styles/style.css")%>" rel="stylesheet" type="text/css">
    <link href="<%= Url.Content("~/Content/styles/css.css")%>" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=1024">
    <%--<link href='http://fonts.googleapis.com/css?family=Astloch|Oswald:300' rel='stylesheet'
        type='text/css'>--%>

		<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47326740-2', 'example.com');
  ga('send', 'pageview');

</script>
		
		
</head>
<body style="background:#061013;">
<%--<body class="bodyImg" >--%>
    <img src="<%= Url.Content("~/Content/Images/bg_img.png")%>" class="bg1" />
    <!-- Main div Start -->
    <!-- Start main div -->
    <div class="main">
        <% using (Html.BeginForm())
           { %>
        <div class="login">
            <label style="color: red;">
                <%= Html.ValidationSummary(true, "") %></label>
            <div class="fl">
                <img src="<%= Url.Content("~/Content/images/logo.png")%>" alt="Wholesaler Profiling" title="Wholesaler Profiling" /></div>
            <%--<div class="fr" style="margin-top: -5px;">
                <h1>
                    WHOLESALER<br>
                    <span style="font-size: 39px;">PROFILING</span></h1>
            </div>--%>
            <div class="cr">
            </div>
            <div class="m-top20">
                <%= Html.TextBoxFor(m => m.UserName, new { Class = "login_input", Style = "width: 258px;font-family: 'Oswald', sans-serif;", Value = "Username", id = "UserName", type = "text", name = "UserName", onblur = "if (this.value == '') {this.value = 'Username';}", onfocus = "if (this.value == 'Username') {this.value = '';}" })%><label
                    style="color: Red;"><%= Html.ValidationMessageFor(m => m.UserName) %></label>
            </div>
            <div class="m-top10">
                <%= Html.PasswordFor(m => m.Password, new { Class = "login_input", Style = "width: 258px;font-family: 'Oswald', sans-serif;", Value = "Password", id = "Password", name = "Password", onblur = "if (this.value == '') {this.value = 'Password';}", onfocus = "if (this.value == 'Password') {this.value = '';}" })%><label
                    style="color: Red;"><%= Html.ValidationMessageFor(m => m.Password) %></label>
            </div>
            <div class="m-top10">
                <input type="submit" value="LOGIN" class="login_input tex_aline login-btn" style="font-family: 'Oswald', sans-serif;">
                <center>
                    <span class="font11">Please use NHP login Credentials</span></center>
            </div>
        </div>
        <% } %>
    </div>
    <!-- End main div -->
</body>
</html>
