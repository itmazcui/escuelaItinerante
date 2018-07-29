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

        [Required]
        public List<DateTime> ClasesCubiertasPorElPago { get; set; }

        //[Required]
        //public

    }
}