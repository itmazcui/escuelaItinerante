using DES.Data.Clases;
using DES.Logic;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{
    public class AlumnosConDeudaViewModel
    {
        private ComisionLogic _comisionLogic = new ComisionLogic();

        public AlumnosConDeudaViewModel()
        {
            Comisiones = _comisionLogic.GetComisiones().OrderBy(x => x.Sede).ThenBy(x => x.Curso).ThenBy(x => x.Turno).Select(x => new SelectListItem { Text = string.Concat(x.Sede.ToString().Replace("_", " "), ": ", x.Curso.ToString().Replace("_", " "), " - ", x.Turno.ToString().Replace("_", " "), " - ", x.Modalidad, " - ", x.Coordinador.ToString().Replace("_", " ")), Value = x.IdComision.ToString() }).ToList();
        }

        public List<Alumno> AlumnosConDeuda { get; set; }

        public List<SelectListItem> Comisiones { get; set; }

        public int IdComision { get; set; }
    }
}