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
        public List<Comision> GetComisiones(int idSede)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_sede", idSede);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcursos_comisiones", parametros);

            var comisiones = new List<Comision>();

            foreach (DataRow item in result.Rows)
            {
                comisiones.Add(Comision.MapComisionFromDataRow(item));
            }
            return comisiones;
        }

        public List<ClaseAlumno> GetClasesAlumno(int idComision, int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumno_pago_clase", parametros);

            var comisiones = new List<ClaseAlumno>();

            foreach (DataRow item in result.Rows)
            {
                comisiones.Add(ClaseAlumno.MapClaseAlumnoFromDataRow(item));
            }
            return comisiones;
        }

        public List<ComisionAlumno> GetComisionesDelAlumno(int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumno_comision_inscripto", parametros);

            var comisiones = new List<ComisionAlumno>();

            foreach (DataRow item in result.Rows)
                comisiones.Add(ComisionAlumno.MapComisionFromDataRow(item));

            return comisiones;
        }

        public List<DateTime> GetClases(int idComision)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcursos_comisiones_clases", parametros);

            var clases = new List<DateTime>();
            foreach (DataRow item in result.Rows)
                clases.Add(Convert.ToDateTime(item["FechaClase"].ToString()));


            return clases;
        }
    }
}
