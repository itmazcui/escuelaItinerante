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
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult NuevoPago()
        {
            ViewBag.Title = "Nuevo pago";
            var vm = new NuevoPagoViewModel();
            return View(vm);
        }
    }
}