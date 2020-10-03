using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcPrestadores.Services.Modelos
{
    public class ConfiguracionAutorizacion
    {
        public string serviciosAutorizacionContrasena { get; set; }
        public string serviciosRutaAutenticacion { get; set; }
        public string serviciosAutorizacionUsuario { get; set; }
        public string serviciosAutorizacionIdCliente { get; set; }
        public string serviciosAutorizacionTipoConcesion { get; set; }
    }
}
