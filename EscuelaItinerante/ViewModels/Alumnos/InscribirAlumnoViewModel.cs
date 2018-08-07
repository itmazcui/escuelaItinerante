using DES.Data.Classes;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class InscribirAlumnoViewModel
    {
        private CursoLogic _cursoLogic = new CursoLogic();

        public InscribirAlumnoViewModel() {
            Sedes = (Enum.GetValues(typeof(Sede))).Cast<Sede>().Select(x => new SelectListItem { Text = x.ToString().Replace("_", " "), Value = ((int)x).ToString() }).ToList();
        }

        public Alumno Alumno { get; internal set; }
        public List<Curso> Cursos { get; set; }

        public int NroDocumento { get; set; }

        [Required]
        public Sede Sede { get; set; }

        public List<SelectListItem> Sedes { get; set; }

        //public int IDCurso { get; set; }

        //public decimal MontoAAbonar { get; set; }

        //public string ObservacionesDelCurso { get; set; }


    }
}