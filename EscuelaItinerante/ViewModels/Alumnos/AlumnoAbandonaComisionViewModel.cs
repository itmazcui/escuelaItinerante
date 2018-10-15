﻿using DES.Data.Clases;
using DES.Logic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class AlumnoAbandonaComisionViewModel
    {
        private ComisionLogic _comisionLogic = new ComisionLogic();

        public AlumnoAbandonaComisionViewModel() {
            //Sedes = (Enum.GetValues(typeof(Sede))).Cast<Sede>().Select(x => new SelectListItem { Text = x.ToString().Replace("_", " "), Value = ((int)x).ToString() }).ToList();}
        }

        public Alumno Alumno { get; internal set; }

        //public List<SelectListItem> Sedes { get; set; }

        public int NroDocumento { get; set; }

        //public Alumno Alumno { get; internal set; }

        public List<ComisionAlumno> Comisiones { get; set; }

        //public int IdComision { get; set; }

        //[Required]
        //public Sede Sede { get; set; }

        //public int Arancel { get; set; }

        //public string ObservacionesDeLaInscripcion { get; set; }


    }
}