using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;


namespace DemoKendo.Controllers
{
    public class DataSourceController : Controller
    {
        //
        // GET: /DataSource/

        public ActionResult Index()
        { // to display data in view page
            return View();
        }

        public ActionResult simpleGrid()
        {
            return View(GetMovies());
        }

        public JsonResult GetJsonOutputForMovies()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetMovies();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public JsonResult GetJsonOutputForWorker()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = "";
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }
        
        public string SearchMovies(string searchString)
        {
            searchString = searchString.ToUpper();
            var searchedMovies = from m in GetMovies()
                        where m.title.ToUpper().Contains(searchString)
                        select m;

            return new JavaScriptSerializer().Serialize(searchedMovies.ToList());
        }

        public ActionResult Details(int id)
        {
            var user = GetMovies().Where(p => p.id == id).FirstOrDefault();
            return View(user);
        }
        public ActionResult SaveGridData()
        {
            return View();
        }
        [HttpPost]
        public JsonResult SaveGridData(List<MyViewModel> users)
        {
            // Here i am not implementing all
            // I am interested to show controller is getting data from view
            var count = 0;
            if (users != null)
            {
                count = users.Count;
            }
            //Returns how many records was posted
            return Json(new { count = count });
        }

        [HttpPost]
        public ActionResult DeleteRecords(int id)
        {
            return Json(new {Value ="Id:"+id+" deleted Successfully" });
        }

        
        public List<MoviesObj> GetMovies()
        {
            var list = new List<MoviesObj>{
            new MoviesObj{ id=1,rating=9.2,year=1995,title="",isDelete=true},
            new MoviesObj{ id=2,rating=8,year=1996,title="One Flew Over the Cuckoo's Nest",isDelete=true},
            new MoviesObj{ id=3,rating=7.5,year=1987,title="12 Angry Men",isDelete=true},
            new MoviesObj{ id=4,rating=9.2,year=1995,title="Inception",isDelete=true}
            };
            return list;
        }

        public List<WorkerObj> GetWorker()
        {
            var list = new List<WorkerObj>{
            new WorkerObj{workerID=1, workerName="A"},
            new WorkerObj{ workerID=2, workerName="B"},
            new WorkerObj{ workerID=3, workerName="C"},
            new WorkerObj{ workerID=4, workerName="D"}
            };
            return list;
        }


        public ActionResult UseOfDate()
        {
            return View();
        }

        public JsonResult GetJsonMydate()
        {
            var Datelist = new List<MyDateView>{
            new MyDateView{Uniqueid="S1",City="Surat",Price=40,MyDate=System.DateTime.Today},
            new MyDateView{Uniqueid="S2",City="Surat",Price=50,MyDate=System.DateTime.Now},
            new MyDateView{Uniqueid="M1",City="Mumbai",Price=30,MyDate=System.DateTime.Now},
            new MyDateView{Uniqueid="A1",City="Ahmedabad",Price=27,MyDate=System.DateTime.Now},
            new MyDateView{Uniqueid="P1",City="Pune",Price=18,MyDate=System.DateTime.Now}
            };
            return Json(Datelist);  // this statement wont allow to see records directly on browser
        }
        
        //[HttpPost]
        //public JsonResult SaveGridDataForUseOfDate(List<MyDateView> users)
        //{
        //    // Here i am not implementing all
        //    // I am interested to show controller is getting data from view
        //    var count = 0;
        //    if (users != null)
        //    {
        //        //count = users.Count;
        //    }
        //    //Returns how many records was posted
        //    return Json(new { count = count });
        //}

    }
    public class MoviesObj {
        public int id{ get; set; }
        public Double rating { get; set; }
        public int year { get; set; }
        public string title { get; set; }
        public Boolean isDelete { get; set; }
    }

    public class WorkerObj
    {
        public int workerID { get; set; }
        public string workerName { get; set; }
    }
    public class MyViewModel
    {
        public string ParamA { get; set; }
        public string ParamB { get; set; }
    }
    public class MyDateView
    {
        public string Uniqueid { get; set; }
        public string City { get; set; }
        public int Price { get; set; }
        public DateTime MyDate { get; set; }
    }
    
}
