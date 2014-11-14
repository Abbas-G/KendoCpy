using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class JsonpController : Controller
    {
        //
        // GET: /Jsonp/

        [JsonpFilter]
        public ActionResult Foo() //cross domain check using jsonp attribute
        {
            var Data = new { Prop1 = "Abs", Prop2 = "Galiyakotwala" };
            return Json(Data, JsonRequestBehavior.AllowGet);
        }
        #region use below client code in cross domain
        //$.getJSON('http://localhost:3373/Jsonp/foo?callback=?', function (data) {
        //    alert(data.Prop1);
        //});

        //or
        //        $.ajax({
        //        type: 'GET',
        //              url: "http://localhost:3373/api/Jsonp/foo",
        //              callback: 'callbackFunc',
        //              contentType: "application/json",
        //              dataType: 'jsonp'
        //              })
        //});
        #endregion

        /*without jsonp*/
        /*at local iis http://localhost:4170/CrossDomainTest.html its tested, its working*/
        public JsonResult FooWithoutJsonP(string siteCode, string shopCode)
        {
            System.Web.HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*"); // here * or domain name
            System.Web.HttpContext.Current.Response.AddHeader("Access-Control-Allow-Headers", "X-Requested-With");
            //System.Web.HttpContext.Current.Response.AddHeader("Access-Control-Allow-Methods" , "GET, POST" );
            //System.Web.HttpContext.Current.Response.AddHeader("Access-Control-Max-Age","1728000" );
            
            var Data = new { Prop1 = "Abs", Prop2 = "Galiyakotwala" };
            return Json(Data, JsonRequestBehavior.AllowGet);
        }  

    }

    #region Attribute define To return jsonp data
    public class JsonpFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuted(
                ActionExecutedContext filterContext)
        {
            if (filterContext == null)
                throw new ArgumentNullException("filterContext");

            //
            // see if this request included a "callback" querystring
            // parameter
            //
            string callback = filterContext.HttpContext.
                      Request.QueryString["callback"];
            if (callback != null && callback.Length > 0)
            {
                //
                // ensure that the result is a "JsonResult"
                //
                JsonResult result = filterContext.Result as JsonResult;
                if (result == null)
                {
                    throw new InvalidOperationException(
                        "JsonpFilterAttribute must be applied only " +
                        "on controllers and actions that return a " +
                        "JsonResult object.");
                }

                filterContext.Result = new JsonpResult
                {
                    ContentEncoding = result.ContentEncoding,
                    ContentType = result.ContentType,
                    Data = result.Data,
                    Callback = callback
                };
            }
        }
    }
    public class JsonpResult : JsonResult
    {
        /// <summary>
        /// Gets or sets the javascript callback function that is
        /// to be invoked in the resulting script output.
        /// </summary>
        /// <value>The callback function name.</value>
        public string Callback { get; set; }

        /// <summary>
        /// Enables processing of the result of an action method by a
        /// custom type that inherits from
        /// <see cref="T:System.Web.Mvc.ActionResult"/>.
        /// </summary>
        /// <param name="context">The context within which the
        /// result is executed.</param>
        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            HttpResponseBase response = context.HttpContext.Response;
            if (!String.IsNullOrEmpty(ContentType))
                response.ContentType = ContentType;
            else
                response.ContentType = "application/javascript";

            if (ContentEncoding != null)
                response.ContentEncoding = ContentEncoding;

            if (Callback == null || Callback.Length == 0)
            {
                Callback = context.HttpContext.
                  Request.QueryString["callback"];
            }

            if (Data != null)
            {
                // The JavaScriptSerializer type was marked as obsolete
                // prior to .NET Framework 3.5 SP1 
            #pragma warning disable 0618
                JavaScriptSerializer serializer =
                     new JavaScriptSerializer();
                string ser = serializer.Serialize(Data);
                response.Write(Callback + "(" + ser + ");");
            #pragma warning restore 0618
            }
        }
    }

    #endregion
}
