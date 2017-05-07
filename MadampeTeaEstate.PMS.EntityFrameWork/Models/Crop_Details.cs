using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Crop_Details
    {
        public Crop_Details()
        {
            this.Employee_Shedule = new List<Employee_Shedule>();
            this.Process_Shedule = new List<Process_Shedule>();
            this.Machine_Shedule = new List<Machine_Shedule>();
        }

        public int CropId { get; set; }
        public System.DateTime Date { get; set; }
        public double EstateLeafWeight { get; set; }
        public int SupplierId { get; set; }
        public double BoughtLeafWeight { get; set; }
        public double ProducedWeight { get; set; }
        public double WastageWeight { get; set; }
        public bool InProduction { get; set; }
        public virtual Supplier_Details Supplier_Details { get; set; }
        public virtual ICollection<Employee_Shedule> Employee_Shedule { get; set; }
        public virtual ICollection<Process_Shedule> Process_Shedule { get; set; }
        public virtual ICollection<Machine_Shedule> Machine_Shedule { get; set; }
    }
}
