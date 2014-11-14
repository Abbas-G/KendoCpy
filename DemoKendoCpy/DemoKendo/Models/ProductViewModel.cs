
using System.Web.Mvc;
namespace DemoKendo.Models
{
    [Bind(Exclude = "CouponCode")] //this bind attribute will exclude an "CouponCode" property from being posted to server
    public class ProductViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string CouponCode { get; set; }
    }
}
