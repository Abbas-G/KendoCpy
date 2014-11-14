using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class SchedulerController : Controller
    {
        //
        // GET: /Scheduler/

        public ActionResult Index()
        {
            string cul = System.Threading.Thread.CurrentThread.CurrentCulture.ToString();
            return View();
        }

        public List<SchedulerObj> GetScheduler()
        {

            var list = new List<SchedulerObj>{
            //new SchedulerObj{ taskID=1, title="x", start="7/10/2014 12:00 AM", end="7/10/2014 01:00 PM",description="xxxx",recurrenceId=null,recurrenceRule="",recurrenceException="",ownerId=null,isAllDay=false}//,
            new SchedulerObj{ TaskID=2, Title="t", Start=Convert.ToDateTime("10/11/2014 10:30 AM"), End=Convert.ToDateTime("10/11/2014 11:30 AM"),Description="tttt",RecurrenceID=null,RecurrenceRule=null,RecurrenceException=null,OwnerID=2,IsAllDay=false},
            new SchedulerObj{ TaskID=3, Title="y", Start=Convert.ToDateTime("10/11/2014 07:00 AM"), End=Convert.ToDateTime("10/11/2014 08:30 AM"),Description="yyy",RecurrenceID=null,RecurrenceRule=null,RecurrenceException=null,OwnerID=2,IsAllDay=false}
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
                IsAllDay = x.IsAllDay,
                RecurrenceRule = x.RecurrenceRule,
                RecurrenceException = x.RecurrenceException,
                RecurrenceID = x.RecurrenceID,
                OwnerID = x.OwnerID
            });

            return Json(ListwithUTC, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            //return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public JsonResult GetSchedulerDataUpdate(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //DridDataObj2 a = jSerializer.Deserialize<DridDataObj2>(models.Replace(@"\""", ""));
            IList<SchedulerObj> persons = new JavaScriptSerializer().Deserialize<IList<SchedulerObj>>(models);
            SchedulerObj temp = new SchedulerObj();
            foreach (SchedulerObj m in persons)
            {
                temp = new SchedulerObj { TaskID = m.TaskID, Title = m.Title, Start = m.Start, End =m.End , Description = m.Description, RecurrenceID = m.RecurrenceID, RecurrenceRule = m.RecurrenceRule, RecurrenceException = m.RecurrenceException, OwnerID = m.OwnerID, IsAllDay = m.IsAllDay };
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
            IList<SchedulerObj> persons = new JavaScriptSerializer().Deserialize<IList<SchedulerObj>>(models);
            SchedulerObj temp = new SchedulerObj();
            foreach (SchedulerObj m in persons)
            {
                temp = new SchedulerObj { TaskID = m.TaskID, Title = m.Title, Start = m.Start.ToLocalTime().AddHours(-5).AddMinutes(-30), End = DateTime.SpecifyKind(m.End, DateTimeKind.Utc).ToLocalTime(), Description = m.Description, RecurrenceID = m.RecurrenceID, RecurrenceRule = m.RecurrenceRule, RecurrenceException = m.RecurrenceException, OwnerID = m.OwnerID, IsAllDay = m.IsAllDay };
            }
            return Json(temp, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            //return Json(temp);
        }
    }
    public class SchedulerObj
    {
        public int? TaskID;
        public string Title;
        public string StartTimezone;
        public string EndTimezone;

        /*public string StartTimezone{
            //get { return string.Format(CultureInfo.CurrentCulture, "api/Product/{0}", this.ProductID.Value); }
            get { return null; }
            set { }
        }*/
        public DateTime Start;
        public DateTime End;
        /*public string EndTimezone
        {
            get { return null; }
            set { }
        }*/

        public string Description;

        public int? RecurrenceID;
        public string RecurrenceRule;
        public string RecurrenceException;
        public int? OwnerID;
        public Boolean IsAllDay;

                    /* {  
                       "TaskID":4,
                       "OwnerID":2,
                       "Title":"Bowling tournament",
                       "Description":"",
                       "StartTimezone":null,
                       "Start":"\/Date(1370811600000)\/",
                       "End":"\/Date(1370822400000)\/",
                       "EndTimezone":null,
                       "RecurrenceRule":null,
                       "RecurrenceID":null,
                       "RecurrenceException":null,
                       "IsAllDay":false
                    },
                    {  
                       "TaskID":5,
                       "OwnerID":2,
                       "Title":"Take the dog to the vet",
                       "Description":"",
                       "StartTimezone":null,
                       "Start":"\/Date(1370847600000)\/",
                       "End":"\/Date(1370851200000)\/",
                       "EndTimezone":null,
                       "RecurrenceRule":null,
                       "RecurrenceID":null,
                       "RecurrenceException":null,
                       "IsAllDay":false
                    }*/
    }
}
