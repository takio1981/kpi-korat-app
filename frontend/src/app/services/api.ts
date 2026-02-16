import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class ApiService {
  // ตรวจสอบ Port ให้ตรงกับ docker-compose (3000)
  private apiUrl = environment.apiUrl; 

  constructor(private http: HttpClient) {}

  login(data: any) { return this.http.post(`${this.apiUrl}/login`, data); }
  getKpiStructure() { return this.http.get(`${this.apiUrl}/kpi-structure`); }
  getKpiData(userId: number, year: number) { return this.http.get(`${this.apiUrl}/kpi-data?userId=${userId}&fiscalYear=${year}`); }
  saveBatch(data: any) { return this.http.post(`${this.apiUrl}/kpi-data/batch`, data); }
  getAmphoes() { return this.http.get(`${this.apiUrl}/admin/amphoes`); }
  getAdminSummary(year: number, amphoe: string) { return this.http.get(`${this.apiUrl}/admin/summary?fiscalYear=${year}&amphoe=${amphoe}`); }
// เพิ่มฟังก์ชันสำหรับเรียก URL แบบกำหนดเอง
  get(endpoint: string) { return this.http.get(`${this.apiUrl}/${endpoint}`); }

}