using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class TreeViewController : Controller
    {
        //
        // GET: /TreeView/

        public ActionResult LocalData()
        {
            return View();
        }
        public ActionResult Basic() {
            return View();
        }

        public ActionResult Events()
        {
            return View();
        }

    }
}
