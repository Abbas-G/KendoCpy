using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.Script.Serialization;

namespace DemoKendo.Controllers
{
    public class UploaderController : Controller
    {
        //
        // GET: /Uploader/

        #region using file in grid
        public ActionResult UploaderInGrid()
        {
            return View();
        }
        public ActionResult UploaderInGrid2()
        {
            return View();
        }

        public ActionResult UploaderInGridPopup()
        {
            return View();
        }

        public JsonResult GetJsonOutputForGridDataSelect()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(publicationTable);  // this statement wont allow to see records directly on browser
        }

        public ActionResult GetJsonOutputForGridDataUpdatePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            //DridDataObj a = jSerializer.Deserialize<DridDataObj>(models.Replace(@"\""", ""));
            IList<DridDataObj> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj>>(models);
            DridDataObj temp = new DridDataObj();
            foreach (DridDataObj m in persons)
            {
                temp = new DridDataObj { ProductID = m.ProductID, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category, FileUploader = m.FileUploader };
            }
            //return Json(publicationTable, JsonRequestBehavior.AllowGet);  //this statement allow to see records directly on browser , you need also to set get in place of post in javascript(.aspx page)
            return Json(temp);
        }

        public JsonResult GetJsonOutputForGridDataDeletePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = GetFOOD();
            return Json(publicationTable);
        }

        public JsonResult GetJsonOutputForGridDataCreatePopup(string models)
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            IList<DridDataObj> persons = new JavaScriptSerializer().Deserialize<IList<DridDataObj>>(models);
            DridDataObj temp = new DridDataObj();
            foreach (DridDataObj m in persons)
            {
                temp = new DridDataObj { ProductID = 22, ProductName = m.ProductName, UnitPrice = m.UnitPrice, UnitsInStock = m.UnitsInStock, Discontinued = m.Discontinued, Category = m.Category, FileUploader = m.FileUploader };
            }
            return Json(temp);
        }

        public JsonResult GetJsonOutputForFoodUniqueCategory()
        {
            JavaScriptSerializer jSerializer = new JavaScriptSerializer();
            var publicationTable = (from c in GetFOOD()
                                    group c by c.Category into d
                                    select new
                                    {
                                        Category = d.Key,
                                    }); //groupby Food by category
            return Json(publicationTable);
        }
        public JsonResult SearchFOODbyCategory(string searchString)
        {
            //searchString = searchString.ToUpper();
            var searchedFOOD = from m in GetFOOD()
                               where m.Category.ToUpper().Contains(searchString.ToUpper()) || m.ProductName.ToUpper().Contains(searchString.ToUpper()) || m.UnitsInStock.ToString().ToUpper().Contains(searchString.ToUpper()) || m.UnitPrice.ToString().ToUpper().Contains(searchString.ToUpper())
                               select m;

            //return new JavaScriptSerializer().Serialize(searchedFOOD.ToList()); //if return type is string
            return Json(searchedFOOD);
        }
        public List<DridDataObj> GetFOOD()
        {
            var list = new List<DridDataObj>{
            new DridDataObj{ ProductID=1, ProductName="chai", UnitPrice=20, UnitsInStock=15,Discontinued=true,Category="Surati",FileUploader="xx"},
            new DridDataObj{ ProductID=2, ProductName="Khaman", UnitPrice=57, UnitsInStock=50,Discontinued=false,Category="Surati",FileUploader="yy"},
            new DridDataObj{ ProductID=3, ProductName="Dhokla", UnitPrice=5, UnitsInStock=8,Discontinued=true,Category="Surati",FileUploader="zz"},
            new DridDataObj{ ProductID=4, ProductName="Vada pav", UnitPrice=10, UnitsInStock=15,Discontinued=false,Category="Mumbai",FileUploader="aa"},
            new DridDataObj{ ProductID=5, ProductName="Dhosa", UnitPrice=30, UnitsInStock=50,Discontinued=true,Category="South Indian",FileUploader="bb"},
            new DridDataObj{ ProductID=6, ProductName="idli", UnitPrice=20, UnitsInStock=80,Discontinued=true,Category="South Indian",FileUploader="cc"},
            new DridDataObj{ ProductID=7, ProductName="Noodles", UnitPrice=7, UnitsInStock=90,Discontinued=false,Category="Chinese",FileUploader="dd"}
            };

            return list;
        }

        public JsonResult UploadFile(HttpPostedFileBase FileUploader)
        {
            string fileName = Path.GetFileName(FileUploader.FileName);
            var path = Path.Combine(Server.MapPath("~/UploadFiles"), fileName);
            FileUploader.SaveAs(path);
            return Json(new { FileUploader = fileName });
            // return Json(new{data="Success","text/plain"});
        }
        #endregion

        #region using jason file
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Upload(HttpPostedFileBase files)
        {
            string fileName = Path.GetFileName(files.FileName);
            var path = Path.Combine(Server.MapPath("~/UploadFiles"), fileName);
            files.SaveAs(path);
            return Json(new { data = "Successfully uploaded" });
          //  return Json(new{data="Success","text/plain"});
        }

        //public JsonResult Delete(HttpPostedFileBase files, Guid codeID)
        //{
        //   // string fileName = Path.GetFileName(files.FileName);
        //    return Json(new { Value = "Successfully" });
        //}
        #endregion

        #region single file
        public ActionResult SingleFile()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SingleFileUpload(HttpPostedFileBase files)
        {
            string fileName = Path.GetFileName(files.FileName);
            var path = Path.Combine(Server.MapPath("~/UploadFiles"), fileName);
            files.SaveAs(path);
            return View("SingleFile");
        }
        #endregion

        #region multi file
        public ActionResult MultiFile()
        {
            return View();
        }

        [HttpPost]
        public ActionResult MultiFileUpload(IEnumerable<HttpPostedFileBase> files)
        {
            foreach (var file in files)
            {
                if (file != null)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/UploadFiles"), fileName);
                    file.SaveAs(path);
                }
            }
            return View("MultiFile");
        }
        #endregion
    }

    public class DridDataObj
    {
        public int? ProductID;
        public string ProductName;
        public int UnitPrice;
        public int UnitsInStock;
        public Boolean Discontinued;
        public string Category;
        public string FileUploader;
    }

}
