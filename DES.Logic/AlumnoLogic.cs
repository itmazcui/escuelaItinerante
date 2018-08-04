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
        private readonly CursoData _cursoData = new CursoData();

        public List<Curso> GetCursos()
        {
            return _cursoData.GetCursos();
        }
    }
}
