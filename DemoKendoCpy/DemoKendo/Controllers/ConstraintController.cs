using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoKendo.Models;

namespace DemoKendo.Controllers
{
    public class ConstraintController : Controller
    {
        //
        // GET: /Constraint/

        public ActionResult Index(int? id) //url Constraint/Index/12 would be consider as {controller}/{action}/{id} define at maproute
        {
            return View();
        }

        public ActionResult Index2(string name, int? cid) //url Constraint/Index2/abs/12 would be consider as {controller}/{action}/{name}/{id} define at maproute
        {
            return View("Index");
        }

        [SlugToId]//http://haacked.com/archive/2010/02/21/manipulating-action-method-parameters.aspx/
        public ActionResult Content(int abs_id) //see role 1 in maproute where Abs/G/another-slug is converted to  Constraint/Content?slug=101 
        {
            var slug = RouteData.Values["slug"] as string;
            ViewData["slug"] = slug;
            ViewData["id"] = abs_id;
            return View();
        }

        [HttpPost]
        [Coupon]//http://haacked.com/archive/2010/02/12/asp-net-mvc-2-optional-url-parameters.aspx/
        public ActionResult ProductView(ProductViewModel product)
        {
            return View(product);
        }

        public ActionResult MediaCenterAction(int? siteid)
        {
            return View("Index");
        }

    }

    public class SlugToIdAttribute : ActionFilterAttribute
    {
        static readonly IDictionary<string, int> SlugIds = new Dictionary<string, int>
        {
            {"this-is-a-slug", 100}, 
            {"another-slug", 101}, 
            {"and-another", 102}
        };

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var slug = filterContext.RouteData.Values["slug"] as string;
            if (slug != null)
            {
                int id;
                SlugIds.TryGetValue(slug, out id);
                filterContext.ActionParameters["abs_id"] = id;
            }
            base.OnActionExecuting(filterContext);
        }
    }

    public class CouponAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var productModel = filterContext.ActionParameters["product"] as ProductViewModel;
            if (productModel != null)
            {
                if (String.IsNullOrEmpty(productModel.CouponCode)) //productModel.CouponCode value retrive null bocz of [Bind(Exclude = "CouponCode")] dataAnnotaion in model
                {
                    // contrived scenario.
                    productModel.CouponCode = "XYZ";
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
