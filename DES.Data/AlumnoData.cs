using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DES.Data.Clases;

namespace DES.Data
{
    public class AlumnoData
    {
        public List<Alumno> GetAlumnos()
        {
            var da = new DataAccess();
            var alumnos = new List<Alumno>();

            var result = da.ExecuteSP("sp_talumnos");

            foreach (DataRow item in result.Rows)
            {
                var alumno = new Alumno();
                alumno.IdAlumno = int.Parse(item["id_alumno"].ToString());
                alumno.Nombre = item["Nombre"].ToString();
                alumno.Apellido = item["Apellido"].ToString();
                alumno.Tipodoc = item["Tipodoc"].ToString();
                alumno.NroDocumento = int.Parse(item["NroDocumento"].ToString());
                alumno.Direccion = item["Direccion"].ToString();
                alumno.CodigoPostal = int.Parse(item["CodigoPostal"].ToString());
                alumno.Localidad = item["Localidad"].ToString();
                alumno.Telefono = int.Parse(item["Telefono"].ToString());
                alumno.Celular =  int.Parse(item["Celular"].ToString());
                alumno.Email = item["Email"].ToString();
                alumno.ComoNosConocio = item["ComoNosConocio"].ToString();
                alumno.EstadoCivil = (EstadoCivil)int.Parse(item["EstadoCivil"].ToString());
                alumno.Hijos = int.Parse(item["Hijos"].ToString());
                alumno.EstudiosRealizados = item["EstudiosRealizados"].ToString();
                alumno.ConocidoEnInstituto = item["ConocidoEnInstituto"].ToString();
                alumno.Observaciones = item["Observaciones"].ToString();
                alumno.FechaIngreso = Convert.ToDateTime(item["FechaIngreso"].ToString());
                alumnos.Add(alumno);
            }

            return alumnos;
        }
        public List<AlumnoComision> GetAlumnosByComision(int idComision)
        {
            var da = new DataAccess();
            var alumnos = new List<AlumnoComision>();

            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_comision", idComision);

            var result = da.ExecuteSP("sp_talumno_comision", parametros);

            foreach (DataRow item in result.Rows)
            {
                var alumno = new AlumnoComision();
                alumno.IdAlumno = int.Parse(item["id_alumno"].ToString());
                alumno.Nombre = item["Nombre"].ToString();
                alumno.Apellido = item["Apellido"].ToString();
                alumno.Tipodoc = item["Tipodoc"].ToString();
                alumno.NroDocumento = int.Parse(item["NroDocumento"].ToString());
                alumno.Direccion = item["Direccion"].ToString();
                alumno.CodigoPostal = int.Parse(item["CodigoPostal"].ToString());
                alumno.Localidad = item["Localidad"].ToString();
                alumno.Telefono = int.Parse(item["Telefono"].ToString());
                alumno.Celular = int.Parse(item["Celular"].ToString());
                alumno.Email = item["Email"].ToString();
                alumno.ComoNosConocio = item["ComoNosConocio"].ToString();
                alumno.EstadoCivil = (EstadoCivil)int.Parse(item["EstadoCivil"].ToString());
                alumno.Hijos = int.Parse(item["Hijos"].ToString());
                alumno.EstudiosRealizados = item["EstudiosRealizados"].ToString();
                alumno.ConocidoEnInstituto = item["ConocidoEnInstituto"].ToString();
                alumno.Observaciones = item["Observaciones"].ToString();
                alumno.FechaIngreso = Convert.ToDateTime(item["FechaIngreso"].ToString());
                alumno.EstadoCursada = (EstadoCursada)int.Parse(item["id_estado_cursada"].ToString());

                if (item["FechaClasePaga"] != DBNull.Value)
                { 
                    alumno.EstaAlDia = Convert.ToDateTime(item["FechaClasePaga"].ToString()) >= DateTime.Now;
                }

                alumnos.Add(alumno);
            }

            return alumnos;
        }

        public bool CambiarEstadoCursada(int idAlumno, int idComision, EstadoCursada estadoCursada)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", idAlumno);
            parametros.Add("@id_comision", idComision);
            parametros.Add("@id_estado_cursada", estadoCursada);

            var da = new DataAccess();
            var result = da.ExecuteSPBool("sp_u_talumno_comision_inscripto", parametros);

            return result;
        }

        public bool SetPagoClase(PagoDTO pagoDTO)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", pagoDTO.IdAlumno);
            parametros.Add("@id_comision", pagoDTO.IdComision);
            parametros.Add("@id_clase", pagoDTO.IdClase);
            parametros.Add("@MontoAbonado", pagoDTO.MontoAbonado);

            var da = new DataAccess();
            var result = da.ExecuteSPBool("sp_i_talumno_pago", parametros);

            return result;
        }


        public void SetPagoParcial(PagoDTO pagoDTO)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", pagoDTO.IdAlumno);
            parametros.Add("@id_comision", pagoDTO.IdComision);
            parametros.Add("@id_clase", pagoDTO.IdClase);
            parametros.Add("@MontoAbonado", pagoDTO.MontoAbonado);

            var da = new DataAccess();
            da.ExecuteSP("sp_i_talumno_pago_parcial", parametros);

        }

        public bool InscribirAlumnoAComision(InscripcionAlumnoDTO inscribirAlumnoDTO)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", inscribirAlumnoDTO.IdAlumno);
            parametros.Add("@id_comision", inscribirAlumnoDTO.IdComision);
            parametros.Add("@id_estado_cursada", (int)EstadoCursada.Cursando);
            parametros.Add("@PrecioAAbonar", inscribirAlumnoDTO.Arancel);
            parametros.Add("@ObservacionesDeLaInscripcion", inscribirAlumnoDTO.ObservacionesDeLaInscripcion == null ? string.Empty : inscribirAlumnoDTO.ObservacionesDeLaInscripcion);

            var da = new DataAccess();
            var result = da.ExecuteSPBool("sp_i_talumno_comision_inscripto", parametros);

            return result;
        }

        public Alumno GetAlumnoByID(int idAlumno)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_alumno", idAlumno);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumnos", parametros);

            if (result.Rows.Count > 0)
            {
                DataRow item = result.Rows[0];

                var alumno = new Alumno();
                alumno.IdAlumno = int.Parse(item["id_alumno"].ToString());
                alumno.Nombre = item["Nombre"].ToString();
                alumno.Apellido = item["Apellido"].ToString();
                alumno.Tipodoc = item["Tipodoc"].ToString();
                alumno.NroDocumento = int.Parse(item["NroDocumento"].ToString());
                alumno.Direccion = item["Direccion"].ToString();
                alumno.CodigoPostal = int.Parse(item["CodigoPostal"].ToString());
                alumno.Localidad = item["Localidad"].ToString();
                alumno.Telefono = int.Parse(item["Telefono"].ToString());
                alumno.Celular = int.Parse(item["Celular"].ToString());
                alumno.Email = item["Email"].ToString();
                alumno.ComoNosConocio = item["ComoNosConocio"].ToString();
                alumno.EstadoCivil = (EstadoCivil)int.Parse(item["EstadoCivil"].ToString());
                alumno.Hijos = int.Parse(item["Hijos"].ToString());
                alumno.EstudiosRealizados = item["EstudiosRealizados"].ToString();
                alumno.ConocidoEnInstituto = item["ConocidoEnInstituto"].ToString();
                alumno.Observaciones = item["Observaciones"].ToString();
                alumno.FechaIngreso = Convert.ToDateTime(item["FechaIngreso"].ToString());

                return alumno;
            }

            return null;
        }

        public Alumno GetAlumnoByNroDocumento(int nroDocumento)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@NroDocumento", nroDocumento);

            var da = new DataAccess();
            var result = da.ExecuteSP("sp_talumnos", parametros);

            if (result.Rows.Count > 0)
            {
                DataRow item = result.Rows[0];

                var alumno = new Alumno();
                alumno.IdAlumno = int.Parse(item["id_alumno"].ToString());
                alumno.Nombre = item["Nombre"].ToString();
                alumno.Apellido = item["Apellido"].ToString();
                alumno.Tipodoc = item["Tipodoc"].ToString();
                alumno.NroDocumento = int.Parse(item["NroDocumento"].ToString());
                alumno.Direccion = item["Direccion"].ToString();
                alumno.CodigoPostal = int.Parse(item["CodigoPostal"].ToString());
                alumno.Localidad = item["Localidad"].ToString();
                alumno.Telefono = int.Parse(item["Telefono"].ToString());
                alumno.Celular = int.Parse(item["Celular"].ToString());
                alumno.Email = item["Email"].ToString();
                alumno.ComoNosConocio = item["ComoNosConocio"].ToString();
                alumno.EstadoCivil = (EstadoCivil)int.Parse(item["EstadoCivil"].ToString());
                alumno.Hijos = int.Parse(item["Hijos"].ToString());
                alumno.EstudiosRealizados = item["EstudiosRealizados"].ToString();
                alumno.ConocidoEnInstituto = item["ConocidoEnInstituto"].ToString();
                alumno.Observaciones = item["Observaciones"].ToString();
                alumno.FechaIngreso = Convert.ToDateTime(item["FechaIngreso"].ToString());

                return alumno;
            }
            return null;
        }

        public void NuevoAlumno(Alumno alumno)
        {
            var parametros = new Dictionary<string, object>();

            parametros.Add("@Nombre", alumno.Nombre);
            parametros.Add("@Apellido", alumno.Apellido);
            parametros.Add("@Tipodoc", alumno.Tipodoc);
            parametros.Add("@NroDocumento", alumno.NroDocumento);
            parametros.Add("@Direccion", alumno.Direccion);
            parametros.Add("@CodigoPostal", alumno.CodigoPostal);
            parametros.Add("@Localidad", alumno.Localidad);
            parametros.Add("@Telefono", alumno.Telefono);
            parametros.Add("@Celular", alumno.Celular);
            parametros.Add("@Email", alumno.Email);
            parametros.Add("@ComoNosConocio", alumno.ComoNosConocio);
            parametros.Add("@EstadoCivil", alumno.EstadoCivil);
            parametros.Add("@Hijos", alumno.Hijos);
            parametros.Add("@EstudiosRealizados", alumno.EstudiosRealizados);
            parametros.Add("@ConocidoEnInstituto", alumno.ConocidoEnInstituto == null ? string.Empty : alumno.ConocidoEnInstituto);
            parametros.Add("@Observaciones", alumno.Observaciones == null ? string.Empty : alumno.Observaciones);
            
            var da = new DataAccess();
            da.ExecuteSP("sp_i_talumnos", parametros);

        }
    }
}
