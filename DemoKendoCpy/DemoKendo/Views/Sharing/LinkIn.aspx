<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LinkIn</title>
</head>
<body>
    <div>
    <!--1 -->
    <input type="button" onclick="share()" value="LinkedIn"/>
    <script>
        function share() {
            window.open("http://www.linkedin.com/shareArticle?mini=true&url=http://www.iprogrammer.com.au/testrelease4/FBSharing2.html&title=Transurban to transfer US toll road&summary=Transurban to transfer US toll road.Transurban to transfer US toll road.Transurban to transfer US toll road.Transurban to transfer US toll road.Transurban to transfer US toll road.Transurban to transfer US toll road.Transurban to transfer US toll road.123", 'facebook-share-dialog', 'width=600,height=400');
        }
    </script>
    
    <!--2 -->
   
    <script src="//platform.linkedin.com/in.js" type="text/javascript">
        lang: en_US
</script>
<script type="IN/Share" data-url="http://www.iprogrammer.com.au/testrelease4/FBSharing2.html" data-counter="top"></script>
    
    
   

    </div>
</body>
</html>
