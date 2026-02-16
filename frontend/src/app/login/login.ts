import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from '../services/api';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.html'
})
export class LoginComponent {
  username = '';
  password = '';

  constructor(private api: ApiService, private router: Router) {}

  onLogin() {
    this.api.login({ username: this.username, password: this.password }).subscribe({
      next: (res: any) => {
        if (res.success) {
          localStorage.setItem('currentUser', JSON.stringify(res.user));
          
          // 2. Alert ยินดีต้อนรับ (Toast มุมขวาบน)
          const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true
          });
          Toast.fire({
            icon: 'success',
            title: 'เข้าสู่ระบบสำเร็จ'
          });

          // --- ตรวจสอบ Role ตรงนี้ ---
          if (res.user.role === 'admin') {
            this.router.navigate(['/admin-dashboard']); // Admin ไปหน้าสรุป
          } else {
            this.router.navigate(['/overview']); // User ไปหน้าบันทึก
          }
          // ------------------------
        }
      },
      error: (err: any) => {
        // 3. Alert แจ้งเตือน Error สวยๆ
        Swal.fire({
          icon: 'error',
          title: 'เข้าสู่ระบบไม่สำเร็จ',
          text: 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง',
          confirmButtonColor: '#d33',
          confirmButtonText: 'ลองใหม่อีกครั้ง'
        });
      }
    });
  }
}