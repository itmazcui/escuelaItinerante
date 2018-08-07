using System.Web;
using System.Web.Optimization;

namespace EscuelaItinerante
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/sitio").Include(
                        "~/Scripts/sitio.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Utilice la versión de desarrollo de Modernizr para desarrollar y obtener información. De este modo, estará
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/datatable").Include(
                        "~/Scripts/jquery-3.3.1.js",
                        "~/Scripts/jquery.dataTables.js",
                        "~/Scripts/DataTable/dataTables.buttons.js",
                        "~/Scripts/DataTable/buttons.flash.js",
                        "~/Scripts/DataTable/jszip.js",
                        "~/Scripts/DataTable/pdfmake.min.js",
                        "~/Scripts/DataTable/buttons.html5.js",
                        "~/Scripts/DataTable/buttons.print.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/datatable").Include(
                      "~/Content/DataTable/jquery.dataTables.css",
                      "~/Content/DataTable/buttons.dataTables.css"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
        }
    }
}
