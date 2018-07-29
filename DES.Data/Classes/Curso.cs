using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Classes
{
    public enum Turno
    {
        Mañana = 1,
        Tarde,
        Noche
    }

    public class Curso
    {
        public int tcursosID { get; set; }
        public int ID_Curso { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int ID_Coordinador { get; set; }
        public Turno Turno { get; set; }
    }
}
