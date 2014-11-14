using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class AutoCompleteServerSideController : Controller
    {
        //
        // GET: /AutoCompleteServerSide/

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetFood(string serachterm)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var PData = new List<ProductObj>{
                new ProductObj{ ProductID="P1",ProductName="Coffee"},
                new ProductObj{ ProductID="P1",ProductName="Tea"},
                new ProductObj{ ProductID="P1",ProductName="Khaman"},
                new ProductObj{ ProductID="P1",ProductName="Dhokala"},
                new ProductObj{ ProductID="P1",ProductName="Pihuf"},
                 new ProductObj{ ProductID="P1",ProductName="Pizza"},
                 new ProductObj{ ProductID="P1",ProductName="Piasta"},
                new ProductObj{ ProductID="P2",ProductName="Sandwich"}
                };
            var Data = PData.Where(x => x.ProductName.ToLower().Contains(serachterm)).ToList();

            return Json(Data, JsonRequestBehavior.AllowGet);
        }

    }
}
