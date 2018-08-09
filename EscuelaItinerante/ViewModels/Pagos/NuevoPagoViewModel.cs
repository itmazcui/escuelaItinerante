using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class NuevoPagoViewModel
    {
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();
        private CursoLogic _cursoLogic = new CursoLogic();

        public NuevoPagoViewModel()
        {

        }

        public Alumno Alumno { get; set; }

        [Required]
        public int NroDocumento { get; set; }
        
        [Required]
        public decimal Precio { get; set; }

        public List<DateTime> ClasesCubiertasPorElPago { get; set; }

        public DateTime MesActual { get; set; }

        public List<Curso> CursosDelAlumno { get; set; }

        internal void Inicializar()
        {
            CursosDelAlumno = _cursoLogic.GetCursosDelAlumno(Alumno.IdAlumno);
        }
    }
}