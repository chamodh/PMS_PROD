using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MadampeTeaEstate.PMS.Models
{
    public class SupplierDetailsModel : LeaveDashboardModel
    {
        public string SupplierName { get; set; }

        public string ContactNumber { get; set; }

        public int SupplierId { get; set; }
    }
}