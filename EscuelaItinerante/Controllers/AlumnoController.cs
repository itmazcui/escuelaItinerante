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
using DES.Data.Classes;
using DES.Logic;

namespace EscuelaItinerante.Controllers
{
    [Authorize]
    public class AlumnoController : Controller
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();

        public AlumnoController()
        {
        }
        
        //
        // GET: /Account/Login
        public ActionResult NuevoAlumno()
        {
            var vm = new NuevoAlumnoViewModel();
            return View(vm);
        }

        //
        // POST: /Account/Login
        [HttpPost]
        public ActionResult NuevoAlumno(NuevoAlumnoViewModel model)
        {
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

                ViewBag.StatusMessage = "El ingreso se ha efectuado correctamente!";

                var nuevoVM = new NuevoAlumnoViewModel();
                return View(nuevoVM);
            }

            return View(model);
        }
    }
}