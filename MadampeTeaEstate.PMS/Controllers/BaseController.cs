using MadampeTeaEstate.PMS.BLL;
using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using MadampeTeaEstate.PMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Controllers
{
    public class BaseController : Controller
    {

        protected CropDetailsManager CropDetailsManager;
        protected ReportingManager ReportingManager;
        protected EmployeeManager EmployeeManager;

        public BaseController()
        {
            CropDetailsManager = new CropDetailsManager();
            ReportingManager = new ReportingManager();
            EmployeeManager = new EmployeeManager();
        }

        public JsonResult SetCropDetails(
          string estateLeafWeight,
          string boughtLeafWeight)
        {
            double noOfLeaves = 0;

            if (string.IsNullOrEmpty(estateLeafWeight) || string.IsNullOrEmpty(boughtLeafWeight))
            {
                return Json(noOfLeaves);
            }

            double estateLeafWeightconverted = double.Parse(estateLeafWeight);
            double boughtLeafWeightConverted = double.Parse(boughtLeafWeight);

            double totalGreenLeafWeight = Math.Round((estateLeafWeightconverted + boughtLeafWeightConverted),3);

            double totalWeightAfterWithering = (totalGreenLeafWeight * 45) / 100;

            double totalWeightAfterFermentation = (totalWeightAfterWithering * 23) / 100;

            double totalProdutionWeight = Math.Round((totalWeightAfterWithering + totalWeightAfterFermentation),3);

            double totoalWestageWeight = Math.Round((totalGreenLeafWeight - totalProdutionWeight),3);

            var result = new
            {
                totalGreenLeafWeight,
                totalProdutionWeight,
                totoalWestageWeight
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddCropDetails(CropDetailsModel cropDetailsModel)
        {
            PopulateSupplierNames(cropDetailsModel);
            return View(cropDetailsModel);
        }

        public ActionResult AddSuppliers(SupplierDetailsModel supplierDetailsModel)
        {
            return View(supplierDetailsModel);
        }

        public ActionResult SaveSupplierDetails(SupplierDetailsModel supplierDetailsModel)
        {

            CropDetailsManager.SaveSupplierDetails(
                supplierDetailsModel.SupplierName,
                supplierDetailsModel.SupplierId,
                supplierDetailsModel.ContactNumber);

            return RedirectToAction("AddSuppliers", new LeaveDashboardModel
            {
                IsRedirectedAfterSave = true,
                OpperationMessage = "The changes were successfully saved."
            });
        }

        public ActionResult PendingCropDetails(CropDetailsModel cropDetailsModel)
        {
            List<Crop_Details> cropDetails = CropDetailsManager.SelectCropDtailsPendingProduction();

            double totalProductionWeight = cropDetails.Sum(i => i.ProducedWeight);

            CalculateRequiredMachineCount(cropDetailsModel, totalProductionWeight);

            CalculateRequiredEmployeeCount(cropDetailsModel, totalProductionWeight);

            cropDetailsModel.CropDetailsList = cropDetails.Select(i => new CropDetailsList
            {
                CropId = i.CropId,
                EstateLeafWeight = i.EstateLeafWeight,
                BoughtLeafWeight = i.BoughtLeafWeight,
                SupplierName = i.Supplier_Details.SupplierName,
                ProductionWeight = i.ProducedWeight,
                WastageWeight = i.WastageWeight,
                EnteredDate = i.Date.ToShortDateString()
            }).OrderByDescending(i =>i.EnteredDate).ToList();

            return View(cropDetailsModel);
        }

        public ActionResult SaveCropDetails(CropDetailsModel cropDetailsModel)
        {
            int supplierId = int.Parse(cropDetailsModel.SupplierId);

            CropDetailsManager.SaveCropDetails(
                cropDetailsModel.SheduleDate,
                cropDetailsModel.EstateLeafWeight,
                supplierId,
                cropDetailsModel.BoughtLeafWeight,
                cropDetailsModel.TotalProductionWeight,
                cropDetailsModel.TotalWestageWeight);

            return RedirectToAction("AddCropDetails", new LeaveDashboardModel
            {
                IsRedirectedAfterSave = true,
                OpperationMessage = "The changes were successfully saved."
            });
        }

        public ActionResult SaveCropShedule(CropDetailsModel cropDetailsModel)
        {
            CropDetailsManager.SavePendingCropDtailsForProduction();

            return RedirectToAction("PendingCropDetails", new LeaveDashboardModel
            {
                IsRedirectedAfterSave = true,
                OpperationMessage = "The changes were successfully saved."
            });
        }

        private void PopulateSupplierNames(CropDetailsModel cropDetailsModel)
        {
            IQueryable<Supplier_Details> supplierDetails = CropDetailsManager.GetSupplierDetails();
            cropDetailsModel.SupplierDetailsList =
                supplierDetails.Select(i => new SelectListItem() { Text = i.SupplierName, Value = i.SupplierId.ToString() }).OrderBy(i =>i.Text).ToList();
        }

        private void CalculateRequiredMachineCount(CropDetailsModel cropDetailsModel, double totalProductionWeight)
        {
            if (totalProductionWeight != 0.0)
            {
                cropDetailsModel.requiredTroughMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 2500));
                cropDetailsModel.requiredRollerMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 140));
                cropDetailsModel.requiredRollBreakerMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 175));
                cropDetailsModel.requiredDryerMachineCount = 1;
                cropDetailsModel.requiredSifterMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 355));
                cropDetailsModel.requiredColorSorterMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 200));

                if (cropDetailsModel.requiredTroughMachineCount > 6)
                {
                    cropDetailsModel.requiredTroughMachineCount = 6;
                }

                if (cropDetailsModel.requiredRollerMachineCount > 7)
                {
                    cropDetailsModel.requiredRollerMachineCount = 7;
                }

                if (cropDetailsModel.requiredRollBreakerMachineCount > 5)
                {
                    cropDetailsModel.requiredRollBreakerMachineCount = 5;
                }

                if (cropDetailsModel.requiredSifterMachineCount > 10)
                {
                    cropDetailsModel.requiredSifterMachineCount = 10;
                }

                if (cropDetailsModel.requiredColorSorterMachineCount > 2)
                {
                    cropDetailsModel.requiredColorSorterMachineCount = 2;
                }
            }

            else
            {
                cropDetailsModel.requiredTroughMachineCount = 0;
                cropDetailsModel.requiredRollerMachineCount = 0;
                cropDetailsModel.requiredRollBreakerMachineCount = 0;
                cropDetailsModel.requiredDryerMachineCount = 0;
                cropDetailsModel.requiredSifterMachineCount = 0;
                cropDetailsModel.requiredColorSorterMachineCount = 0;
            }
        }

        private void CalculateRequiredEmployeeCount(CropDetailsModel cropDetailsModel, double totalProductionWeight)
        {
            if (totalProductionWeight != 0.0)
            {

                if (totalProductionWeight <= 5000)
                {
                    cropDetailsModel.Transportation = 2;
                    cropDetailsModel.Spreading = 2;
                    cropDetailsModel.Withering = 2;
                    cropDetailsModel.Rolling = 3;
                    cropDetailsModel.RollBrakes = 3;
                    cropDetailsModel.Fermentation = 2;
                    cropDetailsModel.Drying = 2;
                    cropDetailsModel.Sifter = 5;
                    cropDetailsModel.ColorSorter = 2;
                    cropDetailsModel.Packing = 2;
                }

                else if (totalProductionWeight <= 7500)
                {
                    cropDetailsModel.Transportation = 3;
                    cropDetailsModel.Spreading = 3;
                    cropDetailsModel.Withering = 2;
                    cropDetailsModel.Rolling = 4;
                    cropDetailsModel.RollBrakes = 4;
                    cropDetailsModel.Fermentation = 2;
                    cropDetailsModel.Drying = 2;
                    cropDetailsModel.Sifter = 6;
                    cropDetailsModel.ColorSorter = 2;
                    cropDetailsModel.Packing = 2;
                }

                else if (totalProductionWeight <= 10000)
                {
                    cropDetailsModel.Transportation = 4;
                    cropDetailsModel.Spreading = 4;
                    cropDetailsModel.Withering = 3;
                    cropDetailsModel.Rolling = 5;
                    cropDetailsModel.RollBrakes = 4;
                    cropDetailsModel.Fermentation = 3;
                    cropDetailsModel.Drying = 2;
                    cropDetailsModel.Sifter = 7;
                    cropDetailsModel.ColorSorter = 2;
                    cropDetailsModel.Packing = 2;
                }

                else if (totalProductionWeight <= 12500)
                {
                    cropDetailsModel.Transportation = 5;
                    cropDetailsModel.Spreading = 5;
                    cropDetailsModel.Withering = 3;
                    cropDetailsModel.Rolling = 5;
                    cropDetailsModel.RollBrakes = 4;
                    cropDetailsModel.Fermentation = 3;
                    cropDetailsModel.Drying = 2;
                    cropDetailsModel.Sifter = 8;
                    cropDetailsModel.ColorSorter = 2;
                    cropDetailsModel.Packing = 2;
                }

                else
                {
                    cropDetailsModel.Transportation = 5;
                    cropDetailsModel.Spreading = 5;
                    cropDetailsModel.Withering = 3;
                    cropDetailsModel.Rolling = 6;
                    cropDetailsModel.RollBrakes = 5;
                    cropDetailsModel.Fermentation = 3;
                    cropDetailsModel.Drying = 2;
                    cropDetailsModel.Sifter = 9;
                    cropDetailsModel.ColorSorter = 2;
                    cropDetailsModel.Packing = 2;
                }
            }

            else
            {
                cropDetailsModel.Transportation = 0;
                cropDetailsModel.Spreading = 0;
                cropDetailsModel.Withering = 0;
                cropDetailsModel.Rolling = 0;
                cropDetailsModel.RollBrakes = 0;
                cropDetailsModel.Fermentation = 0;
                cropDetailsModel.Drying = 0;
                cropDetailsModel.Sifter = 0;
                cropDetailsModel.ColorSorter = 0;
                cropDetailsModel.Packing = 0;
            }
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            RedirectToAction("Error", "Shared");
            base.OnException(filterContext);
        }
    }
}
