using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoKendo.KendoGridUtilities;

namespace DemoKendo.Controllers
{
    public class FileSystemController : Controller
    {
        //
        // GET: /FileSystem/
        private const string startFolder = @"D:\Workspace\RND\extras 2,3,4\mvc2\without_kendo_dll\DemoKendoCpy\DemoKendo\Content\icons";
        public ActionResult Index()
        {
            ViewData["str"]="asds";
            int a = (int)ViewData["str"]; 
            return View();
        }

        /*Server pagination*/
        public JsonResult GetAll(int skip, int take, int page, int pageSize, string group)
        {
            //reference link for linq t0 file system http://msdn.microsoft.com/en-us/library/bb882649.aspx
            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(startFolder);
            IEnumerable<System.IO.FileInfo> fileList = dir.GetFiles("*.*", System.IO.SearchOption.AllDirectories);
            IEnumerable<System.IO.FileInfo> fullfileinfo =
                (from file in fileList select file).Skip(skip).Take(take);

            var list = fullfileinfo.Select(x => new
            {
                text = x.Name,
                value = x.Name
            });

            var total = (from file in fileList select file).Count();

            return Json(
                new
                {
                    File = list,
                    TotalCount = total
                },
                JsonRequestBehavior.AllowGet); //alow get while using server grid
        }

        /*Server pagination with server option like server filteration and server sorting i.e serverFiltering: true, serverSorting: true,*/
        public JsonResult GetAllWithServerOptions(int skip, int take, int page, int pageSize, string group)
        {
            var sorterCollection = KendoGridSorterCollection.BuildCollection(Request);
            var filterCollection = KendoGridFilterCollection.BuildCollection(Request);

            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(startFolder);
            IEnumerable<System.IO.FileInfo> fileList = dir.GetFiles("*.*", System.IO.SearchOption.AllDirectories);

            IEnumerable<System.IO.FileInfo> fulllist = (from file in fileList select file);
            /*IEnumerable<System.IO.FileInfo> fullfileinfo =
                (from file in fileList select file).Skip(skip).Take(take);*/
            var list = fulllist.Select(x => new
            {
                text = x.Name,
                value = x.Name
            });

            var filteredItems = list.MultipleFilter(filterCollection.Filters);
            var sortedItems = filteredItems.MultipleSort(sorterCollection.Sorters).ToList();
            var count = sortedItems.Count();
            var data = (from v in sortedItems.Skip((page - 1) * pageSize)
                            .Take(pageSize)
                        select v).ToList();

            return Json(
                new
                {
                    File = data,
                    TotalCount = count
                },
                JsonRequestBehavior.AllowGet); //alow get while using server grid
        }
    }
}
