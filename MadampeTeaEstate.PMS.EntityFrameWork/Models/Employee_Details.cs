using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Employee_Details
    {
        public int EmployeeId { get; set; }
        public string KnownAs { get; set; }
        public string EmployeeFirstName { get; set; }
        public string EmployeeLastName { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> JoinDate { get; set; }
        public Nullable<bool> IsConfirmed { get; set; }
    }
}
