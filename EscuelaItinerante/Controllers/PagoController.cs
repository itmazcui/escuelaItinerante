﻿using DES.Logic;
using EscuelaItinerante.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EscuelaItinerante.Controllers
{
    public class PagoController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NuevoPago()
        {
            var vm = new NuevoPagoViewModel();
            return View(vm);
        }

        public ActionResult FinalizarPago(int nroDocumento)
        {
            var vm = new NuevoPagoViewModel();
            vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

            if (vm.Alumno != null)
            {
                vm.Inicializar();
            }

            ModelState.AddModelError("NroDocumento", "El documento ingresado no corresponde a ningún alumno.");

            return View("NuevoPago", vm);
        }

        //[HttpGet]
        //public ActionResult NuevoPago(int dniAlumno)
        //{
        //    var vm = new NuevoPagoViewModel(dniAlumno);

        //    if (vm.Alumno != null)
        //    {
        //        vm.Inicializar();
        //    }
        //    else
        //    {
        //        ModelState.AddModelError("Alumno", "No ha ingresado un alumno válido");
        //    }

        //    return View(vm);
        //}

    }
}