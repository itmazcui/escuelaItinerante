using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Clases;

namespace DES.Logic
{
    public class ComisionLogic
    {
        private readonly ComisionData _comisionData = new ComisionData();

        //public List<Curso> GetCursos(int idSede = 0)
        //{
        //    var cursos = _cursosData.GetCursos(idSede);

        //    foreach (var item in cursos)
        //        item.Comisiones = GetComisiones(item.IDCurso, idSede);

        //    return cursos;
        //}

        public List<Comision> GetComisiones(int idSede)
        {
            var comisiones = _comisionData.GetComisiones(idSede);

            foreach (var item in comisiones)
                item.Clases = _comisionData.GetClases(item.IdComision);

            return comisiones;
        }

        public List<Comision> GetComisionesDelAlumno(int idAlumno)
        {
            var comisiones = _comisionData.GetCursosDelAlumno(idAlumno);

            //foreach (var item in cursos)
            //    item.Comisiones = GetComisiones(item.IDCurso, idSede);

            return comisiones;
        }
    }
}
