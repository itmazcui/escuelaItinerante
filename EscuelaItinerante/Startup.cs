using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EscuelaItinerante.Startup))]
namespace EscuelaItinerante
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
