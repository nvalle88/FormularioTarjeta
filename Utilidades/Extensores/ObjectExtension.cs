using Newtonsoft.Json;
using System.Collections.Specialized;
using System.Linq;
using System.Web;

namespace Utilidades.Extensores
{
    public static class ObjectExtension
    {
        public static object Serializar(this object str)
        {
            return str == null ? string.Empty : JsonConvert.SerializeObject(str);
        }

    }
}