using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Data.Linq;

namespace DemoKendo.Controllers
{
    public class GridServerPagingController : Controller
    {
        //
        // GET: /GridServerPaging/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetJsonOutputForGridDataSelect(int? page, int? pageSize, int? take, bool? activeOnly)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            HttpRequest curRequest = System.Web.HttpContext.Current.Request;
            string pages=Convert.ToString(curRequest["page"]);
            string PageSize = Convert.ToString(curRequest["pageSize"]);
            string Skip = Convert.ToString(curRequest["skip"]);
            string Take = Convert.ToString(curRequest["take"]);
            //KendoGridPost a = new KendoGridPost();
            var data = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)

            return Json(new { total = "10", data });  // this statement wont allow to see records directly on browser
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
            var publicationTable = GetFOOD();
            return Json(publicationTable);
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

    }
    
}

public class KendoGridPost
{ //referennce http://sympletech.com/hacking-on-the-kendo-ui-grid-enabling-server-side-sorting-and-paging-in-asp-net-mvc/
    public KendoGridPost()
    {
        if (HttpContext.Current != null)
        {
            HttpRequest curRequest = HttpContext.Current.Request;
            this.Page = Convert.ToInt32(curRequest["page"].ToString());
            this.PageSize = Convert.ToInt32(curRequest["pageSize"].ToString());
            this.Skip = Convert.ToInt32(curRequest["skip"].ToString());
            this.Take = Convert.ToInt32(curRequest["take"].ToString());

            this.SortOrd = curRequest["sort[0][dir]"];
            this.SortOn = curRequest["sort[0][field]"];
        }
    }

    public int Page { get; set; }
    public int PageSize { get; set; }
    public int Skip { get; set; }
    public int Take { get; set; }
    public string SortOrd { get; set; }
    public string SortOn { get; set; }
}

//public class KendoUiHelper
//{
//    public static KendoGridResult<T> ParseGridData<T>(IQueryable<T> collection)
//    {
//        KendoGridPost requestParams = new KendoGridPost();

//        //If the sort Order is provided perform a sort on the specified column
//        if (requestParams.SortOrd.IsNotEmpty())
//        {
//            collection = requestParams.SortOrd == "desc"
//                         ? collection.OrderByDescending(requestParams.SortOn)
//                         : collection.OrderBy(requestParams.SortOn);
//        }

//        //Perform the paging operations
//        List<T> gridData;
//        try
//        {
//            gridData = collection.Skip(requestParams.Skip).Take(requestParams.Take).ToList();
//        }
//        catch
//        {
//            //If the collection is not ordered skip take will fail -- All My Collections have a primary key named id
//            collection = collection.Select(x => x).OrderBy("id");
//            gridData = collection.Skip(requestParams.Skip).Take(requestParams.Take).ToList();
//        }

//        return new KendoGridResult<T>
//        {
//            Items = gridData,
//            TotalCount = collection.Count()
//        };
//    }
//}

public class KendoGridResult<T>
{
    public IEnumerable<T> Items { get; set; }
    public int TotalCount { get; set; }
}

