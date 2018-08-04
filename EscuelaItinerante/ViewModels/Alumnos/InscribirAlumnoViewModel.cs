using DES.Data.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class InscribirAlumnoViewModel
    {
        public InscribirAlumnoViewModel() {
            //TipoDocumentos = new List<SelectListItem>
            //    {
            //        new SelectListItem { Selected = true, Text = "DNI", Value = "DNI"},
            //        new SelectListItem { Selected = false, Text = "CI", Value = "CI"},
            //        new SelectListItem { Selected = false, Text = "LE", Value = "LE"},
            //        new SelectListItem { Selected = false, Text = "LC", Value = "LC"}
            //    };

            //EstadosCiviles = (Enum.GetValues(typeof(EstadoCivil))).Cast<EstadoCivil>().Select(x => new SelectListItem { Text = x.ToString(), Value = ((int)x).ToString() }).ToList();
        }

        public int NroDocumento { get; set; }
        public Alumno Alumno { get; internal set; }
        public List<Curso> Cursos { get; set; }
    }
}