<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GooglePlus</title>
    <link rel="canonical" href="http://www.iprogrammer.com.au/testrelease4/FBSharing2.html" />
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js">
    </script>
</head>
<body>
    <div>
    <a href="https://plus.google.com/share?url=http://www.iprogrammer.com.au/testrelease4/FBSharing2.html" onclick="javascript:window.open(this.href,
  '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><img
  src="https://www.gstatic.com/images/icons/gplus-16.png" alt="Share on Google+"/></a>
    </div>
    
    
    basic share: <g:plus action="share"></g:plus>
    <br />
    Asynchronous Load :
    <%--<g:plus action="share"></g:plus>

    <script type="text/javascript">
        window.___gcfg = {
            lang: 'en-US'
        };

        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>--%>
    
    <!-- Place this tag where you want the +1 button to render -->
    <g:plusone size="small" annotation="none"></g:plusone>

    <!-- Place this render call where appropriate -->
    <script type="text/javascript">
        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>

</body>
</html>
