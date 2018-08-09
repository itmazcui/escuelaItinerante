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

namespace EscuelaItinerante.Controllers
{
    [Authorize]
    public class ReporteController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private CursoLogic _cursoLogic = new CursoLogic();

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

        public ActionResult CursosTodos()
        {
            var vm = new CursosTodosViewModel();
            //vm.Cursos = _cursoLogic.GetCursos();
            return View(vm);
        }

        public ActionResult AlumnosPorCurso()
        {
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
            return View(vm);
        }

        public ActionResult AlumnosConDeuda()
        {
            var vm = new AlumnoReporteViewModel();
            vm.AlumnosInstitutosTodos = _alumnoLogic.GetAlumnos();
            return View(vm);
        }

    }
}