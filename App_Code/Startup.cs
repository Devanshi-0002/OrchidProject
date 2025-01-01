using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NewZenith.Startup))]
namespace NewZenith
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
