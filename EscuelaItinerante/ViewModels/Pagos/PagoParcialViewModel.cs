using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class PagoParcialViewModel
    {
        public PagoParcialViewModel()
        {

        }

        public Alumno Alumno { get; set; }

        [Required]
        public int NroDocumento { get; set; }

        public List<ComisionDelAlumno> Comisiones { get; internal set; }
    }
}