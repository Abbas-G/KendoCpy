using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class DemoController : Controller
    {
        //
        // GET: /Demo/

        public ActionResult Book()
        {
            return View("Index");
        }
        public ActionResult DateTimePicker()
        {
            return View();
        }
        public ActionResult Editor()
        {
            return View();
        }
        public ActionResult Sorting()
        {
            //ViewData["orderScript"] = "<script type='text/javascript'>var orders=" + getJson() + "</script>";
            return View();
        }

        public ActionResult GoogleSearch()
        {
            return View();
        }

        public ActionResult MasterSwitcher()
        {
            var view = View();
            view.MasterName = "MasterTwo";
            return view;
        }
        public JsonResult getJsonOrders()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = new List<OrderObj>{
            new OrderObj{ ShipCountry="Aa",Freight=200,OrderDate=System.DateTime.UtcNow},
            new OrderObj{ ShipCountry="Bb",Freight=300,OrderDate=System.DateTime.Now},
            new OrderObj{ ShipCountry="Cc",Freight=500,OrderDate=System.DateTime.Now}
            };
            /*for (int i = 0; i < 20000; i++)
            {
                OrderObj a= new OrderObj();
                a.ShipCountry = "Aa";
                a.Freight = 200;
                publicationTable.Add(a);
            }*/

                //return Json(publicationTable, JsonRequestBehavior.AllowGet);  this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
                return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }
 
    }

}
public class OrderObj
{
    public string ShipCountry;
    public decimal Freight;
    public DateTime OrderDate;
}
