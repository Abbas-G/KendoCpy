<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>FB</title>
</head>
<body>
    <div>
    <input type="button" onclick="share()" value="share" />
    </div>
    <script>
        function share(){
            //window.open('https://facebook.com/sharer.php?s=100&p[title]=mywebsitename&p[summary]=my content&p[url]=http://www.iprogrammer.com.au&p[images]0]=http://www.mywebsite.com/Images/myownimage.png', 'facebook-share-dialog', 'width=626,height=350');
            window.open('https://facebook.com/sharer.php?s=100&p[url]=http://www.iprogrammer.com.au/testrelease4/FBSharing2.html', 'facebook-share-dialog', 'width=626,height=350');
        }
    </script>
    
    
    <%--<div>
    <div id="fb-root">
    </div>
    <div onclick="return shareWithFacebook();" style="border: 1px solid black;
	background-color: #d3dde5;
        padding: 5pt; width: 175pt; cursor: pointer;">
        <img src='http://www.codeproject.com/images/fb_share.gif' border="0"
	alt="facebook likeus" style="vertical-align: middle;
            padding-right: 5pt;" />
        <strong>Share with Facebook</strong>
    </div>
    <script type="text/javascript">
        window.fbAsyncInit = function () {
        FB.init({ appId: '759163347444853', status: true, cookie: true,
                xfbml: true
            });
        };
        (function () {
            var e = document.createElement('script');
            e.async = true;
            e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(e);
        } ());

        function shareWithFacebook() {
            FB.ui({ method: 'stream.publish',
            message: '<%= ViewData["Message"] %>',
                user_message_prompt: 'xyz',
                attachment: {
                name: '<%=  ViewData["Name"] %>',
                caption: '<%= ViewData["Caption"] %>',
                description: ('<%= ViewData["Description"] %>'),
                href: '<%= ViewData["Href"] %>',
                media: [{ 'type': 'image', 'src': '<%= ViewData["Image"] %>',
                    'href': '<%= ViewData["Href"] %>'}]
                },
                action_links: [
                { text: '<%= ViewData["Image"] %>', href: '<%= ViewData["Href"] %>' }
            ]
            },
            function (response) {
                if (response && response.post_id) {
                    // Do some custom action after the user successfully
		  // posts this to their wall
                    alert('Thanks for sharing!');
                }
            }
        );
            return false;
        }
    </script>
    --%>
</div>
</body>
</html>
