using MadampeTeaEstate.PMS.EntityFrameWork.Models;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;

namespace MadampeTeaEstate.PMS.BLL
{
    public class ReportingManager
    {
        public void GenerateReport(List<Crop_Details> cropDetailsData)
        {
            Excel.Application application = new Excel.Application();
            Excel.Workbook workbook = application.Workbooks.Add(System.Reflection.Missing.Value);
            Excel.Worksheet worksheet = workbook.ActiveSheet;

            worksheet.Cells[1, 1] = "Crop Id";
            worksheet.Cells[1, 2] = "Entred On";
            worksheet.Cells[1, 3] = "Estate Leaf Weight";
            worksheet.Cells[1, 4] = "Bought Leaf Weight";
            worksheet.Cells[1, 5] = "Supplier Name";
            worksheet.Cells[1, 6] = "Production Weight";
            worksheet.Cells[1, 7] = "In Production";
            worksheet.Cells[1, 8] = "Trough Machine";
            worksheet.Cells[1, 9] = "Roller Machine";
            worksheet.Cells[1, 10] = "RollBreaker Machine";
            worksheet.Cells[1, 11] = "Dryer Machine";
            worksheet.Cells[1, 12] = "Sifter Machine";
            worksheet.Cells[1, 13] = "Color Sorter Machine";
            worksheet.Cells[1, 14] = "Withering";
            worksheet.Cells[1, 15] = "Rolling";
            worksheet.Cells[1, 16] = "Drying";
            worksheet.Cells[1, 17] = "Sifter";
            worksheet.Cells[1, 18] = "Color Sorter";
            worksheet.Cells[1, 19] = "Roll Brakers";
            worksheet.Cells[1, 20] = "Packing";
            worksheet.Cells[1, 21] = "Fermentation";
            worksheet.Cells[1, 22] = "Transportation";

            int row = 2;
            foreach (Crop_Details cropId in cropDetailsData)
            {
                worksheet.Cells[row, 1] = cropId.CropId;
                worksheet.Cells[row, 2] = cropId.Date.ToShortDateString();
                worksheet.Cells[row, 3] = cropId.EstateLeafWeight;
                worksheet.Cells[row, 4] = cropId.BoughtLeafWeight;
                worksheet.Cells[row, 5] = cropId.Supplier_Details.SupplierName.Trim();
                worksheet.Cells[row, 6] = cropId.ProducedWeight;
                worksheet.Cells[row, 7] = cropId.InProduction;
                worksheet.Cells[row, 8] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 2500);
                worksheet.Cells[row, 9] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 140);
                worksheet.Cells[row, 10] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 175);
                worksheet.Cells[row, 11] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 300);
                worksheet.Cells[row, 12] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 355);
                worksheet.Cells[row, 13] = cropId.Machine_Shedule.Count(z => z.Machine_Details.MaxWight == 200);
                worksheet.Cells[row, 14] = cropId.Employee_Shedule.Where(x => x.ProcessId == 1).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 15] = cropId.Employee_Shedule.Where(x => x.ProcessId == 2).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 16] = cropId.Employee_Shedule.Where(x => x.ProcessId == 5).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 17] = cropId.Employee_Shedule.Where(x => x.ProcessId == 6).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 18] = cropId.Employee_Shedule.Where(x => x.ProcessId == 7).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 19] = cropId.Employee_Shedule.Where(x => x.ProcessId == 3).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 20] = cropId.Employee_Shedule.Where(x => x.ProcessId == 8).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 21] = cropId.Employee_Shedule.Where(x => x.ProcessId == 4).Select(x => x.EmployeeCount).FirstOrDefault();
                worksheet.Cells[row, 22] = cropId.Employee_Shedule.Where(x => x.ProcessId == 9).Select(x => x.EmployeeCount).FirstOrDefault();
                row++;
            }

            worksheet.get_Range("A1", "V1").EntireColumn.AutoFit();
            worksheet.Range["A1", "V1"].EntireRow.Font.Bold = true;
            worksheet.Application.ActiveWindow.SplitRow = 1;
            worksheet.Application.ActiveWindow.FreezePanes = true;

            string fileNameToSave = string.Format(@"Crop_Details_Report.{0}", System.IO.Path.GetRandomFileName());

            workbook.SaveAs(fileNameToSave);
            workbook.Close();
            Marshal.ReleaseComObject(workbook);
            application.Quit();
            Marshal.FinalReleaseComObject(application);

            OpenFile(fileNameToSave);
        }

        private void OpenFile(string fileNameToSave)
        {
            Excel.Application application = new Excel.Application();
            string excleSheet = fileNameToSave;
            application.Visible = true;
            Excel.Workbooks workbook = application.Workbooks;
            workbook.Open(excleSheet);
        }
    }
}
