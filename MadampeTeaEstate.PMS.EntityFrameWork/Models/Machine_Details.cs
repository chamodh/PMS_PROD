using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Machine_Details
    {
        public Machine_Details()
        {
            this.Machine_Shedule = new List<Machine_Shedule>();
        }

        public int MachineId { get; set; }
        public string MachineName { get; set; }
        public double MaxWight { get; set; }
        public int ProcessId { get; set; }
        public virtual Process_Details Process_Details { get; set; }
        public virtual ICollection<Machine_Shedule> Machine_Shedule { get; set; }
    }
}
