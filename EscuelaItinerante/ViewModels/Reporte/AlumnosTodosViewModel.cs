using DES.Data.Clases;
using DES.Logic;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{
    public class AlumnosTodosViewModel
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();

        public AlumnosTodosViewModel()
        {
            Alumnos = _alumnoLogic.GetAlumnos();
        }

        public List<Alumno> Alumnos { get; set; }
    }
}