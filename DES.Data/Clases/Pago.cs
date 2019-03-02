using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public class Pago
    {
        public int MontoAbonado { get; set; }
        public DateTime FechaPago { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Telefono { get; set; }
        public Sede Sede  { get; set; }
        public string TipoPago { get; set; }
    }
}
