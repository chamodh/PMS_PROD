using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MadampeTeaEstate.PMS.Models
{
    public class CropDetailsModel : CropDetailsList
    {
        public List<SelectListItem> SupplierDetailsList { get; set; }

        public List<CropDetailsList> CropDetailsList { get; set; }

        public DateTime SheduleDate { get; set; }

        public double EstateLeafWeight { get; set; }

        public double BoughtLeafWeight { get; set; }

        public string SupplierId { get; set; }

        public double TotalProductionWeight { get; set; }

        public double TotalWestageWeight { get; set; }

        public object TotalGreenLeafWeight { get; set; }
    }
}