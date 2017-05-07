using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Machine_Shedule
    {
        public int RowId { get; set; }
        public int CropId { get; set; }
        public System.DateTime EnterdDate { get; set; }
        public int MachineId { get; set; }
        public virtual Crop_Details Crop_Details { get; set; }
        public virtual Machine_Details Machine_Details { get; set; }
    }
}
