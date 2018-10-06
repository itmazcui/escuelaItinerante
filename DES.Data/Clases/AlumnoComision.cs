using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class AlumnoComision : Alumno
    {
        public bool EstaAlDia { get; set; }
        public EstadoCursada EstadoCursada { get; set; }
    }
}


