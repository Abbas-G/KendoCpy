using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class twoformController : Controller
    {
        //
        // GET: /twoform/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection result)
        {
            return View();
        }

        public ActionResult PartialView1()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PartialViewNext(FormCollection result)
        {
            return RedirectToAction("Index");
        }
    }
}
