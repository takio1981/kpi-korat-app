#!/bin/bash

# กำหนดสีข้อความ
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=================================================${NC}"
echo -e "${YELLOW}   KORAT KPI APP - DEPLOYMENT SCRIPT (AUTO)      ${NC}"
echo -e "${YELLOW}=================================================${NC}"

# 1. หยุดระบบเก่า
echo -e "\n${YELLOW}[STEP 1/3] หยุดระบบเดิมและล้าง Container เก่า...${NC}"
docker compose down -v
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔ หยุดระบบสำเร็จ${NC}"
else
    echo -e "${RED}✘ เกิดข้อผิดพลาดในการหยุดระบบ${NC}"
    exit 1
fi

# 2. Build Image ใหม่ (เผื่อมีการแก้โค้ด)
echo -e "\n${YELLOW}[STEP 2/3] กำลัง Build ระบบ Backend และ Frontend ใหม่...${NC}"
echo -e "${YELLOW}(ขั้นตอนนี้อาจใช้เวลา 2-5 นาที โปรดรอ...)${NC}"
docker compose build
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔ Build Image สำเร็จ${NC}"
else
    echo -e "${RED}✘ Build ไม่ผ่าน กรุณาเช็ค Error ด้านบน${NC}"
    exit 1
fi

# 3. เริ่มต้นระบบ
echo -e "\n${YELLOW}[STEP 3/3] เริ่มต้นระบบ (Start Containers)...${NC}"
docker compose up -d --build
if [ $? -eq 0 ]; then
    echo -e "${GREEN}=================================================${NC}"
    echo -e "${GREEN}   ✔ DEPLOYMENT SUCCESSFUL! (เสร็จสมบูรณ์)       ${NC}"
    echo -e "${GREEN}=================================================${NC}"
    echo -e "เข้าใช้งานได้ที่: ${YELLOW}http://localhost:8088${NC} (หรือ IP เครื่องนี้)"
    echo -e "ตรวจสอบสถานะ:   ${YELLOW}docker compose ps${NC}"
else
    echo -e "${RED}✘ ไม่สามารถเริ่มระบบได้${NC}"
    exit 1
fi