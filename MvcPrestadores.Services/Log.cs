using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace MvcPrestadores.Services
{
    /// <summary>
    /// Tipos de errores
    /// </summary>
    public enum TypeErrorLog2
    {
        Trace,
        Warning,
        Error,
        Debug
    }
    public class Log
    {
        private static readonly ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
    }
}
