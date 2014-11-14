using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class ComboBoxController : Controller
    {
        //
        // GET: /ComboBox/

        public ActionResult CascadingComboBox()
        {
            return View();
        }
        public ActionResult CascadingComboBox2()
        {
            return View();
        }
        public ActionResult CascadingComboBoxRemoveDupli()
        {
            return View();
        }

        public JsonResult GetJsonOutputForProductByCustomerID(string CustomerID)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            if (CustomerID == "ALFKI")
            {
                var publicationTable = new List<ProductObj>{
                new ProductObj{ ProductID="P1",ProductName="ALFKI_Coffee"},
                new ProductObj{ ProductID="P2",ProductName="ALFKI_Tea"}
                };
                //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
                return Json(publicationTable);  // this statement wont allow to see records directly on browser
            }
            else if (CustomerID == "ANATR")
            {
                var publicationTable = new List<ProductObj>{
                new ProductObj{ ProductID="P3",ProductName="ANATR_Coffee"},
                new ProductObj{ ProductID="P4",ProductName="ANATR_Tea"}
                };
                //return Json(publicationTable, JsonRequestBehavior.AllowGet);  this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
                return Json(publicationTable);  // this statement wont allow to see records directly on browser
            }
            else if (CustomerID == "ANTON")
            {
                var publicationTable = new List<ProductObj>{
                new ProductObj{ ProductID="P5",ProductName="ANTON_Coffee"},
                new ProductObj{ ProductID="P6",ProductName="ANTON_Tea"}
                };
                //return Json(publicationTable, JsonRequestBehavior.AllowGet);  this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
                return Json(publicationTable);  // this statement wont allow to see records directly on browser
            }
            else {
                var publicationTable = new List<ProductObj>{
                new ProductObj{ ProductID="P7",ProductName="AROUT_Coffee"},
                new ProductObj{ ProductID="P8",ProductName="AROUT_Tea"}
                };
                return Json(publicationTable);
            }
        }

        public JsonResult GetJsonOutputForOrderByProductID(string ProductID)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();

            var publicationTable = new List<OrderObj1>{
                new OrderObj1{ OrderID="O1",OrderShipCity="Surat :"+" M/S "+ProductID},
                new OrderObj1{ OrderID="O2",OrderShipCity="Mumbai:"+" M/S "+ProductID}
                };
                //return Json(publicationTable, JsonRequestBehavior.AllowGet);  this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
                return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }
    }
    public class OrderObj1
    {
        public string OrderShipCity;
        public string OrderID;
    }
    public class ProductObj
    {
        public string ProductID;
        public string ProductName;
    }
}
