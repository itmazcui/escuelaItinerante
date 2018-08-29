using DES.Data.Clases;
using DES.Logic;
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
        private ComisionLogic _comisionLogic = new ComisionLogic();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NuevoPago(int nroDocumento = 0)
        {
            var vm = new NuevoPagoViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

                if (vm.Alumno != null)
                    vm.Alumno.ComisionesInscripto = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
            }

            return View(vm);
        }

        [HttpPost]
        public ActionResult NuevoPago(int idAlumno, int idComision, int idClase)
        {
            var pagoDTO = new PagoDTO();
            pagoDTO.IdAlumno = idAlumno;
            pagoDTO.IdClase = idClase;
            pagoDTO.IdComision = idComision;

            bool pagoexitoso = _alumnoLogic.SetPago(pagoDTO);

            return Json(pagoexitoso, JsonRequestBehavior.AllowGet);
        }

    }
}