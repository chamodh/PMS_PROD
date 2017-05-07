using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MadampeTeaEstate.PMS.DLL
{
    public class EmployeeRepository : GenericRepository<Production_Management_SystemContext, Employee_Details>
    {

        public void SaveEmployeeDetails(
            int empId, 
            string firstName, 
            string lastName, 
            string knownAs, 
            DateTime joinedDate)
        {
            base.Add(new Employee_Details
                {
                    EmployeeId = empId,
                    EmployeeFirstName = firstName,
                    EmployeeLastName =  lastName,
                    KnownAs = knownAs,
                    JoinDate = joinedDate
                });
        }
    }
}
