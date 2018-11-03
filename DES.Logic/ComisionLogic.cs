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

        public List<Comision> GetComisiones(int idSede = 0)
        {
            var comisiones = _comisionData.GetComisiones(idSede);

            foreach (var comision in comisiones)
                comision.Clases = _comisionData.GetClases(comision.IdComision);

            return comisiones;
        }

        public List<ComisionDelAlumno> GetComisionesDelAlumno(int idAlumno)
        {
            var comisionesAlumno = _comisionData.GetComisionesDelAlumno(idAlumno);

            foreach (var comision in comisionesAlumno) { 
                comision.Clases = _comisionData.GetClasesAlumno(comision.IdComision, idAlumno);
            }

            return comisionesAlumno;
        }
    }
}
