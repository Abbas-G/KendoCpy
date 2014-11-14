using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class MultiSelectionController : Controller
    {
        //
        // GET: /MultiSelection/
        public ActionResult SimpleMultiSelection()
        {
            return View();
        }
        public ActionResult MultiSelection()
        {
            ViewData["MultiSelectScript"] = "<script type='text/javascript'>var data=" + getJsonForSimpleMultiSelect() + "</script>";
            return View();
        }

        public string getJsonForSimpleMultiSelect()
        {
            var publicationTable = new List<MultiSelectObj>{
            new MultiSelectObj{ text="Aa",value="1"},
            new MultiSelectObj{ text="Bb",value="2"},
            new MultiSelectObj{ text="Cc",value="3"}
            };

            return (new JavaScriptSerializer()).Serialize(publicationTable);
        }

        public ActionResult CustomMultiSelection()
        {
            return View();
        }
       /* public string getJsonForCustomMultiSelect()
        {
            var publicationTable = new List<CustomMultiSelectObj>{
            new CustomMultiSelectObj{ CustomerID="ALFKI",ContactName="Aaa",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="ANATR",ContactName="Bbb",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="ANTON",ContactName="Ccc",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="AROUT",ContactName="Ddd",CompanyName="TiaSol"}
            };
            return (new JavaScriptSerializer()).Serialize(publicationTable);
        }*/
        public JsonResult GetJsonOutputForCustomMultiSelect()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = new List<CustomMultiSelectObj>{
            new CustomMultiSelectObj{ CustomerID="ALFKI",ContactName="Aaa",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="ANATR",ContactName="Bbb",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="ANTON",ContactName="Ccc",CompanyName="TiaSol"},
            new CustomMultiSelectObj{ CustomerID="AROUT",ContactName="Ddd",CompanyName="TiaSol"}
            };
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }
    }
}
public class MultiSelectObj
{
    public string text;
    public string value;
}

public class CustomMultiSelectObj
{
    public string CustomerID;
    public string ContactName;
    public string CompanyName;
}
