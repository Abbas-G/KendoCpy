using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class BatchEdittingController : Controller
    {
        //
        // GET: /BatchEditting/

        public ActionResult Batch()
        {
            return View();
        }
       
        public JsonResult GetJsonOutputForGridDataSelect(string q)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public JsonResult GetJsonOutputForGridDataUpdate(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = jSerializer.Deserialize<List<DridDataObj>>(models);
            foreach (var m in publicationTable)
            {
                int? a = m.ProductID;
            }
            return Json(publicationTable);
        }

        public JsonResult GetJsonOutputForGridDataDelete(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            return Json(publicationTable);
        }

        public ActionResult GetJsonOutputForGridDataCreate(string models)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var publicationTable = serializer.Deserialize<List<DridDataObj>>(models);
            foreach (var m in publicationTable)
            {
                int? a = m.ProductID;
                string b = m.ProductName;
            }
            
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);
        }
        public List<DridDataObj> GetFOOD()
        {
            var list = new List<DridDataObj>{
            new DridDataObj{ ProductID=1, ProductName="chai", UnitPrice=20, UnitsInStock=15,Discontinued=true,Category="Surati"},
            new DridDataObj{ ProductID=2, ProductName="Khaman", UnitPrice=57, UnitsInStock=50,Discontinued=false,Category="Surati"},
            new DridDataObj{ ProductID=3, ProductName="Dhokla", UnitPrice=5, UnitsInStock=8,Discontinued=true,Category="Surati"},
            new DridDataObj{ ProductID=4, ProductName="Vada pav", UnitPrice=10, UnitsInStock=15,Discontinued=false,Category="Mumbai"},
            new DridDataObj{ ProductID=5, ProductName="Dhosa", UnitPrice=30, UnitsInStock=50,Discontinued=true,Category="South Indian"},
            new DridDataObj{ ProductID=6, ProductName="idli", UnitPrice=20, UnitsInStock=80,Discontinued=true,Category="South Indian"},
            new DridDataObj{ ProductID=7, ProductName="Noodles", UnitPrice=7, UnitsInStock=90,Discontinued=false,Category="Chinese"}
            };

            return list;
        }
    }
}
