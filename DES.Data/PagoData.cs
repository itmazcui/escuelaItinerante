using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Clases;

namespace DES.Data
{
    public class PagoData
    {
        public IList<Pago> GetPagos(Sede sede, DateTime fechaDesde, DateTime fechaHasta)
        {
            var da = new DataAccess();
            var pagos = new List<Pago>();
            var parametros = new Dictionary<string, object>
            {
                { "@id_sede", (int)sede },
                { "@fecha_desde", fechaDesde },
                { "@fecha_hasta", fechaHasta }
            };
            var result = da.ExecuteSP("sp_talumno_pagos_por_fechas", parametros);

            foreach (DataRow item in result.Rows)
            {
                var pago = new Pago();
                pago.Nombre = item["Nombre"].ToString();
                pago.Apellido = item["Apellido"].ToString();
                pago.Sede = (Sede)int.Parse(item["id_sede"].ToString());
                pago.TipoPago = item["tipopago"].ToString();
                pago.Telefono = int.Parse(item["Telefono"].ToString());
                pago.MontoAbonado = int.Parse(item["MontoAbonado"].ToString());
                pago.FechaPago = Convert.ToDateTime(item["FechaPago"].ToString());

                pagos.Add(pago);
            }

            return pagos;
        }

    }
}
