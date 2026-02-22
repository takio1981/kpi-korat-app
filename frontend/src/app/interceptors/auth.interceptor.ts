import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';
import Swal from 'sweetalert2';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const router = inject(Router);

  // ดักจับการตอบกลับจาก Backend API
  return next(req).pipe(
    catchError((error) => {
      
      // 🚨 ถ้าโดนจับได้ว่า Token หมดอายุ หรือไม่มีสิทธิ์ (401 Unauthorized)
      if (error.status === 401) {
        
        localStorage.clear();
        sessionStorage.clear();
        Swal.close(); // ปิด Loading เผื่อค้างอยู่

        Swal.fire({
          icon: 'error',
          title: 'Session หมดอายุ',
          text: 'ความปลอดภัยระบบ: กรุณาเข้าสู่ระบบใหม่อีกครั้ง',
          confirmButtonText: 'ตกลง',
          allowOutsideClick: false // บังคับให้กดปุ่มตกลงเท่านั้น
        }).then(() => {
          router.navigate(['/login']);
        });
      }

      return throwError(() => error);
    })
  );
};