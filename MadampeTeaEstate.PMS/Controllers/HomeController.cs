using MadampeTeaEstate.PMS.Filters;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Controllers
{
    public class HomeController : BaseController
    {
        /// <summary>
        /// This is the login page. From here user is redirected accordin to the user`s role. 
        /// </summary>
        /// <returns></returns>
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
