using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class FinalizarInscripcionViewModel
    {
        private CursoLogic _cursoLogic = new CursoLogic();
        private AlumnoLogic _alumnoLogic = new AlumnoLogic();

        public FinalizarInscripcionViewModel() { }

        public FinalizarInscripcionViewModel(int idAlumno, int idCurso, int idSede) {
            var comisiones = _cursoLogic.GetComisiones(idCurso, idSede);

            Comisiones = comisiones.Select(x => new SelectListItem { Text = string.Concat("Coord. ", x.Coordinador.ToString().Replace("_", " "), " - ", x.Modalidad, " - ", x.Turno, " - ", x.Precio.ToString("C")), Value = x.IdComision.ToString() }).ToList();

            Alumno = _alumnoLogic.GetAlumnoByID(idAlumno);
        }

        public int ComisionSeleccionada { get; set; }

        public List<SelectListItem> Comisiones { get; set; }

        public Alumno Alumno { get; }

        public decimal PrecioAAbonar { get; set; }

        public string ObservacionesDelCurso { get; set; }

    }
}