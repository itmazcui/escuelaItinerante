using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Data
{
    public class UsuariosData
    {
        public bool ExisteUsuario(string username, string password)
        {
            var parametros = new Dictionary<string, object>();

            parametros.Add("@username", username);
            parametros.Add("@password", password);

            var da = new DataAccess();
            var usuario = da.ExecuteSP("sp_tusuarios", parametros);

            return usuario.Rows.Count > 0;
        }
    }
}
