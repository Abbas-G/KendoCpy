using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.Hosting;

namespace DemoKendo.Controllers
{
    public class ExportNavigateController : Controller
    {
        //
        // GET: /ExportNavigate/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Export()
        {
            string fileName = "Report.xlsx";
            FileInfo file = new FileInfo(HostingEnvironment.MapPath("~/ReportContent/") + fileName);

            if (file.Exists)
            {
                Response.Clear();

                Response.ClearHeaders();

                Response.ClearContent();

                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);

                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.ContentType = "text/plain";


                Response.TransmitFile(file.FullName);

                Response.Flush();

                Response.End();

                /**this wont call***/
                return RedirectToAction("Navigate");

            }
            return View("Index");
        }

        public ActionResult Navigate()
        {
            return View();
        }
    }
}
