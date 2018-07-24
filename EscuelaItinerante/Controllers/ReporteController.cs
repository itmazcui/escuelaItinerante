using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using EscuelaItinerante.Models;

namespace EscuelaItinerante.Controllers
{
    [Authorize]
    public class ReporteController : Controller
    {
        public ReporteController()
        {
        }

        [AllowAnonymous]
        public ActionResult Index(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [AllowAnonymous]
        public ActionResult AlumnosPorCurso(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }
        

    }
}