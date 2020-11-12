using System.Web;
using System.Web.Optimization;

namespace VirtualWallet
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new Bundle("~/Script/Bundles").Include(
               "~/bundles/inline.*",
               "~/bundles/polyfills.*",
               "~/bundles/scripts.*",
               "~/bundles/vendor.*",
               "~/bundles/runtime.*",
               "~/bundles/zone.*",
               "~/bundles/main.*"));
            bundles.Add(new StyleBundle("~/Content/Styles").Include("~/bundles/styles.*"));
            
        }
    }
}
