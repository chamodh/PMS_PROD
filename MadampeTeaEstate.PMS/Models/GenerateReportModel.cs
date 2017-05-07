using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.Models
{
    public class GenerateReportModel : CropDetailsList
    {
        public List<CropDetailsList> CropDetailsList { get; set; }

        public string SearchFromDate { get; set; }

        public int CropNumber { get; set; }

        public string SearchToDate { get; set; }
    }
}