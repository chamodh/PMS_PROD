using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.DLL
{
    public class ProcessShedulerRepository : GenericRepository<Production_Management_SystemContext, Process_Shedule>
    {

        public  void SaveProcessDetails
            (int cropId, 
            int avaliableTroughMachineCount,
            int avaliableRollerMachineCount,
            int avaliableRollBreakerMachineCount,
            int avaliableSifterMachineCount,
            int avaliableColorSorterMachineCount,
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
                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 1,
                        MachineCount = avaliableTroughMachineCount,
                        ProcessCount = requiredTroughMachineCount,
                        EnterdDate = DateTime.Today,
                    });

                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 2,
                        MachineCount = avaliableRollerMachineCount,
                        ProcessCount = requiredRollerMachineCount,
                        EnterdDate = DateTime.Today,
                    });

                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 3,
                        MachineCount = avaliableRollBreakerMachineCount,
                        ProcessCount = requiredRollBreakerMachineCount,
                        EnterdDate = DateTime.Today,
                    });

                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 5,
                        MachineCount = 1,
                        ProcessCount = requiredDryerMachineCount,
                        EnterdDate = DateTime.Today,
                    });

                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 6,
                        MachineCount = avaliableSifterMachineCount,
                        ProcessCount = requiredSifterMachineCount,
                        EnterdDate = DateTime.Today,
                    });

                    base.Add(new Process_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 7,
                        MachineCount = avaliableColorSorterMachineCount,
                        ProcessCount = requiredColorSorterMachineCount,
                        EnterdDate = DateTime.Today,
                    });

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
