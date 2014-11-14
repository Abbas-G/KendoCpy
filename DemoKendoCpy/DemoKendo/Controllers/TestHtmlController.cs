using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class TestHtmlController : Controller
    {
        //
        // GET: /TestHtml/

        public ActionResult PreventDefault()
        {
            //function() {
            //return false;
            //}

            //// IS EQUAL TO

            //function(e) {
            //e.preventDefault();
            //e.stopPropagation();
            //}
            return View();
        }

    }
}
