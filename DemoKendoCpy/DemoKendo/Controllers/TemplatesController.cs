﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class TemplatesController : Controller
    {
        //
        // GET: /Templates/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Box()
        {
            return View();
        }

        public ActionResult SimpleTemplate()
        {
            return View();
        }
    }
}
