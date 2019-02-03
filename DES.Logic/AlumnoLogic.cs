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

        public List<Alumno> GetAlumnosByFiltro(string cadenaABuscar)
        {
            return _alumnosData.GetAlumnosByFiltro(cadenaABuscar);
        }

        public void NuevoAlumno(Alumno alumno)
        {
            _alumnosData.NuevoAlumno(alumno);
        }

        public Alumno GetAlumnoByID(int idAlumno)
        {
            return _alumnosData.GetAlumnoByID(idAlumno);
        }

        public bool InscribirAlumnoComision(InscripcionAlumnoDTO inscribirAlumnoDTO)
        {
            return _alumnosData.InscribirAlumnoAComision(inscribirAlumnoDTO);
        }

        public bool SetPagoClase(PagoDTO pagoDTO)
        {
            return _alumnosData.SetPagoClase(pagoDTO);
        }

        public bool CambiarEstadoCursada(int idAlumno, int idComision, EstadoCursada estadoCursada)
        {
            return _alumnosData.CambiarEstadoCursada(idAlumno, idComision, estadoCursada);
        }

        public List<AlumnoComision> GetAlumnosByComision(int idComision)
        {
            return _alumnosData.GetAlumnosByComision(idComision);
        }

        public bool AlumnoEstaAlDia(List<AlumnoClase> clases, Modalidad modalidad)
        {
            var clasesPagas = clases.Where(x => x.EstaPagada);

            DateTime FechaMinimaPagoAlDia = DateTime.Now.AddDays(-7);
            if (modalidad == Modalidad.Mensual)
                FechaMinimaPagoAlDia = DateTime.Now.AddMonths(-1);

            var ret = clasesPagas.Any(x => x.FechaClase > FechaMinimaPagoAlDia);
            return ret;
        }

        public void SetPagoParcial(PagoDTO pagoDTO)
        {
            _alumnosData.SetPagoParcial(pagoDTO);
        }
    }
}