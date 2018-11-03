using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class AlumnoAbandonaComisionViewModel
    {
        private ComisionLogic _comisionLogic = new ComisionLogic();

        public AlumnoAbandonaComisionViewModel() {
            //Sedes = (Enum.GetValues(typeof(Sede))).Cast<Sede>().Select(x => new SelectListItem { Text = x.ToString().Replace("_", " "), Value = ((int)x).ToString() }).ToList();}
        }

        public Alumno Alumno { get; internal set; }

        public int NroDocumento { get; set; }

        public List<ComisionDelAlumno> Comisiones { get; set; }


    }
}