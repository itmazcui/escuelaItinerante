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
            Cursos = _cursoLogic.GetCursos();
        }

        public Alumno Alumno { get; internal set; }
        public List<Curso> Cursos { get; set; }

        public int NroDocumento { get; set; }

        public int IDCurso { get; set; }

        public decimal MontoAAbonar { get; set; }

        public string ObservacionesDelCurso { get; set; }


    }
}