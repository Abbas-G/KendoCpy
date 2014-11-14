using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace DemoKendo.Controllers
{
    public class MVCDemoController : Controller
    {
        //
        // GET: /MVCDemo/

        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly] //this attribute want allow you to make request from url like http://localhost:2088/MVCDemo/CurrentDate?city=ahmedabad
        public string CurrentDate(string city)
        {
            
            string result = ChangePassword("a", "b");
            return city+"--"+DateTime.Now.ToString();
        }

        [NonAction]    //this attribute want allow you to make request from url like http://localhost:2088/MVCDemo/ChangePassword?old=a&nw=d  and also  Html.Action() or Html.RenderAction() can not call this
        public string ChangePassword(string old, string nw)
        {
            return "password change";
        }

        [ChildActionOnly] //this attribute want allow you to make request from url like http://localhost:2088/MVCDemo/getNHPWHSBrandList
        public string getTESTDB_BrandList()
        {
           
            /***adding a new data***/
            /*DemoKendo.Models.BrandModel BM = new DemoKendo.Models.BrandModel();
            //BM.id = 1;
            BM.name = "abc";
            BM.type = "NHP";

            DemoKendo.testEntities TE = new testEntities();

            TE.Connection.Open();
            TE.Brand.AddObject(BM);
            TE.SaveChanges();
            TE.AcceptAllChanges();*/

            /****fatching data**/
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");

            DemoKendo.testEntities entities = new testEntities();
            foreach (var items in entities.Brand.Where(x=>x.id > 0).ToList())
            {
                sb.Append("<li>"+items.name+"</li>");
            }
            sb.Append("</ul>");

            return sb.ToString();
        }
    }
}
