using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class FilterController : Controller
    {
        //
        // GET: /Filter/

        public ActionResult ServerFilter()
        {
            return View();
        }
        public ActionResult SimpleFilter()
        {
            return View();
        }
    }
}
