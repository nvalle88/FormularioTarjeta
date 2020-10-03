using System.Web.Mvc;

namespace Card.Web
{
    public class SessionExpireAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //HttpContext ctx = HttpContext.Current;
            //// check  sessions here
            //if (HttpContext.Current.Session["username"] == null)
            //{
            //    filterContext.Result = new RedirectResult("~/Account/Login");
            //    return;
            //}
            //base.OnActionExecuting(filterContext);
        }
    }
}