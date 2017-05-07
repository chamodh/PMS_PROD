using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.DLL
{

    public class MachineSheduleRepository : GenericRepository<Production_Management_SystemContext, Machine_Shedule>
    {
    
        public void SaveMachineShdedule(
            IEnumerable<Crop_Details> cropDetails, 
            int requiredTroughMachineCount, 
            int requiredRollerMachineCount, 
            int requiredRollBreakerMachineCount, 
            int requiredDryerMachineCount, 
            int requiredSifterMachineCount, 
            int requiredColorSorterMachineCount)
        {
            using (var transaction = Context.Database.BeginTransaction())
            {
                try
                {
                    foreach (var cropId in cropDetails)
                    {
                        base.AddInTransaction(new Machine_Shedule
                        {
                            CropId = cropId.CropId
                        });
                    }

                    Context.SaveChanges();
                    transaction.Commit();

                }

                catch (Exception exp)
                {
                    throw exp;
                }
            }
        }
    }
}
