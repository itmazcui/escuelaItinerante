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
    [Authorize]
    public class ReporteController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private ComisionLogic _comisionLogic = new ComisionLogic();

        public ReporteController()
        {
            
        }
        
        public ActionResult Index()
        {
            return View();
        }

        
        public ActionResult AlumnosTodos()
        {
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
            return View(vm);
        }

        public ActionResult ComisionesTodas()
        {
            var vm = new ComisionesTodasViewModel();
            vm.Comisiones = _comisionLogic.GetComisiones();
            return View(vm);
        }

        //public ActionResult AlumnosPorCurso()
        //{
        //    var vm = new AlumnoReporteViewModel();
        //    vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
        //    return View(vm);
        //}

        public ActionResult AlumnosConDeuda()
        {
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
            return View(vm);
        }

    }
}