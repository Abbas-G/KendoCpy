using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

namespace WebService
{
    /// <summary>
    /// Summary description for PDFTOHTMLService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class PDFTOHTMLService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Obj getHtmlDetailJSON(string fsFolder)
        {
            //HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
            Obj o = new Obj();
            o.count = "1";
            o.url = "/DemoMP3PDF/BHTML/Rutila and the Ngarluma Aboriginal Corporation Complete Native Title Agreement (2)/1.HTML"; ;
           //o.url = "dsa";
            return o;
            //return new JavaScriptSerializer().Serialize(o);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Obj getjson()
        {
            //List<Obj> list = new List<Obj>();
            System.Threading.Thread.Sleep(18000);
            //for (int i = 0; i < 100; i++)
            //{
                Obj item= new Obj();
                item.count="1";
                item.url = "True";
               // list.Add(item);
            //}
                return item;
            //return new JavaScriptSerializer().Serialize(list);
        }
        
    }
    public class Obj {
        public string count { get; set; }
        public string url { get; set; }
    }
}
