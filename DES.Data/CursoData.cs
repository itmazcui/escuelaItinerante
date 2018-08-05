using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Classes;

namespace DES.Data
{
    public class CursoData
    {
        public List<Curso> GetCursos()
        {
            var da = new DataAccess();
            var cursos = new List<Curso>();
            
            var result = da.ExecuteSP("sp_tcursos");

            foreach (DataRow item in result.Rows)
            {
                var curso = new Curso();

                curso.IDCurso = int.Parse(item["ID_curso"].ToString());
                curso.Nombre = item["Nombre"].ToString();
                curso.Turno = (Turno)int.Parse(item["ID_Turno"].ToString());
                curso.Sede = (Sede)int.Parse(item["ID_Sede"].ToString());
                curso.Coordinador = (Coordinador)int.Parse(item["ID_Coordinador"].ToString());
                curso.TipoCurso = (TipoCurso)int.Parse(item["ID_Tipo_Curso"].ToString());
                curso.Version = int.Parse(item["Version"].ToString());
                curso.Precio = decimal.Parse(item["Precio"].ToString());
                
                cursos.Add(curso);
            }

            return cursos;
        }
    }
}
