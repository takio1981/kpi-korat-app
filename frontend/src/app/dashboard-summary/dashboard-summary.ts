import { Component, OnInit, OnDestroy } from '@angular/core';
import { ApiService } from '../services/api';
import { CommonModule } from '@angular/common'; 
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import Swal from 'sweetalert2';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-dashboard-summary',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './dashboard-summary.html',
  styleUrls: ['./dashboard-summary.css']
})
export class DashboardSummaryComponent implements OnInit, OnDestroy {

  // ตัวแปร Filter
  selectedYear: string = '2569';
  selectedDistrict: string = 'all';

  // ข้อมูล Dropdown (ควรดึงจาก API จริง ถ้าทำได้)
  years: string[] = ['2570', '2569', '2568', '2567']; // ⚠️ ใส่ให้ครบทุกปี
  districts: string[] = []; // ⚠️ ใส่ให้ครบทุกอำเภอ

  // ข้อมูลผลลัพธ์
  groupedData: any = {}; 
  objectKeys = Object.keys; // ตัวช่วยสำหรับ HTML
  isLoading: boolean = false;

  private apiSubscription: Subscription | undefined;

  constructor(private api: ApiService) { }

  ngOnInit(): void {
    this.loadDistricts();
    this.fetchData();
  }

  // ✅ เพิ่ม ngOnDestroy เพื่อเคลียร์ memory เมื่อเปลี่ยนหน้า
  ngOnDestroy(): void {
    if (this.apiSubscription) {
      this.apiSubscription.unsubscribe();
    }
  }

  // ✅ ฟังก์ชันโหลดรายชื่ออำเภอ
  loadDistricts() {
    this.api.getDistricts().subscribe({
      next: (res) => {
        if (res.success) {
          // เก็บเฉพาะชื่ออำเภอลงในตัวแปร
          this.districts = res.data.map((d: any) => d.amphoe_name);
        }
      },
      error: (err) => console.error('Load districts failed', err)
    });
  }

  fetchData() {
    if (this.apiSubscription) {
      this.apiSubscription.unsubscribe();
    }

    this.isLoading = true; // 1. เริ่มสถานะโหลด (เพื่อซ่อนข้อความ "ไม่พบข้อมูล")

    // 2. แสดง SweetAlert Loading
    Swal.fire({
      title: 'กำลังประมวลผล...',
      html: 'ระบบกำลังดึงข้อมูลและแสดงผล',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      }
    });
    // 3. 🕒 ตั้ง Safety Timeout 30 วินาที (กันค้างตลอดกาล)
    // ถ้าผ่านไป 30 วิ แล้วยังไม่เสร็จ ให้ตัดจบ
    const safetyTimeout = setTimeout(() => {
      if (this.apiSubscription) this.apiSubscription.unsubscribe();
      this.isLoading = false;
      Swal.fire({
        icon: 'warning',
        title: 'ใช้เวลานานเกินกำหนด',
        text: 'ไม่สามารถดึงข้อมูลได้ กรุณาลองใหม่',
        confirmButtonText: 'โหลดใหม่'
      }).then((result) => {
        if (result.isConfirmed) this.fetchData();
      });
    }, 30000);

  // 4. เริ่มดึงข้อมูล
    this.apiSubscription = this.api.getDashboardSummary(this.selectedYear, this.selectedDistrict)
      .subscribe({
        next: (res) => {
          // ✅ ข้อมูลมาแล้ว! ยกเลิก Safety Timeout ทันที
          clearTimeout(safetyTimeout);

          if (res.success) {
            // ✅ Step 1: อัปเดตข้อมูลเข้าตัวแปร (Angular จะเริ่มวาดหน้าจอทันทีบรรทัดนี้)
            this.groupedData = this.groupDataByIssue(res.data);
            
            // ✅ Step 2: สั่งปิด SweetAlert "ทันทีที่วาดเสร็จ"
            // การใช้ setTimeout 0 หรือ 50 คือการบอก Browser ว่า "ให้ทำงาน UI ให้เสร็จก่อนนะ แล้วค่อยทำคำสั่งนี้"
            setTimeout(() => {
              Swal.close(); 
              this.isLoading = false;
            }, 500); // ใส่ไว้นิดเดียว (0.05 วิ) เพื่อความชัวร์ว่า DOM เปลี่ยนแล้วจริงๆ
            
          } else {
            Swal.close();
            this.isLoading = false;
          }
        },
        error: (err) => {
          clearTimeout(safetyTimeout); // ยกเลิก Safety Timeout
          Swal.close();
          this.isLoading = false;
          Swal.fire({
            icon: 'error',
            title: 'เกิดข้อผิดพลาด',
            text: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้'
          });
        }
      });
  }

  // ฟังก์ชันจัดกลุ่ม (Helper)
  groupDataByIssue(data: any[]) {
    return data.reduce((acc: any, cur: any) => {
      const issue = cur.issue_name || 'อื่นๆ';
      if (!acc[issue]) {
        acc[issue] = [];
      }
      acc[issue].push(cur);
      return acc;
    }, {});
  }

  // ฟังก์ชันคำนวณ %
  calculateProgress(target: number, result: number): number {
    if (!target || target === 0) return 0;
    const percent = (result / target) * 100;
    return percent > 100 ? 100 : percent; // จำกัดไม่เกิน 100%
  }

  // ⚡ แนะนำ: เพิ่ม trackBy เพื่อลดอาการหน่วงเวลา Render ข้อมูลเยอะๆ
  trackByFn(index: number, item: any): any {
    return item.kpi_name; // หรือ id ถ้ามี
  }
  trackByKpi(index: number, item: any): any {
    return item.kpi_id; // หรือใช้ item.kpi_name ถ้าไม่มี id
  }
}