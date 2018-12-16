using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data
{
    public class Connection
    {
        private SqlConnection Conn = new SqlConnection("Server=DESKTOP-UQBFOLU\\SQLEXPRESS;DataBase=EscuelaItinerante;User Id=escuelaitinerante;Password=testeo123;");

        public SqlConnection OpenConnection()
        {
            if (Conn.State == ConnectionState.Closed)
                Conn.Open();

            return Conn;
        }

        public SqlConnection CloseConnection()
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();

            return Conn;
        }

    }
}
