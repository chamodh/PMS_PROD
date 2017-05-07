using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Employee_Shedule
    {
        public int RowId { get; set; }
        public int CropId { get; set; }
        public int ProcessId { get; set; }
        public System.DateTime EnterdDate { get; set; }
        public int EmployeeCount { get; set; }
        public virtual Crop_Details Crop_Details { get; set; }
        public virtual Process_Details Process_Details { get; set; }
    }
}
