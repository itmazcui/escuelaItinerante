using DES.Data.Clases;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{
    public class CursosTodosViewModel
    {
        public List<Comision> Comisiones { get; set; }
    }
}