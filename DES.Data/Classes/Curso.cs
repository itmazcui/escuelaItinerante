using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data.Classes
{
    public enum Turno
    {
        Mañana = 1,
        Tarde,
        Noche
    }

    public enum TipoCurso
    {
        Semanal = 1,
        Mensual = 2
    }

    public enum Sede
    {
        San_Miguel = 1,
        Mercedes = 2,
        Moreno = 3,
        Campana = 4
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
        Garciala_Petrella = 10,
        JoseLuis_Cajal = 11,
        Lilian_CanoGonzalez = 12,
        Luly_Barcia = 13,
        Marcela_Guala = 14,
        Mirta_Priori = 15,
        Monica_Caccione = 16,
        Nancy_Portilla = 17,
        Raquel_Acedo = 18,
        Sabrina_Keller = 19,
        Sandra_Palacio = 20,
    }

    public class Curso
    {
        public int IDCurso { get; set; }
        public string Nombre { get; set; }
        public Turno Turno { get; set; }
        public Sede IdSede { get; set; }
        public Coordinador IDCoordinador { get; set; }
        public TipoCurso IDTipoCurso { get; set; }
        public int Version { get; set; }
        public decimal Precio { get; set; }
    }
}
