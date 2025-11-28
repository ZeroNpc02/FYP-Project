-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 05:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hardwareforge`
--

-- --------------------------------------------------------

--
-- Table structure for table `builds`
--

CREATE TABLE `builds` (
  `builds_id` int(11) NOT NULL,
  `builds_name` varchar(150) NOT NULL,
  `builds_description` text DEFAULT NULL,
  `cpus_id` int(11) DEFAULT NULL,
  `gpus_id` int(11) DEFAULT NULL,
  `motherboards_id` int(11) DEFAULT NULL,
  `rams_id` int(11) DEFAULT NULL,
  `cpucoolers_id` int(11) DEFAULT NULL,
  `storages_id` int(11) DEFAULT NULL,
  `cases_id` int(11) DEFAULT NULL,
  `psus_id` int(11) DEFAULT NULL,
  `Users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `builds`
--

INSERT INTO `builds` (`builds_id`, `builds_name`, `builds_description`, `cpus_id`, `gpus_id`, `motherboards_id`, `rams_id`, `cpucoolers_id`, `storages_id`, `cases_id`, `psus_id`, `Users_id`) VALUES
(2, 'test', NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `form_factor` varchar(50) DEFAULT NULL,
  `materials` varchar(100) DEFAULT NULL,
  `mainboard_support` varchar(100) DEFAULT NULL,
  `front_panel` varchar(100) DEFAULT NULL,
  `side_panel` varchar(100) DEFAULT NULL,
  `expansion_slot` int(11) DEFAULT NULL,
  `ssd_slot` int(11) DEFAULT NULL,
  `hdd_slot` int(11) DEFAULT NULL,
  `gpu_length` varchar(50) DEFAULT NULL,
  `cpuCooler_height` varchar(50) DEFAULT NULL,
  `psu_length` varchar(50) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `name`, `price`, `image_url`, `product_url`, `dimensions`, `form_factor`, `materials`, `mainboard_support`, `front_panel`, `side_panel`, `expansion_slot`, `ssd_slot`, `hdd_slot`, `gpu_length`, `cpuCooler_height`, `psu_length`, `weight`) VALUES
(1, 'Lian Li O11 Dynamic EVO', 699.00, 'https://example.com/images/o11_dynamic_evo.jpg', 'https://www.lian-li.com/o11-dynamic-evo/', '465 x 285 x 459 mm', 'Mid Tower', 'Aluminum, Tempered Glass, Steel', 'E-ATX, ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 8, 6, 4, '422 mm', '167 mm', '220 mm', 12.00),
(2, 'NZXT H9 Flow', 749.00, 'https://example.com/images/nzxt_h9_flow.jpg', 'https://nzxt.com/product/h9-flow', '495 x 290 x 466 mm', 'Mid Tower', 'Steel, Tempered Glass, Plastic', 'ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.2, Audio Jack', 'Tempered Glass', 7, 4, 2, '435 mm', '165 mm', '200 mm', 13.10),
(3, 'Fractal Design North', 679.00, 'https://example.com/images/fractal_north.jpg', 'https://www.fractal-design.com/products/cases/north/', '447 x 215 x 469 mm', 'Mid Tower', 'Steel, Tempered Glass, Real Wood', 'ATX, Micro-ATX, Mini-ITX', '2 x USB 3.0, 1 x USB-C, Audio Combo', 'Tempered Glass', 7, 3, 2, '355 mm', '170 mm', '255 mm', 7.60),
(4, 'Montech Air 100 ARGB', 299.00, 'https://example.com/images/montech_air100_argb.jpg', 'https://www.montechpc.com/en/products_detail.php?serial=94', '405 x 210 x 425 mm', 'Micro ATX', 'Steel, Tempered Glass, Plastic', 'Micro-ATX, Mini-ITX', '2 x USB 3.0, 1 x Audio Combo', 'Tempered Glass', 4, 2, 2, '330 mm', '161 mm', '160 mm', 6.30),
(5, 'Phanteks XT Pro Ultra', 599.00, 'https://example.com/images/phanteks_xt_pro_ultra.jpg', 'https://phanteks.com/XT-Pro-Ultra.html', '460 x 230 x 490 mm', 'Mid Tower', 'Steel, Tempered Glass', 'E-ATX, ATX, Micro-ATX, Mini-ITX', '1 x USB-C, 2 x USB 3.0, Audio Combo', 'Tempered Glass', 7, 3, 2, '415 mm', '184 mm', '270 mm', 9.20);

-- --------------------------------------------------------

--
-- Table structure for table `cpucoolers`
--

CREATE TABLE `cpucoolers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `liquid_cooling` tinyint(1) DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `heatpipes` varchar(50) DEFAULT NULL,
  `wattage` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cpucoolers`
--

INSERT INTO `cpucoolers` (`id`, `name`, `price`, `image_url`, `product_url`, `liquid_cooling`, `dimension`, `heatpipes`, `wattage`) VALUES
(1, 'Noctua NH-U12S Redux', 239.00, '', '', 0, '158mm (H) x 125mm (W) x 71mm (D)', '4 heatpipes', 180),
(2, 'DeepCool AK400 Performance', 139.00, '', '', 0, '155mm (H) x 127mm (W) x 97mm (D)', '4 heatpipes', 180),
(3, 'be quiet! Dark Rock 4', 329.00, '', '', 0, '159mm (H) x 136mm (W) x 96mm (D)', '6 heatpipes', 200),
(4, 'Cooler Master MasterLiquid ML240L V2 RGB', 329.00, '', '', 1, '277mm (L) x 119.6mm (W) x 27.2mm (H)', 'Pump-based', 250),
(5, 'NZXT Kraken X63 RGB', 569.00, '', '', 1, '315mm (L) x 143mm (W) x 30mm (H)', 'Pump-based', 280);

-- --------------------------------------------------------

--
-- Table structure for table `cpus`
--

CREATE TABLE `cpus` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `cores` int(11) DEFAULT NULL,
  `threads` int(11) DEFAULT NULL,
  `base_clock` decimal(5,2) DEFAULT NULL,
  `boost_clock` decimal(5,2) DEFAULT NULL,
  `socket` varchar(50) DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `wattage` int(11) DEFAULT NULL,
  `cpu_category` enum('consumer','workstation','datacenter') NOT NULL DEFAULT 'consumer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cpus`
--

INSERT INTO `cpus` (`id`, `name`, `brand`, `price`, `image_url`, `product_url`, `cores`, `threads`, `base_clock`, `boost_clock`, `socket`, `dimension`, `wattage`, `cpu_category`) VALUES
(1, 'Ryzen 7 7800X3D', 'AMD', 1499.00, 'images/CPU/AMD_RYZEN_7_7800X3D_PROCESSOR_TMT.jpg', 'https://www.tmt.my/products/amd-ryzen-7-7800x3d-processor-am5', 8, 16, 4.20, 5.00, 'AM5', '3.99 cm x 3.99 cm x 0.25 cm', 120, 'consumer'),
(2, 'AMD Ryzen 5 7600', 'AMD', 899.00, 'https://example.com/images/ryzen5_7600.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-5-7600', 6, 12, 3.80, 5.10, 'AM5', '40mm x 40mm', 65, 'consumer'),
(3, 'AMD Ryzen 9 7900X', 'AMD', 1849.00, 'https://example.com/images/ryzen9_7900x.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-9-7900x', 12, 24, 4.70, 5.60, 'AM5', '40mm x 40mm', 170, 'consumer'),
(4, 'Intel Core i5-13600K', 'INTEL', 1349.00, 'https://example.com/images/i5_13600k.jpg', 'https://www.intel.com/content/www/us/en/products/sku/230496/intel-core-i513600k-processor-24m-cache-up-to-5-10-ghz.html', 14, 20, 3.50, 5.10, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer'),
(5, 'Intel Core i7-14700K', 'INTEL', 1849.00, 'https://example.com/images/i7_14700k.jpg', 'https://www.intel.com/content/www/us/en/products/sku/236781/intel-core-i714700k-processor-33m-cache-up-to-5-60-ghz.html', 20, 28, 3.40, 5.60, 'LGA1700', '37.5mm x 37.5mm', 125, 'consumer'),
(6, 'AMD Ryzen 5 5600', 'AMD', 669.00, 'https://example.com/images/ryzen5_5600.jpg', 'https://www.amd.com/en/products/cpu/amd-ryzen-5-5600', 6, 12, 3.50, 4.40, 'AM4', '40mm x 40mm', 65, 'consumer');

-- --------------------------------------------------------

--
-- Table structure for table `gpus`
--

CREATE TABLE `gpus` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `core_clock` decimal(6,2) DEFAULT NULL,
  `memory_size` int(11) DEFAULT NULL,
  `memory_type` varchar(50) DEFAULT NULL,
  `power_connectors` varchar(50) DEFAULT NULL,
  `wattage` int(11) DEFAULT NULL,
  `card_bus` varchar(50) DEFAULT NULL,
  `gpu_category` enum('consumer','workstation','datacenter') NOT NULL DEFAULT 'consumer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gpus`
--

INSERT INTO `gpus` (`id`, `name`, `brand`, `price`, `image_url`, `product_url`, `dimension`, `color`, `core_clock`, `memory_size`, `memory_type`, `power_connectors`, `wattage`, `card_bus`, `gpu_category`) VALUES
(1, 'MSI GeForce RTX 5070 Ti EXPERT OC', 'NVIDIA', 4199.00, 'images/GPU/MSI-RTX5070TI-EXPERT-OC-1.jpg', 'https://www.tmt.my/products/msi-geforce-rtx-5070-ti-expert-oc', '	15.00 cm x 31.90 cm x 6.00 cm', 'black', 2588.00, 16, 'GDDR7', '16-pin', 300, '256-Bit', 'consumer'),
(2, 'ASUS Dual Radeon RX 6500 XT V2 OC', 'AMD', 599.00, 'images/GPU/ASUS-DUAL-RADEON-RX-6500-XT-V2-OC-1.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(3, 'MSI GeForce RTX 5070 Ti Gaming TRIO OC', 'NVIDIA', 4299.00, 'images/GPU/MSI-RTX-5070-TI-GAMING-TRIO-PLUS-OC.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(4, 'ZOTAC GAMING GeForce RTX 5090 ARCTICSTORM AIO', 'NVIDIA', 12999.00, 'images/GPU/ZOTAC-RTX5090-ARCTICSTORM-AIO-MAIN.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(5, 'Gigabyte GeForce RTX 5050 WINDFORCE OC', 'NVIDIA', 1099.00, 'images/GPU/', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(6, 'Sapphire Radeon RX 9060 XT OC NITRO+ 16GB', 'AMD', 1859.00, 'images/GPU/SAPPHIRE-RADEON-NITRO-RX9060XT-1.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(7, 'Acer ARC B580 Nitro OC', 'INTEL', 1399.00, 'images/GPU/ACER-ARC-B580-NITRO-OC-1.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(8, 'MSI GeForce RTX 5070 Ti SHADOW 3X OC', 'NVIDIA', 3799.00, 'images/GPU/MSI-RTX-5070-ti-SHADOW-3X-OC.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(9, 'ASUS TURBO Radeon AI PRO R9700', 'AMD', 6849.00, 'images/GPU/ASUS-TURBO-AI-PRO-9700-BOX-VIEW.jpg', '\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'workstation'),
(10, 'ZOTAC GAMING GeForce RTX 3050 Twin Edge OC', 'NVIDIA', 749.00, 'https://www.tmt.my/products/zotac-gaming-geforce-rtx-3050-twin-edge-oc', 'images/GPU/ZOTAC-RTX-3050-TWIN-EDGE-OC-1.jpg\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(11, 'ASUS Dual Radeon RX 7600 EVO OC', 'AMD', 1099.00, 'https://www.tmt.my/products/asus-dual-radeon-rx-7600-evo-oc', 'images/GPU/ASUS-DUAL-RX7600-EVO-OC-1\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(12, 'ASUS Prime GeForce RTX 5080 OC', 'NVIDIA', 6399.00, 'https://www.tmt.my/products/asus-prime-geforce-rtx-5080-oc', 'images/GPU/ASUS-PRIME-RTX-5080-OC.jpg\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(13, 'Gigabyte GeForce RTX 5060 OC Low Profile', 'NVIDIA', 1349.00, 'https://www.tmt.my/products/gigabyte-geforce-rtx-5060-oc-low-profile', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(14, 'PNY GeForce RTX 5060 Ti Dual Fan OC 8GB', 'NVIDIA', 1729.00, 'https://www.tmt.my/products/pny-geforce-rtx-5060-ti-dual-fan-oc-8gb', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer'),
(15, 'Palit GeForce RTX 5060 Dual OC', 'NVIDIA', 1329.00, 'https://www.tmt.my/products/palit-geforce-rtx-5060-dual-oc', 'images/GPU/\r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'consumer');

-- --------------------------------------------------------

--
-- Table structure for table `motherboards`
--

CREATE TABLE `motherboards` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `CPU` varchar(100) DEFAULT NULL,
  `chipset` varchar(100) DEFAULT NULL,
  `memory` varchar(100) DEFAULT NULL,
  `LAN` varchar(100) DEFAULT NULL,
  `wireless_connection` varchar(100) DEFAULT NULL,
  `expansion_slot` varchar(100) DEFAULT NULL,
  `storage_interface` varchar(100) DEFAULT NULL,
  `form_factor` varchar(50) DEFAULT NULL,
  `wattage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboards`
--

INSERT INTO `motherboards` (`id`, `name`, `price`, `image_url`, `product_url`, `CPU`, `chipset`, `memory`, `LAN`, `wireless_connection`, `expansion_slot`, `storage_interface`, `form_factor`, `wattage`) VALUES
(1, 'MSI MPG B850 EDGE TI WIFI ATX Motherboard', 1499.00, NULL, 'https://www.tmt.my/products/msi-mpg-b850-edge-ti-wifi-atx-motherboard', 'AM5', 'AMD B850', '4 x DDR5', 'YES', 'YES', 'PCI-E 5.0 x 16 ', '4 x M.2', 'ATX', 70),
(2, 'MSI B550 Gaming Plus', 599.00, 'https://example.com/images/msi_b550_gaming_plus.jpg', 'https://www.msi.com/Motherboard/B550-GAMING-PLUS', 'AM4', 'AMD B550', '4 x DDR4, up to 4400 MHz, 128GB max', 'Realtek 8111H Gigabit LAN', 'None', '2 x PCIe x16, 2 x PCIe x1', '2 x M.2, 6 x SATA 6Gb/s', 'ATX', 65),
(3, 'ASUS TUF Gaming B650-PLUS WiFi', 899.00, 'https://example.com/images/asus_tuf_b650_plus_wifi.jpg', 'https://www.asus.com/motherboards-components/motherboards/tuf-gaming/tuf-gaming-b650-plus-wifi/', 'AM5', 'AMD B650', '4 x DDR5, up to 6400 MHz, 128GB max', '2.5Gb Intel LAN', 'WiFi 6 + Bluetooth 5.2', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '3 x M.2, 4 x SATA 6Gb/s', 'ATX', 75),
(4, 'Gigabyte B760M AORUS Elite AX', 749.00, 'https://example.com/images/gigabyte_b760m_aorus_elite_ax.jpg', 'https://www.gigabyte.com/Motherboard/B760M-AORUS-ELITE-AX-rev-10', 'LGA1700', 'Intel B760', '4 x DDR5, up to 7600 MHz, 128GB max', '2.5Gb LAN', 'WiFi 6E + Bluetooth 5.3', '2 x PCIe x16 (1x Gen4), 1 x PCIe x1', '2 x M.2, 4 x SATA 6Gb/s', 'Micro ATX', 70),
(5, 'ASRock Z790 Steel Legend', 1099.00, 'https://example.com/images/asrock_z790_steel_legend.jpg', 'https://www.asrock.com/mb/Intel/Z790%20Steel%20Legend/', 'LGA1700', 'Intel Z790', '4 x DDR5, up to 7200 MHz, 128GB max', '2.5Gb Realtek LAN', 'WiFi 6E + Bluetooth 5.3', '3 x PCIe x16, 1 x PCIe x1', '3 x M.2, 8 x SATA 6Gb/s', 'ATX', 80),
(6, 'ASUS ROG Strix B550-I Gaming', 899.00, 'https://example.com/images/asus_rog_strix_b550i.jpg', 'https://rog.asus.com/motherboards/rog-strix/rog-strix-b550-i-gaming-model/', 'AM4', 'AMD B550', '2 x DDR4, up to 5100 MHz, 64GB max', 'Intel I225-V 2.5Gb LAN', 'WiFi 6 + Bluetooth 5.1', '1 x PCIe x16', '2 x M.2, 4 x SATA 6Gb/s', 'Mini ITX', 60);

-- --------------------------------------------------------

--
-- Table structure for table `psus`
--

CREATE TABLE `psus` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `EPS_connector` varchar(50) DEFAULT NULL,
  `SATA_connector` varchar(50) DEFAULT NULL,
  `Dimensions` varchar(100) DEFAULT NULL,
  `Modular` varchar(50) DEFAULT NULL,
  `PSU_compatibility` varchar(100) DEFAULT NULL,
  `PCIe_connector` varchar(50) DEFAULT NULL,
  `form_factor` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `efficiency` varchar(50) DEFAULT NULL,
  `warranty` varchar(50) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psus`
--

INSERT INTO `psus` (`id`, `name`, `price`, `image_url`, `product_url`, `EPS_connector`, `SATA_connector`, `Dimensions`, `Modular`, `PSU_compatibility`, `PCIe_connector`, `form_factor`, `power`, `efficiency`, `warranty`, `weight`) VALUES
(1, 'Corsair RM850e 850W 80+ Gold', 549.00, 'https://example.com/images/corsair_rm850e.jpg', 'https://www.corsair.com/us/en/p/psu/cp-9020252-na/rm850e-850-watt-80-plus-gold-fully-modular-atx-power-supply-cp-9020252-na', '2 x 4+4 Pin EPS', '8 x SATA', '150 x 86 x 160 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '3 x 6+2 Pin PCIe', 'ATX', 850, '80+ Gold', '10 Years', 1.65),
(2, 'Cooler Master MWE 650 Bronze V2', 289.00, 'https://example.com/images/cm_mwe650_bronze_v2.jpg', 'https://www.coolermaster.com/catalog/power-supplies/mwe-series/mwe-650-bronze-v2/', '1 x 4+4 Pin EPS', '6 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'ATX 12V v2.52', '2 x 6+2 Pin PCIe', 'ATX', 650, '80+ Bronze', '5 Years', 1.40),
(3, 'Be Quiet! Pure Power 12M 750W 80+ Gold', 519.00, 'https://example.com/images/bequiet_purepower12m_750.jpg', 'https://www.bequiet.com/en/powersupply/4174', '2 x 4+4 Pin EPS', '6 x SATA', '160 x 150 x 86 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '2 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 750, '80+ Gold', '10 Years', 1.80),
(4, 'Thermaltake Smart BX1 550W 80+ Bronze', 239.00, 'https://example.com/images/tt_smartbx1_550w.jpg', 'https://www.thermaltake.com/smart-bx1-550w.html', '1 x 4+4 Pin EPS', '5 x SATA', '150 x 86 x 140 mm', 'Non-Modular', 'ATX 12V v2.4', '2 x 6+2 Pin PCIe', 'ATX', 550, '80+ Bronze', '5 Years', 1.35),
(5, 'Seasonic Focus GX-1000 80+ Gold', 799.00, 'https://example.com/images/seasonic_focus_gx1000.jpg', 'https://seasonic.com/focus-gx', '2 x 4+4 Pin EPS', '10 x SATA', '140 x 150 x 86 mm', 'Fully Modular', 'ATX 3.0 / PCIe 5.0 Ready', '4 x 6+2 Pin + 1 x 12VHPWR', 'ATX', 1000, '80+ Gold', '10 Years', 1.90);

-- --------------------------------------------------------

--
-- Table structure for table `rams`
--

CREATE TABLE `rams` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `memory_speed` varchar(50) DEFAULT NULL,
  `memory_size` int(11) DEFAULT NULL,
  `memory_type` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `wattage` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rams`
--

INSERT INTO `rams` (`id`, `name`, `price`, `image_url`, `product_url`, `memory_speed`, `memory_size`, `memory_type`, `color`, `wattage`) VALUES
(1, 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', 299.00, 'https://example.com/images/corsair_vengeance_lpx_ddr4_3200.jpg', 'https://www.corsair.com/vengeance-lpx-ddr4-memory', '3200MHz', 16, 'DDR4', 'Black', 10),
(2, 'Kingston Fury Beast 32GB (2x16GB) DDR5 5600MHz', 629.00, 'https://example.com/images/kingston_fury_beast_ddr5_5600.jpg', 'https://www.kingston.com/en/memory/gaming/fury-beast-ddr5', '5600MHz', 32, 'DDR5', 'Black', 12),
(3, 'G.Skill Trident Z5 RGB 32GB (2x16GB) DDR5 6000MHz', 749.00, 'https://example.com/images/gskill_trident_z5_ddr5_6000.jpg', 'https://www.gskill.com/product/165/374/1642497222/F5-6000J3238F16GX2-TZ5RK', '6000MHz', 32, 'DDR5', 'Silver', 14),
(4, 'TEAMGROUP T-Force Delta RGB 16GB (2x8GB) DDR4 3600MHz', 339.00, 'https://example.com/images/tforce_delta_rgb_ddr4_3600.jpg', 'https://www.teamgroupinc.com/en/product/delta-rgb-ddr4', '3600MHz', 16, 'DDR4', 'White', 10),
(5, 'Crucial Pro 64GB (2x32GB) DDR5 5600MHz', 999.00, 'https://example.com/images/crucial_pro_ddr5_5600.jpg', 'https://www.crucial.com/memory/ddr5-pro', '5600MHz', 64, 'DDR5', 'Black', 15);

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `interface` varchar(50) DEFAULT NULL,
  `form_factor` varchar(50) DEFAULT NULL,
  `readwrite` varchar(50) DEFAULT NULL,
  `power` varchar(50) DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `storage_type` varchar(50) DEFAULT NULL,
  `nand` varchar(50) DEFAULT NULL,
  `warranty` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `name`, `price`, `image_url`, `product_url`, `interface`, `form_factor`, `readwrite`, `power`, `capacity`, `storage_type`, `nand`, `warranty`) VALUES
(1, 'Seagate Barracuda 2TB', 250.00, 'images/seagate_2tb.jpg', 'https://example.com/seagate-2tb', 'SATA', '3.5\"', 'Read/Write 200MB/s', '6W', '2TB', 'HDD', NULL, '3 Years'),
(2, 'Samsung 970 EVO Plus 1TB', 550.00, 'images/samsung_970evo_1tb.jpg', 'https://example.com/samsung-970evo-1tb', 'NVMe', 'M.2', 'Read 3500MB/s / Write 3300MB/s', '5W', '1TB', 'M.2 SSD', 'V-NAND', '5 Years'),
(3, 'Crucial MX500 500GB', 220.00, 'images/crucial_mx500_500gb.jpg', 'https://example.com/crucial-mx500-500gb', 'SATA', '2.5\"', 'Read 560MB/s / Write 510MB/s', '4W', '500GB', 'SATA SSD', 'TLC', '5 Years'),
(4, 'WD Blue 1TB', 180.00, 'images/wd_blue_1tb.jpg', 'https://example.com/wd-blue-1tb', 'SATA', '3.5\"', 'Read/Write 150MB/s', '6W', '1TB', 'HDD', NULL, '2 Years'),
(5, 'Kingston A2000 1TB', 300.00, 'images/kingston_a2000_1tb.jpg', 'https://example.com/kingston-a2000-1tb', 'NVMe', 'M.2', 'Read 2200MB/s / Write 2000MB/s', '5W', '1TB', 'M.2 SSD', '3D NAND', '5 Years');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email_Address` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Username`, `Email_Address`, `password_hash`, `role`) VALUES
(3, 'huzir', 'huzir123@gmail.com', '$2b$10$TT10OuIpKMd1PIBxm8AHjO3B0ny8xT1XWZ42mlQUu8yMfU/CFNzce', 'user'),
(4, 'AdminUser', 'admin@example.com', '$2b$10$GJqA2NG/sUQ79xuvyzRRyu7kkstnU6RE/cbT/NzTu8uoNz0o55ZEe', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`builds_id`),
  ADD KEY `cpus_id` (`cpus_id`),
  ADD KEY `gpus_id` (`gpus_id`),
  ADD KEY `motherboards_id` (`motherboards_id`),
  ADD KEY `rams_id` (`rams_id`),
  ADD KEY `cpucoolers_id` (`cpucoolers_id`),
  ADD KEY `storages_id` (`storages_id`),
  ADD KEY `cases_id` (`cases_id`),
  ADD KEY `psus_id` (`psus_id`),
  ADD KEY `Users_id` (`Users_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpucoolers`
--
ALTER TABLE `cpucoolers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpus`
--
ALTER TABLE `cpus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gpus`
--
ALTER TABLE `gpus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motherboards`
--
ALTER TABLE `motherboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `psus`
--
ALTER TABLE `psus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rams`
--
ALTER TABLE `rams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email_Address` (`Email_Address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `builds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cpucoolers`
--
ALTER TABLE `cpucoolers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cpus`
--
ALTER TABLE `cpus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gpus`
--
ALTER TABLE `gpus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `motherboards`
--
ALTER TABLE `motherboards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `psus`
--
ALTER TABLE `psus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rams`
--
ALTER TABLE `rams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `builds`
--
ALTER TABLE `builds`
  ADD CONSTRAINT `builds_ibfk_1` FOREIGN KEY (`cpus_id`) REFERENCES `cpus` (`id`),
  ADD CONSTRAINT `builds_ibfk_2` FOREIGN KEY (`gpus_id`) REFERENCES `gpus` (`id`),
  ADD CONSTRAINT `builds_ibfk_3` FOREIGN KEY (`motherboards_id`) REFERENCES `motherboards` (`id`),
  ADD CONSTRAINT `builds_ibfk_4` FOREIGN KEY (`rams_id`) REFERENCES `rams` (`id`),
  ADD CONSTRAINT `builds_ibfk_5` FOREIGN KEY (`cpucoolers_id`) REFERENCES `cpucoolers` (`id`),
  ADD CONSTRAINT `builds_ibfk_6` FOREIGN KEY (`storages_id`) REFERENCES `storages` (`id`),
  ADD CONSTRAINT `builds_ibfk_7` FOREIGN KEY (`cases_id`) REFERENCES `cases` (`id`),
  ADD CONSTRAINT `builds_ibfk_8` FOREIGN KEY (`psus_id`) REFERENCES `psus` (`id`),
  ADD CONSTRAINT `builds_ibfk_9` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
