using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class PagoParcialViewModel
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private ComisionLogic _cursoLogic = new ComisionLogic();

        public PagoParcialViewModel()
        {

        }

        public Alumno Alumno { get; set; }

        [Required]
        public int NroDocumento { get; set; }
        
    }
}