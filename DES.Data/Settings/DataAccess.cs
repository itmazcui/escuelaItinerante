using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data
{
    public class DataAccess
    {
        private static Connection _connection = new Connection();
        private static SqlDataReader _reader;
        private static DataTable _tabla = new DataTable();

        public static DataTable ExecuteSP(string procedureName, Dictionary<string, object> parameters, string databaseName)
        {
            var command = new SqlCommand(procedureName);

            foreach (var item in parameters)
            {
                DbParameter param = new SqlParameter(item.Key, item.Value);
                param.Direction = ParameterDirection.Input;
                command.Parameters.Add(param);
            }

            command.CommandType = CommandType.StoredProcedure;
            command.Connection = _connection.OpenConnection();
            _reader = command.ExecuteReader();
            _tabla.Load(_reader);
            command.Connection = _connection.OpenConnection();

            return _tabla;
        }
    }
}
