using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoKendo.Controllers
{
    public class LinQPracController : Controller
    {
        //
        // GET: /LinQPrac/

        public ActionResult Index()
        {

            string max_duplicate = Find_out_max_duplicate();

            return View();
        }


        private string Find_out_max_duplicate(){
            //Find out max duplicate number between 1 to N numbers
            int[] _input = new int[] {
              5, 45, 184, 594, 14, 8, 5, 184, 1841, 184, 594, 5, 78, 594, 14, 8, 18, 4, 18, 14, 8, 594
            };

            IGrouping<int, int> max =
              _input.GroupBy(n => n)
              .OrderByDescending(g => g.Count())
              .First();

            return  (
              "Maximum number repeated is " + max.Key +
              " and it is repeated " + max.Count() + " times"
            );


    }
    }
}
