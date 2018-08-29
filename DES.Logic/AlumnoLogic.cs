using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Clases;

namespace DES.Logic
{
    public class AlumnoLogic
    {
        private readonly AlumnoData _alumnosData = new AlumnoData();

        public List<Alumno> GetAlumnos()
        {
            return _alumnosData.GetAlumnos();
        }

        public Alumno GetAlumnoByNroDocumento(int nroDocumento)
        {
            return _alumnosData.GetAlumnoByNroDocumento(nroDocumento);
        }

        public void NuevoAlumno(Alumno alumno)
        {
            _alumnosData.NuevoAlumno(alumno);
        }

        public Alumno GetAlumnoByID(int idAlumno)
        {
            return _alumnosData.GetAlumnoByID(idAlumno);
        }

        public bool InscribirAlumnoAComision(InscripcionAlumnoDTO inscribirAlumnoDTO)
        {
            return _alumnosData.InscribirAlumnoAComision(inscribirAlumnoDTO);
        }

        public bool SetPago(PagoDTO pagoDTO)
        {
            return _alumnosData.SetPago(pagoDTO);
        }
    }
}