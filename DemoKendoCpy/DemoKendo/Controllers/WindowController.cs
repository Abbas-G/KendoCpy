using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoKendo.Models;

namespace DemoKendo.Controllers
{
    public class WindowController : Controller
    {
        //
        // GET: /Window/

        public ActionResult NewWindow()
        {
            return View();
        }
        public ActionResult Validator()
        {
            return View();
        }

        public ActionResult ValidatorAndKendo()
        {
            TestModel Obj = new TestModel();
            Obj.name = "abs";
            Obj.Address = "XYZ";
            Obj.Category = "";
            return View(Obj);
        }
        [HttpPost]
        public ActionResult ValidatorAndKendo(TestModel Obj, FormatException result)
        {
            if (ModelState.IsValid)
            {
                string datetime=DateTime.Now.ToString("MM/dd/yyyy");
                Obj.FutureDate = Convert.ToDateTime(datetime);
                return View(Obj);
            }
            return View(Obj);
        }
    }
}
