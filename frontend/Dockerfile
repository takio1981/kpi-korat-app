# --- Stage 1: Build Angular ---
FROM node:22-alpine as builder

WORKDIR /app

# Copy ไฟล์ package.json และติดตั้ง library
COPY package*.json ./
# เพิ่ม allowedCommonJsDependencies ใน angular.json ก่อน build จะดีมาก (ตามที่เคยแก้)
RUN npm install --legacy-peer-deps

# Copy โค้ดทั้งหมด
COPY . .

# สั่ง Build เป็น Production Mode (ปิด font inline เพื่อแก้ปัญหาเน็ตองค์กร)
# --base-href /kpikorat/ : สำคัญมาก!
RUN npx ng build --configuration production --base-href /kpikorat/

# --- Stage 2: Run with Nginx ---
FROM nginx:alpine

# ลบ config เดิมของ nginx ทิ้ง
RUN rm /etc/nginx/conf.d/default.conf

# Copy ไฟล์ nginx.conf ที่เราสร้างใน Step 1 เข้าไป
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy ไฟล์ที่ Build เสร็จจาก Stage 1 มาวางใน Nginx
# หมายเหตุ: Angular 17+ จะ build ลง dist/ชื่อโปรเจกต์/browser
# ให้แก้ 'frontend' ให้ตรงกับชื่อโปรเจกต์ใน angular.json ของคุณ
COPY --from=builder /app/dist/frontend/browser /usr/share/nginx/html/kpikorat

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]