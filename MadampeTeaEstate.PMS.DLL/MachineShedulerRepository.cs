using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MadampeTeaEstate.PMS.DLL
{
    public class MachineShedulerRepository : GenericRepository<Production_Management_SystemContext, Machine_Shedule>
    {
  
        public  void SaveMachineShdedule
            (int cropId,
            int avaliableTroughMachineCount,
            int avaliableRollerMachineCount,
            int avaliableRollBreakerMachineCount,
            int avaliableDryerMachineCount,
            int avaliableSifterMachineCount,
            int avaliableColorSorterMachineCount)
        {
            using (var transaction = Context.Database.BeginTransaction())
            {
                try
                {
                    for (int i = 1; i <= avaliableTroughMachineCount; i++)
                    {
                        base.Add(new Machine_Shedule
                        {
                            CropId = cropId,
                            EnterdDate = DateTime.Now.Date,
                            MachineId = i,
                        });
                    }

                    for (int i = 1; i <= avaliableRollerMachineCount; i++)
                    {
                        base.Add(new Machine_Shedule
                        {
                            CropId = cropId,
                            EnterdDate = DateTime.Now.Date,
                            MachineId = i + 6,
                        });

                    }

                    for (int i = 1; i <= avaliableRollBreakerMachineCount; i++)
                    {
                        base.Add(new Machine_Shedule
                        {
                            CropId = cropId,
                            EnterdDate = DateTime.Now.Date,
                            MachineId = i + 13,
                        });
                    }

                    base.Add(new Machine_Shedule
                    {
                        CropId = cropId,
                        EnterdDate = DateTime.Now.Date,
                        MachineId = 19,
                    });


                    for (int i = 1; i <= avaliableSifterMachineCount; i++)
                    {
                        base.Add(new Machine_Shedule
                        {
                            CropId = cropId,
                            EnterdDate = DateTime.Now.Date,
                            MachineId = i + 19,
                        });
                    }

                    for (int i = 1; i <= avaliableColorSorterMachineCount; i++)
                    {
                        base.Add(new Machine_Shedule
                        {
                            CropId = cropId,
                            EnterdDate = DateTime.Now.Date,
                            MachineId = i + 29,
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
