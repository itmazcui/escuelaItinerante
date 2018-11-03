using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class AlumnoClase
    {
        public int IdClase { get; set; }
        public int SumaPagosParcialesRealizados { get; private set; }
        public int IdAlumno { get; set; }
        public int IdComision { get; set; }
        public DateTime FechaClase { get; set; }
        public DateTime? FechaPago { get; set; }

        public bool EstaPagada { get { return FechaPago != null; } }

        internal static AlumnoClase MapClaseAlumnoFromDataRow(DataRow dataRow)
        {
            var claseAlumno = new AlumnoClase();
            claseAlumno.IdComision = int.Parse(dataRow["id_comision"].ToString());
            claseAlumno.FechaClase = DateTime.Parse(dataRow["fechaClase"].ToString());
            claseAlumno.IdAlumno = dataRow["id_alumno"] != DBNull.Value ? int.Parse(dataRow["id_alumno"].ToString()) : 0;
            claseAlumno.IdClase = dataRow["id_clase"] != DBNull.Value ? int.Parse(dataRow["id_clase"].ToString()) : 0;

            claseAlumno.SumaPagosParcialesRealizados = dataRow["SumaPagosParcialesRealizados"] != DBNull.Value ? int.Parse(dataRow["SumaPagosParcialesRealizados"].ToString()) : 0;


            if (dataRow["fechaPago"] != DBNull.Value)
                claseAlumno.FechaPago = DateTime.Parse(dataRow["fechaPago"].ToString());


            return claseAlumno;
        }
    }
}
