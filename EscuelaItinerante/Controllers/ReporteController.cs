﻿using System;
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
using DES.Data.Clases;

namespace EscuelaItinerante.Controllers
{
    [Authorize]
    public class ReporteController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private ComisionLogic _comisionLogic = new ComisionLogic();
        private PagoLogic _pagoLogic = new PagoLogic();

        public ReporteController()
        {
            
        }
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ComisionesTodas()
        {
            var vm = new ComisionesTodasViewModel();
            vm.Comisiones = _comisionLogic.GetComisiones();
            return View(vm);
        }

        public ActionResult AlumnosTodos()
        {
            var vm = new AlumnosTodosViewModel();
            return View(vm);
        }

        public ActionResult Pagos()
        {
            var vm = new PagosViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult Pagos(PagosViewModel model)
        {
            model.Pagos = _pagoLogic.GetPagos((Sede)model.IdSede, model.FechaDesde, model.FechaHasta);
            return View(model);
        }

        public ActionResult AlumnosPorCurso()
        {
            var vm = new AlumnosPorCursoViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult AlumnosPorCurso(AlumnosPorCursoViewModel model)
        {
            model.Alumnos = _alumnoLogic.GetAlumnosByComision(model.IdComision);
            return View(model);
        }

    }
}