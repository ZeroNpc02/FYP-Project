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

 Date: 29/11/2025 19:21:16
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `front_panel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `side_panel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expansion_slot` int NULL DEFAULT NULL,
  `ssd_slot` int NULL DEFAULT NULL,
  `hdd_slot` int NULL DEFAULT NULL,
  `gpu_length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gpu_length_max_mm` int NULL DEFAULT NULL,
  `cpuCooler_height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cpu_cooler_height_max_mm` int NULL DEFAULT NULL,
  `psu_length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cases_color`(`color` ASC) USING BTREE,
  INDEX `idx_cases_gpu_length`(`gpu_length_max_mm` ASC) USING BTREE,
  INDEX `idx_cases_cooler_height`(`cpu_cooler_height_max_mm` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` (`id`, `name`, `price`, `image_url`, `product_url`, `dimensions`, `form_factor`, `materials`, `mainboard_support`, `color`, `front_panel`, `side_panel`, `expansion_slot`, `ssd_slot`, `hdd_slot`, `gpu_length`, `gpu_length_max_mm`, `cpuCooler_height`, `cpu_cooler_height_max_mm`, `psu_length`, `weight`) VALUES
(1, 'Lian Li O11 Dynamic EVO', 699.00, 'https://example.com/images/o11_dynamic_evo.jpg', 'https://www.lian-li.com/o11-dynamic-evo/', '465 x 285 x 459 mm', 'Mid Tower', 'Aluminum, Tempered Glass, Steel', 'E-ATX, ATX, Micro-ATX, Mini-ITX', 'Black', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 8, 6, 4, '422 mm', 422, '167 mm', 167, '220 mm', 12.00),
(2, 'NZXT H9 Flow', 749.00, 'https://example.com/images/nzxt_h9_flow.jpg', 'https://nzxt.com/product/h9-flow', '495 x 290 x 466 mm', 'Mid Tower', 'Steel, Tempered Glass, Plastic', 'ATX, Micro-ATX, Mini-ITX', 'Black', '1 x USB-C, 2 x USB 3.2, Audio Jack', 'Tempered Glass', 7, 4, 2, '435 mm', 435, '165 mm', 165, '200 mm', 13.10),
(3, 'Fractal Design North', 679.00, 'https://example.com/images/fractal_north.jpg', 'https://www.fractal-design.com/products/cases/north/', '447 x 215 x 469 mm', 'Mid Tower', 'Steel, Tempered Glass, Real Wood', 'ATX, Micro-ATX, Mini-ITX', 'Wood', '2 x USB 3.0, 1 x USB-C, Audio Combo', 'Tempered Glass', 7, 3, 2, '355 mm', 355, '170 mm', 170, '255 mm', 7.60),
(4, 'Montech Air 100 ARGB', 299.00, 'https://example.com/images/montech_air100_argb.jpg', 'https://www.montechpc.com/en/products_detail.php?serial=94', '405 x 210 x 425 mm', 'Micro ATX', 'Steel, Tempered Glass, Plastic', 'Micro-ATX, Mini-ITX', 'Black', '2 x USB 3.0, 1 x Audio Combo', 'Tempered Glass', 4, 2, 2, '330 mm', 330, '161 mm', 161, '160 mm', 6.30),
(5, 'Phanteks XT Pro Ultra', 599.00, 'https://example.com/images/phanteks_xt_pro_ultra.jpg', 'https://phanteks.com/XT-Pro-Ultra.html', '460 x 230 x 490 mm', 'Mid Tower', 'Steel, Tempered Glass', 'E-ATX, ATX, Micro-ATX, Mini-ITX', 'Black', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 7, 3, 2, '415 mm', 415, '184 mm', 184, '270 mm', 9.20),
(6, 'Lian Li Lancool III', 849.00, NULL, NULL, '475 x 230 x 480 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 398, NULL, 180, NULL, NULL),
(7, 'NZXT H5 Flow', 449.00, NULL, NULL, '460 x 210 x 460 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Mesh', NULL, NULL, NULL, NULL, 365, NULL, 165, NULL, NULL),
(8, 'Fractal Design Meshify C', 399.00, NULL, NULL, '440 x 224 x 479 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 315, NULL, 172, NULL, NULL),
(9, 'Corsair 4000D Airflow', 349.00, NULL, NULL, '453 x 230 x 466 mm', 'ATX Mid Tower', NULL, NULL, 'White', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 360, NULL, 170, NULL, NULL),
(10, 'be quiet! Pure Base 500DX', 499.00, NULL, NULL, '468 x 231 x 501 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 369, NULL, 190, NULL, NULL),
(11, 'Thermaltake View 71', 799.00, NULL, NULL, '590 x 246 x 569 mm', 'ATX Full Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 310, NULL, 185, NULL, NULL),
(12, 'Phanteks Eclipse P400A', 379.00, NULL, NULL, '465 x 200 x 455 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 400, NULL, 170, NULL, NULL),
(13, 'Lian Li LANCOOL 216', 399.00, NULL, NULL, '445 x 230 x 485 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Mesh', NULL, NULL, NULL, NULL, 400, NULL, 180, NULL, NULL),
(14, 'NZXT H7 Flow', 599.00, NULL, NULL, '480 x 230 x 505 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Mesh', NULL, NULL, NULL, NULL, 400, NULL, 185, NULL, NULL),
(15, 'Cooler Master MasterBox Q300L', 199.00, NULL, NULL, '389 x 194 x 399 mm', 'Micro ATX', NULL, NULL, 'Black', NULL, 'Acrylic', NULL, NULL, NULL, NULL, 350, NULL, 159, NULL, NULL),
(16, 'Fractal Design Pop Air', 299.00, NULL, NULL, '450 x 215 x 440 mm', 'ATX Mid Tower', NULL, NULL, 'White', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 340, NULL, 170, NULL, NULL),
(17, 'Corsair 275R Airflow', 299.00, NULL, NULL, '445 x 230 x 466 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 370, NULL, 170, NULL, NULL),
(18, 'Lian Li PC-O11 Dynamic', 699.00, NULL, NULL, '465 x 285 x 460 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 422, NULL, 167, NULL, NULL),
(19, 'NZXT H210i', 269.00, NULL, NULL, '349 x 210 x 375 mm', 'Mini ITX', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 305, NULL, 165, NULL, NULL),
(20, 'Silverstone RL06', 299.00, NULL, NULL, '473 x 200 x 440 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 395, NULL, 167, NULL, NULL),
(21, 'Cooler Master Silencio S600', 449.00, NULL, NULL, '467 x 220 x 505 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Aluminum', NULL, NULL, NULL, NULL, 414, NULL, 165, NULL, NULL),
(22, 'Phanteks P500A', 549.00, NULL, NULL, '500 x 240 x 520 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 440, NULL, 175, NULL, NULL),
(23, 'Lian Li PC-V3000', 1299.00, NULL, NULL, '285 x 650 x 630 mm', 'ATX Full Tower', NULL, NULL, 'Black', NULL, 'Aluminum', NULL, NULL, NULL, NULL, 470, NULL, 190, NULL, NULL),
(24, 'NZXT H510', 399.00, NULL, NULL, '428 x 210 x 460 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Tempered Glass', NULL, NULL, NULL, NULL, 381, NULL, 165, NULL, NULL),
(25, 'Fractal Design Define 7 Compact', 549.00, NULL, NULL, '440 x 224 x 448 mm', 'ATX Mid Tower', NULL, NULL, 'Black', NULL, 'Solid Panel', NULL, NULL, NULL, NULL, 315, NULL, 169, NULL, NULL);

-- ----------------------------
-- Table structure for table `completed_builds`
-- ----------------------------

DROP TABLE IF EXISTS `completed_builds`;
CREATE TABLE `completed_builds` (
  `completed_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `builds_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`completed_id`),
  INDEX `idx_completed_builds_user` (`user_id`),
  INDEX `idx_completed_builds_public` (`is_public`),
  INDEX `idx_completed_builds_created` (`created_at` DESC),
  CONSTRAINT `fk_completed_builds_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_completed_builds_build` FOREIGN KEY (`builds_id`) REFERENCES `builds` (`builds_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for table `build_comments`
-- ----------------------------

DROP TABLE IF EXISTS `build_comments`;
CREATE TABLE `build_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `completed_build_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `idx_build_comments_build` (`completed_build_id`),
  INDEX `idx_build_comments_user` (`user_id`),
  INDEX `idx_build_comments_parent` (`parent_comment_id`),
  INDEX `idx_build_comments_created` (`created_at` DESC),
  CONSTRAINT `fk_build_comments_build` FOREIGN KEY (`completed_build_id`) REFERENCES `completed_builds` (`completed_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_build_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_build_comments_parent` FOREIGN KEY (`parent_comment_id`) REFERENCES `build_comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for table `build_ratings`
-- ----------------------------

DROP TABLE IF EXISTS `build_ratings`;
CREATE TABLE `build_ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `completed_build_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `uk_build_ratings_user_build` (`completed_build_id`, `user_id`),
  INDEX `idx_build_ratings_build` (`completed_build_id`),
  INDEX `idx_build_ratings_user` (`user_id`),
  CONSTRAINT `fk_build_ratings_build` FOREIGN KEY (`completed_build_id`) REFERENCES `completed_builds` (`completed_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_build_ratings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_rating_range` CHECK (`rating` >= 1 AND `rating` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `height_mm` int NULL DEFAULT NULL,
  `heatpipes` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cpucoolers_color`(`color` ASC) USING BTREE,
  INDEX `idx_cpucoolers_height`(`height_mm` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cpucoolers
-- ----------------------------
INSERT INTO `cpucoolers` (`id`, `name`, `price`, `image_url`, `product_url`, `liquid_cooling`, `dimension`, `color`, `height_mm`, `heatpipes`, `wattage`) VALUES
(1, 'Noctua NH-U12S Redux', 239.00, '', '', 0, '158mm (H) x 125mm (W) x 71mm (D)', 'Black', 158, '4 heatpipes', 180),
(2, 'DeepCool AK400 Performance', 139.00, '', '', 0, '155mm (H) x 127mm (W) x 97mm (D)', 'Black', 155, '4 heatpipes', 180),
(3, 'be quiet! Dark Rock 4', 329.00, '', '', 0, '159mm (H) x 136mm (W) x 96mm (D)', 'Black', 159, '6 heatpipes', 200),
(4, 'Cooler Master MasterLiquid ML240L V2 RGB', 329.00, '', '', 1, '277mm (L) x 119.6mm (W) x 27.2mm (H)', 'RGB', 277, 'Pump-based', 250),
(5, 'NZXT Kraken X63 RGB', 569.00, '', '', 1, '315mm (L) x 143mm (W) x 30mm (H)', 'RGB', 315, 'Pump-based', 280),
(6, 'Noctua NH-D15', 599.00, NULL, NULL, 0, '161mm (H) x 150mm (W) x 135mm (D)', 'Black/Brown', 161, '6 heatpipes', 250),
(7, 'be quiet! Dark Rock Pro 4', 399.00, NULL, NULL, 0, '163mm (H) x 139mm (W) x 111mm (D)', 'Black', 163, '7 heatpipes', 250),
(8, 'Corsair H150i Elite Capellix', 799.00, NULL, NULL, 1, '397mm (L) x 120mm (W) x 27mm (H)', 'RGB', 397, 'Pump-based', 280),
(9, 'Arctic Liquid Freezer II 240', 329.00, NULL, NULL, 1, '277mm (L) x 120mm (W) x 38mm (H)', 'Black', 277, 'Pump-based', 250),
(10, 'Thermalright Phantom Spirit 120 SE', 199.00, NULL, NULL, 0, '154mm (H) x 120mm (W) x 71mm (D)', 'Silver', 154, '5 heatpipes', 220),
(11, 'ID-COOLING SE-224-XTS', 149.00, NULL, NULL, 0, '155mm (H) x 120mm (W) x 73mm (D)', 'Black', 155, '4 heatpipes', 180),
(12, 'Scythe Fuma 2', 249.00, NULL, NULL, 0, '154.5mm (H) x 130mm (W) x 140mm (D)', 'Black', 154, '6 heatpipes', 190),
(13, 'Cooler Master Hyper 212 RGB', 199.00, NULL, NULL, 0, '158.8mm (H) x 120mm (W) x 77.6mm (D)', 'Black', 158, '4 heatpipes', 150),
(14, 'Thermaltake TH240 ARGB', 449.00, NULL, NULL, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 280),
(15, 'Deepcool AK620', 169.00, NULL, NULL, 0, '160mm (H) x 120mm (W) x 97mm (D)', 'Black', 160, '6 heatpipes', 220),
(16, 'Noctua NH-U9S', 349.00, NULL, NULL, 0, '125mm (H) x 95mm (W) x 71mm (D)', 'Black/Brown', 125, '5 heatpipes', 130),
(17, 'be quiet! Pure Rock Slim 2', 169.00, NULL, NULL, 0, '145mm (H) x 90mm (W) x 68mm (D)', 'Black', 145, '4 heatpipes', 120),
(18, 'Corsair H100i RGB PLATINUM', 649.00, NULL, NULL, 1, '322mm (L) x 120mm (W) x 27mm (H)', 'RGB', 322, 'Pump-based', 240),
(19, 'Arctic Freezer 34 eSports DUO', 249.00, NULL, NULL, 0, '157mm (H) x 120mm (W) x 96mm (D)', 'Black', 157, '4 heatpipes', 210),
(20, 'Zalman CNPS9900B MAX', 329.00, NULL, NULL, 0, '154mm (H) x 135mm (W) x 110mm (D)', 'Black', 154, '6 heatpipes', 250),
(21, 'Thermaltake TH120 ARGB', 349.00, NULL, NULL, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 150),
(22, 'ID-COOLING AURAFLOW X 240', 399.00, NULL, NULL, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 250),
(23, 'Scythe Mugen 5 Rev.B', 229.00, NULL, NULL, 0, '154.5mm (H) x 130mm (W) x 140mm (D)', 'Black', 154, '6 heatpipes', 220),
(24, 'Cooler Master MasterLiquid ML240L', 299.00, NULL, NULL, 1, '277mm (L) x 119.6mm (W) x 27.2mm (H)', 'Black', 277, 'Pump-based', 200),
(25, 'Noctua NH-L12S', 299.00, NULL, NULL, 0, '145mm (H) x 125mm (W) x 70mm (D)', 'Black/Brown', 145, '5 heatpipes', 145);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cpus
-- ----------------------------
INSERT INTO `cpus` (`id`, `name`, `brand`, `price`, `image_url`, `product_url`, `cores`, `threads`, `base_clock`, `boost_clock`, `socket`, `dimension`, `wattage`, `cpu_category`) VALUES
(1, 'Ryzen 7 7800X3D', 'AMD', 1399.00, 'images/CPU/AMD_RYZEN_7_7800X3D_PROCESSOR_TMT.jpg', 'https://www.tmt.my/products/amd-ryzen-7-7800x3d-processor-am5', 8, 16, 4.20, 5.00, 'AM5', '3.99 cm x 3.99 cm x 0.25 cm', 120, 'consumer'),
(2, 'AMD Ryzen 5 7600', 'AMD', 849.00, 'images/CPU/AMD-RYZEN-5-7600-PROCESSOR-TMT.jpg', 'https://www.tmt.my/products/amd-processor-am5-ryzen-5-7600', 6, 12, 3.80, 5.10, 'AM5', '40mm x 40mm', 65, 'consumer'),
(3, 'AMD Ryzen 9 7900X', 'AMD', 2699.00, 'images/CPU/AMD-RYZEN-9-7900X-PROCESSOR-ASASHI.jpg', 'https://asashi.com.my/english/ws.item/56986/PROCESSOR/AMD%20AM5/AMD-RYZEN-9-7900X-Processor-%2876M-Cache---12C24T---up-to-5.7Ghz%29-AM5---100-100000589WOF/', 12, 24, 4.70, 5.60, 'AM5', '40mm x 40mm', 170, 'consumer'),
(4, 'Intel Core i5-13600K', 'INTEL', 1349.00, 'https://example.com/images/i5_13600k.jpg', 'https://www.intel.com/content/www/us/en/products/sku/230496/intel-core-i513600k-processor-24m-cache-up-to-5-10-ghz.html', 14, 20, 3.50, 5.10, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer'),
(5, 'Intel Core i7-14700K', 'INTEL', 1379.00, 'images/CPU/INTEL-CORE-I5-14700K-PROCESSOR-TMT.jpg', 'https://www.tmt.my/products/intel-i7-14700k-unlocked-14th-gen-processor', 20, 28, 3.40, 5.60, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer'),
(6, 'AMD Ryzen 5 5600', 'AMD', 469.00, 'images/CPU/AMD-RYZEN5-5600-PROCESSOR-TMT.jpg', 'https://www.tmt.my/products/amd-processor-am4-ryzen-5-5600', 6, 12, 3.50, 4.40, 'AM4', '40mm x 40mm', 65, 'consumer'),
(7, 'Intel Xeon W5-2465X', 'INTEL', 3499.00, 'https://example.com/images/xeon-w5-2465x.jpg', 'https://www.intel.com', 16, 32, 3.10, 4.60, 'LGA4677', '45mm x 45mm', 270, 'workstation'),
(8, 'AMD Ryzen Threadripper Pro 7965WX', 'AMD', 6999.00, 'https://example.com/images/threadripper-pro-7965wx.jpg', 'https://www.amd.com', 24, 48, 4.00, 5.30, 'sTR5', '58.5mm x 75.4mm', 350, 'workstation'),
(9, 'Intel Xeon W9-3495X', 'INTEL', 11499.00, 'https://example.com/images/xeon-w9-3495x.jpg', 'https://www.intel.com', 56, 112, 1.90, 4.80, 'LGA4677', '45mm x 45mm', 350, 'workstation'),
(10, 'AMD Ryzen Threadripper 7980X', 'AMD', 9499.00, 'https://example.com/images/threadripper-7980x.jpg', 'https://www.amd.com', 64, 128, 3.20, 0.00, 'sTR5', '58.5mm x 75.4mm', 350, 'workstation'),
(11, 'Intel Xeon Platinum 8460Y', 'INTEL', 18999.00, 'https://example.com/images/xeon-platinum-8460y.jpg', 'https://www.intel.com', 40, 80, 2.00, 3.50, 'LGA4677', '45mm x 45mm', 300, 'datacenter'),
(12, 'AMD EPYC 9554', 'AMD', 15999.00, 'https://example.com/images/epyc-9554.jpg', 'https://www.amd.com', 64, 128, 3.10, 3.75, 'SP5', '72mm x 75mm', 360, 'datacenter'),
(13, 'Intel Xeon Silver 4410Y', 'INTEL', 4499.00, 'https://example.com/images/xeon-silver-4410y.jpg', 'https://www.intel.com', 12, 24, 2.00, 3.90, 'LGA4677', '45mm x 45mm', 150, 'datacenter'),
(14, 'AMD EPYC 9354P', 'AMD', 7999.00, 'https://example.com/images/epyc-9354p.jpg', 'https://www.amd.com', 32, 64, 3.25, 3.80, 'SP5', '72mm x 75mm', 280, 'datacenter'),
(15, 'Intel Core i9-14900K', 'INTEL', 2299.00, 'https://example.com/images/i9-14900k.jpg', 'https://www.intel.com', 24, 32, 3.20, 6.00, 'LGA1700', '37.5mm x 37.5mm', 253, 'consumer'),
(16, 'AMD Ryzen 5 7500F', 'AMD', 799.00, NULL, NULL, 6, 12, NULL, NULL, 'AM5', NULL, 65, 'consumer'),
(17, 'AMD Ryzen 7 7700X', 'AMD', 1299.00, NULL, NULL, 8, 16, NULL, NULL, 'AM5', NULL, 105, 'consumer'),
(18, 'AMD Ryzen 9 7950X3D', 'AMD', 2999.00, NULL, NULL, 16, 32, NULL, NULL, 'AM5', NULL, 120, 'consumer'),
(19, 'Intel Core i5-13400F', 'INTEL', 999.00, NULL, NULL, 10, 16, NULL, NULL, 'LGA1700', NULL, 65, 'consumer'),
(20, 'Intel Core i7-13700F', 'INTEL', 1599.00, NULL, NULL, 16, 24, NULL, NULL, 'LGA1700', NULL, 65, 'consumer'),
(21, 'Intel Core i9-13900KS', 'INTEL', 3299.00, NULL, NULL, 24, 32, NULL, NULL, 'LGA1700', NULL, 150, 'consumer'),
(22, 'AMD Ryzen 3 5300G', 'AMD', 399.00, NULL, NULL, 4, 8, NULL, NULL, 'AM4', NULL, 65, 'consumer'),
(23, 'AMD Ryzen 5 5500', 'AMD', 499.00, NULL, NULL, 6, 12, NULL, NULL, 'AM4', NULL, 65, 'consumer'),
(24, 'AMD Ryzen 7 5700G', 'AMD', 799.00, NULL, NULL, 8, 16, NULL, NULL, 'AM4', NULL, 65, 'consumer'),
(25, 'AMD Ryzen 9 5900X', 'AMD', 1199.00, NULL, NULL, 12, 24, NULL, NULL, 'AM4', NULL, 105, 'consumer'),
(26, 'Intel Core i3-13100', 'INTEL', 649.00, NULL, NULL, 4, 8, NULL, NULL, 'LGA1700', NULL, 60, 'consumer'),
(27, 'Intel Core i3-13400', 'INTEL', 849.00, NULL, NULL, 10, 16, NULL, NULL, 'LGA1700', NULL, 65, 'consumer'),
(28, 'Intel Core i5-13500', 'INTEL', 1149.00, NULL, NULL, 14, 20, NULL, NULL, 'LGA1700', NULL, 65, 'consumer'),
(29, 'Intel Core i5-14600K', 'INTEL', 1599.00, NULL, NULL, 14, 20, NULL, NULL, 'LGA1700', NULL, 125, 'consumer'),
(30, 'Intel Core i7-13700K', 'INTEL', 1999.00, NULL, NULL, 16, 24, NULL, NULL, 'LGA1700', NULL, 125, 'consumer'),
(31, 'Intel Core i9-13900K', 'INTEL', 2799.00, NULL, NULL, 24, 32, NULL, NULL, 'LGA1700', NULL, 125, 'consumer'),
(32, 'AMD Ryzen 5 4500', 'AMD', 299.00, NULL, NULL, 6, 6, NULL, NULL, 'AM4', NULL, 65, 'consumer'),
(33, 'AMD Ryzen 5 5600G', 'AMD', 599.00, NULL, NULL, 6, 12, NULL, NULL, 'AM4', NULL, 65, 'consumer'),
(34, 'AMD Ryzen 7 5700X3D', 'AMD', 1299.00, NULL, NULL, 8, 16, NULL, NULL, 'AM4', NULL, 105, 'consumer'),
(35, 'Intel Core i5-12400F', 'INTEL', 699.00, NULL, NULL, 6, 12, NULL, NULL, 'LGA1700', NULL, 65, 'consumer');

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
  `gpu_subcategory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'gaming',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gpus
-- ----------------------------
INSERT INTO `gpus` (`id`, `name`, `brand`, `price`, `image_url`, `product_url`, `dimension`, `color`, `core_clock`, `memory_size`, `memory_type`, `power_connectors`, `wattage`, `card_bus`, `gpu_category`, `gpu_subcategory`) VALUES
(1, 'MSI GeForce RTX 5070 Ti EXPERT OC', 'NVIDIA', 4199.00, 'images/GPU/MSI-RTX5070TI-EXPERT-OC-1.jpg', 'https://www.tmt.my/products/msi-geforce-rtx-5070-ti-expert-oc', '	15.00 cm x 31.90 cm x 6.00 cm', 'black', 2588.00, 16, 'GDDR7', '16-pin', 300, '256-Bit', 'consumer', 'gaming'),
(2, 'ASUS Dual Radeon RX 6500 XT V2 OC', 'AMD', 599.00, 'images/GPU/ASUS-DUAL-RADEON-RX-6500-XT-V2-OC-1.jpg', '\r\n', NULL, NULL, NULL, 8, 'GDDR6', NULL, 130, NULL, 'consumer', 'entry-level'),
(3, 'MSI GeForce RTX 5070 Ti Gaming TRIO OC', 'NVIDIA', 4299.00, 'images/GPU/MSI-RTX-5070-TI-GAMING-TRIO-PLUS-OC.jpg', '\r\n', NULL, NULL, NULL, 16, 'GDDR7', NULL, 300, NULL, 'consumer', 'gaming'),
(4, 'ZOTAC GAMING GeForce RTX 5090 ARCTICSTORM AIO', 'NVIDIA', 12999.00, 'images/GPU/ZOTAC-RTX5090-ARCTICSTORM-AIO-MAIN.jpg', '\r\n', NULL, NULL, NULL, 32, 'GDDR7', NULL, 600, NULL, 'consumer', 'enthusiast'),
(5, 'Gigabyte GeForce RTX 5050 WINDFORCE OC', 'NVIDIA', 1099.00, 'images/GPU/', '\r\n', NULL, NULL, NULL, 8, 'GDDR6', NULL, 180, NULL, 'consumer', 'entry-level'),
(6, 'Sapphire Radeon RX 9060 XT OC NITRO+ 16GB', 'AMD', 1859.00, 'images/GPU/SAPPHIRE-RADEON-NITRO-RX9060XT-1.jpg', '', NULL, NULL, NULL, 16, 'GDDR6X', NULL, 375, NULL, 'consumer', 'gaming'),
(7, 'Acer ARC B580 Nitro OC', 'INTEL', 1399.00, 'images/GPU/ACER-ARC-B580-NITRO-OC-1.jpg', '\r\n', NULL, NULL, NULL, 12, 'GDDR6', NULL, 150, NULL, 'consumer', 'workstation'),
(8, 'MSI GeForce RTX 5070 Ti SHADOW 3X OC', 'NVIDIA', 3799.00, 'images/GPU/MSI-RTX-5070-ti-SHADOW-3X-OC.jpg', '\r\n', NULL, NULL, NULL, 16, 'GDDR7', NULL, 300, NULL, 'consumer', 'professional'),
(9, 'ASUS TURBO Radeon AI PRO R9700', 'AMD', 6849.00, 'images/GPU/ASUS-TURBO-AI-PRO-9700-BOX-VIEW.jpg', '\r\n', NULL, NULL, NULL, 24, 'GDDR6', NULL, 355, NULL, 'workstation', 'enthusiast'),
(10, 'ZOTAC GAMING GeForce RTX 3050 Twin Edge OC', 'NVIDIA', 749.00, 'https://www.tmt.my/products/zotac-gaming-geforce-rtx-3050-twin-edge-oc', 'images/GPU/ZOTAC-RTX-3050-TWIN-EDGE-OC-1.jpg\r', NULL, NULL, NULL, 8, 'GDDR6', NULL, 130, NULL, 'consumer', 'entry-level'),
(11, 'ASUS Dual Radeon RX 7600 EVO OC', 'AMD', 1099.00, 'https://www.tmt.my/products/asus-dual-radeon-rx-7600-evo-oc', 'images/GPU/ASUS-DUAL-RX7600-EVO-OC-1\r', NULL, NULL, NULL, 16, 'GDDR6', NULL, 220, NULL, 'consumer', 'gaming'),
(12, 'ASUS Prime GeForce RTX 5080 OC', 'NVIDIA', 6399.00, 'https://www.tmt.my/products/asus-prime-geforce-rtx-5080-oc', 'images/GPU/ASUS-PRIME-RTX-5080-OC.jpg\r', NULL, NULL, NULL, 16, 'GDDR7', NULL, 350, NULL, 'consumer', 'gaming'),
(13, 'Gigabyte GeForce RTX 5060 OC Low Profile', 'NVIDIA', 1349.00, 'https://www.tmt.my/products/gigabyte-geforce-rtx-5060-oc-low-profile', 'images/GPU/\r', NULL, NULL, NULL, 8, 'GDDR6', NULL, 170, NULL, 'consumer', 'entry-level'),
(14, 'PNY GeForce RTX 5060 Ti Dual Fan OC 8GB', 'NVIDIA', 1729.00, 'https://www.tmt.my/products/pny-geforce-rtx-5060-ti-dual-fan-oc-8gb', 'images/GPU/\r', NULL, NULL, NULL, 8, 'GDDR6', NULL, 220, NULL, 'consumer', 'workstation'),
(15, 'Palit GeForce RTX 5060 Dual OC', 'NVIDIA', 1329.00, 'https://www.tmt.my/products/palit-geforce-rtx-5060-dual-oc', 'images/GPU/\r', NULL, NULL, NULL, 8, 'GDDR6', NULL, 220, NULL, 'consumer', 'datacenter'),
(16, 'MSI GeForce RTX 4070 GAMING X TRIO', 'NVIDIA', 2999.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6X', '8-pin x 1', 200, NULL, 'consumer', 'gaming'),
(17, 'ASUS ROG Strix RTX 4080 OC', 'NVIDIA', 5999.00, NULL, NULL, NULL, NULL, NULL, 16, 'GDDR6X', '16-pin x 1', 320, NULL, 'consumer', 'gaming'),
(18, 'Gigabyte Radeon RX 7900 XT GAMING OC', 'AMD', 3599.00, NULL, NULL, NULL, NULL, NULL, 20, 'GDDR6', '8-pin x 2', 315, NULL, 'consumer', 'gaming'),
(19, 'Sapphire Pulse Radeon RX 6750 XT', 'AMD', 1799.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6', '8-pin x 1', 250, NULL, 'consumer', 'gaming'),
(20, 'PowerColor RX 6600 Fighter', 'AMD', 999.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '8-pin x 1', 180, NULL, 'consumer', 'gaming'),
(21, 'ZOTAC Gaming GeForce RTX 4060 Ti Twin Edge', 'NVIDIA', 1899.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '8-pin x 1', 160, NULL, 'consumer', 'gaming'),
(22, 'PNY GeForce RTX 4070 Ti Verto', 'NVIDIA', 3599.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6X', '16-pin x 1', 285, NULL, 'consumer', 'gaming'),
(23, 'XFX RX 7800 XT Black Pearl', 'AMD', 2599.00, NULL, NULL, NULL, NULL, NULL, 16, 'GDDR6', '8-pin x 2', 263, NULL, 'consumer', 'gaming'),
(24, 'ASUS TUF Gaming RTX 4090 OC', 'NVIDIA', 9999.00, NULL, NULL, NULL, NULL, NULL, 24, 'GDDR6X', '16-pin x 1', 450, NULL, 'consumer', 'gaming'),
(25, 'Gigabyte Eagle RTX 4060', 'NVIDIA', 1499.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '8-pin x 1', 130, NULL, 'consumer', 'gaming'),
(26, 'MSI Gaming GeForce RTX 3060 Ti', 'NVIDIA', 1799.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '12-pin x 1', 200, NULL, 'consumer', 'gaming'),
(27, 'Sapphire NITRO+ RX 6950 XT', 'AMD', 2299.00, NULL, NULL, NULL, NULL, NULL, 16, 'GDDR6', '8-pin x 2', 335, NULL, 'consumer', 'gaming'),
(28, 'Palit JetStream RTX 4080', 'NVIDIA', 5599.00, NULL, NULL, NULL, NULL, NULL, 16, 'GDDR6X', '16-pin x 1', 320, NULL, 'consumer', 'gaming'),
(29, 'XFX Speedster RX 6600 XT', 'AMD', 1199.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '8-pin x 1', 160, NULL, 'consumer', 'gaming'),
(30, 'ASUS DUAL RTX 4070 OC', 'NVIDIA', 2799.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6X', '8-pin x 1', 200, NULL, 'consumer', 'gaming'),
(31, 'MSI Ventus RTX 3070 Ti OC', 'NVIDIA', 1999.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6X', '12-pin x 1', 290, NULL, 'consumer', 'gaming'),
(32, 'PowerColor Hellhound RX 6650 XT', 'AMD', 899.00, NULL, NULL, NULL, NULL, NULL, 8, 'GDDR6', '8-pin x 1', 230, NULL, 'consumer', 'gaming'),
(33, 'ASRock Phantom Gaming RX 7700 XT', 'AMD', 1999.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6', '8-pin x 1', 245, NULL, 'consumer', 'gaming'),
(34, 'Gigabyte Windforce RTX 3060', 'NVIDIA', 1499.00, NULL, NULL, NULL, NULL, NULL, 12, 'GDDR6', '8-pin x 1', 170, NULL, 'consumer', 'gaming'),
(35, 'Sapphire PULSE RX 7900 XTX', 'AMD', 3999.00, NULL, NULL, NULL, NULL, NULL, 24, 'GDDR6', '8-pin x 3', 355, NULL, 'consumer', 'gaming');

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
  `cpu_socket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chipset` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memory_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `memory_speed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wireless_connection` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expansion_slot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `storage_interface` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wattage` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_motherboards_cpu_socket`(`cpu_socket` ASC) USING BTREE,
  INDEX `idx_motherboards_memory_type`(`memory_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of motherboards
-- ----------------------------
INSERT INTO `motherboards` (`id`, `name`, `price`, `image_url`, `product_url`, `CPU`, `cpu_socket`, `chipset`, `memory`, `memory_type`, `memory_speed`, `LAN`, `wireless_connection`, `expansion_slot`, `storage_interface`, `form_factor`, `wattage`) VALUES
(1, 'MSI MPG B850 EDGE TI WIFI ATX Motherboard', 1499.00, NULL, 'https://www.tmt.my/products/msi-mpg-b850-edge-ti-wifi-atx-motherboard', 'AM5', 'AM5', 'AMD B850', '4 x DDR5', 'DDR5', NULL, 'YES', 'YES', 'PCI-E 5.0 x 16 ', '4 x M.2', 'ATX', 70),
(2, 'MSI B550 Gaming Plus', 599.00, 'https://example.com/images/msi_b550_gaming_plus.jpg', 'https://www.msi.com/Motherboard/B550-GAMING-PLUS', 'AM4', 'AM4', 'AMD B550', '4 x DDR4, up to 4400 MHz, 128GB max', 'DDR4', '4400+', 'Realtek 8111H Gigabit LAN', 'None', '2 x PCIe x16, 2 x PCIe x1', '2 x M.2, 6 x SATA 6Gb/s', 'ATX', 65),
(3, 'ASUS TUF Gaming B650-PLUS WiFi', 899.00, 'https://example.com/images/asus_tuf_b650_plus_wifi.jpg', 'https://www.asus.com/motherboards-components/motherboards/tuf-gaming/tuf-gaming-b650-plus-wifi/', 'AM5', 'AM5', 'AMD B650', '4 x DDR5, up to 6400 MHz, 128GB max', 'DDR5', '6400+', '2.5Gb Intel LAN', 'WiFi 6 + Bluetooth 5.2', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '3 x M.2, 4 x SATA 6Gb/s', 'ATX', 75),
(4, 'Gigabyte B760M AORUS Elite AX', 749.00, 'https://example.com/images/gigabyte_b760m_aorus_elite_ax.jpg', 'https://www.gigabyte.com/Motherboard/B760M-AORUS-ELITE-AX-rev-10', 'LGA1700', 'LGA1700', 'Intel B760', '4 x DDR5, up to 7600 MHz, 128GB max', 'DDR5', '7600+', '2.5Gb LAN', 'WiFi 6E + Bluetooth 5.3', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '2 x M.2, 4 x SATA 6Gb/s', 'Micro ATX', 70),
(5, 'ASRock Z790 Steel Legend', 1099.00, 'https://example.com/images/asrock_z790_steel_legend.jpg', 'https://www.asrock.com/mb/Intel/Z790%20Steel%20Legend/', 'LGA1700', 'LGA1700', 'Intel Z790', '4 x DDR5, up to 7200 MHz, 128GB max', 'DDR5', '7200+', '2.5Gb Realtek LAN', 'WiFi 6E + Bluetooth 5.3', '3 x PCIe x16, 1 x PCIe x1', '3 x M.2, 8 x SATA 6Gb/s', 'ATX', 80),
(6, 'ASUS ROG Strix B550-I Gaming', 899.00, 'https://example.com/images/asus_rog_strix_b550i.jpg', 'https://rog.asus.com/motherboards/rog-strix/rog-strix-b550-i-gaming-model/', 'AM4', 'AM4', 'AMD B550', '2 x DDR4, up to 5100 MHz, 64GB max', 'DDR4', '5100+', 'Intel I225-V 2.5Gb LAN', 'WiFi 6 + Bluetooth 5.1', '1 x PCIe x16', '2 x M.2, 4 x SATA 6Gb/s', 'Mini ITX', 60),
(7, 'ASUS TUF Gaming X670E-Plus WiFi', 1299.00, NULL, NULL, NULL, 'AM5', 'AMD X670E', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(8, 'MSI MAG B760 Tomahawk WiFi', 899.00, NULL, NULL, NULL, 'LGA1700', 'Intel B760', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(9, 'Gigabyte AORUS B650 Elite AX', 799.00, NULL, NULL, NULL, 'AM5', 'AMD B650', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(10, 'ASRock B550M Pro4', 449.00, NULL, NULL, NULL, 'AM4', 'AMD B550', NULL, 'DDR4', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(11, 'ASUS Prime Z690-P WiFi', 999.00, NULL, NULL, NULL, 'LGA1700', 'Intel Z690', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(12, 'MSI PRO B650M-G WiFi', 599.00, NULL, NULL, NULL, 'AM5', 'AMD B650', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(13, 'Gigabyte Z790 AORUS ELITE AX', 1099.00, NULL, NULL, NULL, 'LGA1700', 'Intel Z790', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(14, 'ASRock X670E Steel Legend', 1199.00, NULL, NULL, NULL, 'AM5', 'AMD X670E', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(15, 'ASUS ROG Strix B550-F Gaming WiFi', 799.00, NULL, NULL, NULL, 'AM4', 'AMD B550', NULL, 'DDR4', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(16, 'MSI MAG B660M Mortar WiFi', 749.00, NULL, NULL, NULL, 'LGA1700', 'Intel B660', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(17, 'Gigabyte X670 AORUS ELITE', 999.00, NULL, NULL, NULL, 'AM5', 'AMD X670', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(18, 'ASUS TUF Gaming H770 WiFi', 849.00, NULL, NULL, NULL, 'LGA1700', 'Intel H770', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(19, 'MSI B650 GAMING PLUS WIFI', 749.00, NULL, NULL, NULL, 'AM5', 'AMD B650', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(20, 'ASRock Z690 Phantom Gaming ITX/TB4', 1299.00, NULL, NULL, NULL, 'LGA1700', 'Intel Z690', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Mini ITX', NULL),
(21, 'Gigabyte B650M DS3H', 499.00, NULL, NULL, NULL, 'AM5', 'AMD B650', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(22, 'ASUS Prime B660M-A WiFi', 599.00, NULL, NULL, NULL, 'LGA1700', 'Intel B660', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(23, 'MSI MPG X670E Carbon WiFi', 1499.00, NULL, NULL, NULL, 'AM5', 'AMD X670E', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(24, 'ASRock B650M PG Riptide WiFi', 699.00, NULL, NULL, NULL, 'AM5', 'AMD B650', NULL, 'DDR5', NULL, NULL, NULL, NULL, NULL, 'Micro ATX', NULL),
(25, 'Gigabyte Z690 Gaming X', 849.00, NULL, NULL, NULL, 'LGA1700', 'Intel Z690', NULL, 'DDR4', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL),
(26, 'ASUS TUF Gaming B660-Plus D4', 649.00, NULL, NULL, NULL, 'LGA1700', 'Intel B660', NULL, 'DDR4', NULL, NULL, NULL, NULL, NULL, 'ATX', NULL);

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
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PSU_compatibility` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PCIe_connector` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_factor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `power` int NULL DEFAULT NULL,
  `efficiency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warranty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_psus_color`(`color` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of psus
-- ----------------------------
INSERT INTO `psus` (`id`, `name`, `price`, `image_url`, `product_url`, `EPS_connector`, `SATA_connector`, `Dimensions`, `Modular`, `color`, `PSU_compatibility`, `PCIe_connector`, `form_factor`, `power`, `efficiency`, `warranty`, `weight`) VALUES
(1, 'Corsair RM850e 850W 80+ Gold', 549.00, 'https://example.com/images/corsair_rm850e.jpg', 'https://www.corsair.com/us/en/p/psu/cp-9020252-na/rm850e-850-watt-80-plus-gold-fully-modular-atx-power-supply-cp-9020252-na', '2 x 4+4 Pin EPS', '8 x SATA', '150 x 86 x 160 mm', 'Fully Modular', 'Black', 'ATX 3.0 / PCIe 5.0 Ready', '3 x 6+2 Pin PCIe', 'ATX', 850, '80+ Gold', '10 Years', 1.65),
(2, 'Cooler Master MWE 650 Bronze V2', 289.00, 'https://example.com/images/cm_mwe650_bronze_v2.jpg', 'https://www.coolermaster.com/catalog/power-supplies/mwe-series/mwe-650-bronze-v2/', '1 x 4+4 Pin EPS', '6 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'Black', 'ATX 12V v2.52', '2 x 6+2 Pin PCIe', 'ATX', 650, '80+ Bronze', '5 Years', 1.40),
(3, 'Be Quiet! Pure Power 12M 750W 80+ Gold', 519.00, 'https://example.com/images/bequiet_purepower12m_750.jpg', 'https://www.bequiet.com/en/powersupply/4174', '2 x 4+4 Pin EPS', '6 x SATA', '160 x 150 x 86 mm', 'Fully Modular', 'Black', 'ATX 3.0 / PCIe 5.0 Ready', '2 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 750, '80+ Gold', '10 Years', 1.80),
(4, 'Thermaltake Smart BX1 550W 80+ Bronze', 239.00, 'https://example.com/images/tt_smartbx1_550w.jpg', 'https://www.thermaltake.com/smart-bx1-550w.html', '1 x 4+4 Pin EPS', '5 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'Black', 'ATX 12V v2.4', '2 x 6+2 Pin PCIe', 'ATX', 550, '80+ Bronze', '5 Years', 1.35),
(5, 'Seasonic Focus GX-1000 80+ Gold', 799.00, 'https://example.com/images/seasonic_focus_gx1000.jpg', 'https://seasonic.com/focus-gx', '2 x 4+4 Pin EPS', '10 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'Black', 'ATX 3.0 / PCIe 5.0 Ready', '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 1000, '80+ Gold', '10 Years', 1.90),
(6, 'Corsair RM1000e 1000W 80+ Gold', 649.00, NULL, NULL, '2 x 4+4 Pin', '10 x SATA', '150 x 86 x 180 mm', 'Fully Modular', 'Black', NULL, '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 1000, '80+ Gold', NULL, NULL),
(7, 'Cooler Master MWE 750 Gold V2', 359.00, NULL, NULL, '2 x 4+4 Pin', '6 x SATA', '150 x 86 x 140 mm', 'Semi-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 750, '80+ Gold', NULL, NULL),
(8, 'Be Quiet! Pure Power 11 550W', 299.00, NULL, NULL, '1 x 4+4 Pin', '6 x SATA', '160 x 150 x 86 mm', 'Semi-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 550, '80+ Gold', NULL, NULL),
(9, 'Thermaltake Toughpower GF1 850W', 699.00, NULL, NULL, '2 x 4+4 Pin', '9 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '3 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 850, '80+ Gold', NULL, NULL),
(10, 'Seasonic PRIME TX-1000 1000W', 1599.00, NULL, NULL, '2 x 4+4 Pin', '12 x SATA', '140 x 170 x 86 mm', 'Fully Modular', 'Black', NULL, '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 1000, '80+ Titanium', NULL, NULL),
(11, 'Corsair CX750M 750W 80+ Bronze', 399.00, NULL, NULL, '2 x 4+4 Pin', '6 x SATA', '150 x 86 x 160 mm', 'Semi-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 750, '80+ Bronze', NULL, NULL),
(12, 'Cooler Master MWE 800 White', 449.00, NULL, NULL, '2 x 4+4 Pin', '8 x SATA', '150 x 86 x 140 mm', 'Fully Modular', 'White', NULL, '3 x 6+2 Pin', 'ATX', 800, '80+ Gold', NULL, NULL),
(13, 'Be Quiet! Dark Power 13 850W', 1199.00, NULL, NULL, '2 x 4+4 Pin', '8 x SATA', '160 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 850, '80+ Platinum', NULL, NULL),
(14, 'Thermaltake Smart 700W', 299.00, NULL, NULL, '1 x 4+4 Pin', '5 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 700, '80+ White', NULL, NULL),
(15, 'Seasonic FOCUS GX-650 650W', 549.00, NULL, NULL, '1 x 4+4 Pin', '6 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 650, '80+ Gold', NULL, NULL),
(16, 'Corsair RM850x 850W 80+ Gold', 699.00, NULL, NULL, '2 x 4+4 Pin', '9 x SATA', '150 x 86 x 170 mm', 'Fully Modular', 'Black', NULL, '4 x 6+2 Pin', 'ATX', 850, '80+ Gold', NULL, NULL),
(17, 'Cooler Master MasterWatt 550', 229.00, NULL, NULL, '1 x 4+4 Pin', '5 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 550, '80+ Bronze', NULL, NULL),
(18, 'Be Quiet! System Power 9 700W', 399.00, NULL, NULL, '2 x 4+4 Pin', '6 x SATA', '140 x 150 x 86 mm', 'Semi-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 700, '80+ Gold', NULL, NULL),
(19, 'Thermaltake GF1 ARGB 650W', 429.00, NULL, NULL, '1 x 4+4 Pin', '7 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 650, '80+ Gold', NULL, NULL),
(20, 'Seasonic S12III 650W', 329.00, NULL, NULL, '1 x 4+4 Pin', '6 x SATA', '140 x 150 x 86 mm', 'Non-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 650, '80+ Bronze', NULL, NULL),
(21, 'Corsair TX650M 650W', 449.00, NULL, NULL, '1 x 4+4 Pin', '6 x SATA', '150 x 86 x 160 mm', 'Semi-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 650, '80+ Gold', NULL, NULL),
(22, 'Cooler Master Silent Gold 1200W', 1299.00, NULL, NULL, '2 x 4+4 Pin', '12 x SATA', '170 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '6 x 6+2 Pin', 'ATX', 1200, '80+ Gold', NULL, NULL),
(23, 'Be Quiet! Pure Power L8 600W', 269.00, NULL, NULL, '1 x 4+4 Pin', '6 x SATA', '150 x 140 x 86 mm', 'Non-Modular', 'Black', NULL, '2 x 6+2 Pin', 'ATX', 600, '80+ Bronze', NULL, NULL),
(24, 'Thermaltake TR2 1200W', 899.00, NULL, NULL, '2 x 4+4 Pin', '10 x SATA', '180 x 150 x 86 mm', 'Semi-Modular', 'Black', NULL, '4 x 6+2 Pin', 'ATX', 1200, '80+ Gold', NULL, NULL),
(25, 'Seasonic Prime TX-850 850W', 1399.00, NULL, NULL, '2 x 4+4 Pin', '10 x SATA', '170 x 150 x 86 mm', 'Fully Modular', 'Black', NULL, '3 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 850, '80+ Titanium', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rams
-- ----------------------------
INSERT INTO `rams` (`id`, `name`, `price`, `image_url`, `product_url`, `memory_speed`, `memory_size`, `memory_type`, `color`, `wattage`) VALUES
(1, 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', 299.00, 'https://example.com/images/corsair_vengeance_lpx_ddr4_3200.jpg', 'https://www.corsair.com/vengeance-lpx-ddr4-memory', '3200MHz', 16, 'DDR4', 'Black', 10),
(2, 'Kingston Fury Beast 32GB (2x16GB) DDR5 5600MHz', 629.00, 'https://example.com/images/kingston_fury_beast_ddr5_5600.jpg', 'https://www.kingston.com/en/memory/gaming/fury-beast-ddr5', '5600MHz', 32, 'DDR5', 'Black', 12),
(3, 'G.Skill Trident Z5 RGB 32GB (2x16GB) DDR5 6000MHz', 749.00, 'https://example.com/images/gskill_trident_z5_ddr5_6000.jpg', 'https://www.gskill.com/product/165/374/1642497222/F5-6000J3238F16GX2-TZ5RK', '6000MHz', 32, 'DDR5', 'Silver', 14),
(4, 'TEAMGROUP T-Force Delta RGB 16GB (2x8GB) DDR4 3600MHz', 339.00, 'https://example.com/images/tforce_delta_rgb_ddr4_3600.jpg', 'https://www.teamgroupinc.com/en/product/delta-rgb-ddr4', '3600MHz', 16, 'DDR4', 'White', 10),
(5, 'Crucial Pro 64GB (2x32GB) DDR5 5600MHz', 999.00, 'https://example.com/images/crucial_pro_ddr5_5600.jpg', 'https://www.crucial.com/memory/ddr5-pro', '5600MHz', 64, 'DDR5', 'Black', 15),
(6, 'Corsair Vengeance RGB Pro 32GB DDR4 3600MHz', 599.00, NULL, NULL, '3600MHz', 32, 'DDR4', 'RGB', 0),
(7, 'G.Skill Ripjaws V 16GB DDR4 3200MHz', 279.00, NULL, NULL, '3200MHz', 16, 'DDR4', 'Black', 0),
(8, 'Kingston Fury Beast 32GB DDR5 5200MHz', 749.00, NULL, NULL, '5200MHz', 32, 'DDR5', 'Black', 0),
(9, 'Teamgroup T-Force Xtreem 32GB DDR5 7200MHz', 999.00, NULL, NULL, '7200MHz', 32, 'DDR5', 'Silver', 0),
(10, 'Patriot Viper Venom 16GB DDR5 6000MHz', 399.00, NULL, NULL, '6000MHz', 16, 'DDR5', 'Black', 0),
(11, 'Corsair Dominator Platinum RGB 64GB DDR5 5600MHz', 1499.00, NULL, NULL, '5600MHz', 64, 'DDR5', 'White', 0),
(12, 'G.Skill Trident Z Neo 32GB DDR4 3600MHz', 649.00, NULL, NULL, '3600MHz', 32, 'DDR4', 'Silver', 0),
(13, 'Kingston FURY Beast 16GB DDR4 2666MHz', 199.00, NULL, NULL, '2666MHz', 16, 'DDR4', 'Black', 0),
(14, 'Teamgroup T-Force Dark Za 32GB DDR4 4000MHz', 799.00, NULL, NULL, '4000MHz', 32, 'DDR4', 'Black', 0),
(15, 'Patriot Viper Steel 8GB DDR4 3200MHz', 159.00, NULL, NULL, '3200MHz', 8, 'DDR4', 'Gray', 0),
(16, 'Corsair Vengeance LPX 8GB DDR4 3000MHz', 139.00, NULL, NULL, '3000MHz', 8, 'DDR4', 'Black', 0),
(17, 'G.Skill Trident Z Royal 16GB DDR4 4000MHz', 899.00, NULL, NULL, '4000MHz', 16, 'DDR4', 'Gold', 0),
(18, 'Kingston FURY Renegade 32GB DDR5 6400MHz', 899.00, NULL, NULL, '6400MHz', 32, 'DDR5', 'Black', 0),
(19, 'Teamgroup T-Force Vulcan Z 16GB DDR4 3200MHz', 249.00, NULL, NULL, '3200MHz', 16, 'DDR4', 'Red', 0),
(20, 'Patriot Viper 4 Blackout 64GB DDR4 3600MHz', 1099.00, NULL, NULL, '3600MHz', 64, 'DDR4', 'Black', 0),
(21, 'Corsair Vengeance RGB Pro SL 16GB DDR5 5200MHz', 449.00, NULL, NULL, '5200MHz', 16, 'DDR5', 'White', 0),
(22, 'G.Skill Ripjaws S5 32GB DDR5 5600MHz', 699.00, NULL, NULL, '5600MHz', 32, 'DDR5', 'Black', 0),
(23, 'Kingston FURY Impact 32GB DDR4 2666MHz SO-DIMM', 399.00, NULL, NULL, '2666MHz', 32, 'DDR4', 'Black', 0),
(24, 'Teamgroup T-Force Dark Z 16GB DDR4 3600MHz', 349.00, NULL, NULL, '3600MHz', 16, 'DDR4', 'White', 0),
(25, 'Patriot Memory Signature 8GB DDR4 2666MHz', 99.00, NULL, NULL, '2666MHz', 8, 'DDR4', 'Black', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storages
-- ----------------------------
INSERT INTO `storages` (`id`, `name`, `price`, `image_url`, `product_url`, `interface`, `form_factor`, `readwrite`, `power`, `capacity`, `storage_type`, `nand`, `warranty`) VALUES
(1, 'Seagate Barracuda 2TB', 250.00, 'images/seagate_2tb.jpg', 'https://example.com/seagate-2tb', 'SATA', '3.5\"', 'Read/Write 200MB/s', '6W', '2TB', 'HDD', NULL, '3 Years'),
(2, 'Samsung 970 EVO Plus 1TB', 550.00, 'images/samsung_970evo_1tb.jpg', 'https://example.com/samsung-970evo-1tb', 'NVMe', 'M.2', 'Read 3500MB/s / Write 3300MB/s', '5W', '1TB', 'M.2 SSD', 'V-NAND', '5 Years'),
(3, 'Crucial MX500 500GB', 220.00, 'images/crucial_mx500_500gb.jpg', 'https://example.com/crucial-mx500-500gb', 'SATA', '2.5\"', 'Read 560MB/s / Write 510MB/s', '4W', '500GB', 'SATA SSD', 'TLC', '5 Years'),
(4, 'WD Blue 1TB', 180.00, 'images/wd_blue_1tb.jpg', 'https://example.com/wd-blue-1tb', 'SATA', '3.5\"', 'Read/Write 150MB/s', '6W', '1TB', 'HDD', NULL, '2 Years'),
(5, 'Kingston A2000 1TB', 300.00, 'images/kingston_a2000_1tb.jpg', 'https://example.com/kingston-a2000-1tb', 'NVMe', 'M.2', 'Read 2200MB/s / Write 2000MB/s', '5W', '1TB', 'M.2 SSD', '3D NAND', '5 Years'),
(6, 'Samsung 990 Pro 2TB', 1299.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7450MB/s / Write 6900MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL),
(7, 'WD Black SN850X 1TB', 899.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7300MB/s / Write 6600MB/s', NULL, '1TB', 'M.2 SSD', NULL, NULL),
(8, 'Crucial P5 Plus 2TB', 849.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 6600MB/s / Write 5000MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL),
(9, 'Kingston NV2 1TB', 449.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 3500MB/s / Write 2800MB/s', NULL, '1TB', 'M.2 SSD', NULL, NULL),
(10, 'Teamgroup MP44L 2TB', 699.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 5000MB/s / Write 4500MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL),
(11, 'Samsung 870 EVO 1TB', 599.00, NULL, NULL, 'SATA', '2.5\"', 'Read 560MB/s / Write 530MB/s', NULL, '1TB', 'SATA SSD', NULL, NULL),
(12, 'WD Blue SN580 500GB', 349.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 4000MB/s / Write 3000MB/s', NULL, '500GB', 'M.2 SSD', NULL, NULL),
(13, 'SK Hynix Gold P31 1TB', 649.00, NULL, NULL, 'M.2 PCIe 3.0 x4', 'M.2', 'Read 3500MB/s / Write 3200MB/s', NULL, '1TB', 'M.2 SSD', NULL, NULL),
(14, 'Seagate FireCuda 530 1TB', 999.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7300MB/s / Write 6900MB/s', NULL, '1TB', 'M.2 SSD', NULL, NULL),
(15, 'Intel 670p 2TB', 799.00, NULL, NULL, 'M.2 PCIe 3.0 x4', 'M.2', 'Read 3500MB/s / Write 3000MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL),
(16, 'Kingston Fury Renegade 4TB', 1999.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7300MB/s / Write 7000MB/s', NULL, '4TB', 'M.2 SSD', NULL, NULL),
(17, 'WD Red SA500 500GB', 399.00, NULL, NULL, 'M.2 SATA', 'M.2', 'Read 560MB/s / Write 530MB/s', NULL, '500GB', 'M.2 SSD', NULL, NULL),
(18, 'Samsung 970 Pro 512GB', 449.00, NULL, NULL, 'M.2 PCIe 3.0 x4', 'M.2', 'Read 3500MB/s / Write 2700MB/s', NULL, '512GB', 'M.2 SSD', NULL, NULL),
(19, 'Corsair MP600 Pro XT 1TB', 849.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7100MB/s / Write 6800MB/s', NULL, '1TB', 'M.2 SSD', NULL, NULL),
(20, 'Teamgroup MP33 2TB', 449.00, NULL, NULL, 'M.2 PCIe 3.0 x4', 'M.2', 'Read 2100MB/s / Write 1700MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL),
(21, 'Crucial MX500 2TB', 699.00, NULL, NULL, 'SATA', '2.5\"', 'Read 560MB/s / Write 510MB/s', NULL, '2TB', 'SATA SSD', NULL, NULL),
(22, 'Sabrent Rocket 4.0 4TB', 2199.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7000MB/s / Write 6850MB/s', NULL, '4TB', 'M.2 SSD', NULL, NULL),
(23, 'WD Blue 5TB', 599.00, NULL, NULL, 'SATA', '3.5\"', 'Read/Write 150MB/s', NULL, '5TB', 'HDD', NULL, NULL),
(24, 'Seagate Barracuda 4TB', 399.00, NULL, NULL, 'SATA', '3.5\"', 'Read/Write 210MB/s', NULL, '4TB', 'HDD', NULL, NULL),
(25, 'SK Hynix Platinum P41 2TB', 1499.00, NULL, NULL, 'M.2 PCIe 4.0 x4', 'M.2', 'Read 7000MB/s / Write 6500MB/s', NULL, '2TB', 'M.2 SSD', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'huzir', 'huzir123@gmail.com', '$2b$10$TT10OuIpKMd1PIBxm8AHjO3B0ny8xT1XWZ42mlQUu8yMfU/CFNzce', 'user');
INSERT INTO `users` VALUES (4, 'AdminUser', 'admin@example.com', '$2b$10$GJqA2NG/sUQ79xuvyzRRyu7kkstnU6RE/cbT/NzTu8uoNz0o55ZEe', 'admin');

-- ----------------------------
-- Seed Data for Completed Builds Feature
-- ----------------------------

-- Add more sample builds for testing completed builds feature
INSERT INTO `builds` (`builds_name`, `builds_description`, `cpus_id`, `gpus_id`, `motherboards_id`, `rams_id`, `cpucoolers_id`, `storages_id`, `cases_id`, `psus_id`, `Users_id`) VALUES
('Gaming Beast', 'High-end gaming build with RTX 5070 Ti', 1, 1, 1, 2, 1, 2, 1, 1, 3),
('Budget Workstation', 'Affordable productivity setup', 6, 2, 2, 1, 2, 1, 4, 2, 4),
('Ultimate Dream Build', 'No compromise enthusiast build', 3, 4, 3, 5, 3, 2, 2, 5, 3);

-- Seed data for completed_builds (4 entries)
INSERT INTO `completed_builds` (`user_id`, `builds_id`, `title`, `description`, `is_public`, `created_at`) VALUES
(3, 2, 'My First Gaming PC', 'Finally completed my first gaming build! Super excited about the performance.', 1, '2024-01-15 10:30:00'),
(3, 5, 'Gaming Beast Build', 'High-end gaming rig for 1440p gaming. Runs everything on ultra!', 1, '2024-02-20 14:45:00'),
(4, 6, 'Office Workstation', 'Budget-friendly workstation for productivity tasks and light editing.', 1, '2024-03-10 09:15:00'),
(3, 7, 'Dream Machine', 'My ultimate dream build - no compromises!', 1, '2024-03-25 16:00:00');

-- Seed data for build_comments - Parent comments (top-level, no parent_comment_id)
INSERT INTO `build_comments` (`completed_build_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(1, 4, NULL, 'Nice build! What kind of FPS are you getting in games?', '2024-01-16 11:00:00'),
(2, 4, NULL, 'The RTX 5070 Ti is a beast! Great choice.', '2024-02-21 10:00:00'),
(2, 4, NULL, 'How are the thermals with that cooler?', '2024-02-22 09:30:00'),
(3, 3, NULL, 'Smart budget choices! Perfect for office work.', '2024-03-11 10:00:00'),
(4, 4, NULL, 'Wow, that''s an incredible build! Total cost must be insane.', '2024-03-26 09:00:00');

-- Seed data for build_comments - First level replies
INSERT INTO `build_comments` (`completed_build_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(1, 3, 1, 'Thanks! Getting around 120fps in most AAA titles at 1080p.', '2024-01-16 12:30:00'),
(2, 3, 3, 'Running around 65-70°C under load, pretty quiet too!', '2024-02-22 11:15:00'),
(3, 4, 4, 'Thanks! Trying to keep costs down while staying productive.', '2024-03-11 11:30:00'),
(4, 3, 5, 'Yeah it wasn''t cheap, but totally worth it for the performance!', '2024-03-26 10:30:00');

-- Seed data for build_comments - Second level replies (nested)
INSERT INTO `build_comments` (`completed_build_id`, `user_id`, `parent_comment_id`, `content`, `created_at`) VALUES
(1, 4, 6, 'That''s impressive for a first build! Well done.', '2024-01-16 14:00:00');

-- Seed data for build_ratings (4 entries)
INSERT INTO `build_ratings` (`completed_build_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 4, 4, '2024-01-16 11:05:00'),
(2, 4, 5, '2024-02-21 10:05:00'),
(3, 3, 4, '2024-03-11 10:05:00'),
(4, 4, 5, '2024-03-26 09:05:00');

SET FOREIGN_KEY_CHECKS = 1;


-- Additional Component Data Insertions

-- Additional CPUs (20 records)
INSERT INTO cpus (name, brand, price, cores, threads, socket, wattage, cpu_category, image_url) VALUES
('AMD Ryzen 5 7500F', 'AMD', 799.00, 6, 12, 'AM5', 65, 'consumer', NULL),
('AMD Ryzen 7 7700X', 'AMD', 1299.00, 8, 16, 'AM5', 105, 'consumer', NULL),
('AMD Ryzen 9 7950X3D', 'AMD', 2999.00, 16, 32, 'AM5', 120, 'consumer', NULL),
('Intel Core i5-13400F', 'INTEL', 999.00, 10, 16, 'LGA1700', 65, 'consumer', NULL),
('Intel Core i7-13700F', 'INTEL', 1599.00, 16, 24, 'LGA1700', 65, 'consumer', NULL),
('Intel Core i9-13900KS', 'INTEL', 3299.00, 24, 32, 'LGA1700', 150, 'consumer', NULL),
('AMD Ryzen 3 5300G', 'AMD', 399.00, 4, 8, 'AM4', 65, 'consumer', NULL),
('AMD Ryzen 5 5500', 'AMD', 499.00, 6, 12, 'AM4', 65, 'consumer', NULL),
('AMD Ryzen 7 5700G', 'AMD', 799.00, 8, 16, 'AM4', 65, 'consumer', NULL),
('AMD Ryzen 9 5900X', 'AMD', 1199.00, 12, 24, 'AM4', 105, 'consumer', NULL),
('Intel Core i3-13100', 'INTEL', 649.00, 4, 8, 'LGA1700', 60, 'consumer', NULL),
('Intel Core i3-13400', 'INTEL', 849.00, 10, 16, 'LGA1700', 65, 'consumer', NULL),
('Intel Core i5-13500', 'INTEL', 1149.00, 14, 20, 'LGA1700', 65, 'consumer', NULL),
('Intel Core i5-14600K', 'INTEL', 1599.00, 14, 20, 'LGA1700', 125, 'consumer', NULL),
('Intel Core i7-13700K', 'INTEL', 1999.00, 16, 24, 'LGA1700', 125, 'consumer', NULL),
('Intel Core i9-13900K', 'INTEL', 2799.00, 24, 32, 'LGA1700', 125, 'consumer', NULL),
('AMD Ryzen 5 4500', 'AMD', 299.00, 6, 6, 'AM4', 65, 'consumer', NULL),
('AMD Ryzen 5 5600G', 'AMD', 599.00, 6, 12, 'AM4', 65, 'consumer', NULL),
('AMD Ryzen 7 5700X3D', 'AMD', 1299.00, 8, 16, 'AM4', 105, 'consumer', NULL),
('Intel Core i5-12400F', 'INTEL', 699.00, 6, 12, 'LGA1700', 65, 'consumer', NULL);

-- Additional GPUs (20 records)
INSERT INTO gpus (name, brand, price, memory_size, memory_type, power_connectors, wattage, gpu_category, image_url) VALUES
('MSI GeForce RTX 4070 GAMING X TRIO', 'NVIDIA', 2999.00, 12, 'GDDR6X', '8-pin x 1', 200, 'consumer', NULL),
('ASUS ROG Strix RTX 4080 OC', 'NVIDIA', 5999.00, 16, 'GDDR6X', '16-pin x 1', 320, 'consumer', NULL),
('Gigabyte Radeon RX 7900 XT GAMING OC', 'AMD', 3599.00, 20, 'GDDR6', '8-pin x 2', 315, 'consumer', NULL),
('Sapphire Pulse Radeon RX 6750 XT', 'AMD', 1799.00, 12, 'GDDR6', '8-pin x 1', 250, 'consumer', NULL),
('PowerColor RX 6600 Fighter', 'AMD', 999.00, 8, 'GDDR6', '8-pin x 1', 180, 'consumer', NULL),
('ZOTAC Gaming GeForce RTX 4060 Ti Twin Edge', 'NVIDIA', 1899.00, 8, 'GDDR6', '8-pin x 1', 160, 'consumer', NULL),
('PNY GeForce RTX 4070 Ti Verto', 'NVIDIA', 3599.00, 12, 'GDDR6X', '16-pin x 1', 285, 'consumer', NULL),
('XFX RX 7800 XT Black Pearl', 'AMD', 2599.00, 16, 'GDDR6', '8-pin x 2', 263, 'consumer', NULL),
('ASUS TUF Gaming RTX 4090 OC', 'NVIDIA', 9999.00, 24, 'GDDR6X', '16-pin x 1', 450, 'consumer', NULL),
('Gigabyte Eagle RTX 4060', 'NVIDIA', 1499.00, 8, 'GDDR6', '8-pin x 1', 130, 'consumer', NULL),
('MSI Gaming GeForce RTX 3060 Ti', 'NVIDIA', 1799.00, 8, 'GDDR6', '12-pin x 1', 200, 'consumer', NULL),
('Sapphire NITRO+ RX 6950 XT', 'AMD', 2299.00, 16, 'GDDR6', '8-pin x 2', 335, 'consumer', NULL),
('Palit JetStream RTX 4080', 'NVIDIA', 5599.00, 16, 'GDDR6X', '16-pin x 1', 320, 'consumer', NULL),
('XFX Speedster RX 6600 XT', 'AMD', 1199.00, 8, 'GDDR6', '8-pin x 1', 160, 'consumer', NULL),
('ASUS DUAL RTX 4070 OC', 'NVIDIA', 2799.00, 12, 'GDDR6X', '8-pin x 1', 200, 'consumer', NULL),
('MSI Ventus RTX 3070 Ti OC', 'NVIDIA', 1999.00, 8, 'GDDR6X', '12-pin x 1', 290, 'consumer', NULL),
('PowerColor Hellhound RX 6650 XT', 'AMD', 899.00, 8, 'GDDR6', '8-pin x 1', 230, 'consumer', NULL),
('ASRock Phantom Gaming RX 7700 XT', 'AMD', 1999.00, 12, 'GDDR6', '8-pin x 1', 245, 'consumer', NULL),
('Gigabyte Windforce RTX 3060', 'NVIDIA', 1499.00, 12, 'GDDR6', '8-pin x 1', 170, 'consumer', NULL),
('Sapphire PULSE RX 7900 XTX', 'AMD', 3999.00, 24, 'GDDR6', '8-pin x 3', 355, 'consumer', NULL);

-- Additional Motherboards (20 records)
INSERT INTO motherboards (name, price, cpu_socket, chipset, memory_type, form_factor, image_url) VALUES
('ASUS TUF Gaming X670E-Plus WiFi', 1299.00, 'AM5', 'AMD X670E', 'DDR5', 'ATX', NULL),
('MSI MAG B760 Tomahawk WiFi', 899.00, 'LGA1700', 'Intel B760', 'DDR5', 'ATX', NULL),
('Gigabyte AORUS B650 Elite AX', 799.00, 'AM5', 'AMD B650', 'DDR5', 'ATX', NULL),
('ASRock B550M Pro4', 449.00, 'AM4', 'AMD B550', 'DDR4', 'Micro ATX', NULL),
('ASUS Prime Z690-P WiFi', 999.00, 'LGA1700', 'Intel Z690', 'DDR5', 'ATX', NULL),
('MSI PRO B650M-G WiFi', 599.00, 'AM5', 'AMD B650', 'DDR5', 'Micro ATX', NULL),
('Gigabyte Z790 AORUS ELITE AX', 1099.00, 'LGA1700', 'Intel Z790', 'DDR5', 'ATX', NULL),
('ASRock X670E Steel Legend', 1199.00, 'AM5', 'AMD X670E', 'DDR5', 'ATX', NULL),
('ASUS ROG Strix B550-F Gaming WiFi', 799.00, 'AM4', 'AMD B550', 'DDR4', 'ATX', NULL),
('MSI MAG B660M Mortar WiFi', 749.00, 'LGA1700', 'Intel B660', 'DDR5', 'Micro ATX', NULL),
('Gigabyte X670 AORUS ELITE', 999.00, 'AM5', 'AMD X670', 'DDR5', 'ATX', NULL),
('ASUS TUF Gaming H770 WiFi', 849.00, 'LGA1700', 'Intel H770', 'DDR5', 'ATX', NULL),
('MSI B650 GAMING PLUS WIFI', 749.00, 'AM5', 'AMD B650', 'DDR5', 'ATX', NULL),
('ASRock Z690 Phantom Gaming ITX/TB4', 1299.00, 'LGA1700', 'Intel Z690', 'DDR5', 'Mini ITX', NULL),
('Gigabyte B650M DS3H', 499.00, 'AM5', 'AMD B650', 'DDR5', 'Micro ATX', NULL),
('ASUS Prime B660M-A WiFi', 599.00, 'LGA1700', 'Intel B660', 'DDR5', 'Micro ATX', NULL),
('MSI MPG X670E Carbon WiFi', 1499.00, 'AM5', 'AMD X670E', 'DDR5', 'ATX', NULL),
('ASRock B650M PG Riptide WiFi', 699.00, 'AM5', 'AMD B650', 'DDR5', 'Micro ATX', NULL),
('Gigabyte Z690 Gaming X', 849.00, 'LGA1700', 'Intel Z690', 'DDR4', 'ATX', NULL),
('ASUS TUF Gaming B660-Plus D4', 649.00, 'LGA1700', 'Intel B660', 'DDR4', 'ATX', NULL);

-- Additional RAMs (20 records)
INSERT INTO rams (name, price, memory_speed, memory_size, memory_type, color, image_url) VALUES
('Corsair Vengeance RGB Pro 32GB DDR4 3600MHz', 599.00, '3600MHz', 32, 'DDR4', 'RGB', NULL),
('G.Skill Ripjaws V 16GB DDR4 3200MHz', 279.00, '3200MHz', 16, 'DDR4', 'Black', NULL),
('Kingston Fury Beast 32GB DDR5 5200MHz', 749.00, '5200MHz', 32, 'DDR5', 'Black', NULL),
('Teamgroup T-Force Xtreem 32GB DDR5 7200MHz', 999.00, '7200MHz', 32, 'DDR5', 'Silver', NULL),
('Patriot Viper Venom 16GB DDR5 6000MHz', 399.00, '6000MHz', 16, 'DDR5', 'Black', NULL),
('Corsair Dominator Platinum RGB 64GB DDR5 5600MHz', 1499.00, '5600MHz', 64, 'DDR5', 'White', NULL),
('G.Skill Trident Z Neo 32GB DDR4 3600MHz', 649.00, '3600MHz', 32, 'DDR4', 'Silver', NULL),
('Kingston FURY Beast 16GB DDR4 2666MHz', 199.00, '2666MHz', 16, 'DDR4', 'Black', NULL),
('Teamgroup T-Force Dark Za 32GB DDR4 4000MHz', 799.00, '4000MHz', 32, 'DDR4', 'Black', NULL),
('Patriot Viper Steel 8GB DDR4 3200MHz', 159.00, '3200MHz', 8, 'DDR4', 'Gray', NULL),
('Corsair Vengeance LPX 8GB DDR4 3000MHz', 139.00, '3000MHz', 8, 'DDR4', 'Black', NULL),
('G.Skill Trident Z Royal 16GB DDR4 4000MHz', 899.00, '4000MHz', 16, 'DDR4', 'Gold', NULL),
('Kingston FURY Renegade 32GB DDR5 6400MHz', 899.00, '6400MHz', 32, 'DDR5', 'Black', NULL),
('Teamgroup T-Force Vulcan Z 16GB DDR4 3200MHz', 249.00, '3200MHz', 16, 'DDR4', 'Red', NULL),
('Patriot Viper 4 Blackout 64GB DDR4 3600MHz', 1099.00, '3600MHz', 64, 'DDR4', 'Black', NULL),
('Corsair Vengeance RGB Pro SL 16GB DDR5 5200MHz', 449.00, '5200MHz', 16, 'DDR5', 'White', NULL),
('G.Skill Ripjaws S5 32GB DDR5 5600MHz', 699.00, '5600MHz', 32, 'DDR5', 'Black', NULL),
('Kingston FURY Impact 32GB DDR4 2666MHz SO-DIMM', 399.00, '2666MHz', 32, 'DDR4', 'Black', NULL),
('Teamgroup T-Force Dark Z 16GB DDR4 3600MHz', 349.00, '3600MHz', 16, 'DDR4', 'White', NULL),
('Patriot Memory Signature 8GB DDR4 2666MHz', 99.00, '2666MHz', 8, 'DDR4', 'Black', NULL);

-- Additional PSUs (20 records)
INSERT INTO psus (name, price, power, efficiency, modular, form_factor, color, EPS_connector, SATA_connector, PCIe_connector, Dimensions, image_url) VALUES
('Corsair RM1000e 1000W 80+ Gold', 649.00, 1000, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '10 x SATA', '4 x 6+2 Pin + 1 x 12VHPWR', '150 x 86 x 180 mm', NULL),
('Cooler Master MWE 750 Gold V2', 359.00, 750, '80+ Gold', 'Semi-Modular', 'ATX', 'Black', '2 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '150 x 86 x 140 mm', NULL),
('Be Quiet! Pure Power 11 550W', 299.00, 550, '80+ Gold', 'Semi-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '160 x 150 x 86 mm', NULL),
('Thermaltake Toughpower GF1 850W', 699.00, 850, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '9 x SATA', '3 x 6+2 Pin + 1 x 12VHPWR', '140 x 150 x 86 mm', NULL),
('Seasonic PRIME TX-1000 1000W', 1599.00, 1000, '80+ Titanium', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '12 x SATA', '4 x 6+2 Pin + 1 x 12VHPWR', '140 x 170 x 86 mm', NULL),
('Corsair CX750M 750W 80+ Bronze', 399.00, 750, '80+ Bronze', 'Semi-Modular', 'ATX', 'Black', '2 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '150 x 86 x 160 mm', NULL),
('Cooler Master MWE 800 White', 449.00, 800, '80+ Gold', 'Fully Modular', 'ATX', 'White', '2 x 4+4 Pin', '8 x SATA', '3 x 6+2 Pin', '150 x 86 x 140 mm', NULL),
('Be Quiet! Dark Power 13 850W', 1199.00, 850, '80+ Platinum', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '8 x SATA', '4 x 6+2 Pin + 1 x 12VHPWR', '160 x 150 x 86 mm', NULL),
('Thermaltake Smart 700W', 299.00, 700, '80+ White', 'Non-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '5 x SATA', '2 x 6+2 Pin', '150 x 86 x 140 mm', NULL),
('Seasonic FOCUS GX-650 650W', 549.00, 650, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '1 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '140 x 150 x 86 mm', NULL),
('Corsair RM850x 850W 80+ Gold', 699.00, 850, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '9 x SATA', '4 x 6+2 Pin', '150 x 86 x 170 mm', NULL),
('Cooler Master MasterWatt 550', 229.00, 550, '80+ Bronze', 'Non-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '5 x SATA', '2 x 6+2 Pin', '150 x 86 x 140 mm', NULL),
('Be Quiet! System Power 9 700W', 399.00, 700, '80+ Gold', 'Semi-Modular', 'ATX', 'Black', '2 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '140 x 150 x 86 mm', NULL),
('Thermaltake GF1 ARGB 650W', 429.00, 650, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '1 x 4+4 Pin', '7 x SATA', '2 x 6+2 Pin', '140 x 150 x 86 mm', NULL),
('Seasonic S12III 650W', 329.00, 650, '80+ Bronze', 'Non-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '140 x 150 x 86 mm', NULL),
('Corsair TX650M 650W', 449.00, 650, '80+ Gold', 'Semi-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '150 x 86 x 160 mm', NULL),
('Cooler Master Silent Gold 1200W', 1299.00, 1200, '80+ Gold', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '12 x SATA', '6 x 6+2 Pin', '170 x 150 x 86 mm', NULL),
('Be Quiet! Pure Power L8 600W', 269.00, 600, '80+ Bronze', 'Non-Modular', 'ATX', 'Black', '1 x 4+4 Pin', '6 x SATA', '2 x 6+2 Pin', '150 x 140 x 86 mm', NULL),
('Thermaltake TR2 1200W', 899.00, 1200, '80+ Gold', 'Semi-Modular', 'ATX', 'Black', '2 x 4+4 Pin', '10 x SATA', '4 x 6+2 Pin', '180 x 150 x 86 mm', NULL),
('Seasonic Prime TX-850 850W', 1399.00, 850, '80+ Titanium', 'Fully Modular', 'ATX', 'Black', '2 x 4+4 Pin', '10 x SATA', '3 x 6+2 Pin + 1 x 12VHPWR', '170 x 150 x 86 mm', NULL);

-- Additional Cases (20 records)
INSERT INTO cases (name, price, form_factor, side_panel, color, gpu_length_max_mm, cpu_cooler_height_max_mm, dimensions, image_url) VALUES
('Lian Li Lancool III', 849.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 398, 180, '475 x 230 x 480 mm', NULL),
('NZXT H5 Flow', 449.00, 'ATX Mid Tower', 'Mesh', 'Black', 365, 165, '460 x 210 x 460 mm', NULL),
('Fractal Design Meshify C', 399.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 315, 172, '440 x 224 x 479 mm', NULL),
('Corsair 4000D Airflow', 349.00, 'ATX Mid Tower', 'Tempered Glass', 'White', 360, 170, '453 x 230 x 466 mm', NULL),
('be quiet! Pure Base 500DX', 499.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 369, 190, '468 x 231 x 501 mm', NULL),
('Thermaltake View 71', 799.00, 'ATX Full Tower', 'Tempered Glass', 'Black', 310, 185, '590 x 246 x 569 mm', NULL),
('Phanteks Eclipse P400A', 379.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 400, 170, '465 x 200 x 455 mm', NULL),
('Lian Li LANCOOL 216', 399.00, 'ATX Mid Tower', 'Mesh', 'Black', 400, 180, '445 x 230 x 485 mm', NULL),
('NZXT H7 Flow', 599.00, 'ATX Mid Tower', 'Mesh', 'Black', 400, 185, '480 x 230 x 505 mm', NULL),
('Cooler Master MasterBox Q300L', 199.00, 'Micro ATX', 'Acrylic', 'Black', 350, 159, '389 x 194 x 399 mm', NULL),
('Fractal Design Pop Air', 299.00, 'ATX Mid Tower', 'Tempered Glass', 'White', 340, 170, '450 x 215 x 440 mm', NULL),
('Corsair 275R Airflow', 299.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 370, 170, '445 x 230 x 466 mm', NULL),
('Lian Li PC-O11 Dynamic', 699.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 422, 167, '465 x 285 x 460 mm', NULL),
('NZXT H210i', 269.00, 'Mini ITX', 'Tempered Glass', 'Black', 305, 165, '349 x 210 x 375 mm', NULL),
('Silverstone RL06', 299.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 395, 167, '473 x 200 x 440 mm', NULL),
('Cooler Master Silencio S600', 449.00, 'ATX Mid Tower', 'Aluminum', 'Black', 414, 165, '467 x 220 x 505 mm', NULL),
('Phanteks P500A', 549.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 440, 175, '500 x 240 x 520 mm', NULL),
('Lian Li PC-V3000', 1299.00, 'ATX Full Tower', 'Aluminum', 'Black', 470, 190, '285 x 650 x 630 mm', NULL),
('NZXT H510', 399.00, 'ATX Mid Tower', 'Tempered Glass', 'Black', 381, 165, '428 x 210 x 460 mm', NULL),
('Fractal Design Define 7 Compact', 549.00, 'ATX Mid Tower', 'Solid Panel', 'Black', 315, 169, '440 x 224 x 448 mm', NULL);

-- Additional CPU Coolers (20 records)
INSERT INTO cpucoolers (name, price, liquid_cooling, dimension, color, height_mm, heatpipes, wattage, image_url) VALUES
('Noctua NH-D15', 599.00, 0, '161mm (H) x 150mm (W) x 135mm (D)', 'Black/Brown', 161, '6 heatpipes', 250, NULL),
('be quiet! Dark Rock Pro 4', 399.00, 0, '163mm (H) x 139mm (W) x 111mm (D)', 'Black', 163, '7 heatpipes', 250, NULL),
('Corsair H150i Elite Capellix', 799.00, 1, '397mm (L) x 120mm (W) x 27mm (H)', 'RGB', 397, 'Pump-based', 280, NULL),
('Arctic Liquid Freezer II 240', 329.00, 1, '277mm (L) x 120mm (W) x 38mm (H)', 'Black', 277, 'Pump-based', 250, NULL),
('Thermalright Phantom Spirit 120 SE', 199.00, 0, '154mm (H) x 120mm (W) x 71mm (D)', 'Silver', 154, '5 heatpipes', 220, NULL),
('ID-COOLING SE-224-XTS', 149.00, 0, '155mm (H) x 120mm (W) x 73mm (D)', 'Black', 155, '4 heatpipes', 180, NULL),
('Scythe Fuma 2', 249.00, 0, '154.5mm (H) x 130mm (W) x 140mm (D)', 'Black', 154, '6 heatpipes', 190, NULL),
('Cooler Master Hyper 212 RGB', 199.00, 0, '158.8mm (H) x 120mm (W) x 77.6mm (D)', 'Black', 158, '4 heatpipes', 150, NULL),
('Thermaltake TH240 ARGB', 449.00, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 280, NULL),
('Deepcool AK620', 169.00, 0, '160mm (H) x 120mm (W) x 97mm (D)', 'Black', 160, '6 heatpipes', 220, NULL),
('Noctua NH-U9S', 349.00, 0, '125mm (H) x 95mm (W) x 71mm (D)', 'Black/Brown', 125, '5 heatpipes', 130, NULL),
('be quiet! Pure Rock Slim 2', 169.00, 0, '145mm (H) x 90mm (W) x 68mm (D)', 'Black', 145, '4 heatpipes', 120, NULL),
('Corsair H100i RGB PLATINUM', 649.00, 1, '322mm (L) x 120mm (W) x 27mm (H)', 'RGB', 322, 'Pump-based', 240, NULL),
('Arctic Freezer 34 eSports DUO', 249.00, 0, '157mm (H) x 120mm (W) x 96mm (D)', 'Black', 157, '4 heatpipes', 210, NULL),
('Zalman CNPS9900B MAX', 329.00, 0, '154mm (H) x 135mm (W) x 110mm (D)', 'Black', 154, '6 heatpipes', 250, NULL),
('Thermaltake TH120 ARGB', 349.00, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 150, NULL),
('ID-COOLING AURAFLOW X 240', 399.00, 1, '277mm (L) x 120mm (W) x 27mm (H)', 'RGB', 277, 'Pump-based', 250, NULL),
('Scythe Mugen 5 Rev.B', 229.00, 0, '154.5mm (H) x 130mm (W) x 140mm (D)', 'Black', 154, '6 heatpipes', 220, NULL),
('Cooler Master MasterLiquid ML240L', 299.00, 1, '277mm (L) x 119.6mm (W) x 27.2mm (H)', 'Black', 277, 'Pump-based', 200, NULL),
('Noctua NH-L12S', 299.00, 0, '145mm (H) x 125mm (W) x 70mm (D)', 'Black/Brown', 145, '5 heatpipes', 145, NULL);

-- Additional Storage (20 records)
INSERT INTO storages (name, price, interface, form_factor, capacity, storage_type, readwrite, image_url) VALUES
('Samsung 990 Pro 2TB', 1299.00, 'M.2 PCIe 4.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 7450MB/s / Write 6900MB/s', NULL),
('WD Black SN850X 1TB', 899.00, 'M.2 PCIe 4.0 x4', 'M.2', '1TB', 'M.2 SSD', 'Read 7300MB/s / Write 6600MB/s', NULL),
('Crucial P5 Plus 2TB', 849.00, 'M.2 PCIe 4.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 6600MB/s / Write 5000MB/s', NULL),
('Kingston NV2 1TB', 449.00, 'M.2 PCIe 4.0 x4', 'M.2', '1TB', 'M.2 SSD', 'Read 3500MB/s / Write 2800MB/s', NULL),
('Teamgroup MP44L 2TB', 699.00, 'M.2 PCIe 4.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 5000MB/s / Write 4500MB/s', NULL),
('Samsung 870 EVO 1TB', 599.00, 'SATA', '2.5"', '1TB', 'SATA SSD', 'Read 560MB/s / Write 530MB/s', NULL),
('WD Blue SN580 500GB', 349.00, 'M.2 PCIe 4.0 x4', 'M.2', '500GB', 'M.2 SSD', 'Read 4000MB/s / Write 3000MB/s', NULL),
('SK Hynix Gold P31 1TB', 649.00, 'M.2 PCIe 3.0 x4', 'M.2', '1TB', 'M.2 SSD', 'Read 3500MB/s / Write 3200MB/s', NULL),
('Seagate FireCuda 530 1TB', 999.00, 'M.2 PCIe 4.0 x4', 'M.2', '1TB', 'M.2 SSD', 'Read 7300MB/s / Write 6900MB/s', NULL),
('Intel 670p 2TB', 799.00, 'M.2 PCIe 3.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 3500MB/s / Write 3000MB/s', NULL),
('Kingston Fury Renegade 4TB', 1999.00, 'M.2 PCIe 4.0 x4', 'M.2', '4TB', 'M.2 SSD', 'Read 7300MB/s / Write 7000MB/s', NULL),
('WD Red SA500 500GB', 399.00, 'M.2 SATA', 'M.2', '500GB', 'M.2 SSD', 'Read 560MB/s / Write 530MB/s', NULL),
('Samsung 970 Pro 512GB', 449.00, 'M.2 PCIe 3.0 x4', 'M.2', '512GB', 'M.2 SSD', 'Read 3500MB/s / Write 2700MB/s', NULL),
('Corsair MP600 Pro XT 1TB', 849.00, 'M.2 PCIe 4.0 x4', 'M.2', '1TB', 'M.2 SSD', 'Read 7100MB/s / Write 6800MB/s', NULL),
('Teamgroup MP33 2TB', 449.00, 'M.2 PCIe 3.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 2100MB/s / Write 1700MB/s', NULL),
('Crucial MX500 2TB', 699.00, 'SATA', '2.5"', '2TB', 'SATA SSD', 'Read 560MB/s / Write 510MB/s', NULL),
('Sabrent Rocket 4.0 4TB', 2199.00, 'M.2 PCIe 4.0 x4', 'M.2', '4TB', 'M.2 SSD', 'Read 7000MB/s / Write 6850MB/s', NULL),
('WD Blue 5TB', 599.00, 'SATA', '3.5"', '5TB', 'HDD', 'Read/Write 150MB/s', NULL),
('Seagate Barracuda 4TB', 399.00, 'SATA', '3.5"', '4TB', 'HDD', 'Read/Write 210MB/s', NULL),
('SK Hynix Platinum P41 2TB', 1499.00, 'M.2 PCIe 4.0 x4', 'M.2', '2TB', 'M.2 SSD', 'Read 7000MB/s / Write 6500MB/s', NULL);