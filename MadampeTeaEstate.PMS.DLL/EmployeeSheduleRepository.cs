using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.DLL
{
    public class EmployeeSheduleRepository : GenericRepository<Production_Management_SystemContext, Employee_Shedule>
    {

        public  void SaveEmployeeShedule(
            int cropId, 
            int transportation, 
            int spreading,
            int withering,
            int rolling, 
            int rollBrakes, 
            int fermentation, 
            int drying, 
            int sifter, 
            int colorSorter, 
            int packing)
        {
            using (var transaction = Context.Database.BeginTransaction())
            {
                try
                {
                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 1,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = withering
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 2,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = rolling
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 3,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = rollBrakes
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 4,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = fermentation
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 5,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = drying
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 6,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = sifter
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 7,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = colorSorter
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 8,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = packing
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 9,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = transportation
                    });

                    base.Add(new Employee_Shedule
                    {
                        CropId = cropId,
                        ProcessId = 10,
                        EnterdDate = DateTime.Now.Date,
                        EmployeeCount = spreading
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
