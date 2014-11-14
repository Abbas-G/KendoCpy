<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Page Turn</title> 

    <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
    <div id="example" class="k-content">
    <div id="wrap" class="first-page">
        <ul id="book">
           <li><img src="<%= Url.Content("~/content/kendo/pageturn/maserati.jpg")%>" alt="Page 6" /></li>
            <li><img src="<%= Url.Content("~/content/kendo/pageturn/mazda.jpg")%>" alt="Page 5" /></li>
            <li><img src="<%= Url.Content("~/content/kendo/pageturn/mercedes.jpg")%>" alt="Page 4" /></li>
            <li><img src="<%= Url.Content("~/content/kendo/pageturn/audi.jpg")%>" alt="Page 3" /></li>
            <li><img src="<%= Url.Content("~/content/kendo/pageturn/ferrari.jpg")%>" alt="Page 2" /></li>
            <li class="current"><img src="<%= Url.Content("~/content/kendo/pageturn/mini.jpg")%>" alt="Page 1" /></li>
        </ul>

        <a href="#" id="previous">Previous page</a>
        <a href="#" id="next">Next page</a>
    </div>

    <script>
        function current(page) {
            var book = $("#book"),
                pages = book.children(),
                pagesCount = pages.length,
                current = pages.filter(".current"),
                currentIndex = pagesCount - current.index(),
                newPage;

            if (!arguments.length) {
                return currentIndex;
            }

            if (book.data("animating")) {
                return;
            }

            $("#wrap").toggleClass("first-page", page == 1)
                      .toggleClass("last-page", page == pagesCount);

            if (page != currentIndex) {
                current.removeClass("current");
                newPage = pages.eq(pagesCount - page).addClass("current");

                if (page > currentIndex) {
                    kendo.fx(book).pageturnHorizontal(current, newPage).play();
                } else {
                    kendo.fx(book).pageturnHorizontal(newPage, current).reverse();
                }
            }
        }

        $("#previous").click(function(e) {
            e.preventDefault();
            current(Math.max(1, current() - 1));
        });

        $("#next").click(function(e) {
            e.preventDefault();
            current(Math.min(6, current() + 1));
        });
    </script>

    <style>
        #wrap {
            background-image: url("../../content/kendo/pageturn/book.png");
            width: 657px;
            height: 482px;
            margin: 2.5em auto 4em;
            position: relative;
        }

        #book {
            position: relative;
            width: 650px;
            height: 477px;
            margin: 0 auto;
            padding: 0;
            list-style-type: none;
        }

        #book > li {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #fff;
        }

        #actions {
            overflow: hidden;
            margin: 0 auto 3em;
            width: 650px;
        }

        #previous, #next {
            text-decoration: none;
            text-indent: -999em;
            overflow: hidden;
            display: block;
            height: 100%;
            width: 90px;
            position: absolute;
            top: 0;
            background-repeat: no-repeat;
            background-position: 50% 50%;
            opacity: .5
        }

        #previous:hover, #next:hover {
            opacity: 1;
        }

        #previous {
            left: 0;
            background-image: url("../../content/kendo/pageturn/arrow-left.png");
        }

        #next {
            right: 0;
            background-image: url("../../content/kendo/pageturn/arrow-right.png");
        }

        .first-page #previous,
        .last-page #next {
            display: none;
        }
    </style>
</div>


</body>
</html>
