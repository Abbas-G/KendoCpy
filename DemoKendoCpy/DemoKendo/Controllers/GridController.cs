using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;


namespace DemoKendo.Controllers
{
    public class GridController : Controller
    {
        //
        // GET: /Grid/

        public ActionResult InlineEditing()
        {
            return View();
        }

        public ActionResult InlineEditing2()
        {
           
            return View();
        }

        public ActionResult InsideGridClick()
        {
            return View();
        }

        public ActionResult IncellGrid()
        {
            return View();
        }

        public ActionResult detailInit()
        {
            return View();
        }
        public ActionResult ColorPickerInGrid()
        {
            return View();
        }
        public ActionResult AddNewRow()
        {
            return PartialView();
        }
        public ActionResult popup()
        {
            return View();
        }
        public ActionResult TestGrid()
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
            //DridDataObj a = jSerializer.Deserialize<DridDataObj>(models.Replace(@"\""", ""));
            IList<DridDataObj> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj>>(models);
            DridDataObj temp = new DridDataObj();
            foreach (DridDataObj m in persons)
            {
                temp = new DridDataObj { ProductID = m.ProductID, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category };
            }

             
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(temp);
        }

        public JsonResult GetJsonOutputForGridDataDeletePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //var publicationTable = GetFOOD();
            return Json(new {value="success" });
        }

        public JsonResult GetJsonOutputForGridDataCreatePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            IList<DridDataObj> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj>>(models);
            DridDataObj temp = new DridDataObj();
            foreach (DridDataObj m in persons)
            {
                temp = new DridDataObj { ProductID = 22, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category };
            }
            return Json(temp);
        }

        public JsonResult GetJsonOutputForGridDataUpdate()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);
        }

        public JsonResult GetJsonOutputForGridDataDelete()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);
        }

        public JsonResult GetJsonOutputForFoodUniqueCategory()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = (from c in GetFOOD()
                                    group c by c.Category into d
                                    select new
                                    {
                                        Category = d.Key,
                                    }); //groupby Food by category
            return Json(publicationTable);  
        }
        public JsonResult SearchFOODbyCategory(string searchString)
        {
            //searchString = searchString.ToUpper();
            var searchedFOOD = from m in GetFOOD()
                               where m.Category.ToUpper().Contains(searchString.ToUpper()) || m.ProductName.ToUpper().Contains(searchString.ToUpper()) || m.UnitsInStock.ToString().ToUpper().Contains(searchString.ToUpper()) || m.UnitPrice.ToString().ToUpper().Contains(searchString.ToUpper())
                                 select m;

            //return new JavaScriptSerializer().Serialize(searchedFOOD.ToList()); //if return type is string
            return Json(searchedFOOD); 
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

        [NonAction]
        public List<DridDataObj> GetFOOD2()
        {
            var list = new List<DridDataObj>{
            new DridDataObj{ ProductID=1, ProductName="x", UnitPrice=20, UnitsInStock=15,Discontinued=true,Category="Surati"},
            new DridDataObj{ ProductID=2, ProductName="t", UnitPrice=57, UnitsInStock=50,Discontinued=false,Category="Surati"},
            new DridDataObj{ ProductID=3, ProductName="y", UnitPrice=5, UnitsInStock=8,Discontinued=true,Category="Surati"},
            new DridDataObj{ ProductID=4, ProductName="z pav", UnitPrice=10, UnitsInStock=15,Discontinued=false,Category="Mumbai"},
            new DridDataObj{ ProductID=5, ProductName="f", UnitPrice=30, UnitsInStock=50,Discontinued=true,Category="South Indian"},
            new DridDataObj{ ProductID=6, ProductName="s", UnitPrice=20, UnitsInStock=80,Discontinued=true,Category="South Indian"},
            new DridDataObj{ ProductID=7, ProductName="c", UnitPrice=7, UnitsInStock=90,Discontinued=false,Category="Chinese"}
            };

            return list;
        }

        public ActionResult ImageInGrid()
        {
            return View();
        }
    }
}
public class DridDataObj
{
    public int? ProductID;
    public string ProductName;
    public int UnitPrice;
    public int UnitsInStock;
    public Boolean Discontinued;
    public string Category;
}
