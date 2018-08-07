using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Clases;

namespace DES.Logic
{
    public class CursoLogic
    {
        private readonly CursoData _cursosData = new CursoData();

        public List<Curso> GetCursos(int idSede = 0)
        {
            var cursos = _cursosData.GetCursos(idSede);

            foreach (var item in cursos)
                item.Comisiones = GetComisiones(item.IDCurso, idSede);

            return cursos;
        }

        public List<Comision> GetComisiones(int idCurso, int idSede)
        {
            var comisiones = _cursosData.GetComisiones(idCurso, idSede);

            foreach (var item in comisiones)
                item.Clases = _cursosData.GetClases(item.IdComision);

            return comisiones;
        }

    }
}
