using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data;
using DES.Data.Clases;

namespace DES.Logic
{
    public class PagoLogic
    {
        private readonly PagoData _alumnosData = new PagoData();

        public IList<Pago> GetPagos(Sede sede, DateTime? fechaDesde, DateTime? fechaHasta)
        {
            var fechaDesdeSql = fechaDesde ?? (DateTime)SqlDateTime.MinValue;
            var fechaHastaSql = fechaHasta ?? (DateTime)SqlDateTime.MaxValue;

            return _alumnosData.GetPagos(sede, fechaDesdeSql, fechaHastaSql);
        }
    }
}