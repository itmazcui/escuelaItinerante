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
        private Connection _connection = new Connection();
        private SqlDataReader _reader;
        private DataTable _tabla = new DataTable();

        public DataTable ExecuteSP(string procedureName, Dictionary<string, object> parameters = null)
        {
            var command = new SqlCommand(procedureName);

            if (parameters != null)
                foreach (var item in parameters)
                {
                    DbParameter param = new SqlParameter(item.Key, item.Value);
                    param.Direction = ParameterDirection.Input;
                    command.Parameters.Add(param);
                }

            command.CommandType = CommandType.StoredProcedure;
            command.Connection = _connection.OpenConnection();
            _reader = command.ExecuteReader();
            //Esto devuelve un datatable. Esto significa: DataTable firstTable = dataSet.Tables[0];
            _tabla.Load(_reader);
            command.Connection = _connection.OpenConnection();

            return _tabla;
        }
    }
}
