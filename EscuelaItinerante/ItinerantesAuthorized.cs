using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EscuelaItinerante
{
    [AttributeUsage(AttributeTargets.Method)]
    public class ItinerantesAuthorized : AuthorizeAttribute
    {
        public ItinerantesAuthorized()
        { }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);
            EstaAutorizado(filterContext);
        }

        void EstaAutorizado(AuthorizationContext context)
        {
            if (context.Result == null)
                return;
            else
                context.Result = new ViewResult() { ViewName = "UsuarioNoAutorizado" };
        }
    }
}