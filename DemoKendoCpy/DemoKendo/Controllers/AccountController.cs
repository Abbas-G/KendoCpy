using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoKendo.Models;

namespace DemoKendo.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        public ActionResult Index()
        {
            AccountModel obj = new AccountModel();
            return View(obj);
        }
        [HttpPost]
        public ActionResult Index(AccountModel obj)
        {
            if (ModelState.IsValid) {
                ViewData["message"] = "success";
                return PartialView("AccountPartial", obj);
            }
            return PartialView("AccountPartial", obj);
        }

        public ActionResult AccountPartial()
        {
            AccountModel obj = new AccountModel();
            return PartialView("AccountPartial", obj);
        }

    }
}
