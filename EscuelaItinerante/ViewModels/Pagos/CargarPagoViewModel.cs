using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class CargarPagoViewModel
    {
        public CargarPagoViewModel()
        {

        }

        public Alumno Alumno { get; set; }

        public int NroDocumento { get; set; }

        public List<ComisionDelAlumno> Comisiones { get; internal set; }
    }
}