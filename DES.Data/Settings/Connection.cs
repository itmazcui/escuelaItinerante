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
        private SqlConnection Conn = new SqlConnection("Server=win03.tmd.cloud; DataBase=it_matiasazcui_gmail_com_;User Id=administrador;Password=Jugodemanzana1;");

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
