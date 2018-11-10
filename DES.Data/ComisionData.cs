using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Clases;

namespace DES.Data
{
    public class ComisionData
    {
        public List<Comision> GetComisiones(int idSede, int idComision = 0)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_sede", idSede);
            parametros.Add("@id_comision", idComision);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcomisiones", parametros);

            var comisiones = new List<Comision>();

            foreach (DataRow item in result.Rows)
            {
                comisiones.Add(Comision.MapComisionFromDataRow(item));
            }
            return comisiones;
        }

        public List<AlumnoClase> GetClasesAlumno(int idComision, int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumno_pago_clase", parametros);

            var comisiones = new List<AlumnoClase>();

            foreach (DataRow item in result.Rows)
            {
                comisiones.Add(AlumnoClase.MapClaseAlumnoFromDataRow(item));
            }
            return comisiones;
        }

        public List<ComisionDelAlumno> GetComisionesDelAlumno(int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumno_comision_inscripto", parametros);

            var comisiones = new List<ComisionDelAlumno>();

            foreach (DataRow item in result.Rows)
                comisiones.Add(ComisionDelAlumno.MapComisionFromDataRow(item));

            return comisiones;
        }

        public List<DateTime> GetClases(int idComision)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcomisiones_clases", parametros);

            var clases = new List<DateTime>();
            foreach (DataRow item in result.Rows)
                clases.Add(Convert.ToDateTime(item["FechaClase"].ToString()));


            return clases;
        }
    }
}
