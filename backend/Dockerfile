# ใช้ Node.js version 22 (หรือเวอร์ชันที่คุณใช้อยู่)
FROM node:22-alpine

# กำหนด Folder ทำงานใน Container
WORKDIR /app

# Copy ไฟล์ package.json เข้าไปก่อน เพื่อ install dependencies
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# Copy โค้ดทั้งหมดเข้าไป
COPY . .

# เปิด Port 3000 (Port ภายใน Container)
EXPOSE 3008

# คำสั่งรัน Server
CMD ["npm", "start"]