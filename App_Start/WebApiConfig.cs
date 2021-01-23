using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using VirtualWallet.Controllers;

namespace VirtualWallet
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuración y servicios de API web

            // Rutas de API web
            config.MapHttpAttributeRoutes();
            config.EnableCors();
            config.Formatters.XmlFormatter.SupportedMediaTypes.Add(new System.Net.Http.Headers.MediaTypeHeaderValue("multipart/form-data"));
            config.MessageHandlers.Add(new TokenValidationHandler());

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
                /*name: "DefaultApi",
                routeTemplate: "api/{controller}/{action}/{name}",
                defaults: new { name = RouteParameter.Optional }*/
            );
        }
    }
}
