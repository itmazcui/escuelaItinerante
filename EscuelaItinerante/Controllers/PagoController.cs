using DES.Data.Clases;
using DES.Logic;
using EscuelaItinerante.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
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

        public ActionResult CargarPago(int nroDocumento = 0)
        {
            var vm = new PagoClaseViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

                if (vm.Alumno != null)
                    vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
            }   
            return View();
        }

        public ActionResult PagoClase(int nroDocumento = 0)
        {
            var vm = new PagoClaseViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

                if (vm.Alumno != null)
                    vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
            }

            return View(vm);
        }

        [HttpPost]
        public ActionResult PagoClase(int idAlumno, int idComision, int idClase, int montoAbonado)
        {
            var pagoDTO = new PagoDTO();
            pagoDTO.IdAlumno = idAlumno;
            pagoDTO.IdClase = idClase;
            pagoDTO.IdComision = idComision;
            pagoDTO.MontoAbonado = montoAbonado;

            bool pagoexitoso = _alumnoLogic.SetPagoClase(pagoDTO);

            if (pagoexitoso)
            {
                _comisionLogic.GetComisionesDelAlumno(idAlumno).Where(x =)
                //Debe enviar un mail con el monto que el cliente abonó - la cantidad que ya había abonado para pagos parciales
                //EnviarRecibosPorMail();
            }

            return Json(pagoexitoso, JsonRequestBehavior.AllowGet);
        }

        private void EnviarRecibosPorMail()
        {
            MailMessage mail = new MailMessage("matias.azcui@gmail.com", "matias.azcui@gmail.com");
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("matias.azcui@gmail.com", "chirolita123..");
            client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = true;
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            mail.Subject = "this is a test email.";
            mail.Body = "this is my test email body";
            client.Send(mail);
        }

        public ActionResult PagoParcial(int nroDocumento = 0)
        {
            var vm = new PagoParcialViewModel();

            if (nroDocumento != 0)
            {
                vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

                if (vm.Alumno != null)
                    vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
            }

            return View(vm);
        }

        [HttpPost]
        public ActionResult PagoParcial(int idAlumno, int idComision, int idClase, int montoAbonado)
        {
            var pagoDTO = new PagoDTO();
            pagoDTO.IdAlumno = idAlumno;
            pagoDTO.IdClase = idClase;
            pagoDTO.IdComision = idComision;
            pagoDTO.MontoAbonado = montoAbonado;

            _alumnoLogic.SetPagoParcial(pagoDTO);

            //EnviarRecibosPorMail();

            return Json(true, JsonRequestBehavior.AllowGet);
        }

    }
}