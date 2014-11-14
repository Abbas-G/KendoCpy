<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GoogleSearch</title>
</head>
<body>
<div style="width:500px">
Search :<gcse:search></gcse:search>
</div>

    <div>
  <script>
      (function() {
          var cx = '008758308787564792365:f8spsmpfkl0';
          var gcse = document.createElement('script');
          gcse.type = 'text/javascript';
          gcse.async = true;
          gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(gcse, s);
      })();
</script>


    </div>
</body>
</html>
