using Card.Entity.DTO;
using Card.Services.Interface;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Card.Web.Controllers
{
    public class CardInfoController : Controller
    {

        private readonly IServiceZoho _serviceZoho;

        public CardInfoController(IServiceZoho serviceZoho)
        {
            _serviceZoho = serviceZoho;
        }
        public async Task<ActionResult> Index()
        {
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> SendCarInfo(SendCardInfo sendCardInfo)
        {
            var idCustomerSession = System.Web.HttpContext.Current.Session["idCustomerSession"] as string;
            if (string.IsNullOrWhiteSpace(idCustomerSession))
                return RedirectToAction("Error", "Home", new { titleError = "Sección expirada", message = "La sección ha espirado" });

            System.Web.HttpContext.Current.Session["idCustomerSession"] = idCustomerSession;
            System.Web.HttpContext.Current.Session.Timeout = 2160;

            sendCardInfo.ExpDate = $"{sendCardInfo.ExpMonth}/{sendCardInfo.ExpYear}";
            sendCardInfo.Id = idCustomerSession;
            var idProcessed = await _serviceZoho.SendCardInfo(sendCardInfo,1);

            return Json(new
            {
                idProcessed,
                id=idCustomerSession,
            },
            JsonRequestBehavior.AllowGet);
        }
    }
}