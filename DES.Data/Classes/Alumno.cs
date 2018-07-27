using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Classes
{
    public class Alumno
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Tipodoc { get; set; }
        public int NroDocumento { get; set; }
        public string Dirección { get; set; }
        public int CodigoPostal { get; set; }
        public string Localidad { get; set; }
        public int Telefono { get; set; }
        public int Celular { get; set; }
        public int TelLaboral { get; set; }
        public string Email { get; set; }
        public string ComoNosConocio { get; set; }
        public int EstadoCivil { get; set; }
        public int Hijos { get; set; }
        public string EstudiosRealizados { get; set; }
        public string Experiencias { get; set; }
        public string Expectativas { get; set; }
        public string ConocidoEnInstituto { get; set; }
        public string Observaciones { get; set; }
    }
}
