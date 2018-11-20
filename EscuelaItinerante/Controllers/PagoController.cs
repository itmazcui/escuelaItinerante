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


        //Si borro esto, borrar tamb vista 
        //public ActionResult CargarPago(int nroDocumento = 0)
        //{
        //    var vm = new PagoClaseViewModel();

        //    if (nroDocumento != 0)
        //    {
        //        vm.Alumno = _alumnoLogic.GetAlumnoByNroDocumento(nroDocumento);

        //        if (vm.Alumno != null)
        //            vm.Comisiones = _comisionLogic.GetComisionesDelAlumno(vm.Alumno.IdAlumno);
        //    }   
        //    return View();
        //}

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

            var pagoexitoso = _alumnoLogic.SetPagoClase(pagoDTO);

            if (pagoexitoso)
            {
                var comision = _comisionLogic.GetComision(idComision);

                var fechaPago = DateTime.Now;
                var tipoPago = "Clase";
                var nombreCurso = comision.Curso.ToString().Replace("_", " ");
                var coordinador = comision.Coordinador.ToString().Replace("_", " ");
                var modalidad = comision.Modalidad;
                var sede = comision.Sede.ToString().Replace("_", " ");
                var turno = comision.Turno;

                var html = "<!doctype html><html><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'><style>body{font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;text-align:center;color:#777;}body h1{font-weight:300;margin-bottom:0px;padding-bottom:0px;color:#000;}body h3{font-weight:300;margin-top:10px;margin-bottom:20px;font-style:italic;color:#555;}body a{color:#06F;}.invoice-box{max-width: 700px;margin:auto;padding:30px;border:1px solid #eee;box-shadow:0 0 10px rgba(0, 0, 0, .15);font-size:16px;line-height:24px;font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;color:#555;}.invoice-box table{width:100%;line-height:inherit;text-align:left;}.invoice-box table td{padding:5px;vertical-align:top;}.invoice-box table tr td:nth-child(2){text-align:right;}.invoice-box table tr.top table td{padding-bottom:20px;}.invoice-box table tr.top table td.title{font-size:45px;line-height:45px;color:#333;}.invoice-box table tr.heading td{background:#eee;border-bottom:1px solid #ddd;font-weight:bold;}.invoice-box table tr.details td{padding-bottom:20px;}.invoice-box table tr.item td{border-bottom:1px solid #eee;}.invoice-box table tr.item.last td{border-bottom:none;}.invoice-box table tr.total td:nth-child(2){border-top:2px solid #eee;font-weight:bold;}@media only screen and (max-width: 600px){.invoice-box table tr.top table td{width:100%;display:block;text-align:center;}}</style></head><body><div class='invoice-box'><table cellpadding='0' cellspacing='0'><tr><td colspan='2' style='text-align: center'><img style='width: 270px;' src='http://www.escuelaitinerante.com.ar/images/logo.png'></td></tr><tr class='top'><td colspan='2' style='text-align:right'>Fecha Pago: " + fechaPago + "hs.</td></tr><tr><td colspan='2'><p><b>Nombre de Curso:</b> " + nombreCurso + "<br><b>Coordinador:</b> " + coordinador + "<br><b>Modalidad:</b> " + modalidad + "<br><b>Sede:</b> " + sede + "<br><b>Turno:</b> " + turno + "<br></p></td></tr><tr class='heading'><td>Pago de " + tipoPago + "</td><td>Importe</td></tr><tr class='item last'><td>Importe abonado</td><td>$ " + montoAbonado + ".00</td></tr><tr class='total'><td></td><td> Total: $ " + montoAbonado + ".00</td></tr></table></div></html>";

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

            //TODO var pagoexitoso =
            _alumnoLogic.SetPagoParcial(pagoDTO);

            if (true) //pagoexitoso
            {
                var comision = _comisionLogic.GetComision(idComision);

                var fechaPago = DateTime.Now;
                var tipoPago = "Parcial";
                var nombreCurso = comision.Curso.ToString().Replace("_", " ");
                var coordinador = comision.Coordinador.ToString().Replace("_", " ");
                var modalidad = comision.Modalidad;
                var sede = comision.Sede.ToString().Replace("_", " ");
                var turno = comision.Turno;

                var html = "<!doctype html><html><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'><style>body{font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;text-align:center;color:#777;}body h1{font-weight:300;margin-bottom:0px;padding-bottom:0px;color:#000;}body h3{font-weight:300;margin-top:10px;margin-bottom:20px;font-style:italic;color:#555;}body a{color:#06F;}.invoice-box{max-width: 700px;margin:auto;padding:30px;border:1px solid #eee;box-shadow:0 0 10px rgba(0, 0, 0, .15);font-size:16px;line-height:24px;font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;color:#555;}.invoice-box table{width:100%;line-height:inherit;text-align:left;}.invoice-box table td{padding:5px;vertical-align:top;}.invoice-box table tr td:nth-child(2){text-align:right;}.invoice-box table tr.top table td{padding-bottom:20px;}.invoice-box table tr.top table td.title{font-size:45px;line-height:45px;color:#333;}.invoice-box table tr.heading td{background:#eee;border-bottom:1px solid #ddd;font-weight:bold;}.invoice-box table tr.details td{padding-bottom:20px;}.invoice-box table tr.item td{border-bottom:1px solid #eee;}.invoice-box table tr.item.last td{border-bottom:none;}.invoice-box table tr.total td:nth-child(2){border-top:2px solid #eee;font-weight:bold;}@media only screen and (max-width: 600px){.invoice-box table tr.top table td{width:100%;display:block;text-align:center;}}</style></head><body><div class='invoice-box'><table cellpadding='0' cellspacing='0'><tr><td colspan='2' style='text-align: center'><img style='width: 270px;' src='http://www.escuelaitinerante.com.ar/images/logo.png'></td></tr><tr class='top'><td colspan='2' style='text-align:right'>Fecha Pago: " + fechaPago + "hs.</td></tr><tr><td colspan='2'><p><b>Nombre de Curso:</b> " + nombreCurso + "<br><b>Coordinador:</b> " + coordinador + "<br><b>Modalidad:</b> " + modalidad + "<br><b>Sede:</b> " + sede + "<br><b>Turno:</b> " + turno + "<br></p></td></tr><tr class='heading'><td>Pago de " + tipoPago + "</td><td>Importe</td></tr><tr class='item last'><td>Importe abonado</td><td>$ " + montoAbonado + ".00</td></tr><tr class='total'><td></td><td> Total: $ " + montoAbonado + ".00</td></tr></table></div></html>";

                //EnviarRecibosPorMail();
            }

            return Json(true, JsonRequestBehavior.AllowGet);
        }

    }
}