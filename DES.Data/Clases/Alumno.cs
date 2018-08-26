using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
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
        public int IdAlumno { get; set; }
        public DateTime FechaIngreso { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Tipodoc { get; set; }
        public int NroDocumento { get; set; }
        public string Direccion { get; set; }
        public int CodigoPostal { get; set; }
        public string Localidad { get; set; }
        public int Telefono { get; set; }
        public int Celular { get; set; }
        public string Email { get; set; }
        public string ComoNosConocio { get; set; }
        public EstadoCivil EstadoCivil { get; set; }
        public int Hijos { get; set; }
        public string EstudiosRealizados { get; set; }
        public string ConocidoEnInstituto { get; set; }
        public string Observaciones { get; set; }
        public List<ComisionAlumno> ComisionesInscripto { get; set; }

    }
}


