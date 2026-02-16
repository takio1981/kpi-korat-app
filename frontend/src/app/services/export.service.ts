import { Injectable } from '@angular/core';
import * as XLSX from 'xlsx';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

@Injectable({
  providedIn: 'root'
})
export class ExportService {

  constructor() { }

  // --- 1. ฟังก์ชัน Export Excel ---
  exportToExcel(data: any[], fileName: string, sheetName: string = 'Data') {
    // แปลง JSON เป็น Sheet
    const ws: XLSX.WorkSheet = XLSX.utils.json_to_sheet(data);
    
    // สร้าง Workbook ใหม่
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, sheetName);

    // บันทึกไฟล์
    XLSX.writeFile(wb, `${fileName}.xlsx`);
  }

  // --- 2. ฟังก์ชัน Export PDF (แบบ Capture หน้าจอ) ---
  // elementId = id ของ div หรือ table ที่ต้องการปริ้นท์
  exportToPdf(elementId: string, fileName: string, title: string = 'Report') {
    const element = document.getElementById(elementId);
    if (!element) {
      console.error('Element not found!');
      return;
    }

    // Capture หน้าจอส่วนนั้น
    html2canvas(element, { scale: 2 }).then((canvas) => {
      const imgData = canvas.toDataURL('image/png');
      
      // ตั้งค่า PDF (A4 แนวนอน = landscape, แนวตั้ง = portrait)
      // ถ้าตารางกว้าง แนะนำ 'l' (landscape)
      const pdf = new jsPDF('l', 'mm', 'a4'); 
      
      const imgWidth = 280; // A4 แนวนอนกว้างประมาณ 297mm (เผื่อขอบนิดหน่อย)
      const pageHeight = 210;
      const imgHeight = (canvas.height * imgWidth) / canvas.width;
      
      let heightLeft = imgHeight;
      let position = 15; // เริ่มต้นวาดที่ความสูง 15mm (เผื่อหัวกระดาษ)

      // ใส่หัวกระดาษ
      pdf.setFontSize(16);
      pdf.text(title, 14, 10);

      // วาดรูปลง PDF
      pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
      
      // ถ้าเนื้อหายาวเกินหน้า (ทำหลายหน้า) - *Optional Logic*
      // (แบบง่ายๆ ตัดจบหน้าเดียวไปก่อน เพื่อความชัวร์เรื่อง Layout)
      
      pdf.save(`${fileName}.pdf`);
    });
  }
}