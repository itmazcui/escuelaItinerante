using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class ComisionAlumno : Comision
    {
        public int ArancelAlumno { get; set; }
        public string ObservacionInscripcion { get; set; }
        public EstadoCursada IdEstadoCursada { get; set; }
        public new List<AlumnoClase> Clases { get; set; }

        public bool EstaAlDia
        {
            get
            {
                var ret = !Clases.Exists(x => !x.EstaPagada && x.FechaClase < DateTime.Now);
                return ret;
            }
        }

        public new static ComisionAlumno MapComisionFromDataRow(DataRow dataRow)
        {
            var comisionAlumno = new ComisionAlumno();
            comisionAlumno.IdComision = int.Parse(dataRow["id_comision"].ToString());
            comisionAlumno.Curso = (Curso)int.Parse(dataRow["id_curso"].ToString());
            comisionAlumno.Turno = (Turno)int.Parse(dataRow["ID_Turno"].ToString());
            comisionAlumno.Sede = (Sede)int.Parse(dataRow["ID_Sede"].ToString());
            comisionAlumno.Coordinador = (Coordinador)int.Parse(dataRow["ID_Coordinador"].ToString());
            comisionAlumno.Modalidad = (Modalidad)int.Parse(dataRow["id_modalidad"].ToString());
            comisionAlumno.Arancel = int.Parse(dataRow["Precio"].ToString());
            comisionAlumno.ArancelAlumno = int.Parse(dataRow["PrecioAAbonar"].ToString());
            comisionAlumno.ObservacionInscripcion = dataRow["ObservacionesDelCurso"].ToString();
            comisionAlumno.IdEstadoCursada = (EstadoCursada)int.Parse(dataRow["id_estado_cursada"].ToString());
            return comisionAlumno;
        }

    }
}
