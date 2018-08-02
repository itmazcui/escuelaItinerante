using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Classes;

namespace DES.Logic
{
    public class AlumnoLogic
    {
        private readonly AlumnosData _alumnosData = new AlumnosData();

        public List<Alumno> GetAlumnos()
        {
            return _alumnosData.GetAlumnos();
        }

        public void NuevoAlumno(Alumno alumno)
        {
            _alumnosData.NuevoAlumno(alumno);
        }
    }
}
