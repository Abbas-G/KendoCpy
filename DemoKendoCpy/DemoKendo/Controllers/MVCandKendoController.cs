using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class MVCandKendoController : Controller
    {
        //
        // GET: /MVCandKendo/

        public ActionResult Index()
        {
            DemoKendo.Models.CategoryModel CM = new DemoKendo.Models.CategoryModel();
            return View(CM);
        }
        [HttpPost]
        public ActionResult Index(FormCollection result,DemoKendo.Models.CategoryModel data)
        {
            if (ModelState.IsValid)
            {
                if (data.Number == 11)
                {
                    ModelState.AddModelError("", "Not a Lucky number.");
                    return View(data);
                }
                else
                {
                    DemoKendo.Models.CategoryModel nwdata= new DemoKendo.Models.CategoryModel();
                    nwdata.CateName = "Videos";
                    nwdata.Number = 52;
                    nwdata.CategoryName = "Videos";
                    return View(nwdata);
                }
            }
            return View(data);
        }

        public ActionResult Index2()
        {
            DemoKendo.Models.CategoryModel CM = new DemoKendo.Models.CategoryModel();
            return View(CM);
        }
        [HttpPost]
        public ActionResult Index2(FormCollection result, DemoKendo.Models.CategoryModel data)
        {
            if (ModelState.IsValid)
            {
                if (data.Number == 11)
                {
                    ModelState.AddModelError("", "Not a Lucky number.");
                    return View(data);
                }
                else
                {
                    DemoKendo.Models.CategoryModel nwdata = new DemoKendo.Models.CategoryModel();
                    nwdata.CateName = "Videos";
                    nwdata.Number = 52;
                    nwdata.CategoryName = "Videos";
                    return View(nwdata);
                }
            }
            return View(data);
        }
    }
}
