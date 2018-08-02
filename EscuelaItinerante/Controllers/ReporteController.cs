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
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();

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
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
            return View(vm);
        }
        
    }
}