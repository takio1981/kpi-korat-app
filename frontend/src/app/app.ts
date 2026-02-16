import { Component, HostListener, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, Router } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  template: `<router-outlet></router-outlet>`
})
export class App implements OnInit {
  private timeoutId: any;
  private readonly IDLE_TIMEOUT = 15 * 60 * 1000; // 15 นาที

  constructor(private router: Router) {}

  ngOnInit() {
    this.resetTimer();
  }

  @HostListener('window:mousemove') 
  @HostListener('window:click') 
  @HostListener('window:keypress') 
  @HostListener('window:scroll') 
  refreshUserState() {
    this.resetTimer();
  }

  resetTimer() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
    }

    // ตรวจสอบว่าอยู่ในหน้า Browser จริงๆ (ป้องกัน Error ตอนรัน Server)
    if (typeof window !== 'undefined' && localStorage) {
      const isLoggedIn = !!localStorage.getItem('currentUser');
      // ถ้า Login อยู่ ให้เริ่มนับเวลา
      if (isLoggedIn) {
        this.timeoutId = setTimeout(() => {
          this.logout();
        }, this.IDLE_TIMEOUT);
      }
    }
  }

  logout() {
    // ตรวจสอบอีกครั้งว่าไม่ได้อยู่หน้า Login แล้ว
    if (this.router.url !== '/login' && this.router.url !== '/') {
      console.log('Session expired.');
      localStorage.removeItem('currentUser');
      this.router.navigate(['/login']);
      // alert('หมดเวลาการใช้งาน กรุณาเข้าสู่ระบบใหม่'); // ปิด alert ไว้ก่อนเพื่อป้องกัน Loop
    }
  }
}