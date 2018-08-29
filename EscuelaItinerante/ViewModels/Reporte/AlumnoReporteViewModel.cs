using DES.Data.Clases;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class AlumnoReporteViewModel
    {
        public AlumnoReporteViewModel()
        {
        }

        public List<Alumno> AlumnosInstitutosTodos { get; set; }
    }
}