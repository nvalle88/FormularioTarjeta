﻿using System.Web.Mvc;

namespace Card.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
                return RedirectToAction("Error", "Home", new { titleError = "Wrong request", message = "The request has not been sent correctly" });

            System.Web.HttpContext.Current.Session["idCustomerSession"] = id;
            System.Web.HttpContext.Current.Session.Timeout = 2160;
            return RedirectToAction("Index", "CardInfo");
        }


        public ActionResult OrdenProcesadaOk()
        {
            return View();
        }

        public ActionResult ErrorRespuestaServicio(string message)
        {
            ViewBag.MessageError = message;
            return View();
        }

        public ActionResult Error(string titleError, string message)
        {
            ViewBag.TitleError = titleError;
            ViewBag.Message = message;
            return View();
        }
    }
}