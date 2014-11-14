using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoKendo.Models;
namespace DemoKendo.Controllers
{
    public class MVCListController : Controller
    {
        //
        // GET: /MVCList/

        public ActionResult Index()
        {
            User Obj = new User();
            Obj.Name = "B";
            ViewData["list"] = new SelectList(SelectListFactory(), "Value", "Text");
            return View(Obj);
        }
        [HttpPost]
        public ActionResult Index(User Obj)
        {
            
            Obj.Name = "B";
            ViewData["list"] = new SelectList(SelectListFactory(), "Value", "Text");
            return View(Obj);
        }

        public static List<SelectListItem> SelectListFactory()
        {
            List<SelectListItem> a = new List<SelectListItem>();
            a.Add(new SelectListItem() { Text = "A", Value = "A" });
            a.Add(new SelectListItem() { Text = "B", Value = "B" });
            a.Add(new SelectListItem() { Text = "C", Value = "C" });
            return a;
        }

    }
}
