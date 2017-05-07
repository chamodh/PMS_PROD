using MadampeTeaEstate.PMS.DLL;
using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MadampeTeaEstate.PMS.BLL
{
    public class EmployeeManager
    {

        private EmployeeRepository EmployeeRepository;

        public EmployeeManager()
        {

            EmployeeRepository = new EmployeeRepository();
        }

        public void SaveEmployeeDetails(
            int empId,
            string firstName, 
            string lastName, 
            string knownAs, 
            DateTime joinedDate)
        {
            EmployeeRepository.SaveEmployeeDetails(
                empId,
                firstName,
                lastName,
                knownAs,
                joinedDate);
        }

        public List<Employee_Details> GetEmployeeDetails()
        {
            return EmployeeRepository.GetAll().ToList();
        }
    }
}
