using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.Models
{
    public class AddEmployeeModel : EmployeeDetailsList  
    {

        public List<EmployeeDetailsList> EmployeeDetailsList { get; set; }

        public int EmployeeId { get; set; }

        public string KnownAs { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime JoinedDate { get; set; }
    }
}
