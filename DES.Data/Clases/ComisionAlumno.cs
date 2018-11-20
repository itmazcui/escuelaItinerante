using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class ComisionDelAlumno : Comision
    {
        public int ArancelAlumno { get; set; }

        public string ObservacionInscripcion { get; set; }

        public EstadoCursada EstadoCursada { get; set; }

        public new List<AlumnoClase> Clases { get; set; }

        public bool EstaAlDia
        {
            get
            {
                var clasesPagas = Clases.Where(x => x.EstaPagada);

                DateTime FechaMinimaPagoAlDia = DateTime.Now.AddDays(-7);
                if (Modalidad == Modalidad.Mensual)
                    FechaMinimaPagoAlDia = DateTime.Now.AddMonths(-1);

                var estaAlDia = clasesPagas.Any(x => x.FechaClase > FechaMinimaPagoAlDia);
                return estaAlDia;
            }
        }

        public AlumnoClase ClaseAPagarPagoParcial
        {
            get
            {
                //TODO: Modificar esto cuando todos los cursos tengan clases cargadas
                AlumnoClase primeraClase = null;

                if (Clases.Count > 0)
                    primeraClase = Clases.OrderByDescending(x => x.FechaClase).FirstOrDefault();

                var ultimaClaseNOPagada = Clases.Where(x => !x.EstaPagada).OrderBy(w => w.FechaPago).FirstOrDefault();

                return ultimaClaseNOPagada == null ? primeraClase : ultimaClaseNOPagada;
            }
        }

        public new static ComisionDelAlumno MapComisionFromDataRow(DataRow dataRow)
        {
            var comisionAlumno = new ComisionDelAlumno();

            comisionAlumno.IdComision = int.Parse(dataRow["id_comision"].ToString());
            comisionAlumno.Curso = (Curso)int.Parse(dataRow["id_curso"].ToString());
            comisionAlumno.Turno = (Turno)int.Parse(dataRow["ID_Turno"].ToString());
            comisionAlumno.Sede = (Sede)int.Parse(dataRow["ID_Sede"].ToString());
            comisionAlumno.Coordinador = (Coordinador)int.Parse(dataRow["ID_Coordinador"].ToString());
            comisionAlumno.Modalidad = (Modalidad)int.Parse(dataRow["id_modalidad"].ToString());
            comisionAlumno.Arancel = int.Parse(dataRow["Precio"].ToString());
            comisionAlumno.ArancelAlumno = int.Parse(dataRow["PrecioAAbonar"].ToString());
            comisionAlumno.ObservacionInscripcion = dataRow["ObservacionesDelCurso"].ToString();    
            comisionAlumno.EstadoCursada = (EstadoCursada)int.Parse(dataRow["id_estado_cursada"].ToString());

            return comisionAlumno;
        }

    }
}
