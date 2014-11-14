using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class JavascriptToActionController : Controller
    {
        //
        // GET: /JavascriptToAction/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PageList(string ItemsList)
        {
            ViewData["list"] = ItemsList;
            return View("PageList");
        }
    }
}
