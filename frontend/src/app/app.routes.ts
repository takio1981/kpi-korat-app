import { Routes } from '@angular/router';
import { LoginComponent } from './login/login';
import { DashboardComponent } from './dashboard/dashboard';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard';
import { DistrictDashboardComponent } from './district-dashboard/district-dashboard';

export const routes: Routes = [
    { path: '', redirectTo: 'login', pathMatch: 'full' }, // เข้ามาหน้าแรกให้ไป Login
    { path: 'login', component: LoginComponent },
    { path: 'overview', component: DistrictDashboardComponent },
    { path: 'dashboard', component: DashboardComponent },
    { path: 'admin-dashboard', component: AdminDashboardComponent }
];