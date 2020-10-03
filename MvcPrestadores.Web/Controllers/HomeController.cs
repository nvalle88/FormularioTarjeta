using System.Web.Mvc;

namespace Card.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
                return RedirectToAction("Error", "Home", new { titleError = "Petición incorrecta", message = "La petición no ha sido enviada correctamente" });

            System.Web.HttpContext.Current.Session["idCustomerSession"] = id;
            System.Web.HttpContext.Current.Session.Timeout = 2160;
            return RedirectToAction("Index", "CardInfo");
        }

        public ActionResult Error(string titleError, string message)
        {
            ViewBag.TitleError = titleError;
            ViewBag.Message = message;
            return View();
        }
    }
}