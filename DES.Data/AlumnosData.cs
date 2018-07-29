using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Classes;

namespace DES.Data
{
    public class AlumnosData
    {
        public List<Alumno> GetAlumnos()
        {
            var da = new DataAccess();
            var alumnos = new List<Alumno>();

            var result = da.ExecuteSP("sp_talumnos");

            foreach (DataRow item in result.Rows)
            {
                var alumno = new Alumno();
                alumno.Nombre = item["Nombre"].ToString();
                alumno.Apellido = item["Apellido"].ToString();
                alumno.Tipodoc = item["Tipodoc"].ToString();
                alumno.NroDocumento = int.Parse(item["NroDocumento"].ToString());
                alumno.Direccion = item["Direccion"].ToString();
                alumno.CodigoPostal = int.Parse(item["CodigoPostal"].ToString());
                alumno.Localidad = item["Localidad"].ToString();
                alumno.Telefono = item["Telefono"].ToString();
                alumno.Celular = item["Celular"].ToString();
                alumno.TelLaboral = item["TelLaboral"].ToString();
                alumno.Email = item["Email"].ToString();
                alumno.ComoNosConocio = item["ComoNosConocio"].ToString();
                alumno.EstadoCivil = (EstadoCivil)int.Parse(item["EstadoCivil"].ToString());
                alumno.Hijos = int.Parse(item["Hijos"].ToString());
                alumno.EstudiosRealizados = item["EstudiosRealizados"].ToString();
                alumno.Experiencias = item["Experiencias"].ToString();
                alumno.Expectativas = item["Expectativas"].ToString();
                alumno.ConocidoEnInstituto = item["ConocidoEnInstituto"].ToString();
                alumno.Observaciones = item["Observaciones"].ToString();
                alumnos.Add(alumno);
            }

            return alumnos;
        }
    }
}
