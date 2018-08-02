using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class NuevoPagoViewModel
    {
        [Required]
        public int NroDocumento { get; set; }
        
        [Required]
        public decimal Precio { get; set; }

        public List<DateTime> ClasesCubiertasPorElPago { get; set; }

        public DateTime MesActual { get; set; }
        

    }
}