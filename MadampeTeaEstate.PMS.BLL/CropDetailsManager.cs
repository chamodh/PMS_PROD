using MadampeTeaEstate.PMS.DLL;
using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MadampeTeaEstate.PMS.BLL
{
    public class CropDetailsManager
    {
        private SupplierDetailsRepository SupplierDetailsRepository;
        private CropDetailsRepository CropDetailsRepository;
        private MachineShedulerRepository MachineShedulerRepository;
        private EmployeeSheduleRepository EmployeeSheduleRepository;
        private MachineDetailsRepository MachineDetailsRepository;
        private ProcessShedulerRepository ProcessShedulerRepository;

        public CropDetailsManager()
        {
            SupplierDetailsRepository = new SupplierDetailsRepository();
            CropDetailsRepository = new CropDetailsRepository();
            MachineShedulerRepository = new MachineShedulerRepository();
            EmployeeSheduleRepository = new EmployeeSheduleRepository();
            MachineDetailsRepository = new MachineDetailsRepository();
            ProcessShedulerRepository = new ProcessShedulerRepository();
        }

        public IQueryable<Supplier_Details> GetSupplierDetails()
        {
            return SupplierDetailsRepository.GetAll();
        }

        public void CalculateLeafweights(double estateLeafWeightconverted, double boughtLeafWeightConverted)
        {
            double totalGreenLeafWeight = estateLeafWeightconverted + boughtLeafWeightConverted;

            double totalWeightAfterWithering = (totalGreenLeafWeight * 45) / 100;

            double totalWeightAfterFermentation = (totalWeightAfterWithering * 23) / 100;

        }

        public void SaveCropDetails(
            DateTime sheduleDate,
            double estateLeafWeight,
            int supplierId,
            double boughtLeafWeight,
            double totalProductionWeight,
            double totalWestageWeight)
        {
            CropDetailsRepository.SaveCropDetails(
                sheduleDate,
                estateLeafWeight,
                supplierId,
                boughtLeafWeight,
                totalProductionWeight,
                totalWestageWeight
                );
        }

        public List<Crop_Details> SelectCropDtailsPendingProduction()
        {
            return CropDetailsRepository.GetAll().Where(i => i.InProduction == false).ToList();
        }

        public void SavePendingCropDtailsForProduction()
        {
            List<Crop_Details> cropDetails = SelectCropDtailsPendingProduction();

            CropDetailsRepository.SaveCropDetailsToProdction(cropDetails);
            CalculateRequiredMachineCount(cropDetails);
            CalculateRequiredEmployeeCount(cropDetails);
        }

        private void CalculateRequiredMachineCount(List<Crop_Details> cropDetails)
        {

            foreach (var cropIdCount in cropDetails)
            {
                int cropId = cropIdCount.CropId;
                double totalProductionWeight =
                    cropDetails.Where(i => i.CropId == cropId).Select(i => i.ProducedWeight).FirstOrDefault();

                //Required process number turns 
                int requiredTroughMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 2500));
                int requiredRollerMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 140));
                int requiredRollBreakerMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 175));
                int requiredDryerMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 300));
                int requiredSifterMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 355));
                int requiredColorSorterMachineCount = Convert.ToInt32(Math.Ceiling(totalProductionWeight / 200));

                int avaliableTroughMachineCount = requiredTroughMachineCount;
                int avaliableRollerMachineCount = requiredRollerMachineCount;
                int avaliableRollBreakerMachineCount = requiredRollBreakerMachineCount;
                int avaliableDryerMachineCount = requiredDryerMachineCount; 
                int avaliableSifterMachineCount = requiredSifterMachineCount;
                int avaliableColorSorterMachineCount = requiredColorSorterMachineCount;

                if (requiredTroughMachineCount > 6)
                {
                    avaliableTroughMachineCount = 6;
                }

                if (requiredRollerMachineCount > 7)
                {
                    avaliableRollerMachineCount = 7;
                }

                if (requiredRollBreakerMachineCount > 5)
                {
                    avaliableRollBreakerMachineCount = 5;
                }

                if (requiredDryerMachineCount > 1)
                {
                    avaliableDryerMachineCount = 1;
                }

                if (requiredSifterMachineCount > 10)
                {
                    avaliableSifterMachineCount = 10;
                }

                if (requiredColorSorterMachineCount > 2)
                {
                    avaliableColorSorterMachineCount = 2;
                }

                ProcessShedulerRepository.SaveProcessDetails
                    (cropId,
                    avaliableTroughMachineCount,
                    avaliableRollerMachineCount,
                    avaliableRollBreakerMachineCount,
                    avaliableSifterMachineCount,
                    avaliableColorSorterMachineCount,
                    requiredTroughMachineCount,
                    requiredRollerMachineCount,
                    requiredRollBreakerMachineCount,
                    requiredDryerMachineCount,
                    requiredSifterMachineCount,
                    requiredColorSorterMachineCount);

                MachineShedulerRepository.SaveMachineShdedule
                    (cropId,
                    avaliableTroughMachineCount,
                    avaliableRollerMachineCount,
                    avaliableRollBreakerMachineCount,
                    avaliableDryerMachineCount,
                    avaliableSifterMachineCount,
                    avaliableColorSorterMachineCount);

            }
        }

        private void CalculateRequiredEmployeeCount(List<Crop_Details> cropDetails)
        {
            int transportation = 0;
            int spreading = 0;
            int withering = 0;
            int rolling = 0;
            int rollBrakes = 0;
            int fermentation = 0;
            int drying = 0;
            int sifter = 0;
            int colorSorter = 0;
            int packing = 0;

            foreach (var cropIdCount in cropDetails)
            {
                int cropId = cropIdCount.CropId;
                double totalProductionWeight =
                    cropDetails.Where(i => i.CropId == cropId).Select(i => i.ProducedWeight).FirstOrDefault();

                if (totalProductionWeight <= 5000)
                {
                    transportation = 2;
                    spreading = 2;
                    withering = 2;
                    rolling = 3;
                    rollBrakes = 3;
                    fermentation = 2;
                    drying = 2;
                    sifter = 5;
                    colorSorter = 2;
                    packing = 2;
                }

                else if (totalProductionWeight <= 7500)
                {
                    transportation = 3;
                    spreading = 3;
                    withering = 2;
                    rolling = 4;
                    rollBrakes = 4;
                    fermentation = 2;
                    drying = 2;
                    sifter = 6;
                    colorSorter = 2;
                    packing = 2;
                }

                else if (totalProductionWeight <= 10000)
                {
                    transportation = 4;
                    spreading = 4;
                    withering = 3;
                    rolling = 5;
                    rollBrakes = 4;
                    fermentation = 3;
                    drying = 2;
                    sifter = 7;
                    colorSorter = 2;
                    packing = 2;
                }

                else if (totalProductionWeight <= 12500)
                {
                    transportation = 5;
                    spreading = 5;
                    withering = 3;
                    rolling = 5;
                    rollBrakes = 4;
                    fermentation = 3;
                    sifter = 8;
                    colorSorter = 2;
                    packing = 2;
                }

                else
                {
                    transportation = 5;
                    spreading = 5;
                    withering = 3;
                    rolling = 6;
                    rollBrakes = 5;
                    fermentation = 3;
                    drying = 2;
                    sifter = 9;
                    colorSorter = 2;
                    packing = 2;
                }

                EmployeeSheduleRepository.SaveEmployeeShedule
                    (cropId,
                     transportation,
                     spreading,
                     withering,
                     rolling,
                     rollBrakes,
                     fermentation,
                     drying,
                     sifter,
                     colorSorter,
                     packing);
            }
        }

        public List<Crop_Details> SearchCropData(int cropId, DateTime searchFromDate, DateTime searchToDate)
        {
            return CropDetailsRepository.SearchCropData(
                cropId,
                searchFromDate,
                searchToDate);
        }

        public void SaveSupplierDetails(string supplierName, int supplierId, string contactNumber)
        {
            SupplierDetailsRepository.SaveSupplier(supplierName, supplierId, contactNumber);
        }
    }
}