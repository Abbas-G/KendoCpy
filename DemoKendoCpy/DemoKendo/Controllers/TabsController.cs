using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class TabsController : Controller
    {
        //
        // GET: /Tabs/

        public ActionResult Contents()
        {
            return View();
        }

        public ActionResult WebServiceAcess()
        {
            return View();
        }

        public ActionResult AjaxCallCheck()
        {
            return View();
        }
    }
}
