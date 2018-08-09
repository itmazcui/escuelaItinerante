using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Clases;

namespace DES.Data
{
    public class CursoData
    {
        //public List<Comision> GetCursos(int idSede)
        //{
        //    var parametros = new Dictionary<string, object>();
        //    parametros.Add("@id_sede", idSede);

        //    var da = new DataAccess();
        //    var cursos = new List<Curso>();

        //    var result = da.ExecuteSP("sp_tcursos_by_sede", parametros);

        //    foreach (DataRow item in result.Rows)
        //    {
        //        var curso = new Curso();

        //        curso.IDCurso = int.Parse(item["ID_curso"].ToString());
        //        curso.Nombre = item["Nombre"].ToString();
        //        curso.Observacion = item["Observacion"].ToString();
        //        cursos.Add(curso);
        //    }

        //    return cursos;
        //}

        public List<Comision> GetComisiones(int idSede)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_sede", idSede);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcursos_comisiones", parametros);

            var comisiones = new List<Comision>();

            foreach (DataRow item in result.Rows)
            {
                var comision = new Comision();
                comision.IdComision = int.Parse(item["id_comision"].ToString());
                comision.Turno = (Turno)int.Parse(item["ID_Turno"].ToString());
                comision.Sede = (Sede)int.Parse(item["ID_Sede"].ToString());
                comision.Coordinador = (Coordinador)int.Parse(item["ID_Coordinador"].ToString());
                comision.Modalidad = (Modalidad)int.Parse(item["id_modalidad"].ToString());
                comision.Precio = decimal.Parse(item["Precio"].ToString());
                comisiones.Add(comision);
            }
            return comisiones;
        }

        public List<Curso> GetCursosDelAlumno(int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumno_curso_inscripto", parametros);

            var cursos = new List<Curso>();

            foreach (DataRow item in result.Rows)
            {
                var curso = new Curso();

                //curso.IDCurso = int.Parse(item["ID_curso"].ToString());
                //curso.Nombre = item["Nombre"].ToString();
                //curso.Observacion = item["Observacion"].ToString();
                cursos.Add(curso);
            }

            return cursos;
        }

        public List<DateTime> GetClases(int idComision)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_tcursos_comisiones_clases", parametros);

            var clases = new List<DateTime>();
            foreach (DataRow item in result.Rows)
                clases.Add(Convert.ToDateTime(item["Fecha_clase"].ToString()));


            return clases;
        }
    }
}
