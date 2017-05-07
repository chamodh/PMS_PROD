using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MadampeTeaEstate.PMS.DLL
{
    public class CropDetailsRepository : GenericRepository<Production_Management_SystemContext, Crop_Details>
    {
        public void SaveCropDetails(
            DateTime sheduleDate,
            double estateLeafWeight,
            int supplierId,
            double boughtLeafWeight,
            double totalProductionWeight,
            double totalWestageWeight)
        {
            base.Add(new Crop_Details
            {
                Date = sheduleDate,
                EstateLeafWeight = estateLeafWeight,
                SupplierId = supplierId,
                BoughtLeafWeight = boughtLeafWeight,
                ProducedWeight = totalProductionWeight,
                WastageWeight = totalWestageWeight,
                InProduction = false
            });
        }

        public void SaveCropDetailsToProdction(List<Crop_Details> cropDetails)
        {
            using (var transaction = Context.Database.BeginTransaction())
            {
                try
                {
                    foreach (var cropId in cropDetails)
                    {
                        cropId.InProduction = true;
                        Context.Entry(cropId).State = System.Data.Entity.EntityState.Modified;
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

        public List<Crop_Details> SearchCropData(int cropId, DateTime searchFromDate, DateTime searchToDate)
        {
            IEnumerable<Crop_Details> results = base.GetAll();

            if (cropId != 0)
            {
                results = results.Where(i => i.CropId == cropId);
            }

            if (searchFromDate != DateTime.MinValue)
            {
                results = results.Where(i => i.Date >= searchFromDate);
            }

            if (searchToDate != DateTime.MinValue)
            {
                results = results.Where(i => i.Date <= searchToDate);
            }

            return results.ToList();
        }
    }
}