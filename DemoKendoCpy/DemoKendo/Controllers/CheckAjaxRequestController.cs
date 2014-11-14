using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class CheckAjaxRequestController : Controller
    {
        //
        // GET: /CheckAjaxRequest/

        public ActionResult Index()
        {
            return View();
        }

        //Html.AntiForgeryToken() will give the visitor a cookie whose name begins with __RequestVerificationToken. 
        //The cookie will contain the same random value as the corresponding hidden field. 
        //This value remains constant throughout the visitor’s browsing session
        
        
        
        //[ValidateAntiForgeryToken]
        //[HttpPost]
        //or
        [ValidateAntiForgeryToken, HttpPost]
        public ActionResult Index(FormCollection Result) // if we want to use [ValidateAntiForgeryToken] we must add  @Html.AntiForgeryToken() in index view it is used to varify token, describtn on above [HttpPost]
        {
            return View();
        }

        [ActionName("Check")]
        public ActionResult xyz(string items) // xyz action will be replace by Check action
        {
            if(Request.IsAjaxRequest())
                {
                    // it's an AJAX request

                    //return RedirectToAction("Index");
                    return Json(Url.Action("Index", "DragDrop"));   
                }
                else
                {
                    // it was normal request
                    return RedirectToAction("Index");
                }
        }

        public ActionResult AnyAction()
        {
            return View("Index");
        }

        // if any action that does not include in Demo controller, this method will be invoke, type /CheckAjaxRequest/aaa
        protected override void HandleUnknownAction(string actionName)
        {
            Response.Write(string.Format("You requested the {0} action which does not exist in demo controller", actionName));
            //RedirectToAction("AnyAction");
        }

    }
}
