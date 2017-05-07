using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MadampeTeaEstate.PMS.Models
{
    public class EmployeeDetailsList : LeaveDashboardModel
    {
        public int EmpId { get; set; }

        public string KnownAs { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string JoinedDate { get; set; }
    }
}