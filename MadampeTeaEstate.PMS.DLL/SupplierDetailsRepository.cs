using MadampeTeaEstate.PMS.EntityFrameWork.Models;

namespace MadampeTeaEstate.PMS.DLL
{
    public class SupplierDetailsRepository : GenericRepository<Production_Management_SystemContext, Supplier_Details>
    {

        public void SaveSupplier(string supplierName, int supplierId, string contactNumber)
        {
            base.Add(new Supplier_Details
            {
                SupplierId = supplierId,
                SupplierName = supplierName,
                ContactNumber = contactNumber
            });
        }
    }
}
