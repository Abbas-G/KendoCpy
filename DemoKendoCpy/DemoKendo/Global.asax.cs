using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Text;

namespace DemoKendo
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               "Slug", // Route name
                "Abs/G/{slug}", // URL with parameters
               new { controller = "Constraint", action = "Content" } // Parameter defaults
           );

            
           routes.MapRoute(
               "aspxToAction", // Route name
                "MediaCenter/MediaCenterVariable.aspx/{siteid}", // URL with parameters
               new { controller = "Constraint", action = "MediaCenterAction", siteid = UrlParameter.Optional } // Parameter defaults
           );

          routes.MapRoute(
           "Hello",
          "{controller}/{action}/{name}/{cid}"
        );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
               // new { controller = "MultiSelection", action = "CustomMultiSelection", id = UrlParameter.Optional } // Parameter defaults
               //  new { controller = "Demo", action = "Book", id = UrlParameter.Optional } // Parameter defaults
              // new { controller = "Demo", action = "DateTimePicker", id = UrlParameter.Optional } // Parameter defaults
              //new { controller = "Demo", action = "Sorting", id = UrlParameter.Optional } // Parameter defaults
             // new { controller = "Demo", action = "GoogleSearch", id = UrlParameter.Optional } // Parameter defaults

             // new { controller = "Constraint", action = "Index", id = UrlParameter.Optional } // Parameter defaults
              //new { controller = "Filter", action = "SimpleFilter", id = UrlParameter.Optional } // Parameter defaults
                //new { controller = "Filter", action = "ServerFilter", id = UrlParameter.Optional } // Parameter defaults
             // new { controller = "ComboBox", action = "CascadingComboBox", id = UrlParameter.Optional }
              //new { controller = "ComboBox", action = "CascadingComboBox2", id = UrlParameter.Optional }

              //new { controller = "ComboBox", action = "CascadingComboBoxRemoveDupli", id = UrlParameter.Optional }
             // new { controller = "Window", action = "Validator", id = UrlParameter.Optional }

             //new { controller = "DataSource", action = "Index", id = UrlParameter.Optional }
           // new { controller = "DragDrop", action = "Index", id = UrlParameter.Optional }
         //new { controller = "DataSource", action = "simpleGrid", id = UrlParameter.Optional }
             //new { controller = "DataSource", action = "SaveGridData", id = UrlParameter.Optional }

            // new { controller = "DataSource", action = "UseOfDate", id = UrlParameter.Optional }

             //new { controller = "Grid", action = "detailInit", id = UrlParameter.Optional }
           //      new { controller = "Window", action = "NewWindow", id = UrlParameter.Optional }
           //new { controller = "Transport", action = "Index", id = UrlParameter.Optional }
         //new { controller = "Grid", action = "InlineEditing", id = UrlParameter.Optional } // Parameter defaults
         //new { controller = "Grid", action = "popup", id = UrlParameter.Optional } // Parameter defaults
         new { controller = "Grid", action = "InlineEditing2", id = UrlParameter.Optional } // Parameter defaults
         //new { controller = "Grid", action = "IncellGrid", id = UrlParameter.Optional } // Parameter defaults
         // new { controller = "Grid", action = "InsideGridClick", id = UrlParameter.Optional } // Parameter defaults
        // new { controller = "Grid", action = "ColorPickerInGrid", id = UrlParameter.Optional } // Parameter defaults

         //new { controller = "GridServerPaging", action = "Index", id = UrlParameter.Optional } // Parameter defaults
         //new { controller = "Uploader", action = "Index", id = UrlParameter.Optional }
         //new { controller = "Uploader", action = "SingleFile", id = UrlParameter.Optional }
         //new { controller = "Uploader", action = "MultiFile", id = UrlParameter.Optional }
        // new { controller = "Uploader", action = "UploaderInGrid", id = UrlParameter.Optional }
         //new { controller = "Uploader", action = "UploaderInGrid2", id = UrlParameter.Optional }
         //new { controller = "BatchEditting", action = "Batch", id = UrlParameter.Optional }
        // new { controller = "ListView", action = "ProjectsList", id = UrlParameter.Optional }
        //new { controller = "Tabs", action = "Contents", id = UrlParameter.Optional }
        //new { controller = "Tabs", action = "AjaxCallCheck", id = UrlParameter.Optional }
        //new { controller = "Templates", action = "Index", id = UrlParameter.Optional }
       // new { controller = "Templates", action = "Box", id = UrlParameter.Optional }

        //new { controller = "CheckAjaxRequest", action = "Index", id = UrlParameter.Optional }
        //  new { controller = "MVCDemo", action = "Index", id = UrlParameter.Optional }

       // new { controller = "MVCandKendo", action = "Index2", id = UrlParameter.Optional }
        //new { controller = "Grid", action = "ImageInGrid", id = UrlParameter.Optional }
        //new { controller = "GridToGrid", action = "Transfer", id = UrlParameter.Optional }

       // new { controller = "Sharing", action = "GooglePlus", id = UrlParameter.Optional }
        //  new { controller = "Sharing", action = "Twitter", id = UrlParameter.Optional }
       // new { controller = "Sharing", action = "LinkIn", id = UrlParameter.Optional }

      // new { controller = "MVCList", action = "Index", id = UrlParameter.Optional } // Parameter defaults

       //new { controller = "Window", action = "ValidatorAndKendo", id = UrlParameter.Optional } // Parameter defaults

       //new { controller = "Uploader", action = "UploaderInGridPopup", id = UrlParameter.Optional }
       //new { controller = "Account", action = "Index", id = UrlParameter.Optional }

        //new { controller = "FileSystem", action = "Index", id = UrlParameter.Optional }

      // new { controller = "JavascriptToAction", action = "Index", id = UrlParameter.Optional }

      //new { controller = "TestHtml", action = "PreventDefault", id = UrlParameter.Optional } // Parameter defaults

      //new { controller = "TreeView", action = "LocalData", id = UrlParameter.Optional }
      //new { controller = "TreeView", action = "Basic", id = UrlParameter.Optional }
      //new { controller = "GridWidMultiInput", action = "Index", id = UrlParameter.Optional }
      //new { controller = "Scheduler", action = "Index", id = UrlParameter.Optional }
      //new { controller = "SchedulerTemplates", action = "Index", id = UrlParameter.Optional }
      
        );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }

}