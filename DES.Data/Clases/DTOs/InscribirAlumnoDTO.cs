using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class InscribirAlumnoDTO
    {
        public int IdAlumno { get; set; }
        public int IdComision { get; set; }
        public string ObservacionesDeLaInscripcion { get; set; }
        public decimal Arancel { get; set; }
    }
}
