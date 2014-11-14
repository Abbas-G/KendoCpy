using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class SchedulerTemplatesController : Controller
    {
        //
        // GET: /SchedulerTemplates/

        public ActionResult Index()
        {
            return View();
        }

        public List<SchedulerTempltObj> GetScheduler()
        {

            var list = new List<SchedulerTempltObj>{
            //new SchedulerTempltObj{ taskID=1, title="x", start="7/10/2014 12:00 AM", end="7/10/2014 01:00 PM",description="xxxx",recurrenceId=null,recurrenceRule="",recurrenceException="",ownerId=null,isAllDay=false}//,
            new SchedulerTempltObj{ TaskID=1, Title="t", Start=Convert.ToDateTime("10/11/2014 10:30 AM"), End=Convert.ToDateTime("10/11/2014 11:30 AM"),Description="tttt",IsAllDay=false},
            new SchedulerTempltObj{ TaskID=2, Title="y", Start=Convert.ToDateTime("10/11/2014 07:00 AM"), End=Convert.ToDateTime("10/11/2014 08:30 AM"),Description="yyy",IsAllDay=false}
            };

            return list;
        }


        public JsonResult GetSchedulerDataSelect()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetScheduler();
            var ListwithUTC = publicationTable.Select(x => new
            {
                TaskID = x.TaskID,
                Title = x.Title,
                //Specify the DateTimeKind to be UTC
                Start = DateTime.SpecifyKind(x.Start, DateTimeKind.Utc),
                End = DateTime.SpecifyKind(x.End, DateTimeKind.Utc),
                Description = x.Description,
                Category = "Surati",
                IsAllDay = x.IsAllDay,
                RecurrenceRule = "",
                RecurrenceException = "",
                RecurrenceID = "",
                OwnerID = 1
            });

            return Json(ListwithUTC, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            //return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public JsonResult GetSchedulerDataUpdate(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //DridDataObj2 a = jSerializer.Deserialize<DridDataObj2>(models.Replace(@"\""", ""));
            IList<SchedulerTempltObj> persons = new JavaScriptSerializer().Deserialize<IList<SchedulerTempltObj>>(models);
            SchedulerTempltObj temp = new SchedulerTempltObj();
            foreach (SchedulerTempltObj m in persons)
            {
                temp = new SchedulerTempltObj { TaskID = m.TaskID, Title = m.Title, Start = m.Start, End = m.End, Description = m.Description, IsAllDay = m.IsAllDay };
            }
            return Json(temp, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            //return Json(temp);
        }

        public JsonResult GetSchedulerDataDelete(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //var publicationTable = GetFOOD();
            return Json(new { value = "success" });
        }

        public JsonResult GetSchedulerDataCreate(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //DridDataObj2 a = jSerializer.Deserialize<DridDataObj2>(models.Replace(@"\""", ""));
            IList<SchedulerTempltObj> persons = new JavaScriptSerializer().Deserialize<IList<SchedulerTempltObj>>(models);
            SchedulerTempltObj temp = new SchedulerTempltObj();
            foreach (SchedulerTempltObj m in persons)
            {
                temp = new SchedulerTempltObj { TaskID = m.TaskID, Title = m.Title, Start = DateTime.SpecifyKind(m.Start, DateTimeKind.Utc).ToLocalTime(), End = m.End, Description = m.Description, IsAllDay = m.IsAllDay };
            }
            return Json(temp, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            //return Json(temp);
        }

        public JsonResult GetJsonOutputForFoodUniqueCategory()
        {
            DemoKendo.Controllers.GridController GC = new GridController();
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = (from c in GC.GetFOOD()
                                    group c by c.Category into d
                                    select new
                                    {
                                        Category = d.Key,
                                    }); //groupby Food by category
            /*string[] ArrayOnlyfromlist = new string[publicationTable.ToList().Count];
            int i = 0;
            foreach (var m in publicationTable)
            {
                ArrayOnlyfromlist[i] = m.Category;
                i++;
            }*/
            return Json(publicationTable);
        }

    }
    public class SchedulerTempltObj
    {
        public int TaskID;
        public string Title;
        public DateTime Start;
        public DateTime End;
        public string Description;
        public Boolean IsAllDay;
    }
}
