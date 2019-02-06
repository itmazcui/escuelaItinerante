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
    public class AlumnoController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private ComisionLogic _comisionLogic = new ComisionLogic();


        public AlumnoController()
        {
        }

        [Authorize]
        public ActionResult InscribirAlumno()
        {
            var vm = new InscribirAlumnoViewModel();
            return View(vm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult InscribirAlumno(InscribirAlumnoViewModel model)
        {
            var alumno = _alumnoLogic.GetAlumnoByNroDocumento(model.NroDocumento);

            if (alumno == null)
                ModelState.AddModelError("NroDocumento", "El Nro. de Documento ingresado no existe.");
            else
            {
                model.Comisiones = _comisionLogic.GetComisiones((int)model.Sede).OrderBy(x => x.Curso.ToString()).ThenBy(x => x.Coordinador.ToString()).ToList();
                model.Alumno = alumno;
            }

            return View(model);
        }

        [Authorize]
        [HttpPost]
        public ActionResult FinalizarInscripcion(int idalumno, int idcomision, int arancel, string observacionesdelainscripcion)
        {
            var inscribirAlumnoDTO = new InscripcionAlumnoDTO();
            inscribirAlumnoDTO.IdAlumno = idalumno;
            inscribirAlumnoDTO.IdComision = idcomision;
            inscribirAlumnoDTO.ObservacionesDeLaInscripcion = observacionesdelainscripcion;
            inscribirAlumnoDTO.Arancel = arancel;

            bool inscripcionExitosa = _alumnoLogic.InscribirAlumnoComision(inscribirAlumnoDTO);

            return Json(inscripcionExitosa, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public ActionResult CambiarEstadoCursada(int nroDocumento = 0)
        {
            var vm = new CambiarEstadoCursadaViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);
                
                if (vm.Alumno != null)
                    vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.
                        Alumno.IdAlumno);
            }

            return View(vm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult CambiarEstadoCursada(int idAlumno, int idComision, int nuevoestadocursada)
        {
            bool pagoexitoso = _alumnoLogic.CambiarEstadoCursada(idAlumno, idComision, (EstadoCursada)nuevoestadocursada);

            return Json(pagoexitoso, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
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

            if (model.CodigoPostal == 0)
                ModelState["CodigoPostal"].Errors.Clear();

            if (model.Celular == 0)
                ModelState["Celular"].Errors.Clear();

            if (model.Hijos == 0)
                ModelState["Hijos"].Errors.Clear();

            if (ModelState.IsValid)
            {
                var alumno = new Alumno();
                alumno.Nombre = model.Nombre;
                alumno.Apellido = model.Apellido;
                alumno.Tipodoc = model.Tipodoc;
                alumno.NroDocumento = model.NroDocumento;
                alumno.Direccion = model.Direccion ?? string.Empty;
                alumno.CodigoPostal = model.CodigoPostal;
                alumno.Localidad = model.Localidad ?? string.Empty;
                alumno.Telefono = model.Telefono;
                alumno.Celular = model.Celular;
                alumno.Email = model.Email;
                alumno.ComoNosConocio = model.ComoNosConocio ?? string.Empty;
                alumno.EstadoCivil = model.EstadoCivil;
                alumno.Hijos = model.Hijos;
                alumno.EstudiosRealizados = model.EstudiosRealizados ?? string.Empty;
                alumno.ConocidoEnInstituto = model.ConocidoEnInstituto ?? string.Empty;
                alumno.Observaciones = model.Observaciones ?? string.Empty;
                _alumnoLogic.NuevoAlumno(alumno);

                return RedirectToAction("NuevoAlumnoExitoso");
            }

            return View(model);
        }

        public ActionResult BuscarAlumno()
        {
            var vm = new BuscarAlumnoViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult BuscarAlumno(BuscarAlumnoViewModel model)
        {
            model.Alumnos = _alumnoLogic.GetAlumnosByFiltro(model.CadenaABuscar);
            return View(model);
        }

        public ActionResult FichaAlumno(int idAlumno)
        {
            var vm = new FichaAlumnoViewModel();
            vm.Alumno = _alumnoLogic.GetAlumnoByID(idAlumno);

            if (vm.Alumno != null)
                vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);

            return View(vm);
        }


        public ActionResult NuevoAlumnoExterno()
        {
            var vm = new NuevoAlumnoViewModel();
            return View(vm);
        }

        public ActionResult NuevoAlumnoExitoso()
        {
            return View();
        }


    }
}