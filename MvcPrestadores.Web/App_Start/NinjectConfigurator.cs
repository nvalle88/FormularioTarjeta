using Card.Services;
using Card.Services.Interface;
using Ninject;
using Ninject.Syntax;
using System.Net.Http;
using System.Web.Http;

namespace Card.Web
{
    public class NinjectConfigurator
    {
        //private static HttpClient _webApiClient; // added
        public void Configure(IKernel container)
        {


            //_webApiClient = new HttpClient { BaseAddress = new Uri("http://localhost:1153") }; // added
            // added 


            // Add all bindings/dependencies
            AddBindings(container);

            // Use the container and our NinjectDependencyResolver as
            // application's resolver
            var resolver = new NinjectDependencyResolver(container);

            GlobalConfiguration.Configuration.DependencyResolver = resolver;
        }

        /// <summary>
        /// Add all bindings/dependencies to the container
        /// </summary>
        private static void AddBindings(IBindingRoot container)
        {
            container.Bind<IServiceZoho>().To<ServiceZoho>();

            //container.Bind<HttpClient>().ToConstant(_webApiClient).InSingletonScope();  // added
            //container.BindFilter<AutorizationFilter>(FilterScope.Controller, 0)
            //    .When((controllerContext, actionDescriptor) =>
            //        actionDescriptor.ActionName == "GetAllPagos"
            //        || actionDescriptor.ActionName == "GetAllOdas"
            //        || actionDescriptor.ActionName == "DetailsPdf"
            //        || actionDescriptor.ActionName == "GetAllDiagnosticos"
            //        || actionDescriptor.ActionName == "DiagnosticoOda"
            //        || actionDescriptor.ActionName == "GetAllBeneficio"
            //        || actionDescriptor.ActionName == "GetAllBeneficioContract"
            //        || actionDescriptor.ActionName == "GetAllBeneficioAmbulatorio"
            //        || actionDescriptor.ControllerDescriptor.ControllerName == "Beneficio"
            //        || actionDescriptor.ActionName == "Convenio"
            //        || actionDescriptor.ActionName == "GetAllLotes"
            //        || actionDescriptor.ActionName == "GenerateLote"
            //        || actionDescriptor.ControllerDescriptor.ControllerName == "Account"
            //        || actionDescriptor.ControllerDescriptor.ControllerName == "Lote"
            //        || actionDescriptor.ControllerDescriptor.ControllerName == "ValidarBeneficio"
            //        || actionDescriptor.ControllerDescriptor.ControllerName == "Retenciones");
        }
    }
}