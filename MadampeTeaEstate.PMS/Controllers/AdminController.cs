using MadampeTeaEstate.PMS.BLL;
using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using MadampeTeaEstate.PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Controllers
{
    public class AdminController : BaseController
    {

        public ActionResult Index(LeaveDashboardModel leaveDashboardModel)
        {
            return View(leaveDashboardModel);
        }

        public ActionResult AddEmployee(AddEmployeeModel addEmployeeModel)
        {
            GetEmployeeDetails(addEmployeeModel);
            return View(addEmployeeModel);
        }

        private void GetEmployeeDetails(AddEmployeeModel addEmployeeModel)
        {
            List<Employee_Details> employeeDetailsList = EmployeeManager.GetEmployeeDetails();

            addEmployeeModel.EmployeeDetailsList = employeeDetailsList.Select(i => new EmployeeDetailsList
            {
                EmpId = i.EmployeeId,
                KnownAs = i.KnownAs,
                FirstName = i.EmployeeFirstName,
                LastName = i.EmployeeLastName,
                JoinedDate = i.JoinDate.ToString()

            }).OrderByDescending(i =>i.FirstName).ToList();
        }

        public ActionResult SaveEmployeeDetails(AddEmployeeModel addEmployeeModel)
        {
            EmployeeManager.SaveEmployeeDetails(
                addEmployeeModel.EmployeeId,
                addEmployeeModel.FirstName,
                addEmployeeModel.LastName,
                addEmployeeModel.KnownAs,
                addEmployeeModel.JoinedDate
                );

            return RedirectToAction("AddEmployee", new LeaveDashboardModel
            {
                IsRedirectedAfterSave = true,
                OpperationMessage = "The changes were successfully saved."
            });
        }

        public ActionResult GenerateReport(GenerateReportModel generateReportModel)
        {
            SearchCropDetails(generateReportModel);
            return View(generateReportModel);
        }

        public JsonResult SaveToExcel(
            int? cropId,
            string searchFromDate,
            string searchToDate)

        {
            List<Crop_Details> cropDetailsData = CropDetailsManager.SearchCropData(
               cropId.GetValueOrDefault(),
               DateTime.Parse(searchFromDate),
               DateTime.Parse(searchToDate));

            ReportingManager.GenerateReport(cropDetailsData);

            return Json("Report Generated!");
        }

        private List<CropDetailsList> SearchCropDetails(GenerateReportModel generateReportModel)
        {
            if (generateReportModel.CropNumber == 0 &&
               string.IsNullOrEmpty(generateReportModel.SearchFromDate)  &&
               string.IsNullOrEmpty(generateReportModel.SearchToDate))
            {
                return generateReportModel.CropDetailsList  = new List<CropDetailsList>();
            }

            DateTime searchFromDate = DateTime.Parse(generateReportModel.SearchFromDate);
            DateTime searchToDate = DateTime.Parse(generateReportModel.SearchToDate);

            List<Crop_Details> cropDetailsData = CropDetailsManager.SearchCropData(
                generateReportModel.CropNumber,
                searchFromDate,
                searchToDate);

            return generateReportModel.CropDetailsList = cropDetailsData.Select(i => new CropDetailsList()
            {
                CropId = i.CropId,
                EstateLeafWeight = i.EstateLeafWeight,
                BoughtLeafWeight = i.BoughtLeafWeight,
                SupplierName = i.Supplier_Details.SupplierName,
                ProductionWeight = i.ProducedWeight,
                ProductionStatus = i.InProduction,
                requiredTroughMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 2500),
                requiredRollerMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 140),
                requiredRollBreakerMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 175),
                requiredDryerMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 300),
                requiredSifterMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 355),
                requiredColorSorterMachineCount = i.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 200),
                Withering = i.Employee_Shedule.Where(x => x.ProcessId == 1).Select(x => x.EmployeeCount).FirstOrDefault(),
                Rolling = i.Employee_Shedule.Where(x => x.ProcessId == 2).Select(x => x.EmployeeCount).FirstOrDefault(),
                Drying = i.Employee_Shedule.Where(x => x.ProcessId == 5).Select(x => x.EmployeeCount).FirstOrDefault(),
                Sifter = i.Employee_Shedule.Where(x => x.ProcessId == 6).Select(x => x.EmployeeCount).FirstOrDefault(),
                ColorSorter = i.Employee_Shedule.Where(x => x.ProcessId == 7).Select(x => x.EmployeeCount).FirstOrDefault(),
                RollBrakes = i.Employee_Shedule.Where(x => x.ProcessId == 3).Select(x => x.EmployeeCount).FirstOrDefault(),
                Packing = i.Employee_Shedule.Where(x => x.ProcessId == 8).Select(x => x.EmployeeCount).FirstOrDefault(),
                Fermentation = i.Employee_Shedule.Where(x => x.ProcessId == 4).Select(x => x.EmployeeCount).FirstOrDefault(),
                Transportation = i.Employee_Shedule.Where(x => x.ProcessId == 9).Select(x => x.EmployeeCount).FirstOrDefault(),
                Spreading = i.Employee_Shedule.Where(x => x.ProcessId == 10).Select(x => x.EmployeeCount).FirstOrDefault()
            }).
            OrderBy(i =>i.EnteredDate).ToList();
        }
    }
}
