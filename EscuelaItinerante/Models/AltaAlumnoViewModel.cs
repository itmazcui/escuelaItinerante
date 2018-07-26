using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EscuelaItinerante.Models
{

    public class AltaAlumnoViewModel
    {
        [Required]
        public int Celular { get; set; }

        [Required]
        public int CodigoPostal { get; set; }

        [Required]
        public int EstadoCivil { get; set; }

        [Required]
        public int Hijos { get; set; }

        [Required]
        public int NroDocumento { get; set; }

        [Required]
        public int Telefono { get; set; }

        [Required]
        public int Tellaboral { get; set; }

        [Required]
        public int Tipodoc { get; set; }

        [Required]
        public string Apellido { get; set; }
        
        public string ComoNosConocio { get; set; }

        [Required]
        public string ConocidoEnInstituto { get; set; }

        [Required]
        public string Dirección { get; set; }

        [EmailAddress]
        public string Email { get; set; }

        public string EstudiosRealizados { get; set; }

        public string Expectativas { get; set; }

        public string Experiencias { get; set; }

        public string Localidad { get; set; }

        [Required]
        public string Nombre { get; set; }

        public string Observaciones { get; set; }
    }
}