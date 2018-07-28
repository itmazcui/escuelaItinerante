using DES.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DES.Logic
{
    public class UsuarioLogic
    {
        private UsuariosData _usuariosData = new UsuariosData();

        public bool ExisteUsuario(string Username, string Password)
        {
            return _usuariosData.ExisteUsuario(Username, Password);
        }
    }
}
