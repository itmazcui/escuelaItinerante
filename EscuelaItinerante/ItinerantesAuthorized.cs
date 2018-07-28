using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace EscuelaItinerante
{
    [AttributeUsage(AttributeTargets.Method)]
    public class ItinerantesAuthorized : AuthorizeAttribute
    {
        public ItinerantesAuthorized()
        { }

        //    public override void OnAuthorization(AuthorizationContext filterContext)
        //    {
        //        base.OnAuthorization(filterContext);
        //        EstaAutorizado(filterContext);
        //    }

        //    void EstaAutorizado(AuthorizationContext context)
        //    {
        //        if (context.Result == null)
        //            return;
        //        else
        //            context.Result = new ViewResult() { ViewName = "UsuarioNoAutorizado" };
        //    }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            FormsAuthentication.SetAuthCookie("asd", false);

            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                // The user is not authorized => no need to go any further
                return false;
            }

            // We have an authenticated user, let's get his username
            string authenticatedUser = httpContext.User.Identity.Name;

            

            return true;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Items.Contains("redirectToCompleteProfile"))
            {
                filterContext.Result = new ViewResult() { ViewName = "UsuarioNoAutorizado" };
            }
            else
            {
                base.HandleUnauthorizedRequest(filterContext);
            }
        }
    }
}