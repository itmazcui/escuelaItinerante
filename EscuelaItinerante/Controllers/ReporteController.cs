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
using DES.Logic;

namespace EscuelaItinerante.Controllers
{

    public class ReporteController : Controller
    {
        public ReporteController()
        {
            
        }

        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult Alumnos()
        {
            //TODO: pasar a variable global
            var al = new AlumnoLogic();
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = al.GetAlumnos();
            return View(vm);
        }
        
    }
}