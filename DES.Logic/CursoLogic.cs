using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Classes;

namespace DES.Logic
{
    public class CursoLogic
    {
        private readonly CursoData _cursosData = new CursoData();

        public List<Curso> GetCursos(int idSede)
        {
            var cursos = _cursosData.GetCursos(idSede);

            foreach (var item in cursos)
                item.Comisiones = GetComisiones(item.IDCurso);

            return cursos;
        }

        private List<Comision> GetComisiones(int idCurso)
        {
            var comisiones = _cursosData.GetComisiones(idCurso);

            foreach (var item in comisiones)
                item.Clases = _cursosData.GetClases(item.IdComision);

            return comisiones;
        }

    }
}
