SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kpi_issues
-- ----------------------------
DROP TABLE IF EXISTS kpi_issues;
CREATE TABLE kpi_issues  (
  id int NOT NULL AUTO_INCREMENT,
  issue_no int NOT NULL COMMENT 'เลขข้อย่อย (1-6)',
  name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อประเด็นหลัก',
  PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kpi_issues
-- ----------------------------
INSERT INTO kpi_issues VALUES (1, 1, '1. เด็กโคราชฉลาด IQ ดีฯ');
INSERT INTO kpi_issues VALUES (2, 2, '2. โรคไม่ติดต่อ (NCDs)');
INSERT INTO kpi_issues VALUES (3, 3, '3. ปลอดโรคพิษสุนัขบ้า');
INSERT INTO kpi_issues VALUES (4, 4, '4. สุขภาพจิต/ยาเสพติด');
INSERT INTO kpi_issues VALUES (5, 5, '5. สิ่งแวดล้อม');
INSERT INTO kpi_issues VALUES (6, 6, '6. อาหารปลอดภัย');

-- ----------------------------
-- Table structure for kpi_items
-- ----------------------------
DROP TABLE IF EXISTS kpi_items;
CREATE TABLE kpi_items  (
  id int NOT NULL COMMENT 'ใช้เลขข้อ 1-31 ตาม Excel เป็น ID เลย',
  sub_activity_id int NOT NULL,
  name text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อรายการข้อมูล (Indicators)',
  unit varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'หน่วยนับ',
  target_value varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'เป้าหมายรายข้อ (ถ้ามี)',
  PRIMARY KEY (id) USING BTREE,
  INDEX sub_activity_id(sub_activity_id ASC) USING BTREE,
  CONSTRAINT kpi_items_ibfk_1 FOREIGN KEY (sub_activity_id) REFERENCES kpi_sub_activities (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kpi_items
-- ----------------------------
INSERT INTO kpi_items VALUES (1, 1, 'จำนวน ศพด. ที่มีการหยอดยาน้ำเสริมธาตุเหล็ก', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (2, 1, 'จำนวนเด็กใน ศพด. ที่ได้รับยาน้ำเสริมธาตุเหล็ก', 'คน', NULL);
INSERT INTO kpi_items VALUES (3, 1, 'จำนวน รร.อนุบาล ที่มีการหยอดยาน้ำเสริมธาตุเหล็ก', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (4, 1, 'จำนวนเด็กใน รร.อนุบาล ที่ได้รับยาน้ำเสริมธาตุเหล็ก', 'คน', NULL);
INSERT INTO kpi_items VALUES (5, 1, 'จำนวนเด็กในชุมชนที่ได้รับยาน้ำเสริมธาตุเหล็กโดย อสม.', 'คน', NULL);
INSERT INTO kpi_items VALUES (6, 2, 'จำนวน ศพด. ที่จัดกิจกรรมส่งเสริม IQ (2222)', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (7, 2, 'จำนวนเด็กใน ศพด. ที่เข้าร่วมกิจกรรม', 'คน', NULL);
INSERT INTO kpi_items VALUES (8, 2, 'จำนวน รร.อนุบาล ที่จัดกิจกรรมส่งเสริม IQ (2222)', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (9, 2, 'จำนวนเด็กใน รร.อนุบาล ที่เข้าร่วมกิจกรรม', 'คน', NULL);
INSERT INTO kpi_items VALUES (10, 3, 'จำนวน ศพด. ที่มีการชั่งน้ำหนัก/วัดส่วนสูง', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (11, 3, 'จำนวนเด็กใน ศพด. ที่ได้รับการชั่งน้ำหนัก', 'คน', NULL);
INSERT INTO kpi_items VALUES (12, 3, 'จำนวนเด็กใน ศพด. ที่มีรูปร่างสมส่วน (ปกติ)', 'คน', NULL);
INSERT INTO kpi_items VALUES (13, 3, 'จำนวน รร.อนุบาล ที่มีการชั่งน้ำหนัก/วัดส่วนสูง', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (14, 3, 'จำนวนเด็กใน รร.อนุบาล ที่ได้รับการชั่งน้ำหนัก', 'คน', NULL);
INSERT INTO kpi_items VALUES (15, 3, 'จำนวนเด็กใน รร.อนุบาล ที่มีรูปร่างสมส่วน (ปกติ)', 'คน', NULL);
INSERT INTO kpi_items VALUES (16, 4, 'จำนวนผู้ป่วยเบาหวานที่เข้าเรียนในโรงเรียนเบาหวาน', 'คน', NULL);
INSERT INTO kpi_items VALUES (17, 5, 'จำนวนผู้ป่วยเบาหวานที่เข้าสู่ระยะสงบ (DM Remission)', 'คน', NULL);
INSERT INTO kpi_items VALUES (18, 6, 'จำนวน ปชช.(15ปี+) ที่ได้รับความรู้/ปรับพฤติกรรม', 'คน', NULL);
INSERT INTO kpi_items VALUES (19, 7, 'จำนวนผู้สัมผัสโรคพิษสุนัขบ้า', 'คน', NULL);
INSERT INTO kpi_items VALUES (20, 7, 'จำนวนผู้สัมผัสโรคที่ได้รับวัคซีนครบชุด', 'คน', NULL);
INSERT INTO kpi_items VALUES (21, 8, 'จำนวน อปท. ที่มีการฉีดวัคซีนสุนัข-แมว', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (22, 8, 'จำนวนสุนัขและแมวที่ได้รับการฉีดวัคซีน', 'ตัว', NULL);
INSERT INTO kpi_items VALUES (23, 9, 'จำนวนโรงเรียนมัธยมที่เข้าร่วมโครงการ', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (24, 9, 'จำนวนครูที่ได้รับการอบรมทักษะการให้คำปรึกษา', 'คน', NULL);
INSERT INTO kpi_items VALUES (25, 9, 'จำนวนนักเรียนที่ได้รับการคัดกรองสุขภาพจิต', 'คน', NULL);
INSERT INTO kpi_items VALUES (26, 9, 'จำนวนแกนนำนักเรียน (YC) ที่ผ่านการอบรม', 'คน', NULL);
INSERT INTO kpi_items VALUES (27, 10, 'จำนวน อปท. มีระบบบำบัดสิ่งปฏิกูล (อย่างน้อย1แห่ง/อ.)', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (28, 11, 'จำนวน อปท./หมู่บ้าน ที่ผ่านเกณฑ์ประปา 3C', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (29, 12, 'จำนวนร้านค้าชุมชน/ตลาด ที่ได้รับการตรวจ', 'แห่ง', NULL);
INSERT INTO kpi_items VALUES (30, 12, 'จำนวนตัวอย่างอาหารที่ตรวจสารปนเปื้อน (6 ชนิด)', 'ตัวอย่าง', NULL);
INSERT INTO kpi_items VALUES (31, 13, 'จำนวนร้านอาหารที่ผ่านเกณฑ์มาตรฐาน SAN', 'แห่ง', NULL);

-- ----------------------------
-- Table structure for kpi_main_indicators
-- ----------------------------
DROP TABLE IF EXISTS kpi_main_indicators;
CREATE TABLE kpi_main_indicators  (
  id int NOT NULL AUTO_INCREMENT,
  issue_id int NOT NULL,
  name text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อตัวชี้วัดหลัก',
  target_label varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ค่าเป้าหมาย (Text)',
  PRIMARY KEY (id) USING BTREE,
  INDEX issue_id(issue_id ASC) USING BTREE,
  CONSTRAINT kpi_main_indicators_ibfk_1 FOREIGN KEY (issue_id) REFERENCES kpi_issues (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kpi_main_indicators
-- ----------------------------
INSERT INTO kpi_main_indicators VALUES (1, 1, '1.เด็ก 0-5 ปี ได้รับยาน้ำเสริมธาตุเหล็กทุกสัปดาห์', '85');
INSERT INTO kpi_main_indicators VALUES (2, 1, '2.เด็ก 0-5 ปี มีรูปร่างสมส่วน (ส่งเสริม)', '72');
INSERT INTO kpi_main_indicators VALUES (3, 2, '3.ร้อยละ 10 ของผู้ป่วยเบาหวานในพื้นที่เข้ารับการปรับเปลี่ยนพฤติกรรมสุขภาพด้วยหลักสูตรโรงเรียนเบาหวาน (NCD)', '10');
INSERT INTO kpi_main_indicators VALUES (4, 2, '4.มีผลลัพธ์ผู้ป่วยเบาหวานเข้าสู่ระยะสงบ (DM Remission) มากกว่าหรือเท่ากับ ร้อยละ 1 (NCD)', '1');
INSERT INTO kpi_main_indicators VALUES (5, 2, '5.ประชาชนอายุ 15 ปีขึ้นไป มีความรู้เรื่องการปรับเปลี่ยนพฤติกรรมสุขภาพเพื่อลดความเสี่ยงในการป่วยด้วยโรคเบาหวานและความดันโลหิตสูง (ปฐมภูมิ)', '80');
INSERT INTO kpi_main_indicators VALUES (6, 3, '6.ผู้ที่สัมผัสโรคจะได้รับการฉีดวัคซีนป้องกัน ตามแนวทางเวชปฏิบัติ ร้อยละ 100 (คร)', '100');
INSERT INTO kpi_main_indicators VALUES (7, 3, '7.อัตราความครอบคลุมการฉีดวัคซีนในสุนัขและแมว อย่างน้อยร้อยละ 80 (คร)', '80');
INSERT INTO kpi_main_indicators VALUES (8, 4, '8.อัตราการฆ่าตัวตายสำเร็จไม่เกิน 7.8 ต่อประชากรแสนคน (ยสต)', '7.8');
INSERT INTO kpi_main_indicators VALUES (9, 5, '9.องค์กรปกครองส่วนท้องถิ่นดำเนินการก่อสร้างระบบบำบัดสิ่งปฏิกูลจากรถสูบส้วมอย่างน้อย อำเภอละ 1 แห่ง (อวล)', '100');
INSERT INTO kpi_main_indicators VALUES (10, 5, '10.องค์กรปกครองส่วนท้องถิ่นพัฒนาระบบประปาหมู่บ้านผ่านมาตรฐานประปาสะอาด 3 C (clear clean chlorine) กรมอนามัย อย่างน้อยอำเภอละ 1 แห่ง (อวล)', '100');
INSERT INTO kpi_main_indicators VALUES (11, 6, '11.อัตราความครอบคลุมอำเภอที่มีการจัดการความเสี่ยงสารตกค้างยาฆ่าแมลงในผักผลไม้ แบบบูรณาการ ร้อยละ 100(คบส)', '100');
INSERT INTO kpi_main_indicators VALUES (12, 6, '12.อัตราความครอบคลุมสถานที่จำหน่ายอาหารผ่านเกณฑ์ SAN ร้อยละ 85 (คบส)', '85');

-- ----------------------------
-- Table structure for kpi_records
-- ----------------------------
DROP TABLE IF EXISTS kpi_records;
CREATE TABLE kpi_records  (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL COMMENT 'เชื่อมโยงกับตาราง users',
  hospcode VARCHAR(5) NOT NULL COMMENT 'รหัสหน่วยบริการ',
  fiscal_year int NOT NULL COMMENT 'ปีงบประมาณ (เช่น 2569)',
  report_month int NOT NULL COMMENT 'เดือนตามปฏิทิน (1-12)',
  report_year_ad int NOT NULL COMMENT 'ปี ค.ศ. ของเดือนนั้นๆ (เช่น 2025, 2026)',
  kpi_id int NOT NULL COMMENT 'รหัสตัวชี้วัด (ตามคอลัมน์ No. ใน Excel เช่น 1, 2, ... 27)',
  kpi_value int NULL DEFAULT 0 COMMENT 'ค่าผลงานที่บันทึก',
  recorded_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id) USING BTREE,
  UNIQUE INDEX unique_kpi_entry(user_id ASC, kpi_id ASC, report_month ASC, report_year_ad ASC) USING BTREE,
  INDEX kpi_id(kpi_id ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kpi_records
-- ----------------------------
INSERT INTO kpi_records VALUES (44, 423, '00018', 2569, 10, 2025, 1, 1, '2026-02-06 14:53:08');
INSERT INTO kpi_records VALUES (45, 423, '00018', 2569, 10, 2025, 2, 2, '2026-02-06 14:53:08');
INSERT INTO kpi_records VALUES (46, 423, '00018', 2569, 10, 2025, 3, 3, '2026-02-06 14:53:08');
INSERT INTO kpi_records VALUES (47, 423, '00018', 2569, 10, 2025, 4, 4, '2026-02-06 14:53:08');
INSERT INTO kpi_records VALUES (48, 423, '00018', 2569, 10, 2025, 5, 5, '2026-02-06 14:53:09');

-- ----------------------------
-- Table structure for kpi_sub_activities
-- ----------------------------
DROP TABLE IF EXISTS kpi_sub_activities;
CREATE TABLE kpi_sub_activities  (
  id int NOT NULL AUTO_INCREMENT,
  main_ind_id int NOT NULL,
  name varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อกิจกรรมย่อย (เช่น 1.1 เสริมธาตุเหล็ก)',
  PRIMARY KEY (id) USING BTREE,
  INDEX main_ind_id(main_ind_id ASC) USING BTREE,
  CONSTRAINT kpi_sub_activities_ibfk_1 FOREIGN KEY (main_ind_id) REFERENCES kpi_main_indicators (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kpi_sub_activities
-- ----------------------------
INSERT INTO kpi_sub_activities VALUES (1, 1, '1.1 เสริมธาตุเหล็ก');
INSERT INTO kpi_sub_activities VALUES (2, 2, '1.2 ส่งเสริม IQ');
INSERT INTO kpi_sub_activities VALUES (3, 2, '1.3 ภาวะโภชนาการ');
INSERT INTO kpi_sub_activities VALUES (4, 3, '2.1 โรงเรียนเบาหวาน');
INSERT INTO kpi_sub_activities VALUES (5, 4, '2.1 โรงเรียนเบาหวาน');
INSERT INTO kpi_sub_activities VALUES (6, 5, '2.2 ปรับพฤติกรรม');
INSERT INTO kpi_sub_activities VALUES (7, 6, '3.1 การดูแลคน');
INSERT INTO kpi_sub_activities VALUES (8, 7, '3.2 การดูแลสัตว์');
INSERT INTO kpi_sub_activities VALUES (9, 8, '4.1 โรงเรียนสร้างสุข');
INSERT INTO kpi_sub_activities VALUES (10, 9, '5.1 สิ่งปฏิกูล');
INSERT INTO kpi_sub_activities VALUES (11, 10, '5.2 น้ำประปา 3C');
INSERT INTO kpi_sub_activities VALUES (12, 11, '6.1 สารปนเปื้อน');
INSERT INTO kpi_sub_activities VALUES (13, 12, '6.2 มาตรฐาน SAN');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users  (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อผู้ใช้ (เช่น รหัสหน่วยงาน)',
  password_hash varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รหัสผ่านที่เข้ารหัสแล้ว (SHA256)',
  hospital_name varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อหน่วยงาน (รพ.สต./รพ.)',
  amphoe_name varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'อำเภอ',
  role enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user' COMMENT 'สิทธิ์การใช้งาน',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  hospcode varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'รหัสหน่วยบริการ',
  PRIMARY KEY (id) USING BTREE,
  UNIQUE INDEX username(username ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES (1, 'hosp02536', '7ee8f77876761a4d57d888599555b6642013d69308fbfe39a1466edc5aee4179', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองพลวงมะนาว', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02536');
INSERT INTO users VALUES (2, 'hosp02537', 'af4c8e6ebc1802d22c92125335705d38f826135f54b91afb53bb9ed0e26681ae', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองปรู', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02537');
INSERT INTO users VALUES (3, 'hosp02538', 'ec79a0f97ac9dde4dea05ddb8a471a8bd0fc25a4f6c3eb96de46f829408dce99', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกสูง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02538');
INSERT INTO users VALUES (4, 'hosp02539', '56c6167e2c1bffdb12118401cc9a0f1ba9cfefac73a67b85dcb8a6327dd0c938', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านพระ', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02539');
INSERT INTO users VALUES (5, 'hosp02540', 'a62cedd04a45fbb16e3fb5e61d364ba30bc50e13215c4aa2f3b753d77e7a3c85', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโตนด', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02540');
INSERT INTO users VALUES (6, 'hosp02541', '217a6be828b153af9a1de36ae7811eb7fe218763d770560953230c910fbf4f6a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองพระลาน', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02541');
INSERT INTO users VALUES (7, 'hosp02542', '2fe209f159973685d97bd4cf842ba928eeaaca950ca8411c3670d98fc777f634', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหลักร้อย', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02542');
INSERT INTO users VALUES (8, 'hosp02543', 'ba7d4abe6af775167207b53a8fc8f02a24dbf98f6bcaa86dddee4aa9fda3977f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองกระทุ่ม', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02543');
INSERT INTO users VALUES (9, 'hosp02544', '7ec1203f84a41cfecef56e688a45b76e5eee97b3271bf7d254c4589a3296b8d8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพลกรัง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02544');
INSERT INTO users VALUES (10, 'hosp02545', 'd9fe7391ff4cb804a40066db3efe5bbcea37c0f085008dac5b09b38c10aaae10', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนฝรั่ง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02545');
INSERT INTO users VALUES (11, 'hosp02546', 'fd873a9bed4bbab9fbfe5f3b489b56edd3148c22f6d5832ef4951d4b853fe0f2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขนาย', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02546');
INSERT INTO users VALUES (12, 'hosp02547', '94ba8983348da991a08964ddf82f5486d55b8d9c209105daa31a3b734522e8be', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านใหม่', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02547');
INSERT INTO users VALUES (13, 'hosp02548', '647dfc76602e7f8ef10c4369aad165803e76b0948d5c46c493c1f887d78f8753', 'โรงพยาบาลส่งเสริมสุขภาพตำบลศรีษะละเลิง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02548');
INSERT INTO users VALUES (14, 'hosp02549', 'dd44ebef7d621a146c87a4edb61d015776ccd4332852d38007c18b681bb4fec5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพุดซา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02549');
INSERT INTO users VALUES (15, 'hosp02550', '0d428e6622653f48a5da1ed1797c037ecb566c45c3ac729311b98be67dee6754', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะค่า', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02550');
INSERT INTO users VALUES (16, 'hosp02551', '71f1e92afe8893867a99ea4857756e4de639f5f64d22af2c2fc32c0a14722919', 'โรงพยาบาลส่งเสริมสุขภาพตำบลระกาย', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02551');
INSERT INTO users VALUES (17, 'hosp02553', '86b96ce4af17479a1c57fa8cc79c1c790e0f980c282a0688009ac3a8f6f16207', 'โรงพยาบาลส่งเสริมสุขภาพตำบลไชยมงคล', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02553');
INSERT INTO users VALUES (18, 'hosp02554', '4461e058b6a37ca02d4f745d02951e7500cac47dda63f12f4d2921c8aa948da6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองปลิง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02554');
INSERT INTO users VALUES (19, 'hosp02555', '22e4586cbb57c9a022fd0e5d95eb79e31a59a0a39bbafd0f2fc11b6fe867e890', 'โรงพยาบาลส่งเสริมสุขภาพตำบลยางใหญ่', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02555');
INSERT INTO users VALUES (20, 'hosp02556', 'fad91f47dd7176a68da3a28f8595cd2d85cb844f3485dd529ae60ff2f57a2c4a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสีมุม', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02556');
INSERT INTO users VALUES (21, 'hosp02557', '74a3c441d68af9555fd32ad156ceb0cea6106527b7f7bf83581e4d168de7f054', 'โรงพยาบาลส่งเสริมสุขภาพตำบลทุ่งกระโดน', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02557');
INSERT INTO users VALUES (22, 'hosp02558', '55152a32e73f4dd64e5bc607d47bfd3593bc210527febe1ceaba569f21141af0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกระฉอด', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02558');
INSERT INTO users VALUES (23, 'hosp02559', '2e14388a74452e0732e3f5de1b812900cd3002f710e90dcac884e843e5a97357', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะเริงน้อย', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02559');
INSERT INTO users VALUES (24, 'hosp02560', 'ad98553b7c0a18099ae7a68e1d064370ec7456de295d8b85345658462ff5c3b0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองไข่น้ำ', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '02560');
INSERT INTO users VALUES (25, 'hosp02561', '6792b68cf5871d2df806826bc4f17a563a3a1735ce32a1dde2daa9dfd9a42cd6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนแสนสุข', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02561');
INSERT INTO users VALUES (26, 'hosp02562', 'a90e30c61ad7fce0a6fc78e2f6435b82e3ad26e8526f83d8456b3bb4224e6fd0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านใหญ่', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02562');
INSERT INTO users VALUES (27, 'hosp02563', 'f431986c583b53b99ff8ff6dcb0bb4ee57864d61b43125d7464c355833d81365', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเฉลียงใหญ่', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02563');
INSERT INTO users VALUES (28, 'hosp02564', '4d7d185a90b6545863b15d934cf41656969c765968fd902fd3b06af16f5f38be', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกกระชาย', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02564');
INSERT INTO users VALUES (29, 'hosp02565', '06705b5a9808b43b95a0006a978d8383812387243b5cb2b7325b0bab31eb605e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมาบกราด', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02565');
INSERT INTO users VALUES (30, 'hosp02566', 'bbaa24f884d44b97165ea5c44f53821a3f95747a1a5d4f92e0d92936c04d6dfe', 'โรงพยาบาลส่งเสริมสุขภาพตำบลจระเข้หิน', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02566');
INSERT INTO users VALUES (31, 'hosp02567', 'c63c64f6459488384816451eba51ead8bafa85f9fd88f37327f96451f2bd146a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตลิ่งชัน', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02567');
INSERT INTO users VALUES (32, 'hosp02568', 'd73fa20325edac48b2876b74e12ddbb40ceba5d5ab8687d97cb026b5cc6611ab', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมาบตะโกเอน', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02568');
INSERT INTO users VALUES (33, 'hosp02569', 'e180f531b50f9a0f06f8e93a549077e996a115170cb41f14594c24ed128c4dc5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนาราก', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02569');
INSERT INTO users VALUES (34, 'hosp02570', 'e37c8c1ea413d55894b1aa4c3609179a4ccc930c917a7b40e3eef690b472a22e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลอังโกน', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02570');
INSERT INTO users VALUES (35, 'hosp02571', '1e729aca5f06131dc1dc46fdb8a3c5883bc24eac298a820ec036a12b3ef5c0eb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนกลาง', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02571');
INSERT INTO users VALUES (36, 'hosp02572', 'f5e5d48ff7dca204028a031ea8f9ebcaec563be223b010f6cc39005c3ffb1a7c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลลำเพียก', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02572');
INSERT INTO users VALUES (37, 'hosp02573', '8acb2cc97a64a71cf71945641142bab424340b1db09c3a8ed5afcd4ffe46dad7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับระวิง', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02573');
INSERT INTO users VALUES (38, 'hosp02574', 'f018f108f645c0508e0267e93af34d48c9716f9c54e36a7c33f92b6962d0919c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับก้านเหลือง', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02574');
INSERT INTO users VALUES (39, 'hosp02575', '6e398832d3844cfa67967066151a51b9ed029b60b11a97e811f6d3e8bd1edd11', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองบัว', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02575');
INSERT INTO users VALUES (40, 'hosp02576', '21e2a49d3eb506306e08ff86b42198d95b5d08cf69867c3314e29f66c4421eb8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสระว่านพระยา', 'ครบุรี', 'user', '2026-01-29 17:05:54', '02576');
INSERT INTO users VALUES (41, 'hosp02577', '986a4216e62bff2113389a226ccc8596866c1c151ecea967d52d79012c003232', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกไม้ตาย', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02577');
INSERT INTO users VALUES (42, 'hosp02578', '55ddfb54b5541646d496539e58be72d9821a2a702c0d60c112f0042631ab4be2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสันติสุข', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02578');
INSERT INTO users VALUES (43, 'hosp02579', '17d25330301a40ab623e0bc522d4b0962ffbf39de17b0e97097e1c0f419e729e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกน้อย', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02579');
INSERT INTO users VALUES (44, 'hosp02580', '08f8bd76df24f4bf2ec4a641ba9796c06ebf17649dea9a48def4b0bbd88419cc', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุดโบสถ์', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02580');
INSERT INTO users VALUES (45, 'hosp02581', '3e072678d014aa090986a413168c80dce3f5a884eac601e837c6fe54bf7bf3ac', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสมบัติเจริญ', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02581');
INSERT INTO users VALUES (46, 'hosp02582', '56dc93045e2143c3533a4cecaf374ed0b980cefc9583c03abc656c81ca82092a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนแขวน', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02582');
INSERT INTO users VALUES (47, 'hosp02583', '188b961b481579d02aa24375c9d91a602131f4bdf9d9d333cb6f23671c8fa888', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองตูม', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02583');
INSERT INTO users VALUES (48, 'hosp02584', 'a519c18c0bea9136c3efe1a7db908fcb85e70063b4b4c48d886afab7b733a2ba', 'โรงพยาบาลส่งเสริมสุขภาพตำบลราษฎร์พัฒนา', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '02584');
INSERT INTO users VALUES (49, 'hosp02585', '86f2206be90f906f301c1fc1c7b3a31a2ca0418b3b6c54ccfe19eb0627bcbe6f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลปอปิด', 'คง', 'user', '2026-01-29 17:05:54', '02585');
INSERT INTO users VALUES (50, 'hosp02586', 'da3b188bada0a34a7dc411464decc616773e39c1dc26a6ce9cc08b33e995cad6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคูขาด', 'คง', 'user', '2026-01-29 17:05:54', '02586');
INSERT INTO users VALUES (51, 'hosp02587', '932d87a28084017eadf08eb6d2b9a50696604d5de722900f5e3287e54556ac13', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคอนเมือง', 'คง', 'user', '2026-01-29 17:05:54', '02587');
INSERT INTO users VALUES (52, 'hosp02588', 'c92b85d162f2ee4e947f73212bd96ebfe02404a8674e023ed1df6a82c7ec3464', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านวัด', 'คง', 'user', '2026-01-29 17:05:54', '02588');
INSERT INTO users VALUES (53, 'hosp02589', '87e048a7c75944a89b0f1695d5a0c7133d02244788d09232dbf8142363fcd370', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตาจั่น', 'คง', 'user', '2026-01-29 17:05:54', '02589');
INSERT INTO users VALUES (54, 'hosp02590', '3d49c469cb03da68ef3f00138b6ed0333224132c691be454e9dd4bcc8190397b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านปรางค์', 'คง', 'user', '2026-01-29 17:05:54', '02590');
INSERT INTO users VALUES (55, 'hosp02591', '71e4682eb4aeb50670b125e19ec7165e991c32061394a79774c1a5fd7ed4e38a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองม่วง', 'คง', 'user', '2026-01-29 17:05:54', '02591');
INSERT INTO users VALUES (56, 'hosp02592', 'e26d26fb15c0295055aa0a1b2819dd3029582a2128beca0605ef872964ee6c17', 'โรงพยาบาลส่งเสริมสุขภาพตำบลห้วยไหราษฎร์พัฒนา', 'คง', 'user', '2026-01-29 17:05:54', '02592');
INSERT INTO users VALUES (57, 'hosp02593', '444a337e6587fc592b33ba1581cc8773a7e9490927fe4a742618cc0a9006aa92', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนเต็ง', 'คง', 'user', '2026-01-29 17:05:54', '02593');
INSERT INTO users VALUES (58, 'hosp02594', 'b9670ed85d6b916593ba0965f341b68d81b4332b8013ccc5a3cd3e2bcfbec131', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนใหญ่', 'คง', 'user', '2026-01-29 17:05:54', '02594');
INSERT INTO users VALUES (59, 'hosp02595', 'e8dbbed447607e5f090f95d74a80fa6e5109f7a8e79a2c3ca2d222e546747b15', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขามสมบูรณ์', 'คง', 'user', '2026-01-29 17:05:54', '02595');
INSERT INTO users VALUES (60, 'hosp02596', 'd70bc4c0615284e77f0d5c6f7f9038f0d2ed7c5c8bcb7aea7e98168d8f292194', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังโพธิ์', 'บ้านเหลื่อม', 'user', '2026-01-29 17:05:54', '02596');
INSERT INTO users VALUES (61, 'hosp02597', 'e88304b3691b405807082287f8da9018e5979006b261f58cdcde4ae8d46137e1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกกระเบื้อง', 'บ้านเหลื่อม', 'user', '2026-01-29 17:05:54', '02597');
INSERT INTO users VALUES (62, 'hosp02598', '494f7a8779332e1a2dde043c7c932d079dafc83e47d4b5884349f1cd7f89faed', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตลุกพลวง', 'บ้านเหลื่อม', 'user', '2026-01-29 17:05:54', '02598');
INSERT INTO users VALUES (63, 'hosp02599', '7be053279bd04348a0c542b4c45ca91d20c0f6e38ac7097df8c07005b614b2b2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลช่อระกา', 'บ้านเหลื่อม', 'user', '2026-01-29 17:05:54', '02599');
INSERT INTO users VALUES (64, 'hosp02600', '6863834a9ec064abed6520f67b0c34c1fcbb324eacce729c8ea49221959b7581', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองบัวตะแบง', 'จักราช', 'user', '2026-01-29 17:05:54', '02600');
INSERT INTO users VALUES (65, 'hosp02601', 'bf059fb3ff28196245daddb806495f2016091d3bedee8542f69817f8b3f9205b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสีสุก', 'จักราช', 'user', '2026-01-29 17:05:54', '02601');
INSERT INTO users VALUES (66, 'hosp02602', '53d888252aea7451fc6ae823802d0e33ec8e13f0d25a761b4f7c34730b07487a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองขาม', 'จักราช', 'user', '2026-01-29 17:05:54', '02602');
INSERT INTO users VALUES (67, 'hosp02603', '0a3cacc422a1d1b30ab928029c2a0f4e9894fcd8a81e8878aa7a91dcb21e7a88', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านบุ', 'จักราช', 'user', '2026-01-29 17:05:54', '02603');
INSERT INTO users VALUES (68, 'hosp02604', 'bce478b88aed999092805bdf09f25d3e9d9e0ef93b93804a7b37c429e7df3ed3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกพระ', 'จักราช', 'user', '2026-01-29 17:05:54', '02604');
INSERT INTO users VALUES (69, 'hosp02605', '76419bd78dbcf8cf5e6de32846600f38d68982d3b4db28292811d6610d49aa51', 'โรงพยาบาลส่งเสริมสุขภาพตำบลละกอ', 'จักราช', 'user', '2026-01-29 17:05:54', '02605');
INSERT INTO users VALUES (70, 'hosp02606', '8f957eaaa68553a43143a8f79a53a41ba54fbcb8c48e8941a62f0be48e6ddab8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงพลอง', 'จักราช', 'user', '2026-01-29 17:05:54', '02606');
INSERT INTO users VALUES (71, 'hosp02607', 'cf8cbf429ca3982f810c0bdec4fa091203aa1bb1a12cafbaa809afa793560cab', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหินโคน', 'จักราช', 'user', '2026-01-29 17:05:54', '02607');
INSERT INTO users VALUES (72, 'hosp02608', '050a4dab7acb729df6f0f0105f9de4838fe54bdcf29dda68de465164149240ae', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพะโค', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02608');
INSERT INTO users VALUES (73, 'hosp02609', '43a978f897ac20eb6ccdac151624700fff73b1d145098a93f060f60550dc45d5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพลับพลา', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02609');
INSERT INTO users VALUES (74, 'hosp02610', '6e510cfa2f7490d15090aa5d29a8ed4710783aac24d9ec2b9d61273676954dc4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าอ่าง', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02610');
INSERT INTO users VALUES (75, 'hosp02611', '1eb40943bd1f75944007879ad5d1fbe10792cc5ef1a0bb06e3d84a2b1a39462a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองปรึก', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02611');
INSERT INTO users VALUES (76, 'hosp02612', '043c8d614409735c1785f8a9d7d88721ce31a8ae76c7428fc1754e986e6710f6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าลาดขาว', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02612');
INSERT INTO users VALUES (77, 'hosp02613', '3dbef344145cbcddbdbf877554ce4bca762e03d23dfe511c700ea011f9f65a0e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขี้ตุ่น', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02613');
INSERT INTO users VALUES (78, 'hosp02614', 'e6c31ff956f61d2f9767321469d567daf664e5646682d33d902c3c8ae4641906', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโจด', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02614');
INSERT INTO users VALUES (79, 'hosp02615', '47b7dd9ada8e844b50338358823df4e8a13ddfdb6c50bd4059f58504de7a4f7f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกอโจด', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02615');
INSERT INTO users VALUES (80, 'hosp02616', '2cfc413abc84ea324cec07e2c2f95ffec41260037801c2f3803f49cb7680f6af', 'โรงพยาบาลส่งเสริมสุขภาพตำบลละลม', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02616');
INSERT INTO users VALUES (81, 'hosp02617', '42a3c60a20c74fb96ecec3a3f4090f3e426fa232a01503b915d88e673bc736a9', 'โรงพยาบาลส่งเสริมสุขภาพตำบลด่านเกวียน', 'โชคชัย', 'user', '2026-01-29 17:05:54', '02617');
INSERT INTO users VALUES (82, 'hosp02618', 'f4523cca697021123610b54e75aa1cb924c71f6d661d0d1c4470183290dba954', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุดพิมาน', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02618');
INSERT INTO users VALUES (83, 'hosp02619', '550a56d5cb0a33f55e2ff6d1247863da140c8a9e9c599662bf7014d185aac494', 'โรงพยาบาลส่งเสริมสุขภาพตำบลด่านนอก', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02619');
INSERT INTO users VALUES (84, 'hosp02620', '948785fd88505de715c346fe90263c8939237c6a0bb2d3d099a89b09cc30f46e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านพระ', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02620');
INSERT INTO users VALUES (85, 'hosp02621', 'e6a7b6b57b4f9d9336b472b5cbcc94be1705d69797f22389dfeaa0cf128d4827', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตะเคียน', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02621');
INSERT INTO users VALUES (86, 'hosp02622', '65f21214509a47b612bdc506b9b22253393ef827d430b5d250d2a092cff98afe', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุดม่วง', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02622');
INSERT INTO users VALUES (87, 'hosp02623', 'de7b8fc39365a2b4a7c1429aac04c5359159a01c2f6bddd9a8d2110b4a5f4065', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังโป่ง', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02623');
INSERT INTO users VALUES (88, 'hosp02624', 'ffe8dd198ff8add471464d3d038fa99be7a84f87939fa2a4cda3429426c8f4b8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านแปรง', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02624');
INSERT INTO users VALUES (89, 'hosp02625', '7e343190da5424e7dd9e93cd1c19b2ce76b659f57d01c4073a09551e5f9dacff', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพันชนะ', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02625');
INSERT INTO users VALUES (90, 'hosp02626', '921ac252d936e3673642b2d43a44b6182d03b0b932fef35de0783b3d04e0f1d5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสระจรเข้', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02626');
INSERT INTO users VALUES (91, 'hosp02627', 'c61288d3b7221d15e059fd8466363241dccd1d6c2443a3706f7aa8f59540614c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองกราด', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02627');
INSERT INTO users VALUES (92, 'hosp02628', '70fc73510e07ae702a156823b2863076b8ee70d4bb373ea1a0fc786f8f3ce4c6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองบัวตะเกียด', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02628');
INSERT INTO users VALUES (93, 'hosp02629', '773f18fdd45c3d3c928f7318d3d434bf5eeb6dc8c2e767ff60dad163fc17d306', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองบัวละคร', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02629');
INSERT INTO users VALUES (94, 'hosp02630', 'f118dd5c69ffc203193eeeff738032ddd210223836448bb5d66b51cb9e3f1152', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหินดาด', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02630');
INSERT INTO users VALUES (95, 'hosp02631', '9309a912a16d075b4be97e7adf843b5266ab42ac538a99063c4342972134640d', 'โรงพยาบาลส่งเสริมสุขภาพตำบลห้วยจรเข้', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02631');
INSERT INTO users VALUES (96, 'hosp02632', '51730e2dcb801b59db921637864054038d3508833ea88564132feef57947a738', 'โรงพยาบาลส่งเสริมสุขภาพตำบลห้วยบง', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02632');
INSERT INTO users VALUES (97, 'hosp02633', '0e0b15a351c668c0c85d7db740a02f51808786cb75eb166c7972573e6f4e46c3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองใหญ่', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02633');
INSERT INTO users VALUES (98, 'hosp02634', 'e8f44059a4cb526e2946b1d2fea942ed6809afeec0b7d6d1c9e5030358bfd584', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับพลู', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02634');
INSERT INTO users VALUES (99, 'hosp02635', '80d56c01fe6261ba459378c51f6184caf88d170ad51f9c6afaf07b811de5ad47', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนเมืองพัฒนา', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02635');
INSERT INTO users VALUES (100, 'hosp02636', 'a9dda631bad638a6f3157df68510c435843d45e6ed14af2bbcb8a99a8b261932', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนป่าโอบ', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '02636');
INSERT INTO users VALUES (101, 'hosp02637', '05471fad841c595e1ec604fdc6ca108e7ff5e4942b08adb20eb987c4601d2e67', 'โรงพยาบาลส่งเสริมสุขภาพตำบลด่านจาก', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02637');
INSERT INTO users VALUES (102, 'hosp02638', 'a729623e9e21a6dba5480a0df3b539488afe34f70b2dba940799c528aa482df5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลใหม่นารี', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02638');
INSERT INTO users VALUES (103, 'hosp02639', '389223e3a8e4ed244a2f7830dcd00e1d2972992710e4be3040bb0744638dad92', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสำโรง', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02639');
INSERT INTO users VALUES (104, 'hosp02640', 'b4bb6bc0841d33d92cdbf13bfbd2aa126fd658998b04cdbb254392a624635547', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสระพัง', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02640');
INSERT INTO users VALUES (105, 'hosp02641', '5709eb89c980a97de9cd6a4d9f3a99ac4f7ad1aca950c677324b2623258045b6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลค้างพลู', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02641');
INSERT INTO users VALUES (106, 'hosp02642', '2fcd92c72c53bfd3c9c2f601f693c123e77cd3477660a64b6869bfaac94ec92b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านวัง', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02642');
INSERT INTO users VALUES (107, 'hosp02643', '532cc0d05d4712a3dc4e5b19961ae6818978d3f065ce32b2dee24c29347ed5f5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคูเมือง', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02643');
INSERT INTO users VALUES (108, 'hosp02644', '8e66c0c0587bbe3621e1bd67ba355785c12d49b2e763c8fda60198d0e341b4a4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสระตะเฆ่', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02644');
INSERT INTO users VALUES (109, 'hosp02645', '03070b1780cfa6f7db38d7a8b7616bf8a5a42315f52240a7b054614d701468f3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสายออ', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02645');
INSERT INTO users VALUES (110, 'hosp02647', '25b0138e12ac67f45df2d27c8f9580d6f1666bf045236c56b427b75bdae935f9', 'โรงพยาบาลส่งเสริมสุขภาพตำบลถนนโพธิ์', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02647');
INSERT INTO users VALUES (111, 'hosp02648', 'd283e2fd063ac55e211e49e3e11b9edd76d80358ba545fd25d35427c7ccf231c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองดุม', 'โนนไทย', 'user', '2026-01-29 17:05:54', '02648');
INSERT INTO users VALUES (112, 'hosp02649', '6409c99e85f3c83ca0674a610629c9ae3a5c27e4b65000527d4bfda964856275', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านใหม่กลอ', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02649');
INSERT INTO users VALUES (113, 'hosp02650', '54b43f25fff264be2b4fbcb8331e36ae9409df37660a35d1dbea1f3b121032df', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโตนด', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02650');
INSERT INTO users VALUES (114, 'hosp02651', 'd4a2d12fde4f8b77b251634c6b48143e26841061e3710272bb3427b3a75b360c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเพชร', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02651');
INSERT INTO users VALUES (115, 'hosp02652', '57f7d2956b9d473dfa323a48375fded98f1cd4c8c1167e9269e2b2644d177f2f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนชมพู', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02652');
INSERT INTO users VALUES (116, 'hosp02653', '93668760900fedabcdef101b0702f77a6dbac0faabf7b09e79ff1fd93559a9dc', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตลาดแค', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02653');
INSERT INTO users VALUES (117, 'hosp02654', '0aef68a5a361752e5dc5bd2dd47c5c32abe40fd332dc96ebc903b84d5a32d68b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหลุมข้าว', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02654');
INSERT INTO users VALUES (118, 'hosp02655', 'e3913ad03d4b7d07a14ea389be981ce98eb2886f5b664be892800ae546590c62', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่ากระทุ่ม', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02655');
INSERT INTO users VALUES (119, 'hosp02656', 'ec887243ed055fc1d3640e2a95b378f45f4c75762029b4daa8606e9c86111f21', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะค่า', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02656');
INSERT INTO users VALUES (120, 'hosp02657', 'c75e3671c23ad917f64dd4978b8bb0c4a474c381d68d5ccb38ce17acefd74db4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพลสงคราม', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02657');
INSERT INTO users VALUES (121, 'hosp02658', '9e373e08f5b6667d163387b8b00d14db71451b625774a249f9b15e0d3382c2b2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะรุม', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02658');
INSERT INTO users VALUES (122, 'hosp02659', '8919e9cdf61efe32484dd6eb62c04ce904f1a465d8ee2f85adb3e66c09561855', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเหล่า', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02659');
INSERT INTO users VALUES (123, 'hosp02660', '9071896e9631c71a374c7bc3efd4dbe65374dec3effbfb85ca8ca17f45b71b17', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านไพ', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02660');
INSERT INTO users VALUES (124, 'hosp02661', '61f8bb7302490a3687c37832d320262240f6667749829a02fb7c6a5c751b073d', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหว้า', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02661');
INSERT INTO users VALUES (125, 'hosp02662', 'c0ee3616506038199fedb0dcf4731ef7e8c27898f0f2e2272c56b7d0512a83e2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสะพาน', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02662');
INSERT INTO users VALUES (126, 'hosp02663', 'cf4a0ac2692381eea9db243c88d5ddf2bad498ec5c8efeb21748abc9fbd4bd52', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนท้าว', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02663');
INSERT INTO users VALUES (127, 'hosp02664', 'ceca461ce7474530e76fa860658263845a224b95e92b496ec15f24be7028a8d8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองตะคลอง', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02664');
INSERT INTO users VALUES (128, 'hosp02665', '7e907a8d123d6f7851b02c5fe47ea7c9130db6fd9faca334a669ba2093b9206c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนาราดพัฒนา', 'โนนสูง', 'user', '2026-01-29 17:05:54', '02665');
INSERT INTO users VALUES (129, 'hosp02666', '8531b87e5d0636e4d594598352babf2c52bc38552f483c949dd68aece0604a7d', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนเมือง', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02666');
INSERT INTO users VALUES (130, 'hosp02667', 'f36c41dceb9e7f2f41ec107528b23b8ac43446db0e8f27e1a3a737701918cc3a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านห้วย', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02667');
INSERT INTO users VALUES (131, 'hosp02668', 'e7ea390a27153c211c67e325dba80ffef2f2c9b23a320287a620053288448bad', 'โรงพยาบาลส่งเสริมสุขภาพตำบลชีวึก', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02668');
INSERT INTO users VALUES (132, 'hosp02669', '6c3647d783bd3e3d7cc0888dba655c3868fb8da1387f41d0559fa403a30543a3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองไข่น้ำ', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02669');
INSERT INTO users VALUES (133, 'hosp02670', 'd518aad01f1eb5c724332357f3616b75d0ea96220d5781dc8df43b4a2fb3d014', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหัวฟาน', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02670');
INSERT INTO users VALUES (134, 'hosp02671', 'd700d62fde71ea772b1a55ba0993afa6f6dd9b5f734cd1d565936646139eb12e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเมืองทอง', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '02671');
INSERT INTO users VALUES (135, 'hosp02672', '8ac3b7cef113e519f9897e10ccbca14c571bf85261858341c1658f60139d69db', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงบัง', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02672');
INSERT INTO users VALUES (136, 'hosp02673', 'fa47ce1f557a6d6b02c8f455fa39833253693725ce2375e701b528eec6f2982a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแจ้งน้อย', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02673');
INSERT INTO users VALUES (137, 'hosp02674', '133e684d2c76c2f3dca420a8f65ae21853d05436fcbadb328ba59b652eeff299', 'โรงพยาบาลส่งเสริมสุขภาพตำบลทองหลางน้อย', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02674');
INSERT INTO users VALUES (138, 'hosp02675', '7ca37229ae12134c69a53c26893e09a5c45f96f13d33ee757880c149aa4e2a35', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองพลวง', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02675');
INSERT INTO users VALUES (139, 'hosp02676', 'f1c49ea0cf2295a88da56175b7055b534fd74914eddc5d5675e17c62690bcfab', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคูขาด', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02676');
INSERT INTO users VALUES (140, 'hosp02677', 'cf909592d05837db209b709fcafc128f67f61aa8636a3b4b58e59e5fedce220f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนทองหลาง', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02677');
INSERT INTO users VALUES (141, 'hosp02678', '36a065f2b0e881af4aeb8bfec82e55632f79bf48a1db39be5a61527392fc732f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนชุมช้าง', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02678');
INSERT INTO users VALUES (142, 'hosp02679', '26b1bc829fc6e6b2a34ceae62eded855c59de8087dd903547fd3a0104c3ee632', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวง', 'บัวลาย', 'user', '2026-01-29 17:05:54', '02679');
INSERT INTO users VALUES (143, 'hosp02680', 'd3117e062fb2d293922e4bcf4f72c37d584608875ec36cb082987ba8159d9207', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบัวลาย', 'บัวลาย', 'user', '2026-01-29 17:05:54', '02680');
INSERT INTO users VALUES (144, 'hosp02681', 'd6f5cca1c690b5d7b60cb2af40f20dcc4f4385a94d8e6ef290c3b6e9d021b0f3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหินแห่', 'สีดา', 'user', '2026-01-29 17:05:54', '02681');
INSERT INTO users VALUES (145, 'hosp02682', '6ecfe9d3e9a422e81b3c135388b768e6c512311394f3b3679c3223b582a27471', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโพนทอง', 'สีดา', 'user', '2026-01-29 17:05:54', '02682');
INSERT INTO users VALUES (146, 'hosp02683', 'e4af4d1718642b75933d51909ff269a44eb9f3da429a76d6db04d14db260aa9c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองเชียงโข่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02683');
INSERT INTO users VALUES (147, 'hosp02684', '16ce4192346b838b1d8e06f393d684d81ebc66c54954662a9da925088d0a3fbb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกสะอาด', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02684');
INSERT INTO users VALUES (148, 'hosp02685', 'ec258a272b5488ba7b7909a886aeb659cc374d3d407af7bd5ed9c39db3429b04', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนจาน', 'บัวลาย', 'user', '2026-01-29 17:05:54', '02685');
INSERT INTO users VALUES (149, 'hosp02686', '71888862241cfff352c573ed0648dc7d23b433d4cd05d748923a2e62aa2fd983', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนกอก', 'สีดา', 'user', '2026-01-29 17:05:54', '02686');
INSERT INTO users VALUES (150, 'hosp02687', 'e4015dc50e98db6951e58bf39e38eb0a7f69790b5dfe4746d08e62fd0f63d123', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกสี', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02687');
INSERT INTO users VALUES (151, 'hosp02688', 'ce1656cdb53dd94c0fa9947051815d393c68a33b2def26b10c6337d5aa37dabf', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนคนทา', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02688');
INSERT INTO users VALUES (152, 'hosp02689', 'bd12ee12271a3664953edf310076f3781ef07bd83887948a1de5e65bac3d0401', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองจะบก', 'สีดา', 'user', '2026-01-29 17:05:54', '02689');
INSERT INTO users VALUES (153, 'hosp02691', 'f1ffdae7e06774ea39ccb88e1a621ee6921407f38bde5ebc174e3ba0d4d69656', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนประดู่', 'สีดา', 'user', '2026-01-29 17:05:54', '02691');
INSERT INTO users VALUES (154, 'hosp02692', 'ba1684788b4945b1c5464cd8c385a4f89ac2d16f4ceeb74b501a39e81079fa97', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแจ้งใหญ่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '02692');
INSERT INTO users VALUES (155, 'hosp02693', '3d263f59094b57fd605a1224c87844eddbf1bad3d703882560188e4a35b81105', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสี่เหลี่ยม', 'ประทาย', 'user', '2026-01-29 17:05:54', '02693');
INSERT INTO users VALUES (156, 'hosp02694', 'b6bee07aff12141530e374cc14eedc773d46cdf0dc717e5e2162f99e3957ae41', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนไผ่ล้อม', 'ประทาย', 'user', '2026-01-29 17:05:54', '02694');
INSERT INTO users VALUES (157, 'hosp02695', '569f1eb1dd5e20610bbb2279762a7c074b75bf30a0aaf85008c83e48c991a0f2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกสี', 'ประทาย', 'user', '2026-01-29 17:05:54', '02695');
INSERT INTO users VALUES (158, 'hosp02696', 'aa091edbc07d1a3cade0c674b5aaac9249fb1eac783d7f289876a0aa00b4561f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านประทาย', 'ประทาย', 'user', '2026-01-29 17:05:54', '02696');
INSERT INTO users VALUES (159, 'hosp02697', '16f00815053f1a0be1749d56f32d93a13d69ee15cb948720560786f10f8318b0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหัวหนอง', 'ประทาย', 'user', '2026-01-29 17:05:54', '02697');
INSERT INTO users VALUES (160, 'hosp02698', '7f50670677f231610f26dcd2be3fa70e6fb0afc84ffb187192b2e2b7ddef1c09', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสำโรง', 'ประทาย', 'user', '2026-01-29 17:05:54', '02698');
INSERT INTO users VALUES (161, 'hosp02699', 'da23bab950afeb7199c14bbc9f85e078e3decf721de99584206c0ccb62f49a90', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหันห้วยทราย', 'ประทาย', 'user', '2026-01-29 17:05:54', '02699');
INSERT INTO users VALUES (162, 'hosp02700', 'd842b3eef6d939e988dc6d3baef05d12c81ba5062e0d981b2949b22f24e14a95', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคอกหมู', 'ประทาย', 'user', '2026-01-29 17:05:54', '02700');
INSERT INTO users VALUES (163, 'hosp02701', '3f32fe4383b7778ce04563e9ea4a97eb3384da305656003d9d2486b33c666263', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหญ้าคา', 'ประทาย', 'user', '2026-01-29 17:05:54', '02701');
INSERT INTO users VALUES (164, 'hosp02702', 'fa3ae41d8f46087ca3b68b2b3343aa4bd201b1ffaa03b8aa713f46826a6d59ad', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองช่างตาย', 'ประทาย', 'user', '2026-01-29 17:05:54', '02702');
INSERT INTO users VALUES (165, 'hosp02703', 'df1345c66495f20d9df7b6a8f9da5279673e4d69d05afbe6361350c43cb48e05', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเย้ยตะแบง', 'ประทาย', 'user', '2026-01-29 17:05:54', '02703');
INSERT INTO users VALUES (166, 'hosp02704', '8edc006afd598aebaf4190c3fe1aae69527df7dc2dac3a1031a262671d361e10', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกกลาง', 'ประทาย', 'user', '2026-01-29 17:05:54', '02704');
INSERT INTO users VALUES (167, 'hosp02705', '6b18026fb45c6234e6e62cde4808a6603ca0db80de296e42e29861d744db186b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองคู', 'ประทาย', 'user', '2026-01-29 17:05:54', '02705');
INSERT INTO users VALUES (168, 'hosp02706', '5ae8a452fe2ff2f42b4a581cd2bf005a43987c5f763d8434ef3840cafe00992b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตะคุ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02706');
INSERT INTO users VALUES (169, 'hosp02707', '1449989dc6d7923d0be1c1d10bc0a3c48ddae55ee13356220f48b3616f62a299', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสุขัง', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02707');
INSERT INTO users VALUES (170, 'hosp02708', 'c1c670f88dfcdb602c3c1f0fa1e664d69f93a9bf506d552b773ad9bc403a8e32', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบุสมอ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02708');
INSERT INTO users VALUES (171, 'hosp02709', 'a5580d952ebbceff501d098e048e9418946cdb80d4d8f9033754366ae17d6e33', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขุนละคร', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02709');
INSERT INTO users VALUES (172, 'hosp02710', '97195a5d9cbae5c51620bd1abd4cfbafa77b398e557f12e1729abb824af60650', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตะขบ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02710');
INSERT INTO users VALUES (173, 'hosp02711', '7a8c4e47494afc4f17138cef6b3316ffd76f80279e4c7e4ca1d0bf7969c68bf6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลน้ำซับ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02711');
INSERT INTO users VALUES (174, 'hosp02712', '2660073ce2d220eb3b2c94ea259fea84b253f7d06478eb9689fe14f7ea0283bd', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพระเพลิง', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02712');
INSERT INTO users VALUES (175, 'hosp02713', 'e5dd41a20d64a0278ef93f7429e8e6e6ee87af14cdb19eb40d2e0f561ea4a1dc', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนกออก', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02713');
INSERT INTO users VALUES (176, 'hosp02714', '34c30856ffc7fcde7d2265736e100d5aa5ea1c4f9893d7956913003850fd87bc', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านพร้าว', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02714');
INSERT INTO users VALUES (177, 'hosp02715', '9ad4e577d0fd4ac0a9b689fffc1886c08070745564e4f4c24c4d7dfab404c39a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองปลิง', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02715');
INSERT INTO users VALUES (178, 'hosp02716', 'a4d2488cf9eeb88872c9c79504ed681ac47ff99f77d26d702c150080d2761155', 'โรงพยาบาลส่งเสริมสุขภาพตำบลงิ้ว', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02716');
INSERT INTO users VALUES (179, 'hosp02717', 'd1ffe12d8a2f1aabe43bcaf64dcca624758dd041459605a14af71296dd109e37', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโคก', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02717');
INSERT INTO users VALUES (180, 'hosp02718', '0f5c47b9f29c4c01638a7aa5146a260afeea70fc56c7bb73563efb968c37bbee', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเชียงสา', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02718');
INSERT INTO users VALUES (181, 'hosp02719', 'b9fea3412b1655a35dc42070df9029fcc236ebd56bbe800de6c06b4eb631ba95', 'โรงพยาบาลส่งเสริมสุขภาพตำบลลำนางแก้ว', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02719');
INSERT INTO users VALUES (182, 'hosp02720', '953b08646ab09489f27b43a102ba5937985cc64b3d45cf70f6361c63b816506c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองนกเขียน', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02720');
INSERT INTO users VALUES (183, 'hosp02721', 'dab84f635042866e9d6d81b617e62f364ca1f519abfcd5bf2ef9aa44eaeaaafd', 'โรงพยาบาลส่งเสริมสุขภาพตำบลปลายดาบ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02721');
INSERT INTO users VALUES (184, 'hosp02722', '4cc3ccbf91de6b85abd6ab7ba9f70041dce8d4c74d624d3ce57e120f4cc1815b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหลุมข้าว', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02722');
INSERT INTO users VALUES (185, 'hosp02723', '9954b38bff63a96e0afefbf6e7acf0692a3a6999fa0a366e5973014b7f4d91d5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนางเหริญ', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02723');
INSERT INTO users VALUES (186, 'hosp02724', 'c280a459eefe48104ffdf71bd8684006e98a5a03eac9f4cc7b747653dccd0297', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าเยี่ยม', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '02724');
INSERT INTO users VALUES (187, 'hosp02725', '4deb264fff6cf3a7c963683a59da850297d891c2b1ff1027343639977c539270', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านซึม', 'พิมาย', 'user', '2026-01-29 17:05:54', '02725');
INSERT INTO users VALUES (188, 'hosp02726', '6dee1ed50533f7ef420a5f954412c2cd266473fa9181f8ec326356ce0197e93c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสัมฤทธิ์', 'พิมาย', 'user', '2026-01-29 17:05:54', '02726');
INSERT INTO users VALUES (189, 'hosp02727', '88ffc8fc2b6f9e69faefcb79c77a284b79586acf3f85be1d9a49e8de5f9f78a6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลลุงตามัน', 'พิมาย', 'user', '2026-01-29 17:05:54', '02727');
INSERT INTO users VALUES (190, 'hosp02728', 'de7ed33efc2427b92c95cf62c64230fb5fd9fc92e5916b2c60681d71fb1f7bb2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองจิก', 'พิมาย', 'user', '2026-01-29 17:05:54', '02728');
INSERT INTO users VALUES (191, 'hosp02729', 'b283e117fc07418f02784a3ad45d3abb28cf8b08afcdb97eaff3aa49deb0f562', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเตย', 'พิมาย', 'user', '2026-01-29 17:05:54', '02729');
INSERT INTO users VALUES (192, 'hosp02730', 'bad7b28d13b121be5e85f91a5bdf21edca9066be66e1017d186492422830bae3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าหลวง', 'พิมาย', 'user', '2026-01-29 17:05:54', '02730');
INSERT INTO users VALUES (193, 'hosp02731', 'd583dc5431237c940e6b62b061b9c9b3f552cabd6bab512d678309b3567d4225', 'โรงพยาบาลส่งเสริมสุขภาพตำบลจารย์ตำรา', 'พิมาย', 'user', '2026-01-29 17:05:54', '02731');
INSERT INTO users VALUES (194, 'hosp02732', '460637af70b88dd4c3b90909e53ef06dbef6065069451651bdfea455b6cbf827', 'โรงพยาบาลส่งเสริมสุขภาพตำบลรังกาใหญ่', 'พิมาย', 'user', '2026-01-29 17:05:54', '02732');
INSERT INTO users VALUES (195, 'hosp02733', '6bb8d72e6865e6d6991b8cb1a1b05b9ed4bf04a5acec96d92138d496217e8da4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนิคมสร้างตนเอง 2', 'พิมาย', 'user', '2026-01-29 17:05:54', '02733');
INSERT INTO users VALUES (196, 'hosp02734', '47f5c725a3ca4e7513102e3bd15ce71379a14b97216f6ca87d98d456e0a26ccf', 'โรงพยาบาลส่งเสริมสุขภาพตำบลชีวาน', 'พิมาย', 'user', '2026-01-29 17:05:54', '02734');
INSERT INTO users VALUES (197, 'hosp02735', '535392a3d45de67fdbb130ca9c6f7a0c24e9e04b4920e858636b35bb1365eab7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนิคมสร้างตนเอง 1', 'พิมาย', 'user', '2026-01-29 17:05:54', '02735');
INSERT INTO users VALUES (198, 'hosp02736', '73be3e14f22f5b4cd4f39c2f1974d37561ae56374389109c143ce5258370f3ce', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหญ้าขาว', 'พิมาย', 'user', '2026-01-29 17:05:54', '02736');
INSERT INTO users VALUES (199, 'hosp02737', 'dc245353d47fb9c148b91b073af180bb84c31b8f052f47c8d504ee355d85c554', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงน้อย', 'พิมาย', 'user', '2026-01-29 17:05:54', '02737');
INSERT INTO users VALUES (200, 'hosp02738', '08d97866a6617e17b59e97878941739ff67c5e8cab8ee6a3b9c4d80174221f60', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงใหญ่', 'พิมาย', 'user', '2026-01-29 17:05:54', '02738');
INSERT INTO users VALUES (201, 'hosp02739', '5c4b0b9d693047666eff9f82560b4c78b870730da0a78ad3ac36f34dba4de20d', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะกอก', 'พิมาย', 'user', '2026-01-29 17:05:54', '02739');
INSERT INTO users VALUES (202, 'hosp02740', '7691e78806eda8c745ec721f0d6e186742e5b8d032e371edd72e0bb8384679e1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะค่าระเว', 'พิมาย', 'user', '2026-01-29 17:05:54', '02740');
INSERT INTO users VALUES (203, 'hosp02741', '002f5a9a6c92d0b6ad55c96d178fa45e457199d3d5ef7a1ef55b08353a86ed95', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองขาม', 'พิมาย', 'user', '2026-01-29 17:05:54', '02741');
INSERT INTO users VALUES (204, 'hosp02742', '22fbd8b672680eddeb45aed89fe93b698f6a98bb29cda1bbc3e745c24345ada3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองระเวียง', 'พิมาย', 'user', '2026-01-29 17:05:54', '02742');
INSERT INTO users VALUES (205, 'hosp02743', '70a9cea9207e97859af1830ae3682c88bd4731ba01ca302ecf75a65b87dbe7e0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลทับสวาย', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02743');
INSERT INTO users VALUES (206, 'hosp02744', '602315504323c1c2665d7f543f830c44f20784f63884f215117d0f8d80767b57', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนทอง', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02744');
INSERT INTO users VALUES (207, 'hosp02745', '7ed68e4143c0bbbbf3457d7b90c5a7c15b336c9eef97afc813348c95272236a5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าลี่', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02745');
INSERT INTO users VALUES (208, 'hosp02746', '65206fe81314814d35e17494e954c523dd1f48f08133306e69247f82f532b61a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลไผ่นกเขา', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02746');
INSERT INTO users VALUES (209, 'hosp02747', 'c4bfd00f8079a3f8513c87f24c7c96b985b1da0043682a9a42ee4aaf165a2a8e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองสาย', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02747');
INSERT INTO users VALUES (210, 'hosp02748', '5600f0a3562a1054fc0aa517918641ad494afb0da7fe51c6e7686b92ff7fa2f3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหินดาด', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02748');
INSERT INTO users VALUES (211, 'hosp02749', '0e1c10581dcf1ecfd0174c03647316e73cddc0b2a57e3b244d19711d3d2ea007', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองพลอง', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02749');
INSERT INTO users VALUES (212, 'hosp02750', '9688f96abe5d8cf3e0e716293745a292cf15351df7f627449a605fe7acce90c2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองม่วงใหญ่', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02750');
INSERT INTO users VALUES (213, 'hosp02751', '29d4d81784ee69a930c47990637ea7b4cbfaeac0c9391fa12b882edbc5d56d44', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองนาพัฒนา', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02751');
INSERT INTO users VALUES (214, 'hosp02752', 'fa2e3961fa61e2298cc09801f3c2595229cfe1ed1d72cca05ccf45f5420f5e5a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซ่าเลือด', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02752');
INSERT INTO users VALUES (215, 'hosp02753', '79a0989d56415e3d836eb88b00af10957fd3dc9e07eca1a305bdff9b6d6fe274', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหลุ่งประดู่', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02753');
INSERT INTO users VALUES (216, 'hosp02754', 'd97d9007b63258a8c0210fc65f01dab9d3e3048e3db57f6b096093e4ce6cb858', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตะโก', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02754');
INSERT INTO users VALUES (217, 'hosp02755', '7ddc885ceac007ed2f69103908cc0ee86167f3e9dfc3cc5a414b48ae24065408', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแต้', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '02755');
INSERT INTO users VALUES (218, 'hosp02756', '715ed3c60adb6a20b33533a00bf3b8c90bd795893019ac3e7b35302a48159c27', 'โรงพยาบาลส่งเสริมสุขภาพตำบลประสุข', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02756');
INSERT INTO users VALUES (219, 'hosp02757', '5f97fefbf55d5f59860d0763fe48f72822df71e200125fe631d8af5d886a5ccc', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านเขว้า', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02757');
INSERT INTO users VALUES (220, 'hosp02758', '92dcf6fe8c27dca8e84312f88e7cd7fbd7fa99d37b1dc6429fde3b55694fb8f8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าลาด', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02758');
INSERT INTO users VALUES (221, 'hosp02759', 'fc3a6829fb80c870372372683497a07ca6c8e73d8bae5dc02bd34e2d399c8dfb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกพะงาด', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02759');
INSERT INTO users VALUES (222, 'hosp02760', '4020b936167034c64ff9ce3ebdcbfeb332388b19ba62b4afb83498aa3e0aa68f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกหินช้าง', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02760');
INSERT INTO users VALUES (223, 'hosp02761', '7d3eb72d15c3b30424cc618b6185c1043bd038069302ec9775dcbf1dca350ce7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตาจง', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02761');
INSERT INTO users VALUES (224, 'hosp02762', '0675bb697cf6bc668b179966b1b063862215e9b666fc0985ca9917e67355d504', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองตาด', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02762');
INSERT INTO users VALUES (225, 'hosp02763', 'd1b829cab129bfd61c624ff45f4e1b1cc6362c1ae768761d9e43dc14f4da8faf', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนรัง', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02763');
INSERT INTO users VALUES (226, 'hosp02764', '1ccf6ea58d215789331cf4451843dcc62a9f6750533a959f718f912aa97cc9b8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลปฏิรูปที่ดิน', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02764');
INSERT INTO users VALUES (227, 'hosp02765', 'd00d6e4273b3c568b4dbca235b9539d62f274cd0eb107c8bb1bf35fc3384be5f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหลัก', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02765');
INSERT INTO users VALUES (228, 'hosp02766', '13ce4551b684fc121f2b0465402ab9b7e39f946d224279182faea0b78d3d8eb5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตูมใหญ่', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02766');
INSERT INTO users VALUES (229, 'hosp02767', '0cd6ffd2922e5b5926e3ee30fe4ba86734337af39ce0eb90877fc451ef1d4e24', 'โรงพยาบาลส่งเสริมสุขภาพตำบลประดู่', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '02767');
INSERT INTO users VALUES (230, 'hosp02768', '21a121733078bbcb74e2ee1b171816e88fc76f7514359f760ed2db153acea9f5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเหมือดแอ่', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02768');
INSERT INTO users VALUES (231, 'hosp02769', '11cb9c4669f1a2d103cd86af310114e69d0385e296cebf238a594ce30fa83277', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหินตั้ง', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02769');
INSERT INTO users VALUES (232, 'hosp02770', 'd18dd6f79529ac63a8496a4188910fd98a465aaa8971fce46444404fc1484730', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเมืองเก่า', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02770');
INSERT INTO users VALUES (233, 'hosp02771', 'f5459b36cb8ccd574dfa909db91d8c915b3c692ca54b754bf9ea21ef4235946b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกมะกอก', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02771');
INSERT INTO users VALUES (234, 'hosp02772', '0fb660a2f5618bc81ec1309554730c26327b7b4062de4af5a4edd1255dfc472f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนค่า', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02772');
INSERT INTO users VALUES (235, 'hosp02773', 'a1291ad4cb59bbd90b66abe5a5b98e7c7c298a0a4970eaae590c1404d7067d77', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหอย', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02773');
INSERT INTO users VALUES (236, 'hosp02774', '65c88f239dd7c7995a1cf571fe441e904e604924316bd8f32adc68c25af0acd0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโค้งยาง', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02774');
INSERT INTO users VALUES (237, 'hosp02775', '1f98f336040f4e9e17a80d8b9b9e320ad1d89a71dba51f5f5be2625d4a282330', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะเกลือเก่า', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02775');
INSERT INTO users VALUES (238, 'hosp02776', '263b4ce1d0d84b0823f7e66375712e0ba7d768aa8101687a0f356f63eb141e50', 'โรงพยาบาลส่งเสริมสุขภาพตำบลปลายราง', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02776');
INSERT INTO users VALUES (239, 'hosp02777', 'a16b78b117da3816b507ef4ef7ac30d08109f492759e8c6d120b66da591e895a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะเกลือใหม่', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02777');
INSERT INTO users VALUES (240, 'hosp02778', '973919b99c2382f0463a0e854622b866a6635b493b8748568e0ef145e92a7b01', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวะภูแก้ว', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02778');
INSERT INTO users VALUES (241, 'hosp02779', '3388d7fe2b2ea25fc9659c9cbca4780af361689526b8b0de22565d5dd76efaf5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนาใหญ่', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02779');
INSERT INTO users VALUES (242, 'hosp02780', '67c4f59bf1f997aa735932a9f0f33280abbe7ead5ee4bb54989471657864e6a2', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองตะไก้', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02780');
INSERT INTO users VALUES (243, 'hosp02781', '51395a414182a7d2e864e47685b59f878cbee9133784ea7b509337d730946ba3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุดจิก', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '02781');
INSERT INTO users VALUES (244, 'hosp02782', '51c5f318c21671b394b4657cb2ea6ec41db5408ce1ba680f30bf473545ce4416', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโป่งแดง', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02782');
INSERT INTO users VALUES (245, 'hosp02783', 'e7fd67d7d13b8a1190481d01213da505dc70c05ab3a1c381f6e2b466732c3789', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพันดุง', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02783');
INSERT INTO users VALUES (246, 'hosp02784', '06ea6bb3e56089b607e7348e7cd00627241e4cb8ad5b19e35e0009aecc6d1678', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกแขวน', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02784');
INSERT INTO users VALUES (247, 'hosp02785', '58198cb9ef49e69a17c63569628f6f71699a941c8dc7567d487ddeba47ca16e1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองสรวง', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02785');
INSERT INTO users VALUES (248, 'hosp02786', 'f0325aaa1d83bb965244c64a28a0ab0439e90419b416b5b7059203b68185ab12', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองตะครอง', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02786');
INSERT INTO users VALUES (249, 'hosp02787', 'e12c3e576e90aff00e19ce0c76a0d74f32dc6d717f7ce1afd8f6296576e977c6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบึงอ้อ', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '02787');
INSERT INTO users VALUES (250, 'hosp02788', '9a519d36421feb4a9780b3263fd569813990f7f870b70a2f076fc904c1217581', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหัน', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02788');
INSERT INTO users VALUES (251, 'hosp02789', '866a371a64196b954e19e472f842b16735c23ec3a84d4975ca4b3b8d1508d502', 'โรงพยาบาลส่งเสริมสุขภาพตำบลปางละกอ', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02789');
INSERT INTO users VALUES (252, 'hosp02790', '23a0d2e33292a74c8d7151720155e755c587d5158848174c281fcefb4aad1fed', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังโรงน้อย', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02790');
INSERT INTO users VALUES (253, 'hosp02791', '3f4c3e1e0d7a07f1079057f0753b0df721a348642359c19a3a5a48a2d72a39fb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลใหม่สำโรง', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02791');
INSERT INTO users VALUES (254, 'hosp02792', 'bcdc1a312fa2fec8fa47194f877bf767b2ad1d31bc3dfca2e052f1b4c9eb992d', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองตะแบก', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02792');
INSERT INTO users VALUES (255, 'hosp02793', '9161a6788ae7741c8317400d04403d136ac5e7beea677d28decf535221833e4a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองไผ่', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02793');
INSERT INTO users VALUES (256, 'hosp02794', '46b4edca8ffdf6f790b88031e3ec1f6270863d11e95fbf54cc1af92467f29591', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุดน้อย', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02794');
INSERT INTO users VALUES (257, 'hosp02795', 'f6d50031801f49774ef072e24f61385f49783d152375041dd4e62fdb1eb79173', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนเสลา', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02795');
INSERT INTO users VALUES (258, 'hosp02796', '9d96ab870695a3df51ca2a60bfe48f5722c206fa8534d85724f9ad17f8893441', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองน้ำใส', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02796');
INSERT INTO users VALUES (259, 'hosp02797', '9fef4f542aa458c53aa556ae8b72275ebe4a77bd79dbd6c104fbd4a7debbdaea', 'โรงพยาบาลส่งเสริมสุขภาพตำบลห้วยลุง', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02797');
INSERT INTO users VALUES (260, 'hosp02798', '336343448be3887ad812597a7b2b325dda292eaa976aab246baf6389aed1bdaa', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังโรงใหญ่', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02798');
INSERT INTO users VALUES (261, 'hosp02799', '81470b10a3e1b211a80b55930922ffcb807a41c23269ff77ded7d555b4803b7f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองจอก', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02799');
INSERT INTO users VALUES (262, 'hosp02800', 'eba9eb5cfa5c58742d37d9d8c257bc2bbd8b81fc86cf07438d68454e3caf475c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองไผ่', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02800');
INSERT INTO users VALUES (263, 'hosp02801', 'cecd6adaec44ecd4deb8dd186932a315e88c31fdb74779184b778bda25bbd883', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวง', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02801');
INSERT INTO users VALUES (264, 'hosp02802', 'c9dc7641c7c97f1cafaabd310e3f27d962de17ea880c0233b89404b0b87b43fe', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองกก', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '02802');
INSERT INTO users VALUES (265, 'hosp02803', '0a25327db2b7823abaa7b9188de1293ec73b8da2659fd6c87434c5441336ec78', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองมะค่า', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02803');
INSERT INTO users VALUES (266, 'hosp02804', '09a29892968112859659c4f7ee75a8046d8229824dc861cf3ee984c8c214376f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกลางดง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02804');
INSERT INTO users VALUES (267, 'hosp02805', '6d9f5338bf8e67db28f4bf8254c306b02fd859539ba22dea4c7574ed19cc23fe', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองกระทุ่ม', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02805');
INSERT INTO users VALUES (268, 'hosp02806', '980ce44b13683b653d08566590fc7c19a12b6a4509dab71a56889749fcaa86c1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองไข่น้ำ', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02806');
INSERT INTO users VALUES (269, 'hosp02807', '5201ba6543b495d6e060617ba39ab68121e7e6c0e4219cbe43e20d1bf4878fbb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังกะทะ', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02807');
INSERT INTO users VALUES (270, 'hosp02808', '16334b7848143d61144729ace848d9cb9a8a75c4386ec05941129552d913d6ce', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองขวาง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02808');
INSERT INTO users VALUES (271, 'hosp02809', '48837580959fcd19b5cbfbae85fde09b60fc1d5139501e706dbdf755ac99264c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองดินดำ', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02809');
INSERT INTO users VALUES (272, 'hosp02810', '6b10b063760c8c7a8863b6a7bfc21dc56b117e519461d4bc3251cacb299d9016', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าช้าง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02810');
INSERT INTO users VALUES (273, 'hosp02811', '9bf82f73fea5dfe549a57d822ec1841f26f2b66a61d18cb596e79bce95ff99a8', 'สถานีอนามัยเฉลิมพระเกียรติ 60 พรรษา นวมินทราชินี', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02811');
INSERT INTO users VALUES (274, 'hosp02812', 'a20f64e2ac4bcc2fe5e96dde9dcb8d744543105528fc91c6c38bd9d52d560d89', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ่อทอง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02812');
INSERT INTO users VALUES (275, 'hosp02813', 'df5a8e20adb7981bee71d4326cf501a00311f7fdb2c227b7eff5fcf6d44aa893', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขนงพระเหนือ', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02813');
INSERT INTO users VALUES (276, 'hosp02814', '74d30fc778854aa42f4352569fd8fbd19ec8f5116f717e62e0bc1bf2c9fc9434', 'โรงพยาบาลส่งเสริมสุขภาพตำบลขนงพระใต้', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02814');
INSERT INTO users VALUES (277, 'hosp02815', '2e0aa6969f57c3e0a7b3224ea4268c757f16aad485dc2bba3d64edcfcfcdf826', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองคุ้ม', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02815');
INSERT INTO users VALUES (278, 'hosp02816', '109b8443383f8e966273f394108ef4d810c0c951606e0dde3ec84dbd4157587f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองม่วง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02816');
INSERT INTO users VALUES (279, 'hosp02817', '32de6dfe2a0e2be26e9dcddeab152c41ea612d2fdae14e3f10bc8c0c4a74e5ff', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับพลู', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02817');
INSERT INTO users VALUES (280, 'hosp02818', '9ea854a5cff8b49068d4e7fbdcaeff78ebd5ebccc17e40cdb60bb548191626c3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองน้ำแดง', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02818');
INSERT INTO users VALUES (281, 'hosp02819', '6280ae323974d9d7fd00ae4ac350315c11fc9887a4cd834738ba91fa2524d6c7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังไทร', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02819');
INSERT INTO users VALUES (282, 'hosp02820', 'c349864d096548def8f0e3b05db0241c1893f877800f80e552e8583b60da3547', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับน้อย', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02820');
INSERT INTO users VALUES (283, 'hosp02821', 'a91bd031e848a329354d3192b71163d7b86f7711ed8d6159281b8392adb00cb7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนกระโดน', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '02821');
INSERT INTO users VALUES (284, 'hosp02822', 'c05686796f6b74bc530bf6b5457bc9e996554f09f6538962f9acc8f6ea5c8798', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหัวทำนบ', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02822');
INSERT INTO users VALUES (285, 'hosp02823', '5332832f786004af5c7513262ffe7c03845ae20ce69723b43aa4dd01f93a4115', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสารภี', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02823');
INSERT INTO users VALUES (286, 'hosp02824', '24e1d14f47320b6cf0e7a7560fcf6137b21e8a58eec3994a4ae1877f6b076e48', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านพระ', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02824');
INSERT INTO users VALUES (287, 'hosp02825', 'b1f667390639c9d08171ac90a56ae558c9804f2f2680b14467f3e291328a759f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลซับตะคร้อ', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02825');
INSERT INTO users VALUES (288, 'hosp02826', '3fe1babc7accfa29c2d32ccd3e0004ff0d445418600a59e24cfd57ff4080fca9', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบุกระโทก', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02826');
INSERT INTO users VALUES (289, 'hosp02827', '288f6c8e36cbd0c3a4e3af148849d18265c211eba77e5c8aac131356f9e02669', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหัวแรด', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02827');
INSERT INTO users VALUES (290, 'hosp02828', '43a47555ecb851846ce2c598ef5ada48fae4f0e516790c310796d25354058548', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองตะไก้', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02828');
INSERT INTO users VALUES (291, 'hosp02829', '3c0c173db874489092067c88b2f877627ea8e565ef1c5e180695f22c6873d120', 'โรงพยาบาลส่งเสริมสุขภาพตำบลลุงเขว้า', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02829');
INSERT INTO users VALUES (292, 'hosp02830', '679ac92b2c43d0b1ba020cbf95b2e1cd850be4fa870491319407a544e895d817', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองไม้ไผ่', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02830');
INSERT INTO users VALUES (293, 'hosp02831', '1dbe6a248e7b08fbf1e1d0e8b06d9661847d4cc8c3c480f69c25428e9c6e9250', 'โรงพยาบาลส่งเสริมสุขภาพตำบลใหม่อุดม', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '02831');
INSERT INTO users VALUES (294, 'hosp02832', '794aceeef6d424f1683e956cc883c077fe4397de9b149eab9f23f1609d393a43', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนสำราญ', 'แก้งสนามนาง', 'user', '2026-01-29 17:05:54', '02832');
INSERT INTO users VALUES (295, 'hosp02833', 'd52f0bae181bddc891d2b800d2e1c7cc0eeffaa681f8a4cecedb9f4a9b3f7dea', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนระเวียง', 'แก้งสนามนาง', 'user', '2026-01-29 17:05:54', '02833');
INSERT INTO users VALUES (296, 'hosp02834', 'da434c4adb27c52a8d373ae497d9d5dc4ea51ae2510fbd45c19bf700b228ca61', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสีสุก', 'แก้งสนามนาง', 'user', '2026-01-29 17:05:54', '02834');
INSERT INTO users VALUES (297, 'hosp02835', '5feedfe68808b26d2382ba3cbbd4f125ecf00170153771c087b0ec394f8d91f1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหัวหนอง', 'แก้งสนามนาง', 'user', '2026-01-29 17:05:54', '02835');
INSERT INTO users VALUES (298, 'hosp02836', '4fc582f6c5973d224b373925ecf1aaf8bbd68583c69c68a88a801d4d1166543b', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนตาเถร', 'โนนแดง', 'user', '2026-01-29 17:05:54', '02836');
INSERT INTO users VALUES (299, 'hosp02837', '1374a8610c69c41fa9de98a0bc2abc4dc13fa3407ba70ce895aac64df05724a0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสำพะเนียง', 'โนนแดง', 'user', '2026-01-29 17:05:54', '02837');
INSERT INTO users VALUES (300, 'hosp02838', '80266b27d4b59813e2ca244759c361716a6831c14068c4e46ba74360ae4c3823', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนยาวน้อย', 'โนนแดง', 'user', '2026-01-29 17:05:54', '02838');
INSERT INTO users VALUES (301, 'hosp02839', '7dc973af3b3add859656aa98041464cbeba148c92851f4366d7a4e7c474ccb20', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดอนยาวใหญ่', 'โนนแดง', 'user', '2026-01-29 17:05:54', '02839');
INSERT INTO users VALUES (302, 'hosp02840', 'bc16463becebc3adee12f919c4cda792d87c8870e34fa08ff8bd58cb344a5173', 'โรงพยาบาลส่งเสริมสุขภาพตำบลศาลเจ้าพ่อ', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02840');
INSERT INTO users VALUES (303, 'hosp02841', '0c00e2a05db8fc9d22a6e497f430ee63635668351e41f60fc7ba88e67d42ab7a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองทุเรียน', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02841');
INSERT INTO users VALUES (304, 'hosp02842', 'ef57eeb97081bfd816e9ea44749d62ce5b8e984d6d6463f5924a02af238cf2aa', 'โรงพยาบาลส่งเสริมสุขภาพตำบลท่าวังไทร', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02842');
INSERT INTO users VALUES (305, 'hosp02843', 'd0cfd135248851b828867d513170abc0cc66d88ead393bf0f2534e26879ce569', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบุเจ้าคุณ', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02843');
INSERT INTO users VALUES (306, 'hosp02844', '0e716e2e7a390725e303c104e9d474849c9dda56f7c0ca576cf73c9267313dcb', 'โรงพยาบาลส่งเสริมสุขภาพตำบลยุบอีปูน', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02844');
INSERT INTO users VALUES (307, 'hosp02845', 'cc9ccd4c9e8375f9b09fc7f3327704531a59afd595ffb87726149b71e459cb0c', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนสาวเอ้', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02845');
INSERT INTO users VALUES (308, 'hosp02846', '5d2ebcd3a30bdaca856c352b8cfec0c4b083b1c237304c76a5ffa65d4a8cad73', 'โรงพยาบาลส่งเสริมสุขภาพตำบลระเริง', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02846');
INSERT INTO users VALUES (309, 'hosp02847', 'c24fa098c4dabae120f4ff54b0a2aa2b9f3f9f73a0d76d02005451563faae442', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบะใหญ่', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02847');
INSERT INTO users VALUES (310, 'hosp02848', 'bae4f885f8c5d470a42fb39fe4d3d387991fd91ecf63eade7231115a7857c276', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองโสม', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02848');
INSERT INTO users VALUES (311, 'hosp02849', '82b713bfc53f19364f9a395326b704d20c387293c7d40abe69fc51849c327bc8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลไทยสามัคคี', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '02849');
INSERT INTO users VALUES (312, 'hosp02850', '6f176c2e12b6d9985c2e30aaafb83e42309fe22b8ac340f6f418e7393581afa4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสำนักตะคร้อ', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '02850');
INSERT INTO users VALUES (313, 'hosp02851', '7b3e4e341b76fd6880fba2b3388bf8d3e8813a6160d589e4b4775363a7861bf6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวง', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '02851');
INSERT INTO users VALUES (314, 'hosp02852', '960ef1c906d2c11840f5ee5e5f8319d2f17b944ba10d23597544ed12d16322c6', 'โรงพยาบาลส่งเสริมสุขภาพตำบลสะพานหิน', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '02852');
INSERT INTO users VALUES (315, 'hosp02853', 'eaf38d3953737233c7fac2ea2e16f3e7fcc88d889f70248f2664039109461331', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบึงปรือ', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '02853');
INSERT INTO users VALUES (316, 'hosp02854', '649928844b75f747df30b48dc5fad5d70fef36841cdc609fe4bf6299f60ced82', 'โรงพยาบาลส่งเสริมสุขภาพตำบลวังยายทอง', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '02854');
INSERT INTO users VALUES (317, 'hosp02855', '4595a8a9e74d8a34cebf437e659f122c856f225007a961b16c60690196c46039', 'โรงพยาบาลส่งเสริมสุขภาพตำบลลิ้นฟ้า', 'เมืองยาง', 'user', '2026-01-29 17:05:54', '02855');
INSERT INTO users VALUES (318, 'hosp02856', '66c0eea7a07998410e4dc5038f98afc37fbead133d45b565504a90cd93f67311', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกระเบื้องนอก', 'เมืองยาง', 'user', '2026-01-29 17:05:54', '02856');
INSERT INTO users VALUES (319, 'hosp02857', '08b1f198601d390c604622ba788aec75ff2a43bef501ebdc1ce3b53221ed0d55', 'โรงพยาบาลส่งเสริมสุขภาพตำบลครบุรี', 'เมืองยาง', 'user', '2026-01-29 17:05:54', '02857');
INSERT INTO users VALUES (320, 'hosp02858', '518c75d4ce72b922b0641e3e143bf6cfd583574e5f15fc2790471628a229dd56', 'โรงพยาบาลส่งเสริมสุขภาพตำบลเมืองจาก', 'เมืองยาง', 'user', '2026-01-29 17:05:54', '02858');
INSERT INTO users VALUES (321, 'hosp02860', 'bad5f5edc278e32a064a23e60a3c524cbe8e5662212faad3d76bf7af8b9767c3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมาบกราด', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '02860');
INSERT INTO users VALUES (322, 'hosp02861', 'dbc30ab8204b72618d939844aa650cf189935fd9fa7d6df60cfc55a8a220e2a7', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพังเทียม', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '02861');
INSERT INTO users VALUES (323, 'hosp02862', 'af617495e0d1544610f70d80c22bb3ce44679e571ef5fd2f26afc87920b4e94f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลทัพรั้ง', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '02862');
INSERT INTO users VALUES (324, 'hosp02863', 'f98fa983025702df9bba010742bd2fbfbbcc05c03aaaf37f756e3591a85c5678', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองหอย', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '02863');
INSERT INTO users VALUES (325, 'hosp02864', '9a52f8f20e545b8828f42f3933e619465342610572cb90decac9d870de5927f0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลทำนบพัฒนา', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '02864');
INSERT INTO users VALUES (326, 'hosp02866', '4b399f624830504e87464ff290572fe4702753c71b12d42433b6b8e4428bdc2e', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านยาง', 'ลำทะเมนชัย', 'user', '2026-01-29 17:05:54', '02866');
INSERT INTO users VALUES (327, 'hosp02867', 'f88024e86318befd64c673b3e68ac055ff3f1e5c3675e70e430108c6e80a1e41', 'โรงพยาบาลส่งเสริมสุขภาพตำบลช่องแมว', 'ลำทะเมนชัย', 'user', '2026-01-29 17:05:54', '02867');
INSERT INTO users VALUES (328, 'hosp02868', '7c83d8b23028a435c7aea3e7294596e7e8af2c5560f169454cfd33b8612b3a1a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลดงหลบ', 'ลำทะเมนชัย', 'user', '2026-01-29 17:05:54', '02868');
INSERT INTO users VALUES (329, 'hosp02869', '647834145961b8469371e649098ee754e680d1d6ed4d270d0c11daa49b4f29e4', 'โรงพยาบาลส่งเสริมสุขภาพตำบลไพล', 'ลำทะเมนชัย', 'user', '2026-01-29 17:05:54', '02869');
INSERT INTO users VALUES (330, 'hosp02870', '65a6f5bf08a460cf0ef694fc153b676a663d45ec78e63f40b5545299786958e8', 'โรงพยาบาลส่งเสริมสุขภาพตำบลมะดัน', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '02870');
INSERT INTO users VALUES (331, 'hosp02871', 'c017d84254c3f1979f614b6f55b6539f9a46c88928808b7cc336a131d72fc61f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านกรูด', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '02871');
INSERT INTO users VALUES (332, 'hosp02872', '44e55666b675a20393ec069c37a461adb0cbdff3520934f29d8d6c27bcbc0f1f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลพระพุทธ', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '02872');
INSERT INTO users VALUES (333, 'hosp02873', '79879853a852a448b80e3228c644bf9c0b45dd000d8cb70350773027b90ab055', 'โรงพยาบาลส่งเสริมสุขภาพตำบลนาตาวงษ์', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '02873');
INSERT INTO users VALUES (334, 'hosp02874', '6be671d88e8f39ab3be8bd02a3e245bf3c436b94773c5bf3286fa2e5924d46bf', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านโสง', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '02874');
INSERT INTO users VALUES (335, 'hosp10666', 'b5fffaee283e96ab2b32dc2a3d67c9e0d2258141694ca5f9153b6b1e86d5d346', 'โรงพยาบาลมหาราชนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '10666');
INSERT INTO users VALUES (336, 'hosp10871', '96d2af559dae6f3e1f96702628dd3e0239ba4a8554f9e98a2f1ea2b93869917d', 'โรงพยาบาลครบุรี', 'ครบุรี', 'user', '2026-01-29 17:05:54', '10871');
INSERT INTO users VALUES (337, 'hosp10872', 'f4257b4b803071d3c40e6fcdd00df77a9a043f21e662a01395d1c1d0dfb17cf8', 'โรงพยาบาลเสิงสาง', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '10872');
INSERT INTO users VALUES (338, 'hosp10873', 'ededdba73c15e04882433692de6963de99fbc50a81f98c24534f37e82679d3b3', 'โรงพยาบาลคง', 'คง', 'user', '2026-01-29 17:05:54', '10873');
INSERT INTO users VALUES (339, 'hosp10874', '9e9e94c9ffa39fc28143834da8de4d6cecaef9776fc38af1596362bd3554c1a2', 'โรงพยาบาลบ้านเหลื่อม', 'บ้านเหลื่อม', 'user', '2026-01-29 17:05:54', '10874');
INSERT INTO users VALUES (340, 'hosp10875', '59eb531eb08e052ba7351eff6e09c826fc00805abbd04732df6b660688d8a12c', 'โรงพยาบาลจักราช', 'จักราช', 'user', '2026-01-29 17:05:54', '10875');
INSERT INTO users VALUES (341, 'hosp10876', '5a3fbba592465dea88762c0d4d064e42bdaa31fd8ebf24179c502192a6f31419', 'โรงพยาบาลโชคชัย', 'โชคชัย', 'user', '2026-01-29 17:05:54', '10876');
INSERT INTO users VALUES (342, 'hosp10877', 'b59cd6a09c1d6a80486c8ab3dd3131e48d28a0f4aade95db8386a9a3b0883565', 'โรงพยาบาลหลวงพ่อคูณ ปริสุทฺโธ', 'ด่านขุนทด', 'user', '2026-01-29 17:05:54', '10877');
INSERT INTO users VALUES (343, 'hosp10878', '8e72147832f46b0399311940f63b6395e9e276dd0d7283532cf10add68625a6c', 'โรงพยาบาลโนนไทย', 'โนนไทย', 'user', '2026-01-29 17:05:54', '10878');
INSERT INTO users VALUES (344, 'hosp10879', 'cb2a713abbb0465f4a0da314c0fbe00739b9bd087665d24ad29415db0c824158', 'โรงพยาบาลโนนสูง', 'โนนสูง', 'user', '2026-01-29 17:05:54', '10879');
INSERT INTO users VALUES (345, 'hosp10880', 'fe152ce6b60f59339ec280ef63d13dc0981184a37de34929b2fab547beb0342b', 'โรงพยาบาลขามสะแกแสง', 'ขามสะแกแสง', 'user', '2026-01-29 17:05:54', '10880');
INSERT INTO users VALUES (346, 'hosp10881', 'b01e052755cbea259d7f3d31cbdad395d0ce23eb257dd9c229eb92f2c124cf21', 'โรงพยาบาลบัวใหญ่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '10881');
INSERT INTO users VALUES (347, 'hosp10882', 'b8ff35aa9ccfeb0f73bfdc1e4d53810f024c057d7fd19de50b11f4afb8742055', 'โรงพยาบาลประทาย', 'ประทาย', 'user', '2026-01-29 17:05:54', '10882');
INSERT INTO users VALUES (348, 'hosp10883', 'a3f97d821d8cd1a54180b5f766c38c568bc12c2f0f736367ea7599465ea65a04', 'โรงพยาบาลปักธงชัย', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '10883');
INSERT INTO users VALUES (349, 'hosp10884', '8ad390b9d0e12f1136fafbb9d344323697a844b3d449ece20271e1fc5a1c5292', 'โรงพยาบาลพิมาย', 'พิมาย', 'user', '2026-01-29 17:05:54', '10884');
INSERT INTO users VALUES (350, 'hosp10885', '0bbde4287f03bc7d5ae4a1717af9130c7b4d555022ba6f72f7f4d2ffdc072e8f', 'โรงพยาบาลห้วยแถลง', 'ห้วยแถลง', 'user', '2026-01-29 17:05:54', '10885');
INSERT INTO users VALUES (351, 'hosp10886', '40c4492937e926f080a9caae8efba95db83ed21345b1f7cff02b1732febecd3a', 'โรงพยาบาลชุมพวง', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '10886');
INSERT INTO users VALUES (352, 'hosp10887', '8c64f81029cb8315a80d2197675b8837c78b550f1781f91a883f3a83b7017b40', 'โรงพยาบาลสูงเนิน', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '10887');
INSERT INTO users VALUES (353, 'hosp10888', '5091c9c822c9241faacd19a0358b42f5f24a26a36bc844a23363e528b08bbaf3', 'โรงพยาบาลขามทะเลสอ', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '10888');
INSERT INTO users VALUES (354, 'hosp10889', 'e01fa06369b33426ccd5d9bac5bbf10c308856e5363b1e1eca6adfd18d8ed260', 'โรงพยาบาลสีคิ้ว', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '10889');
INSERT INTO users VALUES (355, 'hosp10890', 'cd7b55c541a9a3c03b0e07c168e38812035bf4b02ebb7c688e694d6aff04b932', 'โรงพยาบาลปากช่องนานา', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '10890');
INSERT INTO users VALUES (356, 'hosp10891', 'fee1a025fb4cbe169112c5010e9ee9ba01e6b04637d5cdac3a27c74ee7268611', 'โรงพยาบาลหนองบุญมาก', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '10891');
INSERT INTO users VALUES (357, 'hosp10892', '6cef8ad50079143dc63272ff5c064ece34eb35eb41b0aa67b298ac3848da0c85', 'โรงพยาบาลแก้งสนามนาง', 'แก้งสนามนาง', 'user', '2026-01-29 17:05:54', '10892');
INSERT INTO users VALUES (358, 'hosp10893', 'f85dc3af652ef2536b89e6429c242f394efde135584189da5b1ba866c9b71a14', 'โรงพยาบาลโนนแดง', 'โนนแดง', 'user', '2026-01-29 17:05:54', '10893');
INSERT INTO users VALUES (359, 'hosp10894', '6cde451e5ea2352de142d72b0305f659bd84e23afcf32115e849df896709b26e', 'โรงพยาบาลวังน้ำเขียว', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '10894');
INSERT INTO users VALUES (360, 'hosp11492', 'd3ad3d21d347e7a7ba04587f0ce16b5e1c9118db74c7c0de74179f47553ee0ee', 'โรงพยาบาลค่ายสุรนารี นครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '11492');
INSERT INTO users VALUES (361, 'hosp11602', '04cabb4612771f3bd1bcfe21250f18a39b0b4b73bad11bd39688af6d3eddff01', 'โรงพยาบาลเฉลิมพระเกียรติสมเด็จย่า 100 ปี', 'เมืองยาง', 'user', '2026-01-29 17:05:54', '11602');
INSERT INTO users VALUES (362, 'hosp11608', '61d8dc82e706c4148befea457825b7d269b420e50dd44e8b89e00162b90ee153', 'โรงพยาบาลลำทะเมนชัย', 'ลำทะเมนชัย', 'user', '2026-01-29 17:05:54', '11608');
INSERT INTO users VALUES (363, 'hosp11885', '5753aa95e8fa4a2fb08e1f97983cb827ca549bedba52aa2c26ef5336358ae8e0', 'โรงพยาบาลเดอะโกลเดนเกท', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '11885');
INSERT INTO users VALUES (364, 'hosp11891', 'db8d4ba57300aad66b4c3c56b6ca2b0bb6c9b19fbc1e8a56b342d450d40fc9e8', 'โรงพยาบาลราชสีมาฮอสพิทอล', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '11891');
INSERT INTO users VALUES (365, 'hosp11988', 'eda1471bc0cfe06f8f6c1ca3575f37e93cde4cb28bf0ac2757600c4f9728baf0', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านหนองโบสถ์', 'ครบุรี', 'user', '2026-01-29 17:05:54', '11988');
INSERT INTO users VALUES (366, 'hosp12267', 'b2da8e3f55e557032c049191006fef760e6de974911aaaa0f4dd67913501c3f3', 'ศูนย์อนามัยที่ 9 นครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '12267');
INSERT INTO users VALUES (367, 'hosp12268', 'b8f59842982f5b3d353f72bbb45a238f4132721ed92d2485f23118dd46e64bb7', 'โรงพยาบาลจิตเวชนครราชสีมาราชนครินทร์', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '12268');
INSERT INTO users VALUES (368, 'hosp12466', '056733e5212d3b90f55ff90f36cd59216fdf01ea82f889247b3970e688524597', 'สถานพยาบาลสถานีกาชาดที่ 4', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '12466');
INSERT INTO users VALUES (369, 'hosp13826', '0ef4fcfd875bb79ab1c7a6a78f6a449c17b17ebbf12ba053ee31edd090ebd870', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโพนสูง', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '13826');
INSERT INTO users VALUES (370, 'hosp13827', '61d19b38c5eafd82f997b15e6b209659528f0a38247186c8defa4bfec4d45f8f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองยารักษ์', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '13827');
INSERT INTO users VALUES (371, 'hosp13828', '8656ae2d0f7e93cd1c4ed758df030ecd76ed141a2ac65ad1da856b79ab5dfdf1', 'โรงพยาบาลส่งเสริมสุขภาพตำบลราษฎร์สามัคคี', 'เสิงสาง', 'user', '2026-01-29 17:05:54', '13828');
INSERT INTO users VALUES (372, 'hosp13829', '8e1049f4aada82eec20cc62b3ec298c638066aacf156eea624f1f6fd34451bb3', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองกลาง', 'โชคชัย', 'user', '2026-01-29 17:05:54', '13829');
INSERT INTO users VALUES (373, 'hosp13830', '5f0622a01faf3b99ad41d48e5c7f446d530f0001d32705fc3bf5820eafcbf196', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตะคร้อ', 'โนนไทย', 'user', '2026-01-29 17:05:54', '13830');
INSERT INTO users VALUES (374, 'hosp13831', '9da6018e2b710755d7282bf5e3a5de71d3c4f38319b241e42aa04392a582ea4a', 'โรงพยาบาลส่งเสริมสุขภาพตำบลบ้านดู่', 'ปักธงชัย', 'user', '2026-01-29 17:05:54', '13831');
INSERT INTO users VALUES (375, 'hosp13832', '5b30f5d38e2ace2e810f5be3cd870844a01883b38c1e3978792d28e6bde33e4f', 'โรงพยาบาลส่งเสริมสุขภาพตำบลตลาดไทร', 'ชุมพวง', 'user', '2026-01-29 17:05:54', '13832');
INSERT INTO users VALUES (376, 'hosp13833', '1e3392ebe0f6f9b76a0e66b9aae88e836f8198cf0b2a834cabfb70332826c087', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองแวง', 'สูงเนิน', 'user', '2026-01-29 17:05:54', '13833');
INSERT INTO users VALUES (377, 'hosp13834', 'cecc96761ebd2c93cc744969e023b576c02ecc793aeed598750e4ddf7691b768', 'โรงพยาบาลส่งเสริมสุขภาพตำบลกุ่มพะยา', 'ขามทะเลสอ', 'user', '2026-01-29 17:05:54', '13834');
INSERT INTO users VALUES (378, 'hosp13835', '46388a4b6db63a453e5a4c8860d949f1e9a97f46bf0f097b39a68aeba37c1178', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคลองสะท้อน', 'วังน้ำเขียว', 'user', '2026-01-29 17:05:54', '13835');
INSERT INTO users VALUES (379, 'hosp14161', '61787de46b491b34262a6dde7bef15cd4a854ada34e8522602c2ca1cdf5a7c32', 'โรงพยาบาลกองบิน กองบิน1', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14161');
INSERT INTO users VALUES (380, 'hosp14249', '08ec895b8fa8de6cd666aa7972bf9c53f024635e6d54ff20d8678dc765cf9195', 'โรงพยาบาลส่งเสริมสุขภาพตำบลคึมมะอุ', 'บัวลาย', 'user', '2026-01-29 17:05:54', '14249');
INSERT INTO users VALUES (381, 'hosp14421', '8cf875c1adaf6c1fcb757a24f10346c522b13ce86afc97eba054c7aa598c8b4b', 'ศูนย์บริการสาธารณสุขเทศบาลนครนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14421');
INSERT INTO users VALUES (382, 'hosp14690', '3c7e6da7e40c457de144175f2a561300357342228e8411149b86fe3f3844ed89', 'ศูนย์สุขภาพชุมชนเมือง 7 โคกกรวด', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14690');
INSERT INTO users VALUES (383, 'hosp14693', 'c6558463502b2e2b9e0c0d2701379c4e72a1e7918c899866c4888d958519c9ed', 'ศูนย์แพทย์ชุมชนเมือง9', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14693');
INSERT INTO users VALUES (384, 'hosp14695', '59e551cbd38e9a4396871c451109326c38d7c5ae0e1d73b614f23c12dcc51262', 'ศูนย์แพทย์ชุมชนเมือง 11', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '14695');
INSERT INTO users VALUES (385, 'hosp14696', '55d90da859936172aed1e3106759aa720fa541921c5429c01e87b8d221ac7f1c', 'ศูนย์แพทย์ชุมชนเมือง12', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14696');
INSERT INTO users VALUES (386, 'hosp14697', 'c559aaee9f32b8b4944b9159a3418e52f49c832f1ef3e6632909f72348d8d3e9', 'ศูนย์แพทย์ชุมชนเมือง 13', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14697');
INSERT INTO users VALUES (387, 'hosp14699', 'c319c9dad27f3edc42d21764d8cf27ab6a3062f63eaa32f7b8824e13342c9b16', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโคกกระชาย', 'ครบุรี', 'user', '2026-01-29 17:05:54', '14699');
INSERT INTO users VALUES (388, 'hosp14710', 'd8bd4792167449f4b24d45a62600c7cacf5c81b94bb26cc71526742a55e00d1a', 'ศูนย์ควบคุมโรคติดต่อนำโดยแมลงที่ 5.4', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '14710');
INSERT INTO users VALUES (389, 'hosp14826', 'e82fa44465f9793f30e4d6b03f1a91ab91aaa34a2082d2952787cdb6c89018c8', 'ศูนย์บริการสาธารณสุข 3 (สวนพริกไทย) เทศบาลนครนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14826');
INSERT INTO users VALUES (390, 'hosp14827', '32ad6b303f89eee9381cfa12cbbbc06de0842744b795c7e80a88a296089b9179', 'ศูนย์บริการสาธารณสุข 2 (ทุ่งสว่าง) เทศบาลนครนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14827');
INSERT INTO users VALUES (391, 'hosp14829', 'c576d837e5bcc0b5bbf76bd6519386806849a38eb0c6db29262014cf8032c292', 'ศูนย์บริการสาธารณสุข ๑ เทศบาลเมืองบัวใหญ่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '14829');
INSERT INTO users VALUES (392, 'hosp14834', '4d1191a6d519496d80ba57813419240ecdfb263e2c1292768cb8cc21908eabf3', 'ศูนย์แพทย์ชุมชนเมือง 1 หัวทะเล', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14834');
INSERT INTO users VALUES (393, 'hosp14835', 'cea5884580d1c8e70af57b7d953a1581f8480969311712adf8c4b6c3c4cae5f0', 'ศูนย์แพทย์ชุมชนเมือง 2 วัดป่าสาละวัน', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14835');
INSERT INTO users VALUES (394, 'hosp14836', 'ea5b53371b8f1f559be9dc19c24e068a7d3d76054918cf77f0ad57643dd2a47b', 'ศูนย์แพทย์ชุมชนเมือง 3 วัดบูรพ์', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '14836');
INSERT INTO users VALUES (395, 'hosp15060', 'c4ceb880f09d89ac2ac9fc4d41938c0788de23c9f2d80ac1715074cf30e72e91', 'คลินิกเวชปฎิบัติครอบครัว', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '15060');
INSERT INTO users VALUES (396, 'hosp21324', 'cfee229d1f1fbd3dd6424cc687893e94779242fa060f6964b037425eb0a71be0', 'คลินิกชุมชนอบอุ่นมหาชัย', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '21324');
INSERT INTO users VALUES (397, 'hosp21481', '36de87e16673f820a17b81f08a7141fe502135b25dcd5812447d56f8d4011e3d', 'ศูยน์สุขภาพชุมชนพิมายเมืองใหม่', 'พิมาย', 'user', '2026-01-29 17:05:54', '21481');
INSERT INTO users VALUES (398, 'hosp22143', '1c0086a47a13d3b6891ef07754bb36d3a632338a5dc7100f7fc34b85905ad41d', 'ศูนย์สุขภาพชุมชนดอนไพล', 'โชคชัย', 'user', '2026-01-29 17:05:54', '22143');
INSERT INTO users VALUES (399, 'hosp22456', '5aea66ae58a2ace8c40892f394a134dfafc790ccdf6d39a9d3bde9fc670421da', 'โรงพยาบาลพระทองคำ เฉลิมพระเกียรติ 80 พรรษา', 'พระทองคำ', 'user', '2026-01-29 17:05:54', '22456');
INSERT INTO users VALUES (400, 'hosp22736', '61ca09438d1ebbb606b75cfc40c38ad7222e95cbd127e43535239152aa81d109', 'ศูนย์บริการสาธารณสุข 4 (การเคหะ) เทศบาลนครนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '22736');
INSERT INTO users VALUES (401, 'hosp22738', '9b3a1db134d30c78272e694f50d06c54cc32ec5f8f4dad9ec5775a4a4fa9753f', 'สถานพยาบาลเรือนจำกลางนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '22738');
INSERT INTO users VALUES (402, 'hosp22745', '2f30466dcb73adb17dfe99457e090fba754cea16a0a96596d2b02ac734bd471e', 'สถานพยาบาลเรือนจำกลางคลองไผ่', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '22745');
INSERT INTO users VALUES (403, 'hosp22831', '0ab950edfc5157563ab44a4a182c179012f3e266520dcc450fa4cc2e50ee245a', 'สถานพยาบาลเรือนจำอำเภอบัวใหญ่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '22831');
INSERT INTO users VALUES (404, 'hosp22844', '0d3517bef6c74479513d88e2fb8b04d3e3b503658c70d1633feb85d1ba51b949', 'สถานพยาบาลเรือนจำอำเภอสีคิ้ว', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '22844');
INSERT INTO users VALUES (405, 'hosp22853', '27c155fe8a4315e912cebc56e25a4ed49c9bca80f47b3c57735d8d9cdbbcf795', 'สถานพยาบาลทัณฑสถานเกษตรอุตสาหกรรมเขาพริก', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '22853');
INSERT INTO users VALUES (406, 'hosp22867', 'c3cf005de518843851c9d30be3dd2531de167996c1157ba4239bf54c889000a5', 'สถานพยาบาลทัณฑสถานหญิงนครราชสีมา', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '22867');
INSERT INTO users VALUES (407, 'hosp23012', 'c8793f7bf6a181f1bb3a442e74ba0e371a963e7f4638c558efb2216e11d60ec5', 'ศูนย์สุขภาพชุมชนเทศบาลเมืองปากช่อง3(หนองสาหร่าย)', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '23012');
INSERT INTO users VALUES (408, 'hosp23839', '8c458f25e4a4f727fb77fa9ed35dd6d0f9078b3d87712450fc07180bf289b91e', 'โรงพยาบาลเทพรัตน์นครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '23839');
INSERT INTO users VALUES (409, 'hosp24060', '0fcc30f6aceaa50ad5a28097e24fcbc8ad7f51a7a144e8dc43aaf7574b7d225d', 'โรงพยาบาลมหาวิทยาลัยเทคโนโลยีสุรนารี', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '24060');
INSERT INTO users VALUES (410, 'hosp24641', 'd0100495927acf39c79b7e88194dac4b648f71bf4b4429ec90eabc23563d1370', 'ศูนย์สุขภาพชุมชนเทศบาลเมืองปากช่อง 1', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '24641');
INSERT INTO users VALUES (411, 'hosp24642', 'b7d361fdd597938ed4e62e5ddf22f387855bd22874dcde689f01cc4901dcfa18', 'ศูนย์สุขภาพชุมชนเทศบาลเมืองปากช่อง 2', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '24642');
INSERT INTO users VALUES (412, 'hosp24692', '7d72ed98fe74158b54e78c4f00cd50d3230b58a2850ff585a230328016b4ecf6', 'โรงพยาบาลเฉลิมพระเกียรติ', 'เฉลิมพระเกียรติ', 'user', '2026-01-29 17:05:54', '24692');
INSERT INTO users VALUES (413, 'hosp27839', '4de5fb608839bd4a93be6b0aa1f8db53e58b48d821046da9c416bcf972db2f16', 'โรงพยาบาลบัวลาย', 'บัวลาย', 'user', '2026-01-29 17:05:54', '27839');
INSERT INTO users VALUES (414, 'hosp27840', '98717b151738dbb3af1668f8ae410a9f4c97857ad1cdfc7761da7d13d7a1e8d1', 'โรงพยาบาลสีดา', 'สีดา', 'user', '2026-01-29 17:05:54', '27840');
INSERT INTO users VALUES (415, 'hosp27841', '4b8356558090ae8e73b98e96efcbaabc42339aa8d3a40bdd72dc1cf5a18d54f8', 'โรงพยาบาลเทพารักษ์', 'เทพารักษ์', 'user', '2026-01-29 17:05:54', '27841');
INSERT INTO users VALUES (416, 'hosp41092', 'd015e64380eb1a7ddb952260c2225537d881adeedf19d67984a824d319052ee5', 'โรงพยาบาลส่งเสริมสุขภาพตำบลหนองจานพัฒนา', 'หนองบุญมาก', 'user', '2026-01-29 17:05:54', '41092');
INSERT INTO users VALUES (417, 'hosp41723', '83e2964a183543776427513052760a40db01f50c23091c0d7dfebe714e1e7741', 'โรงพยาบาลส่งเสริมสุขภาพตำบลโนนพุทรา', 'พิมาย', 'user', '2026-01-29 17:05:54', '41723');
INSERT INTO users VALUES (418, 'hosp77471', 'f5dff7876338ea66a0fe713b90e2080f1c10fe8b35a58582766efb5a0caab7e2', 'ศูนย์บริการสาธารณสุขเทศบาลเมืองสีคิ้ว', 'สีคิ้ว', 'user', '2026-01-29 17:05:54', '77471');
INSERT INTO users VALUES (419, 'hosp77497', '22ea9fa4d3cf0e5d3c68a42be6f0bd6e4b5a10851033b1d959f3690ee9e6049b', 'ศูนย์สุขภาพชุมชนโรงพยาบาลเทพรัตน์นครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '77497');
INSERT INTO users VALUES (420, 'hosp77498', '70c938147d672bca4dd224e132f7239115051aa3f68615f3cd868c6b7c1e47b8', 'โรงพยาบาลมกุฏคีรีวัน', 'ปากช่อง', 'user', '2026-01-29 17:05:54', '77498');
INSERT INTO users VALUES (421, 'hosp77524', '9801d8502b49571ddada7ffbd57ac9192f4eff86020aa549bed17573f6d60956', 'ศูนย์บริการสาธารณสุข 6 (วัดศาลาทอง) เทศบาลนครนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-29 17:05:54', '77524');
INSERT INTO users VALUES (422, 'hosp99947', '76c39efe18371470791d35eb7bcc5fdb8d0fc0257e3ebc247ca22b513fd7e822', 'ศูนย์สุขภาพชุมชนโรงพยาบาลบัวใหญ่', 'บัวใหญ่', 'user', '2026-01-29 17:05:54', '99947');
INSERT INTO users VALUES (423, 'hosp00018', '94ee0b0f77114e44b22a88a143a3ca4b7d2f2ad21fbdd7256c6f909f94b6c6ed', 'สำนักงานสาธารณสุขจังหวัดนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-01-30 21:15:11', '00018');
INSERT INTO users VALUES (424, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'administrator', 'เมืองนครราชสีมา', 'admin', '2026-02-02 08:22:34', '00018');
INSERT INTO users VALUES (426, 'hosp00222', '7c21d0274d2af4c9e5d91ae85b67cd665a0d73389b145537dcf2246c35750ee5', 'สำนักงานสาธารณสุขอำเภอเมืองนครราชสีมา', 'เมืองนครราชสีมา', 'user', '2026-02-06 12:52:29', '00222');
INSERT INTO users VALUES (427, 'hosp00223', '88ee61bd9eb81bea382b840af58e0f037d5ea5fce85a47932bf8f01d4c4ada47', 'สำนักงานสาธารณสุขอำเภอครบุรี', 'ครบุรี', 'user', '2026-02-06 12:52:29', '00223');
INSERT INTO users VALUES (428, 'hosp00224', '82fd11328a1a68059a062848862f6eb658e4df5db4ec9157546f7f5b6f780430', 'สำนักงานสาธารณสุขอำเภอเสิงสาง ', 'เสิงสาง ', 'user', '2026-02-06 12:52:29', '00224');
INSERT INTO users VALUES (429, 'hosp00225', 'd1067f92aea23db3a211ca68d6834643b521387bb7f114dfdf1d863a6a5285c0', 'สำนักงานสาธารณสุขอำเภอคง ', 'คง ', 'user', '2026-02-06 12:52:29', '00225');
INSERT INTO users VALUES (430, 'hosp00226', '248e8d9a7c85ff87e0ef09561f5fdb3b29f11087bd16210403a668ab3cda0390', 'สำนักงานสาธารณสุขอำเภอบ้านเหลื่อม', 'บ้านเหลื่อม', 'user', '2026-02-06 12:52:29', '00226');
INSERT INTO users VALUES (431, 'hosp00227', 'daa86767a1cf8ab79a52319285299d687962ad6ec9c8eaa36af0df4aff1e5634', 'สำนักงานสาธารณสุขอำเภอจักราช ', 'จักราช ', 'user', '2026-02-06 12:52:29', '00227');
INSERT INTO users VALUES (432, 'hosp00228', '3679e1a1356ef3c59d2b0d56c34aaffb320f056d4d66baf66c973c4004512c13', 'สำนักงานสาธารณสุขอำเภอโชคชัย ', 'โชคชัย ', 'user', '2026-02-06 12:52:29', '00228');
INSERT INTO users VALUES (433, 'hosp00229', 'dff8549ff78c0b27bf5607858957bf6c98c3fdfff196af8605e3483d3c604543', 'สำนักงานสาธารณสุขอำเภอด่านขุนทด', 'ด่านขุนทด', 'user', '2026-02-06 12:52:29', '00229');
INSERT INTO users VALUES (434, 'hosp00230', 'e1bb8c5d32ea4b6666b43c31f595e42ba9cf434b140318d27e4a13214a30af54', 'สำนักงานสาธารณสุขอำเภอโนนไทย', 'โนนไทย', 'user', '2026-02-06 12:52:29', '00230');
INSERT INTO users VALUES (435, 'hosp00231', '5c2958ee448770c391ee791d0897ce8826ab3dd4f5f4f8405ba10b8272024f17', 'สำนักงานสาธารณสุขอำเภอโนนสูง ', 'โนนสูง ', 'user', '2026-02-06 12:52:29', '00231');
INSERT INTO users VALUES (436, 'hosp00232', '5bbef8e7158525b655a8dd60d94f2946484bc5bf23d28f0f9eb5993336951934', 'สำนักงานสาธารณสุขอำเภอขามสะแกแสง', 'ขามสะแกแสง', 'user', '2026-02-06 12:52:29', '00232');
INSERT INTO users VALUES (437, 'hosp00233', '64d5e29e81c10b77af01981e8f249f0f4b2c6d993c1a12bbd271d1dcfc349cc4', 'สำนักงานสาธารณสุขอำเภอบัวใหญ่', 'บัวใหญ่', 'user', '2026-02-06 12:52:29', '00233');
INSERT INTO users VALUES (438, 'hosp00234', 'f84d6ac99b1c1d1643a3dbec3dd38b9cc1f1b31a091e413d87a5177b9310a43b', 'สำนักงานสาธารณสุขอำเภอประทาย', 'ประทาย', 'user', '2026-02-06 12:52:29', '00234');
INSERT INTO users VALUES (439, 'hosp00235', '4276cc53b9e484e8a99fc01df8883b7a85513b910b85f9bebbbc54bf6ee7535c', 'สำนักงานสาธารณสุขอำเภอปักธงชัย ', 'ปักธงชัย ', 'user', '2026-02-06 12:52:29', '00235');
INSERT INTO users VALUES (440, 'hosp00236', 'f8265980fd8f6ab20767f6938d8b91b9ab28956a9e6963a7dc3ad69d5eac56e8', 'สำนักงานสาธารณสุขอำเภอพิมาย', 'พิมาย', 'user', '2026-02-06 12:52:29', '00236');
INSERT INTO users VALUES (441, 'hosp00237', '735064aeef44175119c49579d2f8d428b5cdb84a47cb2c98f443a1cb6b0c362e', 'สำนักงานสาธารณสุขอำเภอห้วยแถลง ', 'ห้วยแถลง ', 'user', '2026-02-06 12:52:29', '00237');
INSERT INTO users VALUES (442, 'hosp00238', 'c919f395cc261e7e0844d4d9c424650f8794013d85d2b5c95aa8bc924a1c808d', 'สำนักงานสาธารณสุขอำเภอชุมพวง ', 'ชุมพวง ', 'user', '2026-02-06 12:52:29', '00238');
INSERT INTO users VALUES (443, 'hosp00239', '2d67a5e3ffd05eddb0c79480dce88d747aae3ca67e3e8611f9bd5b955c96d2a6', 'สำนักงานสาธารณสุขอำเภอสูงเนิน ', 'สูงเนิน ', 'user', '2026-02-06 12:52:29', '00239');
INSERT INTO users VALUES (444, 'hosp00240', 'a8bf17570958d16cbeb12bbde18bad75e0d210018547a760dc01d4f571823665', 'สำนักงานสาธารณสุขอำเภอขามทะเลสอ', 'ขามทะเลสอ', 'user', '2026-02-06 12:52:29', '00240');
INSERT INTO users VALUES (445, 'hosp00241', '86e5bc07c27c92c23c4aebb41abb8c8a10f558667aa6016d7bd0212de416e52f', 'สำนักงานสาธารณสุขอำเภอสีคิ้ว ', 'สีคิ้ว ', 'user', '2026-02-06 12:52:29', '00241');
INSERT INTO users VALUES (446, 'hosp00242', '7e3712d00466204dc7fac9c606b82d5ddbbbf073477f5f629ce933b5f38d70cd', 'สำนักงานสาธารณสุขอำเภอปากช่อง ', 'ปากช่อง ', 'user', '2026-02-06 12:52:29', '00242');
INSERT INTO users VALUES (447, 'hosp00243', '2ad6e3540e6f4bdc88e333a61780c9561b240a1e28b23bbb3acfd3535ff3d8eb', 'สำนักงานสาธารณสุขอำเภอหนองบุญมาก', 'หนองบุญมาก', 'user', '2026-02-06 12:52:29', '00243');
INSERT INTO users VALUES (448, 'hosp00244', '6648a71fa5f3f853fee39c042dd8055d7077c3d49cbe4c181a15908cf8358259', 'สำนักงานสาธารณสุขอำเภอแก้งสนามนาง', 'แก้งสนามนาง', 'user', '2026-02-06 12:52:29', '00244');
INSERT INTO users VALUES (449, 'hosp00245', '7bf5bb21db65b5f579d92a545d115239ddf3f7801b12739196654b859f899703', 'สำนักงานสาธารณสุขอำเภอโนนแดง', 'โนนแดง', 'user', '2026-02-06 12:52:29', '00245');
INSERT INTO users VALUES (450, 'hosp00246', 'cef76735605452ad6809fd8460747c5fdaa351b64a5e80ae0ba470ec832cf334', 'สำนักงานสาธารณสุขอำเภอวังน้ำเขียว  ', 'วังน้ำเขียว  ', 'user', '2026-02-06 12:52:29', '00246');
INSERT INTO users VALUES (451, 'hosp00247', '7fae279e7d6a7ffccd92096f0d6aaefa3d4da4e36f097fa5fa1ed487132f558a', 'สำนักงานสาธารณสุขอำเภอเทพารักษ์', 'เทพารักษ์', 'user', '2026-02-06 12:52:29', '00247');
INSERT INTO users VALUES (452, 'hosp00248', '3e2715602a71930c66852c65db63466c6767f840dedd7bb0eece10d581169f2d', 'สำนักงานสาธารณสุขอำเภอเมืองยาง', 'เมืองยาง', 'user', '2026-02-06 12:52:29', '00248');
INSERT INTO users VALUES (453, 'hosp00249', 'a25a540c06af417867bf2d5bc3ef88a60869cb434551932d31fe2acb212ea7c4', 'สำนักงานสาธารณสุขอำเภอพระทองคำ', 'พระทองคำ', 'user', '2026-02-06 12:52:29', '00249');
INSERT INTO users VALUES (454, 'hosp00250', 'b66da3b39918c6cb93378b308495de93ab19d91d0e9554512f3c7f2d148e1091', 'สำนักงานสาธารณสุขอำเภอลำทะเมนชัย', 'ลำทะเมนชัย', 'user', '2026-02-06 12:52:29', '00250');
INSERT INTO users VALUES (455, 'hosp14141', 'a964e28310454a5d53089f3eac9e3adbb4775ea53eccf80da86846b807a2af', 'สำนักงานสาธารณสุขอำเภอบัวลาย', 'บัวลาย', 'user', '2026-02-06 12:52:29', '14141');
INSERT INTO users VALUES (456, 'hosp14142', '79f261b9a928483b1833925c36993a7b7234c475571ae601f86d57ff6950419d', 'สำนักงานสาธารณสุขอำเภอสีดา', 'สีดา', 'user', '2026-02-06 12:52:29', '14142');
INSERT INTO users VALUES (457, 'hosp00251', '3abd6f7918b4178bdb1abbbb09f691a7d787c10c2d413d9e5c52ff9213566171', 'สำนักงานสาธารณสุขอำเภอเฉลิมพระเกียรติ', 'เฉลิมพระเกียรติ', 'user', '2026-02-06 12:52:29', '00251');

-- ----------------------------
-- View structure for view_kpi_summary
-- ----------------------------
DROP VIEW IF EXISTS view_kpi_summary;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW view_kpi_summary AS select u.hospital_name AS hospital_name,u.amphoe_name AS amphoe_name,k.fiscal_year AS fiscal_year,k.kpi_id AS kpi_id,sum(k.kpi_value) AS total_value from (kpi_records k join users u on((k.user_id = u.id))) group by u.hospital_name,k.fiscal_year,k.kpi_id;

SET FOREIGN_KEY_CHECKS = 1;
