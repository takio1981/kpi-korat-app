import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';
import Swal from 'sweetalert2';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  // ✅ ในแบบ Functional เราใช้ inject() เพื่อเรียกใช้ Router
  const router = inject(Router);

  return next(req).pipe(
    catchError((error) => {
      
      // 🚨 ดักจับ Error 401 (Unauthorized / Token หมดอายุ)
      if (error.status === 401) {
        console.warn('⚠️ 401 Unauthorized detected inside Functional Interceptor');

        // 1. ล้าง Token
        localStorage.clear();
        sessionStorage.clear();

        // 2. ปิด Loading (ถ้ามี)
        Swal.close();

        // 3. แจ้งเตือนและดีดออก
        Swal.fire({
          icon: 'warning',
          title: 'Session หมดอายุ',
          text: 'กรุณาเข้าสู่ระบบใหม่',
          confirmButtonText: 'ตกลง',
          allowOutsideClick: false
        }).then(() => {
          router.navigate(['/login']);
        });
      }

      return throwError(() => error);
    })
  );
};