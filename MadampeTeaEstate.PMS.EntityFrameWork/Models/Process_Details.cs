using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Process_Details
    {
        public Process_Details()
        {
            this.Employee_Shedule = new List<Employee_Shedule>();
            this.Machine_Details = new List<Machine_Details>();
            this.Process_Shedule = new List<Process_Shedule>();
        }

        public int ProcessId { get; set; }
        public string ProcessName { get; set; }
        public double RequiredProcessTime { get; set; }
        public virtual ICollection<Employee_Shedule> Employee_Shedule { get; set; }
        public virtual ICollection<Machine_Details> Machine_Details { get; set; }
        public virtual ICollection<Process_Shedule> Process_Shedule { get; set; }
    }
}
