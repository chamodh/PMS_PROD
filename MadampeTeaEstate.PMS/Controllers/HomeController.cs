using MadampeTeaEstate.PMS.Filters;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Controllers
{
    public class HomeController : BaseController
    {
        [Authorize]
        [InitializeSimpleMembership]
        public ActionResult Index()
        {

            if (User.IsInRole("EmployeeUser"))
            {
                return RedirectToAction("index", "Employee");
            }

            if (User.IsInRole("AdminUser"))
            {
                return RedirectToAction("index", "Admin");
            }

            return RedirectToAction("Login", "Account");
        }
    }
}
