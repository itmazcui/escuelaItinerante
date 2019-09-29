using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Clases
{
    public enum Turno
    {
        Mañana = 1,
        Tarde,
        Noche
    }

    public enum Modalidad
    {
        Semanal = 1,
        Mensual = 2
    }

    public enum Sede
    {
        San_Miguel = 1,
        Mercedes = 2,
        Moreno = 3,
        Campana = 4,
        Merlo = 5
    }

    public enum Coordinador
    {
        Adriana_Dorrego = 1,
        Alba_ = 2,
        Alcira_Solaligue = 3,
        Alicia_Eidelman = 4,
        Ana_Garay = 5,
        Carlos_Margiotta = 6,
        Claudia_Izquierdo = 7,
        Darian_Spalla = 8,
        Eduardo_Laurenzi = 9,
        Graciela_Petrella = 10,
        JoseLuis_Cajal = 11,
        Lilian_Cano_Gonzalez = 12,
        Luly_Barcia = 13,
        Marcela_Guala = 14,
        Mirta_Priori = 15,
        Monica_Caccione = 16,
        Nancy_Portilla = 17,
        Raquel_Acedo = 18,
        Sabrina_Keller = 19,
        Sandra_Palacio = 20,
        Belen_Martinez = 21,
        Hernan_Barrios = 22,
        Liliana_Viater = 23,
        Natalia_Erroz = 24,
        Soledad_Murua = 25

    }

    public enum Curso
    {
        Acompañante_Terapeutico = 1,
        Diplomatura = 2,
        Operador_Socio_Comunitario = 3,
        P_N_L = 4,
        Psicodrama = 5,
        Psicologia_Social = 6,
        Coaching = 7
    }

    public enum EstadoCursada
    {
        Cursando = 1,
        Abandonado = 2,
        Egresado = 3
    }

    public class Comision
    {
        public int IdComision { get; set; }
        public Modalidad Modalidad { get; set; }
        public Sede Sede { get; set; }
        public Coordinador Coordinador { get; set; }
        public Turno Turno { get; set; }
        public List<DateTime> Clases { get; set; }
        public int Arancel { get; set; }
        public Curso Curso { get; internal set; }
        
        public static Comision MapComisionFromDataRow(DataRow dataRow)
        {
            var comision = new Comision();
            comision.IdComision = int.Parse(dataRow["id_comision"].ToString());
            comision.Curso = (Curso)int.Parse(dataRow["id_curso"].ToString());
            comision.Turno = (Turno)int.Parse(dataRow["ID_Turno"].ToString());
            comision.Sede = (Sede)int.Parse(dataRow["ID_Sede"].ToString());
            comision.Coordinador = (Coordinador)int.Parse(dataRow["ID_Coordinador"].ToString());
            comision.Modalidad = (Modalidad)int.Parse(dataRow["id_modalidad"].ToString());
            comision.Arancel = int.Parse(dataRow["Precio"].ToString());
            return comision;
        }
    }
}
