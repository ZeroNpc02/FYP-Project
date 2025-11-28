/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : hardwareforge

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 28/11/2025 18:41:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for builds
-- ----------------------------
DROP TABLE IF EXISTS `builds`;
CREATE TABLE `builds`  (
  `builds_id` int NOT NULL AUTO_INCREMENT,
  `builds_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `builds_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `cpus_id` int NULL DEFAULT NULL,
  `gpus_id` int NULL DEFAULT NULL,
  `motherboards_id` int NULL DEFAULT NULL,
  `rams_id` int NULL DEFAULT NULL,
  `cpucoolers_id` int NULL DEFAULT NULL,
  `storages_id` int NULL DEFAULT NULL,
  `cases_id` int NULL DEFAULT NULL,
  `psus_id` int NULL DEFAULT NULL,
  `Users_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`builds_id`) USING BTREE,
  INDEX `cpus_id`(`cpus_id` ASC) USING BTREE,
  INDEX `gpus_id`(`gpus_id` ASC) USING BTREE,
  INDEX `motherboards_id`(`motherboards_id` ASC) USING BTREE,
  INDEX `rams_id`(`rams_id` ASC) USING BTREE,
  INDEX `cpucoolers_id`(`cpucoolers_id` ASC) USING BTREE,
  INDEX `storages_id`(`storages_id` ASC) USING BTREE,
  INDEX `cases_id`(`cases_id` ASC) USING BTREE,
  INDEX `psus_id`(`psus_id` ASC) USING BTREE,
  INDEX `Users_id`(`Users_id` ASC) USING BTREE,
  CONSTRAINT `builds_ibfk_1` FOREIGN KEY (`cpus_id`) REFERENCES `cpus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_2` FOREIGN KEY (`gpus_id`) REFERENCES `gpus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_3` FOREIGN KEY (`motherboards_id`) REFERENCES `motherboards` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_4` FOREIGN KEY (`rams_id`) REFERENCES `rams` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_5` FOREIGN KEY (`cpucoolers_id`) REFERENCES `cpucoolers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_6` FOREIGN KEY (`storages_id`) REFERENCES `storages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_7` FOREIGN KEY (`cases_id`) REFERENCES `cases` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_8` FOREIGN KEY (`psus_id`) REFERENCES `psus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `builds_ibfk_9` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of builds
-- ----------------------------
INSERT INTO `builds` VALUES (2, 'test', NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for cases
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `dimensions` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `materials` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mainboard_support` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `front_panel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `side_panel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expansion_slot` int NULL DEFAULT NULL,
  `ssd_slot` int NULL DEFAULT NULL,
  `hdd_slot` int NULL DEFAULT NULL,
  `gpu_length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cpuCooler_height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psu_length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES (1, 'Lian Li O11 Dynamic EVO', 699.00, 'https://example.com/images/o11_dynamic_evo.jpg', 'https://www.lian-li.com/o11-dynamic-evo/', '465 x 285 x 459 mm', 'Mid Tower', 'Aluminum, Tempered Glass, Steel', 'E-ATX, ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 8, 6, 4, '422 mm', '167 mm', '220 mm', 12.00);
INSERT INTO `cases` VALUES (2, 'NZXT H9 Flow', 749.00, 'https://example.com/images/nzxt_h9_flow.jpg', 'https://nzxt.com/product/h9-flow', '495 x 290 x 466 mm', 'Mid Tower', 'Steel, Tempered Glass, Plastic', 'ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.2, Audio Jack', 'Tempered Glass', 7, 4, 2, '435 mm', '165 mm', '200 mm', 13.10);
INSERT INTO `cases` VALUES (3, 'Fractal Design North', 679.00, 'https://example.com/images/fractal_north.jpg', 'https://www.fractal-design.com/products/cases/north/', '447 x 215 x 469 mm', 'Mid Tower', 'Steel, Tempered Glass, Real Wood', 'ATX, Micro-ATX, Mini-ITX', '2 x USB 3.0, 1 x USB-C, Audio Combo', 'Tempered Glass', 7, 3, 2, '355 mm', '170 mm', '255 mm', 7.60);
INSERT INTO `cases` VALUES (4, 'Montech Air 100 ARGB', 299.00, 'https://example.com/images/montech_air100_argb.jpg', 'https://www.montechpc.com/en/products_detail.php?serial=94', '405 x 210 x 425 mm', 'Micro ATX', 'Steel, Tempered Glass, Plastic', 'Micro-ATX, Mini-ITX', '2 x USB 3.0, 1 x Audio Combo', 'Tempered Glass', 4, 2, 2, '330 mm', '161 mm', '160 mm', 6.30);
INSERT INTO `cases` VALUES (5, 'Phanteks XT Pro Ultra', 599.00, 'https://example.com/images/phanteks_xt_pro_ultra.jpg', 'https://phanteks.com/XT-Pro-Ultra.html', '460 x 230 x 490 mm', 'Mid Tower', 'Steel, Tempered Glass', 'E-ATX, ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 7, 3, 2, '415 mm', '184 mm', '270 mm', 9.20);

-- ----------------------------
-- Table structure for cpucoolers
-- ----------------------------
DROP TABLE IF EXISTS `cpucoolers`;
CREATE TABLE `cpucoolers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `liquid_cooling` tinyint(1) NULL DEFAULT NULL,
  `dimension` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `heatpipes` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cpucoolers
-- ----------------------------
INSERT INTO `cpucoolers` VALUES (1, 'Noctua NH-U12S Redux', 239.00, '', '', 0, '158mm (H) x 125mm (W) x 71mm (D)', '4 heatpipes', 180);
INSERT INTO `cpucoolers` VALUES (2, 'DeepCool AK400 Performance', 139.00, '', '', 0, '155mm (H) x 127mm (W) x 97mm (D)', '4 heatpipes', 180);
INSERT INTO `cpucoolers` VALUES (3, 'be quiet! Dark Rock 4', 329.00, '', '', 0, '159mm (H) x 136mm (W) x 96mm (D)', '6 heatpipes', 200);
INSERT INTO `cpucoolers` VALUES (4, 'Cooler Master MasterLiquid ML240L V2 RGB', 329.00, '', '', 1, '277mm (L) x 119.6mm (W) x 27.2mm (H)', 'Pump-based', 250);
INSERT INTO `cpucoolers` VALUES (5, 'NZXT Kraken X63 RGB', 569.00, '', '', 1, '315mm (L) x 143mm (W) x 30mm (H)', 'Pump-based', 280);

-- ----------------------------
-- Table structure for cpus
-- ----------------------------
DROP TABLE IF EXISTS `cpus`;
CREATE TABLE `cpus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `cores` int NULL DEFAULT NULL,
  `threads` int NULL DEFAULT NULL,
  `base_clock` decimal(5, 2) NULL DEFAULT NULL,
  `boost_clock` decimal(5, 2) NULL DEFAULT NULL,
  `socket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dimension` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT NULL,
  `cpu_category` enum('consumer','workstation','datacenter') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'consumer',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cpus
-- ----------------------------
INSERT INTO `cpus` VALUES (1, 'Ryzen 7 7800X3D', 'AMD', 1499.00, 'images/CPU/AMD_RYZEN_7_7800X3D_PROCESSOR_TMT.jpg', 'https://www.tmt.my/products/amd-ryzen-7-7800x3d-processor-am5', 8, 16, 4.20, 5.00, 'AM5', '3.99 cm x 3.99 cm x 0.25 cm', 120, 'consumer');
INSERT INTO `cpus` VALUES (2, 'AMD Ryzen 5 7600', 'AMD', 899.00, 'https://example.com/images/ryzen5_7600.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-5-7600', 6, 12, 3.80, 5.10, 'AM5', '40mm x 40mm', 65, 'consumer');
INSERT INTO `cpus` VALUES (3, 'AMD Ryzen 9 7900X', 'AMD', 1849.00, 'https://example.com/images/ryzen9_7900x.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-9-7900x', 12, 24, 4.70, 5.60, 'AM5', '40mm x 40mm', 170, 'consumer');
INSERT INTO `cpus` VALUES (4, 'Intel Core i5-13600K', 'INTEL', 1349.00, 'https://example.com/images/i5_13600k.jpg', 'https://www.intel.com/content/www/us/en/products/sku/230496/intel-core-i513600k-processor-24m-cache-up-to-5-10-ghz.html', 14, 20, 3.50, 5.10, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer');
INSERT INTO `cpus` VALUES (5, 'Intel Core i7-14700K', 'INTEL', 1849.00, 'https://example.com/images/i7_14700k.jpg', 'https://www.intel.com/content/www/us/en/products/sku/236781/intel-core-i714700k-processor-33m-cache-up-to-5-60-ghz.html', 20, 28, 3.40, 5.60, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer');
INSERT INTO `cpus` VALUES (6, 'AMD Ryzen 5 5600', 'AMD', 669.00, 'https://example.com/images/ryzen5_5600.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-5-5600', 6, 12, 3.50, 4.40, 'AM4', '40mm x 40mm', 65, 'consumer');
INSERT INTO `cpus` VALUES (7, 'Intel Xeon W5-2465X', 'INTEL', 3499.00, 'https://example.com/images/xeon-w5-2465x.jpg', 'https://www.intel.com', 16, 32, 3.10, 4.60, 'LGA4677', '45mm x 45mm', 270, 'workstation');
INSERT INTO `cpus` VALUES (8, 'AMD Ryzen Threadripper Pro 7965WX', 'AMD', 6999.00, 'https://example.com/images/threadripper-pro-7965wx.jpg', 'https://www.amd.com', 24, 48, 4.00, 5.30, 'sTR5', '58.5mm x 75.4mm', 350, 'workstation');
INSERT INTO `cpus` VALUES (9, 'Intel Xeon W9-3495X', 'INTEL', 11499.00, 'https://example.com/images/xeon-w9-3495x.jpg', 'https://www.intel.com', 56, 112, 1.90, 4.80, 'LGA4677', '45mm x 45mm', 350, 'workstation');
INSERT INTO `cpus` VALUES (10, 'AMD Ryzen Threadripper 7980X', 'AMD', 9499.00, 'https://example.com/images/threadripper-7980x.jpg', 'https://www.amd.com', 64, 128, 3.20, 5.10, 'sTR5', '58.5mm x 75.4mm', 350, 'workstation');
INSERT INTO `cpus` VALUES (11, 'Intel Xeon Platinum 8460Y', 'INTEL', 18999.00, 'https://example.com/images/xeon-platinum-8460y.jpg', 'https://www.intel.com', 40, 80, 2.00, 3.50, 'LGA4677', '45mm x 45mm', 300, 'datacenter');
INSERT INTO `cpus` VALUES (12, 'AMD EPYC 9554', 'AMD', 15999.00, 'https://example.com/images/epyc-9554.jpg', 'https://www.amd.com', 64, 128, 3.10, 3.75, 'SP5', '72mm x 75mm', 360, 'datacenter');
INSERT INTO `cpus` VALUES (13, 'Intel Xeon Silver 4410Y', 'INTEL', 4499.00, 'https://example.com/images/xeon-silver-4410y.jpg', 'https://www.intel.com', 12, 24, 2.00, 3.90, 'LGA4677', '45mm x 45mm', 150, 'datacenter');
INSERT INTO `cpus` VALUES (14, 'AMD EPYC 9354P', 'AMD', 7999.00, 'https://example.com/images/epyc-9354p.jpg', 'https://www.amd.com', 32, 64, 3.25, 3.80, 'SP5', '72mm x 75mm', 280, 'datacenter');
INSERT INTO `cpus` VALUES (15, 'Intel Core i9-14900K', 'INTEL', 2299.00, 'https://example.com/images/i9-14900k.jpg', 'https://www.intel.com', 24, 32, 3.20, 6.00, 'LGA1700', '37.5mm x 37.5mm', 253, 'consumer');

-- ----------------------------
-- Table structure for gpus
-- ----------------------------
DROP TABLE IF EXISTS `gpus`;
CREATE TABLE `gpus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `dimension` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `core_clock` decimal(6, 2) NULL DEFAULT NULL,
  `memory_size` int NULL DEFAULT NULL,
  `memory_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `power_connectors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT NULL,
  `card_bus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gpu_category` enum('consumer','workstation','datacenter') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'consumer',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpus
-- ----------------------------
INSERT INTO `gpus` VALUES (1, 'MSI GeForce RTX 5070 Ti EXPERT OC', 'NVIDIA', 4199.00, 'images/GPU/MSI-RTX5070TI-EXPERT-OC-1.jpg', 'https://www.tmt.my/products/msi-geforce-rtx-5070-ti-expert-oc', '	15.00 cm x 31.90 cm x 6.00 cm', 'black', 2588.00, 16, 'GDDR7', '16-pin', 300, '256-Bit', 'consumer');
INSERT INTO `gpus` VALUES (2, 'ASUS Dual Radeon RX 6500 XT V2 OC', 'AMD', 599.00, 'images/GPU/ASUS-DUAL-RADEON-RX-6500-XT-V2-OC-1.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (3, 'MSI GeForce RTX 5070 Ti Gaming TRIO OC', 'NVIDIA', 4299.00, 'images/GPU/MSI-RTX-5070-TI-GAMING-TRIO-PLUS-OC.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (4, 'ZOTAC GAMING GeForce RTX 5090 ARCTICSTORM AIO', 'NVIDIA', 12999.00, 'images/GPU/ZOTAC-RTX5090-ARCTICSTORM-AIO-MAIN.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (5, 'Gigabyte GeForce RTX 5050 WINDFORCE OC', 'NVIDIA', 1099.00, 'images/GPU/', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (6, 'Sapphire Radeon RX 9060 XT OC NITRO+ 16GB', 'AMD', 1859.00, 'images/GPU/SAPPHIRE-RADEON-NITRO-RX9060XT-1.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (7, 'Acer ARC B580 Nitro OC', 'INTEL', 1399.00, 'images/GPU/ACER-ARC-B580-NITRO-OC-1.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (8, 'MSI GeForce RTX 5070 Ti SHADOW 3X OC', 'NVIDIA', 3799.00, 'images/GPU/MSI-RTX-5070-ti-SHADOW-3X-OC.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (9, 'ASUS TURBO Radeon AI PRO R9700', 'AMD', 6849.00, 'images/GPU/ASUS-TURBO-AI-PRO-9700-BOX-VIEW.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'workstation');
INSERT INTO `gpus` VALUES (10, 'ZOTAC GAMING GeForce RTX 3050 Twin Edge OC', 'NVIDIA', 749.00, 'https://www.tmt.my/products/zotac-gaming-geforce-rtx-3050-twin-edge-oc', 'images/GPU/ZOTAC-RTX-3050-TWIN-EDGE-OC-1.jpg\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (11, 'ASUS Dual Radeon RX 7600 EVO OC', 'AMD', 1099.00, 'https://www.tmt.my/products/asus-dual-radeon-rx-7600-evo-oc', 'images/GPU/ASUS-DUAL-RX7600-EVO-OC-1\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (12, 'ASUS Prime GeForce RTX 5080 OC', 'NVIDIA', 6399.00, 'https://www.tmt.my/products/asus-prime-geforce-rtx-5080-oc', 'images/GPU/ASUS-PRIME-RTX-5080-OC.jpg\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (13, 'Gigabyte GeForce RTX 5060 OC Low Profile', 'NVIDIA', 1349.00, 'https://www.tmt.my/products/gigabyte-geforce-rtx-5060-oc-low-profile', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (14, 'PNY GeForce RTX 5060 Ti Dual Fan OC 8GB', 'NVIDIA', 1729.00, 'https://www.tmt.my/products/pny-geforce-rtx-5060-ti-dual-fan-oc-8gb', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');
INSERT INTO `gpus` VALUES (15, 'Palit GeForce RTX 5060 Dual OC', 'NVIDIA', 1329.00, 'https://www.tmt.my/products/palit-geforce-rtx-5060-dual-oc', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');

-- ----------------------------
-- Table structure for motherboards
-- ----------------------------
DROP TABLE IF EXISTS `motherboards`;
CREATE TABLE `motherboards`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CPU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chipset` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wireless_connection` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expansion_slot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `storage_interface` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of motherboards
-- ----------------------------
INSERT INTO `motherboards` VALUES (1, 'MSI MPG B850 EDGE TI WIFI ATX Motherboard', 1499.00, NULL, 'https://www.tmt.my/products/msi-mpg-b850-edge-ti-wifi-atx-motherboard', 'AM5', 'AMD B850', '4 x DDR5', 'YES', 'YES', 'PCI-E 5.0 x 16 ', '4 x M.2', 'ATX', 70);
INSERT INTO `motherboards` VALUES (2, 'MSI B550 Gaming Plus', 599.00, 'https://example.com/images/msi_b550_gaming_plus.jpg', 'https://www.msi.com/Motherboard/B550-GAMING-PLUS', 'AM4', 'AMD B550', '4 x DDR4, up to 4400 MHz, 128GB max', 'Realtek 8111H Gigabit LAN', 'None', '2 x PCIe x16, 2 x PCIe x1', '2 x M.2, 6 x SATA 6Gb/s', 'ATX', 65);
INSERT INTO `motherboards` VALUES (3, 'ASUS TUF Gaming B650-PLUS WiFi', 899.00, 'https://example.com/images/asus_tuf_b650_plus_wifi.jpg', 'https://www.asus.com/motherboards-components/motherboards/tuf-gaming/tuf-gaming-b650-plus-wifi/', 'AM5', 'AMD B650', '4 x DDR5, up to 6400 MHz, 128GB max', '2.5Gb Intel LAN', 'WiFi 6 + Bluetooth 5.2', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '3 x M.2, 4 x SATA 6Gb/s', 'ATX', 75);
INSERT INTO `motherboards` VALUES (4, 'Gigabyte B760M AORUS Elite AX', 749.00, 'https://example.com/images/gigabyte_b760m_aorus_elite_ax.jpg', 'https://www.gigabyte.com/Motherboard/B760M-AORUS-ELITE-AX-rev-10', 'LGA1700', 'Intel B760', '4 x DDR5, up to 7600 MHz, 128GB max', '2.5Gb LAN', 'WiFi 6E + Bluetooth 5.3', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '2 x M.2, 4 x SATA 6Gb/s', 'Micro ATX', 70);
INSERT INTO `motherboards` VALUES (5, 'ASRock Z790 Steel Legend', 1099.00, 'https://example.com/images/asrock_z790_steel_legend.jpg', 'https://www.asrock.com/mb/Intel/Z790%20Steel%20Legend/', 'LGA1700', 'Intel Z790', '4 x DDR5, up to 7200 MHz, 128GB max', '2.5Gb Realtek LAN', 'WiFi 6E + Bluetooth 5.3', '3 x PCIe x16, 1 x PCIe x1', '3 x M.2, 8 x SATA 6Gb/s', 'ATX', 80);
INSERT INTO `motherboards` VALUES (6, 'ASUS ROG Strix B550-I Gaming', 899.00, 'https://example.com/images/asus_rog_strix_b550i.jpg', 'https://rog.asus.com/motherboards/rog-strix/rog-strix-b550-i-gaming-model/', 'AM4', 'AMD B550', '2 x DDR4, up to 5100 MHz, 64GB max', 'Intel I225-V 2.5Gb LAN', 'WiFi 6 + Bluetooth 5.1', '1 x PCIe x16', '2 x M.2, 4 x SATA 6Gb/s', 'Mini ITX', 60);

-- ----------------------------
-- Table structure for psus
-- ----------------------------
DROP TABLE IF EXISTS `psus`;
CREATE TABLE `psus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EPS_connector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SATA_connector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dimensions` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modular` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PSU_compatibility` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PCIe_connector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `power` int NULL DEFAULT NULL,
  `efficiency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warranty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of psus
-- ----------------------------
INSERT INTO `psus` VALUES (1, 'Corsair RM850e 850W 80+ Gold', 549.00, 'https://example.com/images/corsair_rm850e.jpg', 'https://www.corsair.com/us/en/p/psu/cp-9020252-na/rm850e-850-watt-80-plus-gold-fully-modular-atx-power-supply-cp-9020252-na', '2 x 4+4 Pin EPS', '8 x SATA', '150 x 86 x 160 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '3 x 6+2 Pin PCIe', 'ATX', 850, '80+ Gold', '10 Years', 1.65);
INSERT INTO `psus` VALUES (2, 'Cooler Master MWE 650 Bronze V2', 289.00, 'https://example.com/images/cm_mwe650_bronze_v2.jpg', 'https://www.coolermaster.com/catalog/power-supplies/mwe-series/mwe-650-bronze-v2/', '1 x 4+4 Pin EPS', '6 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'ATX 12V v2.52', '2 x 6+2 Pin PCIe', 'ATX', 650, '80+ Bronze', '5 Years', 1.40);
INSERT INTO `psus` VALUES (3, 'Be Quiet! Pure Power 12M 750W 80+ Gold', 519.00, 'https://example.com/images/bequiet_purepower12m_750.jpg', 'https://www.bequiet.com/en/powersupply/4174', '2 x 4+4 Pin EPS', '6 x SATA', '160 x 150 x 86 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '2 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 750, '80+ Gold', '10 Years', 1.80);
INSERT INTO `psus` VALUES (4, 'Thermaltake Smart BX1 550W 80+ Bronze', 239.00, 'https://example.com/images/tt_smartbx1_550w.jpg', 'https://www.thermaltake.com/smart-bx1-550w.html', '1 x 4+4 Pin EPS', '5 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'ATX 12V v2.4', '2 x 6+2 Pin PCIe', 'ATX', 550, '80+ Bronze', '5 Years', 1.35);
INSERT INTO `psus` VALUES (5, 'Seasonic Focus GX-1000 80+ Gold', 799.00, 'https://example.com/images/seasonic_focus_gx1000.jpg', 'https://seasonic.com/focus-gx', '2 x 4+4 Pin EPS', '10 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 1000, '80+ Gold', '10 Years', 1.90);

-- ----------------------------
-- Table structure for rams
-- ----------------------------
DROP TABLE IF EXISTS `rams`;
CREATE TABLE `rams`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `memory_speed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memory_size` int NULL DEFAULT NULL,
  `memory_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rams
-- ----------------------------
INSERT INTO `rams` VALUES (1, 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', 299.00, 'https://example.com/images/corsair_vengeance_lpx_ddr4_3200.jpg', 'https://www.corsair.com/vengeance-lpx-ddr4-memory', '3200MHz', 16, 'DDR4', 'Black', 10);
INSERT INTO `rams` VALUES (2, 'Kingston Fury Beast 32GB (2x16GB) DDR5 5600MHz', 629.00, 'https://example.com/images/kingston_fury_beast_ddr5_5600.jpg', 'https://www.kingston.com/en/memory/gaming/fury-beast-ddr5', '5600MHz', 32, 'DDR5', 'Black', 12);
INSERT INTO `rams` VALUES (3, 'G.Skill Trident Z5 RGB 32GB (2x16GB) DDR5 6000MHz', 749.00, 'https://example.com/images/gskill_trident_z5_ddr5_6000.jpg', 'https://www.gskill.com/product/165/374/1642497222/F5-6000J3238F16GX2-TZ5RK', '6000MHz', 32, 'DDR5', 'Silver', 14);
INSERT INTO `rams` VALUES (4, 'TEAMGROUP T-Force Delta RGB 16GB (2x8GB) DDR4 3600MHz', 339.00, 'https://example.com/images/tforce_delta_rgb_ddr4_3600.jpg', 'https://www.teamgroupinc.com/en/product/delta-rgb-ddr4', '3600MHz', 16, 'DDR4', 'White', 10);
INSERT INTO `rams` VALUES (5, 'Crucial Pro 64GB (2x32GB) DDR5 5600MHz', 999.00, 'https://example.com/images/crucial_pro_ddr5_5600.jpg', 'https://www.crucial.com/memory/ddr5-pro', '5600MHz', 64, 'DDR5', 'Black', 15);

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `thread_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `thread_id`(`thread_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of replies
-- ----------------------------

-- ----------------------------
-- Table structure for storages
-- ----------------------------
DROP TABLE IF EXISTS `storages`;
CREATE TABLE `storages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `product_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `interface` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `readwrite` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `power` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `capacity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `storage_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warranty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storages
-- ----------------------------
INSERT INTO `storages` VALUES (1, 'Seagate Barracuda 2TB', 250.00, 'images/seagate_2tb.jpg', 'https://example.com/seagate-2tb', 'SATA', '3.5\"', 'Read/Write 200MB/s', '6W', '2TB', 'HDD', NULL, '3 Years');
INSERT INTO `storages` VALUES (2, 'Samsung 970 EVO Plus 1TB', 550.00, 'images/samsung_970evo_1tb.jpg', 'https://example.com/samsung-970evo-1tb', 'NVMe', 'M.2', 'Read 3500MB/s / Write 3300MB/s', '5W', '1TB', 'M.2 SSD', 'V-NAND', '5 Years');
INSERT INTO `storages` VALUES (3, 'Crucial MX500 500GB', 220.00, 'images/crucial_mx500_500gb.jpg', 'https://example.com/crucial-mx500-500gb', 'SATA', '2.5\"', 'Read 560MB/s / Write 510MB/s', '4W', '500GB', 'SATA SSD', 'TLC', '5 Years');
INSERT INTO `storages` VALUES (4, 'WD Blue 1TB', 180.00, 'images/wd_blue_1tb.jpg', 'https://example.com/wd-blue-1tb', 'SATA', '3.5\"', 'Read/Write 150MB/s', '6W', '1TB', 'HDD', NULL, '2 Years');
INSERT INTO `storages` VALUES (5, 'Kingston A2000 1TB', 300.00, 'images/kingston_a2000_1tb.jpg', 'https://example.com/kingston-a2000-1tb', 'NVMe', 'M.2', 'Read 2200MB/s / Write 2000MB/s', '5W', '1TB', 'M.2 SSD', '3D NAND', '5 Years');

-- ----------------------------
-- Table structure for threads
-- ----------------------------
DROP TABLE IF EXISTS `threads`;
CREATE TABLE `threads`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of threads
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email_Address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Email_Address`(`Email_Address` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'huzir', 'huzir123@gmail.com', '$2b$10$TT10OuIpKMd1PIBxm8AHjO3B0ny8xT1XWZ42mlQUu8yMfU/CFNzce', 'user');
INSERT INTO `users` VALUES (4, 'AdminUser', 'admin@example.com', '$2b$10$GJqA2NG/sUQ79xuvyzRRyu7kkstnU6RE/cbT/NzTu8uoNz0o55ZEe', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
