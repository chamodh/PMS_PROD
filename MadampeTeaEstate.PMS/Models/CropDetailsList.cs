
namespace MadampeTeaEstate.PMS.Models
{
    public class CropDetailsList : LeaveDashboardModel
    {
        public int CropId { get; set; }

        public string EnteredDate { get; set; }

        public double EstateLeafWeight { get; set; }

        public double BoughtLeafWeight { get; set; }

        public double ProductionWeight { get; set; }

        public double WastageWeight { get; set; } 

        public string SupplierName { get; set; }

        public int requiredTroughMachineCount { get; set; }

        public int requiredRollerMachineCount { get; set; }

        public int requiredRollBreakerMachineCount { get; set; }

        public int requiredDryerMachineCount { get; set; }

        public int requiredSifterMachineCount { get; set; }

        public int requiredColorSorterMachineCount { get; set; }

        public int Withering { get; set; }

        public int Rolling { get; set; }

        public int Drying { get; set; }

        public int Sifter{ get; set; }

        public int ColorSorter { get; set; }

        public int RollBrakes { get; set; }

        public int Packing { get; set; }

        public int Fermentation { get; set; }

        public int Transportation { get; set; }

        public int Spreading { get; set; }

        public bool ProductionStatus { get; set; }

    }
}
