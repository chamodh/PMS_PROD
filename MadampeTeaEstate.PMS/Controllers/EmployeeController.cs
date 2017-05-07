
using MadampeTeaEstate.PMS.Models;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Controllers
{
    /// <summary>
    /// All Employee Funtions Are Common To Admin.
    /// So All employee Funtions Are In Base BaseController.
    /// If Any Funtions Specific Only To Employee Goes In Here.
    /// </summary>
    public class EmployeeController : BaseController
    {
        public ActionResult Index(LeaveDashboardModel leaveDashboardModel)
        {
            return View(leaveDashboardModel);
        }
    }
}
