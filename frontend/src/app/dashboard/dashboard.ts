import { NgChartsModule } from 'ng2-charts';
import { Component, OnInit, ChangeDetectorRef } from '@angular/core'; 
import { ApiService } from '../services/api';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import Swal from 'sweetalert2'; // Import SweetAlert2
import { ChartConfiguration, ChartOptions } from 'chart.js';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule, NgChartsModule, RouterLink, RouterLinkActive],
  templateUrl: './dashboard.html',
  styleUrls: ['./dashboard.css']
})
export class DashboardComponent implements OnInit {
  kpiStructure: any[] = [];
  dataMap: { [key: string]: any } = {};
  
  fiscalYear = 2569; 
  availableYears = [2566, 2567, 2568, 2569, 2570]; 
  months = [10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  pendingChanges: any[] = [];
  currentUser: any = null;
  isLoading = true;
  // 3. ตัวแปรสำหรับ Modal กราฟ
  showChartModal = false;
  currentChartTitle = '';
  // 4. การตั้งค่ากราฟ (Bar Chart ผสม Line)
  public chartData: ChartConfiguration<'bar' | 'line'>['data'] = {
    labels: [],
    datasets: []
  };

  public chartOptions: ChartOptions<'bar' | 'line'> = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: { display: true, position: 'bottom' },
    }
  };

// ตัวแปรสำหรับ Filter
  selectedYear: string = '2569'; // ค่าเริ่มต้น
  selectedDistrict: string = 'all';

  // ข้อมูลตัวเลือก (ควรดึงจาก API แต่ hardcode ทดสอบก่อนได้)
  years = ['2567', '2568', '2569'];
  districts = ['เมืองนครราชสีมา', 'ครบุรี', 'เสิงสาง']; // ⚠️ ใส่ชื่ออำเภอให้ครบ หรือดึงจาก API

  // ข้อมูลสำหรับแสดงผล
  groupedData: any = {}; // เก็บข้อมูลที่จัดกลุ่มแล้ว
  objectKeys = Object.keys; // ตัวช่วยสำหรับวนลูปใน HTML

  // 2. เช็ค Constructor ต้องมี private cd: ChangeDetectorRef
  constructor(private api: ApiService, private router: Router, private cd: ChangeDetectorRef) {}

  // เช็คว่าเป็น Admin เข้ามาดูไหม
  isAdminView = false;

  ngOnInit() {
    const userStored = localStorage.getItem('currentUser');
    if (userStored) {
      this.currentUser = JSON.parse(userStored);
      this.isAdminView = this.currentUser.isAdminView || false; // เช็ค Flag ว่าเป็น Admin View หรือไม่ (ต้องตั้งค่าใน Backend ด้วย)

      // 1. ตรวจสอบว่าดึง User ID มาถูกไหม
      console.log('Current User ID:', this.currentUser.id);

      // --- แก้ไข Logic การเลือกปี ---
      if (this.isAdminView) {
        // ถ้า Admin เข้ามาดู ให้ดึงปีที่ Admin เลือกไว้
        const savedYear = localStorage.getItem('adminSelectedYear');
        if (savedYear) {
          this.fiscalYear = parseInt(savedYear, 10);
        }
      } else {
        // ถ้า User เข้าเอง ให้เป็นปีเริ่มต้น (หรือปีปัจจุบัน)
        this.fiscalYear = 2569; 
      }
      // --------------------------
      console.log('Loading Data for Year:', this.fiscalYear);

      this.loadKpiData();
      this.loadData();
    } else {
      this.router.navigate(['/login']);
    }
  }
  
  backToAdmin() {
    // คืนร่าง Admin
    const adminSession = localStorage.getItem('adminSession');
    if (adminSession) {
      localStorage.setItem('currentUser', adminSession);
      localStorage.removeItem('adminSession');
      localStorage.removeItem('adminSelectedYear'); // ล้างค่าปีทิ้ง
      this.router.navigate(['/admin-dashboard']);
    }
  }

  loadData() {
    this.api.getDashboardSummary(this.selectedYear, this.selectedDistrict).subscribe({
      next: (res) => {
        if (res.success) {
          // แปลงข้อมูลดิบ ให้เป็นกลุ่มตาม "ชื่อประเด็น"
          this.groupedData = this.groupDataByIssue(res.data);
        }
      },
      error: (err) => console.error('Load Dashboard Failed', err)
    });
  }

  // 🛠️ ฟังก์ชันจัดกลุ่มข้อมูล (Helper)
  groupDataByIssue(data: any[]) {
    return data.reduce((acc: any, cur: any) => {
      const issue = cur.issue_name || 'ไม่ระบุประเด็น';
      if (!acc[issue]) {
        acc[issue] = [];
      }
      acc[issue].push(cur);
      return acc;
    }, {});
  }

  // 🛠️ ฟังก์ชันคำนวณ % ความสำเร็จ
  calcProgress(target: number, result: number): number {
    if (!target || target == 0) return 0;
    let percent = (result / target) * 100;
    return percent > 100 ? 100 : percent; // ไม่ให้เกิน 100% (แล้วแต่ requirement)
  }

  loadKpiData() {
    this.isLoading = true;
    this.dataMap = {}; 

    this.api.getKpiStructure().subscribe({
      next: (res: any) => {
        if (res.success) {
          this.kpiStructure = res.data;
          
          // ตรวจสอบว่ามี currentUser.id ไหม (ถ้าไม่มี ข้อมูลจะไม่มา)
          if (!this.currentUser || !this.currentUser.id) {
             console.error("User ID is missing!");
             this.isLoading = false;
             return;
          }

          this.api.getKpiData(this.currentUser.id, this.fiscalYear).subscribe({
            next: (dataRes: any) => {
              console.log('Data fetched from DB:', dataRes.data);

              if (dataRes.success && dataRes.data.length > 0) {
                dataRes.data.forEach((d: any) => {
                  const key = `${d.kpi_id}_${d.report_month}`;
                  this.dataMap[key] = d.kpi_value;
                });
              } else {
                 console.warn('No data found for this user/year');
              }
              this.isLoading = false;
              this.cd.detectChanges(); // บังคับอัปเดตหน้าจอ
            },
            error: (err: any) => {
              console.error('Data Load Error:', err);
              this.isLoading = false;
              this.cd.detectChanges();
            }
          });
        }
      },
      error: (err: any) => {
        console.error('Structure Load Error:', err);
        this.isLoading = false;
        this.cd.detectChanges();
      }
    });
  }

  onYearChange() { this.loadKpiData(); }

  getMonthName(m: number): string {
    const names = ['', 'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];
    return names[m];
  }

  getSum(kpiId: number): number {
    let sum = 0;
    this.months.forEach(m => {
      const val = this.dataMap[`${kpiId}_${m}`];
      if (val !== undefined && val !== null && val !== '') sum += parseFloat(val);
    });
    return sum;
  }

  onValueChange(kpiId: number, month: number, event: any) {
    let val = event.target.value;
    if (val === '') val = null; 
    else val = parseFloat(val);

    const key = `${kpiId}_${month}`;
    this.dataMap[key] = val;

    const existingIndex = this.pendingChanges.findIndex(c => c.kpi_id === kpiId && c.month === month);
    if (existingIndex > -1) this.pendingChanges.splice(existingIndex, 1);
    this.pendingChanges.push({ kpi_id: kpiId, month: month, value: val });
  }

// 1. ฟังก์ชันคำนวณร้อยละ (Result / Target * 100)
  getPercentage(kpiId: number): number {
    const target = this.dataMap[`${kpiId}_0`]; // เป้าหมาย (เดือน 0)
    const result = this.getSum(kpiId);         // ผลงาน (รวมยอด)

    if (!target || parseFloat(target) === 0) return 0;
    return (result / parseFloat(target)) * 100;
  }

  // 2. ปรับปรุงฟังก์ชัน save() ให้เปิด Popup ก่อน
  save() {
    if (this.pendingChanges.length === 0) {
      Swal.fire({
        icon: 'warning',
        title: 'ไม่มีการเปลี่ยนแปลง',
        text: 'คุณยังไม่ได้แก้ไขข้อมูลใดๆ',
        confirmButtonText: 'ตกลง',
        confirmButtonColor: '#3085d6'
      });
      return;
    }
    // สร้าง HTML ตารางสรุปสำหรับแสดงใน SweetAlert
    let tableHtml = `
      <div style="text-align: left; max-height: 300px; overflow-y: auto;">
        <table style="width: 100%; font-size: 14px; border-collapse: collapse;">
          <tr style="background: #f3f4f6; border-bottom: 2px solid #ddd;">
             <th style="padding: 8px;">รายการ</th>
             <th style="padding: 8px;">เดือน</th>
             <th style="padding: 8px; text-align: right;">ค่าใหม่</th>
          </tr>`;
    // เตรียมข้อมูลแสดงใน Popup

    this.pendingChanges.forEach(c => {
      // หาชื่อ KPI
      let kpiName = 'Unknown';
      let monthName = c.month === 0 ? 'เป้าหมาย' : this.getMonthName(c.month);
      
      this.kpiStructure.forEach(issue => {
        issue.groups.forEach((g: any) => {
          g.subs.forEach((s: any) => {
            const item = s.items.find((i: any) => i.id === c.kpi_id);
            if (item) kpiName = item.label;
          });
        });
      });

      tableHtml += `
        <tr style="border-bottom: 1px solid #eee;">
          <td style="padding: 8px;">${kpiName}</td>
          <td style="padding: 8px;">${monthName}</td>
          <td style="padding: 8px; text-align: right; font-weight: bold; color: #2563eb;">${c.value !== null ? c.value : '-'}</td>
        </tr>`;
    });

  tableHtml += `</table></div>`;

    // เรียก SweetAlert ยืนยัน
    Swal.fire({
      title: 'ยืนยันการบันทึกข้อมูล',
      html: tableHtml, // ใส่ตารางที่เราสร้าง
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#10b981', // สีเขียว
      cancelButtonColor: '#d33',     // สีแดง
      confirmButtonText: '<i class="fas fa-save"></i> ยืนยันบันทึก',
      cancelButtonText: 'ยกเลิก',
      width: '600px'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.confirmSave(); // ถ้ากดยืนยัน ให้เรียกฟังก์ชันบันทึกจริง
      }
    });
  }

  // 3. ฟังก์ชันยืนยันการบันทึก (Confirm Save)
  confirmSave() {
    // แสดง Loading
    Swal.fire({
      title: 'กำลังบันทึก...',
      allowOutsideClick: false,
      didOpen: () => { Swal.showLoading(); }
    });

    this.api.saveBatch({
      userId: this.currentUser.id,
      fiscalYear: this.fiscalYear,
      changes: this.pendingChanges
    }).subscribe({
      next: (res: any) => {
        if (res.success) {
          Swal.fire({
            icon: 'success',
            title: 'บันทึกสำเร็จ!',
            text: `บันทึกข้อมูลเรียบร้อย ${res.count} รายการ`,
            timer: 2000,
            showConfirmButton: false
          });
          this.pendingChanges = [];
          this.loadKpiData();
        }
      },
      error: (err: any) => {
        Swal.fire({
          icon: 'error',
          title: 'เกิดข้อผิดพลาด',
          text: 'ไม่สามารถบันทึกข้อมูลได้ กรุณาลองใหม่',
        });
      }
    });
  }

  logout() {
    Swal.fire({
      title: 'ออกจากระบบ?',
      text: "คุณต้องการออกจากระบบใช่หรือไม่",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'ใช่, ออกจากระบบ'
    }).then((result: any) => {
      if (result.isConfirmed) {
        localStorage.removeItem('currentUser');
        this.router.navigate(['/login']);
      }
    });
  }

  // 5. ฟังก์ชันเปิดกราฟ (เรียกเมื่อกดปุ่มกราฟ)
  openChart(item: any) {
    this.currentChartTitle = item.label;

    // เตรียม Label (ชื่อเดือน)
    const labels = ['ต.ค.', 'พ.ย.', 'ธ.ค.', 'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.'];
    
    // เตรียมข้อมูลผลงาน (Results) รายเดือน
    const results = this.months.map(m => {
      const val = this.dataMap[`${item.id}_${m}`];
      return val ? parseFloat(val) : 0;
    });

    // เตรียมข้อมูลเป้าหมาย (Target) - เส้นตรงเท่ากันทุกเดือน
    const targetVal = this.dataMap[`${item.id}_0`] ? parseFloat(this.dataMap[`${item.id}_0`]) : 0;
    // ถ้าเป้าหมายไม่ใช่ผลรวม (เช่น ร้อยละ) เส้นกราฟควรเป็นค่าคงที่
    // แต่ถ้าเป้าหมายเป็นผลรวม (Accumulate) อาจต้องหารเฉลี่ย (ในที่นี้ขอทำเป็นเส้น Benchmark คงที่ครับ)
    const targets = Array(12).fill(targetVal);

    // กำหนดค่าให้กราฟ
    this.chartData = {
      labels: labels,
      datasets: [
        {
          type: 'bar',
          label: 'ผลงาน (Result)',
          data: results,
          backgroundColor: 'rgba(34, 197, 94, 0.6)', // สีเขียวโปร่ง
          borderColor: 'rgba(34, 197, 94, 1)',
          borderWidth: 1,
          order: 2
        },
        {
          type: 'line',
          label: 'เป้าหมาย (Target)',
          data: targets,
          borderColor: 'rgba(234, 179, 8, 1)', // สีเหลือง
          borderWidth: 3,
          pointRadius: 0, // ไม่ต้องมีจุด
          fill: false,
          order: 1,
          tension: 0.1 // ความโค้งของเส้น (0.1 = เกือบตรง)
        }
      ]
    };

    this.showChartModal = true;
  }

  closeChart() {
    this.showChartModal = false;
  }

  goToOverview() {
    this.router.navigate(['/overview']);
  }
}

