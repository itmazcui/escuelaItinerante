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
using DES.Data.Clases;
using DES.Logic;

namespace EscuelaItinerante.Controllers
{
    [Authorize]
    public class AlumnoController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private ComisionLogic _comisionLogic = new ComisionLogic();


        public AlumnoController()
        {
        }

        public ActionResult InscribirAlumno()
        {
            var vm = new InscribirAlumnoViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult InscribirAlumno(InscribirAlumnoViewModel model)
        {
            var alumno = _alumnoLogic.GetAlumnoByNroDocumento(model.NroDocumento);

            if (alumno == null)
                ModelState.AddModelError("NroDocumento", "El Nro. de Documento ingresado no existe.");
            else
            {
                model.Comisiones = _comisionLogic.GetComisiones((int)model.Sede);
                model.Alumno = alumno;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult FinalizarInscripcion(int idAlumno, int idComision, int arancel, string observacionesDeLaInscripcion)
        {
            var inscribirAlumnoDTO = new InscripcionAlumnoDTO();
            inscribirAlumnoDTO.IdAlumno = idAlumno;
            inscribirAlumnoDTO.IdComision = idComision;
            inscribirAlumnoDTO.ObservacionesDeLaInscripcion = observacionesDeLaInscripcion;
            inscribirAlumnoDTO.Arancel = arancel;

            bool inscripcionExitosa = _alumnoLogic.InscribirAlumnoComision(inscribirAlumnoDTO);

            return Json(inscripcionExitosa, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AlumnoAbandonaComision(int nroDocumento = 0)
        {
            var vm = new AlumnoAbandonaComisionViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

                if (vm.Alumno != null)
                    vm.Alumno.ComisionesInscripto = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
            }

            return View(vm);
        }

        [HttpPost]
        public ActionResult AlumnoAbandonaComision(int idAlumno, int idComision)
        {
            bool pagoexitoso = _alumnoLogic.CambiarEstadoCursada(idAlumno, idComision, EstadoCursada.Abandonado);

            return Json(pagoexitoso, JsonRequestBehavior.AllowGet);
        }

        public ActionResult NuevoAlumno()
        {
            var vm = new NuevoAlumnoViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult NuevoAlumno(NuevoAlumnoViewModel model)
        {
            var alumnoInscripto = _alumnoLogic.GetAlumnoByNroDocumento(model.NroDocumento);

            if (alumnoInscripto != null)
                ModelState.AddModelError("NroDocumento", "El alumno ya se encuenta inscripto en el instituto");

            if (ModelState.IsValid)
            {
                var alumno = new Alumno();
                alumno.Nombre = model.Nombre;
                alumno.Apellido = model.Apellido;
                alumno.Tipodoc = model.Tipodoc;
                alumno.NroDocumento = model.NroDocumento;
                alumno.Direccion = model.Direccion;
                alumno.CodigoPostal = model.CodigoPostal;
                alumno.Localidad = model.Localidad;
                alumno.Telefono = model.Telefono;
                alumno.Celular = model.Celular;
                alumno.Email = model.Email;
                alumno.ComoNosConocio = model.ComoNosConocio;
                alumno.EstadoCivil = model.EstadoCivil;
                alumno.Hijos = model.Hijos;
                alumno.EstudiosRealizados = model.EstudiosRealizados;
                alumno.ConocidoEnInstituto = model.ConocidoEnInstituto;
                alumno.Observaciones = model.Observaciones;
                _alumnoLogic.NuevoAlumno(alumno);

                return RedirectToAction("NuevoAlumnoExitoso");
            }

            return View(model);
        }

        public ActionResult NuevoAlumnoExitoso()
        {
            return View();
        }


    }
}