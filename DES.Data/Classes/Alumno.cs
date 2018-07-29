using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Classes
{
    public enum EstadoCivil
    {
        Soltero = 1,
        Casado,
        Divorciado,
        Viudo,
        Otro
    }

    public class Alumno
    {
        public DateTime FechaInscripcion { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Tipodoc { get; set; }
        public int NroDocumento { get; set; }
        public string Direccion { get; set; }
        public int CodigoPostal { get; set; }
        public string Localidad { get; set; }
        public string Telefono { get; set; }
        public string Celular { get; set; }
        public string TelLaboral { get; set; }
        public string Email { get; set; }
        public string ComoNosConocio { get; set; }
        public EstadoCivil EstadoCivil { get; set; }
        public int Hijos { get; set; }
        public string EstudiosRealizados { get; set; }
        public string Experiencias { get; set; }
        public string Expectativas { get; set; }
        public string ConocidoEnInstituto { get; set; }
        public string Observaciones { get; set; }
    }
}
