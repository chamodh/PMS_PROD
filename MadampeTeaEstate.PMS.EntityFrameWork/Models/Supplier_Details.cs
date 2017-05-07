using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Supplier_Details
    {
        public Supplier_Details()
        {
            this.Crop_Details = new List<Crop_Details>();
        }

        public int SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string ContactNumber { get; set; }
        public virtual ICollection<Crop_Details> Crop_Details { get; set; }
    }
}
