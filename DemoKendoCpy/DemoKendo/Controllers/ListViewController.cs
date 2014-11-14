using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;


namespace DemoKendo.Controllers
{
    public class ListViewController : Controller
    {
        //
        // GET: /ListView/

        public ActionResult ProjectsList()
        {
            return View();
        }
        public JsonResult GetJsonOutputForMovies()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetProjects();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }
        public ActionResult Details(int id)
        {
            var user = GetProjects().Where(p => p.id == id).FirstOrDefault();
            return View(user);
        }
        public string SearchMovies(string searchString)
        {
            searchString = searchString.ToUpper();
            var searchedMovies = from m in GetProjects()
                                 where m.PName.ToUpper().Contains(searchString) || m.PShortSummary.ToUpper().Contains(searchString) || m.PNo.ToString().ToUpper().Contains(searchString) 
                                 select m;

            return new JavaScriptSerializer().Serialize(searchedMovies.ToList());
        }
        [HttpPost]
        public ActionResult DeleteRecords(int id)
        {
            return Json(new { Value = "Id:" + id + " deleted Successfully" });
        }
        public List<ProjectObj> GetProjects()
        {
            string msg1 = "Tomorrow never dies";
            string msg2 = "One Flew Over the Cuckoo's Nest";
            string msg3 = "12 Angry Men";
            string msg4 = "Inception";
            var list = new List<ProjectObj>{
            new ProjectObj{ id=1,PNo=50001,PName="p1",PShortSummary=(msg1.Length>10)? msg1.Substring(0,10)+".." :msg1,CreatedDate=System.DateTime.Now},
            new ProjectObj{ id=2,PNo=50002,PName="p2",PShortSummary=(msg2.Length>10)? msg2.Substring(0,10)+".." :msg2,CreatedDate=System.DateTime.Now},
            new ProjectObj{ id=3,PNo=50003,PName="p3",PShortSummary=(msg3.Length>10)? msg3.Substring(0,10)+".." :msg3,CreatedDate=System.DateTime.Now},
            new ProjectObj{ id=4,PNo=50004,PName="p4",PShortSummary=(msg4.Length>10)? msg4.Substring(0,10)+".." :msg4,CreatedDate=System.DateTime.Now}
            };
            return list;
        }

    }

    public class ProjectObj
    {
        public int id { get; set; }
        public int PNo { get; set; }
        public string PName { get; set; }
        public string PShortSummary { get; set; }
        public DateTime CreatedDate { get; set; }
    }


}
