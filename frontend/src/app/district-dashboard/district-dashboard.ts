import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgChartsModule, BaseChartDirective } from 'ng2-charts';
import { ChartConfiguration, ChartData, ChartType } from 'chart.js';
import { ApiService } from '../services/api';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-district-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule, NgChartsModule],
  templateUrl: './district-dashboard.html',
  styleUrls: ['./district-dashboard.css']
})
export class DistrictDashboardComponent implements OnInit {
  @ViewChild(BaseChartDirective) chart: BaseChartDirective | undefined;

  fiscalYear = 2569;
  availableYears = [2566, 2567, 2568, 2569, 2570];
  
  // ตัวเลือก KPI
  kpiList: any[] = [];
  selectedKpi = 'all';

  // --- ตั้งค่ากราฟ ---
  public barChartOptions: ChartConfiguration['options'] = {
    responsive: true,
    maintainAspectRatio: false,
    scales: {
      y: {
        beginAtZero: true,
        max: 100, // ให้กราฟเต็ม 100% (ถ้ามีค่าเกิน 100 ก็จะทะลุได้ถ้าเอา max ออก)
        title: { display: true, text: 'ร้อยละความสำเร็จ (%)' }
      },
      x: {
        ticks: { autoSkip: false, maxRotation: 90, minRotation: 45 } // ชื่ออำเภอเอียงๆ หน่อยจะได้ไม่ซ้อน
      }
    },
    plugins: {
      legend: { display: true, position: 'top' },
      tooltip: {
        callbacks: {
          label: (context) => `ผลงาน: ${context.parsed.y.toFixed(2)}%`
        }
      }
    }
  };

  public barChartType: ChartType = 'bar';
  public barChartData: ChartData<'bar'> = {
    labels: [],
    datasets: [
      { data: [], label: 'ผลการดำเนินงานเฉลี่ย', backgroundColor: '#0d9488', hoverBackgroundColor: '#115e59' }
    ]
  };

  constructor(private api: ApiService, private router: Router) {}

  ngOnInit(): void {
    this.loadKpiList();
    this.loadChartData();
  }

  // โหลดรายชื่อตัวชี้วัดใส่ Dropdown
  loadKpiList() {
    this.api.getKpiStructure().subscribe((res: any) => {
      if (res.success) {
        // ยุบโครงสร้างให้เหลือแค่ List ของ Items
        this.kpiList = [];
        res.data.forEach((issue: any) => {
          issue.groups.forEach((group: any) => {
            group.subs.forEach((sub: any) => {
              sub.items.forEach((item: any) => {
                this.kpiList.push({ id: item.id, name: item.label });
              });
            });
          });
        });
      }
    });
  }

  // โหลดข้อมูลกราฟ
  loadChartData() {
    // เรียก API ที่เราสร้างในขั้นตอนที่ 1
    // (หมายเหตุ: คุณต้องเพิ่มฟังก์ชัน getDistrictStats ใน api.service.ts ด้วย หรือใช้ this.api.get(...) ตรงๆ ถ้าทำ generic ไว้)
    const url = `dashboard/district-stats?fiscalYear=${this.fiscalYear}&kpiId=${this.selectedKpi}`;
    
    // สมมติว่า api service มี method get
    this.api.get(url).subscribe((res: any) => {
      if (res.success) {
        const labels = res.data.map((d: any) => d.amphoe_name);
        const data = res.data.map((d: any) => parseFloat(d.avg_percent).toFixed(2));

        this.barChartData.labels = labels;
        this.barChartData.datasets[0].data = data;
        this.barChartData.datasets[0].label = this.selectedKpi === 'all' ? 'ภาพรวมทุกตัวชี้วัด (%)' : 'ผลงานรายตัวชี้วัด (%)';

        this.chart?.update();
      }
    });
  }

  // ฟังก์ชันนำทาง
  goToEntry() {
    this.router.navigate(['/dashboard']); // ไปหน้าบันทึก
  }
  
logout() {
    Swal.fire({
      title: 'ยืนยันการออกจากระบบ?',
      text: 'คุณต้องการออกจากระบบใช่หรือไม่?',
      icon: 'question', // ใช้ไอคอนคำถาม (หรือ 'warning' ก็ได้)
      showCancelButton: true, // เปิดปุ่มยกเลิก
      confirmButtonColor: '#d33', // สีปุ่มยืนยัน (สีแดง)
      cancelButtonColor: '#3085d6', // สีปุ่มยกเลิก (สีน้ำเงิน)
      confirmButtonText: 'ใช่, ออกจากระบบ',
      cancelButtonText: 'ยกเลิก',
      reverseButtons: true // สลับฝั่งปุ่มให้ ยกเลิก อยู่ซ้าย ยืนยัน อยู่ขวา (Optional)
    }).then((result) => {
      
      // ถ้าผู้ใช้กดปุ่ม "ใช่, ออกจากระบบ"
      if (result.isConfirmed) {
        
        // 1. ล้างข้อมูลในเครื่อง
        localStorage.clear();
        sessionStorage.clear();
        
        // 2. เด้งกลับไปหน้า Login
        this.router.navigate(['/login']);
        
      }
      // ถ้ากดยกเลิก Popup จะปิดไปเองโดยไม่ต้องเขียนโค้ดเพิ่มครับ
    });
  }
}