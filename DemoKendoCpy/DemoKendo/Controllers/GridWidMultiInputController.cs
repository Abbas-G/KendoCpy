using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class GridWidMultiInputController : Controller
    {
        //
        // GET: /GridWidMultiInput/

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetJsonOutputForGridDataSelect()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public JsonResult GetJsonOutputForGridDataUpdatePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //DridDataObj2 a = jSerializer.Deserialize<DridDataObj2>(models.Replace(@"\""", ""));
            IList<DridDataObj2> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj2>>(models);
            DridDataObj2 temp = new DridDataObj2();
            foreach (DridDataObj2 m in persons)
            {
                temp = new DridDataObj2 { ProductID = m.ProductID, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category };
            }


            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(temp);
        }

        public JsonResult GetJsonOutputForGridDataDeletePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //var publicationTable = GetFOOD();
            return Json(new { value = "success" });
        }

        public JsonResult GetJsonOutputForGridDataCreatePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            IList<DridDataObj2> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj2>>(models);
            DridDataObj2 temp = new DridDataObj2();
            foreach (DridDataObj2 m in persons)
            {
                temp = new DridDataObj2 { ProductID = 22, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category };
            }
            return Json(temp);
        }
        public JsonResult GetJsonOutputForFoodUniqueCategory()
        {
            //JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //var publicationTable = (from c in GetFOOD()
            //                        group c by c.Category into d
            //                        select new
            //                        {
            //                            Category = d.Key,
            //                        }); //groupby Food by category

            string[] listfood = new string[] { "Surati", "Mumbai", "Chinese", "South Indian" };
            //var publicationTable = listfood.Select(x => new
            //{
            //    Category = x
            //});
            return Json(listfood);
        }
        public JsonResult SearchFOODbyCategory(string searchString)
        {
            //searchString = searchString.ToUpper();
            var searchedFOOD = from m in GetFOOD()
                               where m.ProductName.ToUpper().Contains(searchString.ToUpper()) || m.UnitsInStock.ToString().ToUpper().Contains(searchString.ToUpper()) || m.UnitPrice.ToString().ToUpper().Contains(searchString.ToUpper())
                               select m;

            //return new JavaScriptSerializer().Serialize(searchedFOOD.ToList()); //if return type is string
            return Json(searchedFOOD);
        }
        public List<DridDataObj2> GetFOOD()
        {
            var list = new List<DridDataObj2>{
            new DridDataObj2{ ProductID=1, ProductName="chai", UnitPrice=20, UnitsInStock=15,Discontinued=true,Category=new string[]{"Surati","Mumbai"}},
            new DridDataObj2{ ProductID=2, ProductName="Khaman", UnitPrice=57, UnitsInStock=50,Discontinued=false,Category=new string[]{"Surati"}},
            new DridDataObj2{ ProductID=3, ProductName="Dhokla", UnitPrice=5, UnitsInStock=8,Discontinued=true,Category=new string[]{"Surati"}},
            new DridDataObj2{ ProductID=4, ProductName="Vada pav", UnitPrice=10, UnitsInStock=15,Discontinued=false,Category=new string[]{"Mumbai"}},
            new DridDataObj2{ ProductID=5, ProductName="Dhosa", UnitPrice=30, UnitsInStock=50,Discontinued=true,Category=new string[]{"South Indian"}},
            new DridDataObj2{ ProductID=6, ProductName="idli", UnitPrice=20, UnitsInStock=80,Discontinued=true,Category=new string[]{"South Indian"}},
            new DridDataObj2{ ProductID=7, ProductName="Noodles", UnitPrice=7, UnitsInStock=90,Discontinued=false,Category=new string[]{"Chinese"}}
            };
            //var list = new List<DridDataObj2>{
            //new DridDataObj2{ ProductID=1, ProductName="x", UnitPrice=20, UnitsInStock=15,Discontinued=true,Category="Surati, Mumbai"},
            //new DridDataObj2{ ProductID=2, ProductName="t", UnitPrice=57, UnitsInStock=50,Discontinued=false,Category="Surati"},
            //new DridDataObj2{ ProductID=3, ProductName="y", UnitPrice=5, UnitsInStock=8,Discontinued=true,Category="Surati"},
            //new DridDataObj2{ ProductID=4, ProductName="z pav", UnitPrice=10, UnitsInStock=15,Discontinued=false,Category="Mumbai"},
            //new DridDataObj2{ ProductID=5, ProductName="f", UnitPrice=30, UnitsInStock=50,Discontinued=true,Category="South Indian"},
            //new DridDataObj2{ ProductID=6, ProductName="s", UnitPrice=20, UnitsInStock=80,Discontinued=true,Category="South Indian"},
            //new DridDataObj2{ ProductID=7, ProductName="c", UnitPrice=7, UnitsInStock=90,Discontinued=false,Category="Chinese"}
            //};

            return list;
        }
    }
    public class DridDataObj2
    {
        public int? ProductID;
        public string ProductName;
        public int UnitPrice;
        public int UnitsInStock;
        public Boolean Discontinued;
        public string[] Category;
        //public string Category;
    }
}
