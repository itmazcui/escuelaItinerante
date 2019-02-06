using DES.Data.Clases;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;

namespace EscuelaItinerante.Models
{

    public class NuevoAlumnoViewModel
    {
        public NuevoAlumnoViewModel() {
            TipoDocumentos = new List<SelectListItem>
                {
                    new SelectListItem { Selected = true, Text = "DNI", Value = "DNI"},
                    new SelectListItem { Selected = false, Text = "CI", Value = "CI"},
                    new SelectListItem { Selected = false, Text = "LE", Value = "LE"},
                    new SelectListItem { Selected = false, Text = "LC", Value = "LC"}
                };

            EstadosCiviles = (Enum.GetValues(typeof(EstadoCivil))).Cast<EstadoCivil>().Select(x => new SelectListItem { Text = x.ToString(), Value = ((int)x).ToString() }).ToList();


        }

        [Required]
        public string Nombre {get;set;}

        [Required]
        public string Apellido {get;set;}

        [Required(ErrorMessage = "El campo Tipo Documento es obligatorio.")]
        public string Tipodoc { get; set; }

        public List<SelectListItem> TipoDocumentos {get;set;}

        [Range(1000000, 99999999, ErrorMessage = "El documento ingresado no es correcto")]
        public int NroDocumento {get;set;}

        public string Direccion {get;set;}
        
        public int CodigoPostal {get;set;}

        //[Required]
        public string Localidad {get;set;}

        public int Telefono {get;set;}

        public int Celular {get;set;}

        [Required]
        [EmailAddress]
        public string Email {get;set;}

        //[Required(ErrorMessage = "El campo Como nos conocoió es obligatorio.")]
        public string ComoNosConocio {get;set;}

        //[Required]
        public EstadoCivil EstadoCivil { get;set;}

        public List<SelectListItem> EstadosCiviles { get; set; }

        public int Hijos {get;set;}

        //[Required(ErrorMessage = "El campo Estudios Realizados es obligatorio.")]
        public string EstudiosRealizados {get;set;}
        
        public string ConocidoEnInstituto {get;set;}

        public string Observaciones {get;set;}        
    }
}