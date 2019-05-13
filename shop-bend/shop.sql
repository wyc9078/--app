-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2019-05-13 10:43:50
-- 服务器版本： 5.6.30-1
-- PHP Version: 5.6.26-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `shop_cart`
--

CREATE TABLE `shop_cart` (
  `id` int(11) NOT NULL,
  `commodity_id` int(11) DEFAULT NULL COMMENT '关联商品表的id',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户表的id',
  `cart_nums` varchar(255) DEFAULT NULL COMMENT '收藏商品的数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_cart`
--

INSERT INTO `shop_cart` (`id`, `commodity_id`, `user_id`, `cart_nums`) VALUES
(67, 18, 15, '1');

-- --------------------------------------------------------

--
-- 表的结构 `shop_commodity`
--

CREATE TABLE `shop_commodity` (
  `id` int(11) NOT NULL,
  `commodity_name` varchar(255) DEFAULT NULL COMMENT '标题',
  `commodity_nowprice` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `commodity_brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `commodity_stock` varchar(255) DEFAULT NULL COMMENT '库存',
  `commodity_oldprice` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `commodity_sales` varchar(255) DEFAULT NULL COMMENT '销量',
  `commodity_main` varchar(500) DEFAULT NULL COMMENT '商品主题',
  `commodity_thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `commodity_attachimg` varchar(1000) DEFAULT NULL COMMENT '附图',
  `commodity_content` varchar(255) DEFAULT NULL COMMENT '商品介绍'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_commodity`
--

INSERT INTO `shop_commodity` (`id`, `commodity_name`, `commodity_nowprice`, `commodity_brand`, `commodity_stock`, `commodity_oldprice`, `commodity_sales`, `commodity_main`, `commodity_thumbnail`, `commodity_attachimg`, `commodity_content`) VALUES
(1, '小米6X', 1199.00, '小米', '1008', 1499.00, '9998', '[{\"id\":1, \"url\":\"https://i8.mifile.cn/a1/pms_1527144859.25489991!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1527144859.25489991!560x560.jpg', '[{\"id\":\"1\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t18211/69/1964940745/165270/f9c8b3b9/5adfff97N4785b207.jpg\"},{\"id\":\"2\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t19510/342/1994937303/314169/2fa249c/5ae028acN08dbcfb2.jpg\"},{\"id\":\"3\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t17221/337/1986295406/355489/33d4ab5a/5ae028acNbd82b1f1.jpg\"},{\"id\":\"4\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t19600/182/1954269253/398563/8999bda1/5adfff9bN417b1519.jpg\"}]', '全系感恩回馈价「4GB+32GB最高省300元」「4GB+64GB／6GB+128GB立省250元」 「6GB+64GB立省200元」\r\n                      轻薄美观的拍照手机 / 前置2000万“治愈系”自拍 / 后置2000万 AI双摄 / 标配骁龙660 AIE处理器\r\n                  '),
(2, '小米8 青春版', 1399.00, '小米', '21213', 1399.00, '25452', '[{\"id\":\"1\",\"url\":\"https://i8.mifile.cn/a1/pms_1537323963.1278763!560x560.jpg\"},{\"id\":\"2\",\"url\":\"https://i8.mifile.cn/a1/pms_1537323963.2662931!560x560.jpg\"},{\"id\":\"3\",\"url\":\"https://i8.mifile.cn/a1/pms_1537323963.12643245!560x560.jpg\"},{\"id\":\"4\",\"url\":\"https://i8.mifile.cn/a1/pms_1537323963.40512928!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1537323963.1278763!560x560.jpg', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/2360/20/7321/391271/5ba50f10E2e934060/874a9326f479b703.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/5111/35/6060/81691/5ba1c203Ef7d689f8/59c83f6ecfc702ff.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/4575/26/6038/55584/5ba1c203E0435b5c9/e76be408881deed2.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/4392/29/6077/46785/5ba1c203Eb0df0978/03aeceb8a7550d45.jpg\"}]', '潮流镜面渐变色 / 2400万自拍旗舰 / 7.5mm超薄机身 / 6.26\"小刘海全面屏 / AI裸妆美颜 / 骁龙660AIE处理器'),
(3, '小米8', 2499.00, '小米', '278', 2699.00, '968', '[{\"id\":\"1\",\"url\":\"https://i8.mifile.cn/a1/pms_1527735134.03584233!560x560.jpg\"},{\"id\":\"2\",\"url\":\"https://i8.mifile.cn/a1/pms_1527735134.08232431!560x560.jpg\"},{\"id\":\"3\",\"url\":\"https://i8.mifile.cn/a1/pms_1527735134.24873718!560x560.jpg\"},{\"id\":\"4\",\"url\":\"https://i8.mifile.cn/a1/pms_1527735134.01919050!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1527735134.03584233!560x560.jpg', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/3903/29/6990/200702/5ba4a273E0a717ba8/426981810b1a70f2.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t1/148/5/7346/197445/5ba4a273Ef7bc120c/a3c4b221fbe4bdaf.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t20002/136/948301962/365666/d8b24f90/5b0fdc0eN74a6459a.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t21811/173/751658295/118558/613c4bd7/5b17b42bNcad0e881.jpg\"}]', '全球首款双频GPS / 骁龙845处理器 / 红外人脸解锁 / AI变焦双摄 / 三星 AMOLED 屏'),
(4, '小米MIX 2S', 2899.00, '小米', '4500', 3299.00, '3400', '[{\"id\":\"1\",\"url\":\"https://i8.mifile.cn/a1/pms_1522033929.93635904!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1522033929.93635904!560x560.jpg', '[{\"id\":\"1\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t17308/338/1036538395/399535/3a902940/5ab9c4c3Ncfe80705.jpg\"},{\"id\":\"2\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t19651/26/1063887955/378736/dfa56086/5ab9c4c3N9bd0b1d4.jpg\"},{\"id\":\"3\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t17074/286/1083295446/114994/6a7e3726/5ab9c4c3N32c17ba2.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t18889/152/2551012980/281585/6d04ab56/5afe41afN037f7543.jpg\"}]', '陶瓷机身 手机中的艺术品 / 搭载高通骁龙845 年度旗舰处理器 / AI超感光双摄，DxO百分相机 / 高效 Qi 无线充电'),
(5, '小米8 SE', 1699.00, '小米', '3200', 1799.00, '1890', '[{\"id\":\"1\",\"url\":\"https://i8.mifile.cn/a1/pms_1527684986.69698543!560x560.jpg\"},\r\n[{\"id\":\"2\",\"url\":\"https://i8.mifile.cn/a1/pms_1527684986.76121192!560x560.jpg\"},\r\n[{\"id\":\"3\",\"url\":\"https://i8.mifile.cn/a1/pms_1527684986.6891825!560x560.jpg\"},\r\n[{\"id\":\"4\",\"url\":\"https://i8.mifile.cn/a1/pms_1527684986.69828101!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1527684986.69698543!560x560.jpg', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t22078/170/541599639/358967/c32efee2/5b0fe150Nde455d01.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t19939/202/954779231/73556/a6ac196d/5b0fe14fN01e568a7.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t24028/322/2209114727/202874/bb51cbba/5b76e37bN50a1ea84.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t21715/229/509065122/361926/4bbb3602/5b0fb077N1b9f9fd2.jpg\"}]', '三星 AMOLED 全面屏 小屏旗舰 / 骁龙710处理器 / AI 超感光双摄 / 前置2000万柔光自拍'),
(6, '黑鲨游戏手机', 3199.00, '小米', '5600', 3499.00, '3400', '[{\"id\":\"1\",\"url\":\"https://i8.mifile.cn/a1/pms_1524032283.82393376!560x560.jpg\"}]', 'https://i8.mifile.cn/a1/pms_1524032283.82393376!560x560.jpg', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t20926/151/101459644/91185/f3aae941/5afbf17cN49932153.jpg\"},{\"id\":\"2\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t17434/70/1601997585/154130/d0d14b68/5acfef86N8a4eb14b.jpg\"},{\"id\":\"3\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t19522/297/1561060203/167918/7b458deb/5acfef81Nb7596c54.jpg\"},{\"id\":\"4\",\"url\":\"https://img30.360buyimg.com/sku/jfs/t16723/121/1588941042/132508/1cf676f3/5acfef7cN70cf581b.jpg\"}]', '液冷散热 / 独立图像处理芯片 / 一键游戏模式 / 骁龙845处理器 / 18:9全面屏 / 前后2000万摄像头'),
(7, '坚果 Pro 2S', 1798.00, '锤子', '20000', 1798.00, '32653', '[{\"id\":1,\"url\":\"https://resource.smartisan.com/resource/b07b9765e272f866da6acda4ee107d88.png?x-oss-process=image/resize,w_659/format,webp\"}]', 'https://resource.smartisan.com/resource/b07b9765e272f866da6acda4ee107d88.png?x-oss-process=image/resize,w_659/format,webp', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t23452/60/2334006160/312016/4cb7f3f2/5b7ab17dN36451ed7.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t23287/47/2242707882/288546/10927a08/5b7ab17dNf77653d3.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t25477/72/728758335/295415/fb343e40/5b7ac3eeNcbfbe4da.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t26077/252/754231002/212856/9a9aab4f/5b7ab17cNa843f62c.jpg\"}]', '双系统，无限屏，骁龙 ™ 710 处理器 · 前置 1600 万像素摄像头 · 6.01 英寸全高清全面屏 · AI 通话降噪 · 人脸解锁 + 指纹解锁'),
(8, '坚果 R1', 2999.00, '锤子', '30000', 2999.00, '32102', '[{\"id\":1,\"url\":\"https://resource.smartisan.com/resource/06c2253354096f5e9ebf0616f1af2086.png?x-oss-process=image/resize,w_659/format,webp\"}]', 'https://resource.smartisan.com/resource/06c2253354096f5e9ebf0616f1af2086.png?x-oss-process=image/resize,w_659/format,webp', '[{\"id\":\"1\",\"url\":\"http://img10.360buyimg.com/imgzone/jfs/t20302/62/1083627061/1381702/4b7a64bb/5b1faf31Ncca17a93.jpg\"},{\"id\":\"2\",\"url\":\"http://img10.360buyimg.com/imgzone/jfs/t21586/53/1075307095/1276467/cd739f7c/5b1faf31N252fb392.jpg\"},{\"id\":\"3\",\"url\":\"http://img10.360buyimg.com/imgzone/jfs/t20434/207/1085850337/1418735/7f49caf8/5b1faf31N1cd60353.jpg\"},{\"id\":\"4\",\"url\":\"http://img10.360buyimg.com/imgzone/jfs/t20587/55/1080611148/201588/646cc095/5b1f8c50N9312eda1.jpg\"}]', '骁龙 845 处理器 · 光学防抖双摄像头 · 6.17 英寸压力感应屏幕 · 10W快速无线充电功能'),
(9, '坚果 Pro 2', 1799.00, '锤子', '25266', 1799.00, '31516', '[{\"id\":1,\"url\":\"https://resource.smartisan.com/resource/c71ce2297b362f415f1e74d56d867aed.png?x-oss-process=image/resize,w_659/format,webp\"}]', 'https://resource.smartisan.com/resource/c71ce2297b362f415f1e74d56d867aed.png?x-oss-process=image/resize,w_659/format,webp', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t7876/253/4061690954/2017476/3714f24/5a0319a7Nf6d88738.jpg\"}]', '骁龙 ™ 660 处理器 · 1200 万 + 500 万像素双摄像头 · 3500mAh 大电池 · 18W 快速充电 · 人脸解锁 + 指纹解锁'),
(10, '坚果 3', 1599.00, '锤子', '15314', 1599.00, '26265', '[{\"id\":1,\"url\":\"https://resource.smartisan.com/resource/13e91511f6ba3227ca5378fd2e93c54b.png?x-oss-process=image/resize,w_659/format,webp\"}]', 'https://resource.smartisan.com/resource/13e91511f6ba3227ca5378fd2e93c54b.png?x-oss-process=image/resize,w_659/format,webp', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t17368/340/1617561606/1069487/9676971/5ad014b1Nb8463c4e.jpg\"},{\"id\":\"2\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t17278/52/1620296383/1157116/3d0f473/5ad014b8N32c9c183.jpg\"},{\"id\":\"3\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t17278/52/1620296383/1157116/3d0f473/5ad014b8N32c9c183.jpg\"},{\"id\":\"4\",\"url\":\"//img20.360buyimg.com/vc/jfs/t22327/134/520556609/180777/b2499c7a/5b1005d9Nb92a9c1e.jpg\"}]', '三面无边框 Almost，4000mAh 超巨型电池，双 1300 万诚实双摄，双面玻璃 + 金属中框，人脸解锁 + 指纹支付'),
(11, '荣耀畅玩8C', 1099.00, '华为', '999', 1099.00, '1005', '[{\"id\":\"1\",\"url\":\"https://res.vmallres.com/pimages//product/6901443259571/800_800_1538278169451mp.png\"},{\"id\":\"2\",\"url\":\"https://res.vmallres.com/pimages//product/6901443259571/group//800_800_1538299156732.png\"},{\"id\":\"3\",\"url\":\"https://res.vmallres.com/pimages//product/6901443259571/group//800_800_1538299163016.png\"}]', 'https://res0.vmallres.com/pimages//product/6901443259588/428_428_1538278298963mp.png', '[{\"id\":\"1\",\"url\":\"http://img12.360buyimg.com/cms/jfs/t26980/323/1033239624/192553/b488218f/5bc40860Nf1e54a0e.jpg\"},{\"id\":\"2\",\"url\":\"http://img13.360buyimg.com/cms/jfs/t26389/158/1199430727/280580/e1169ce2/5bc3fdd6N879fa196.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/cms/jfs/t26209/336/1194816768/251239/6275777/5bc3fe03N099c9320.jpg\"},{\"id\":\"4\",\"url\":\"http://img13.360buyimg.com/cms/jfs/t25750/362/2095009928/112868/d41891b3/5bc3fe14N64b8fb61.jpg\"}]', '荣耀畅玩8C 全网通标配版 4GB+32GB（幻夜黑）'),
(12, '荣耀10', 2299.00, '华为', '999', 2599.00, '999', '[{\"id\":\"1\",\"url\":\"https://res.vmallres.com/pimages//product/6901443232413/group//800_800_1535358140458.jpg\"},{\"id\":\"2\",\"url\":\"https://res.vmallres.com/pimages//product/6901443232413/group//800_800_1535358145378.jpg\"},{\"id\":\"3\",\"url\":\"https://res.vmallres.com/pimages//product/6901443232413/group//800_800_1535358149095.jpg\"}]', 'https://res0.vmallres.com/pimages//frontLocation/content/4520161/1539566459947.png', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t25990/322/528395471/66190/b1a80203/5b739cd1Nc944d39d.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t23206/242/2143252474/44524/bace4a0c/5b739cd1N0fa1adaa.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t24139/142/2081255188/92312/782dd0b9/5b739cd1Na0a08dce.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/sku/jfs/t24235/146/2098373111/94726/535b2c17/5b739cd1N71b77868.jpg\"}]', '荣耀10 GT游戏加速 AIS手持夜景 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 荣耀10GT'),
(13, '荣耀Play', 1799.00, '华为', '899', 1999.00, '886', '[{\"id\":\"1\",\"url\":\"https://res.vmallres.com/pimages//product/6901443242641/group//800_800_1527925619010.jpg\"},{\"id\":\"2\",\"url\":\"https://res.vmallres.com/pimages//product/6901443242641/group//800_800_1527925620829.jpg\"},{\"id\":\"3\",\"url\":\"https://res.vmallres.com/pimages//product/6901443242641/group//800_800_1527925621679.jpg\"}]', 'https://res0.vmallres.com/pimages//frontLocation/content/1268791/1539427302857.png', '[{\"id\":\"1\",\"url\":\"http://img13.360buyimg.com/cms/jfs/t1/5940/33/9965/301258/5bc99f85E4bea2b6d/4bb70ef4804ee08e.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/cms/jfs/t21151/211/1795336231/135686/4a61632a/5b35d130N7969ddc8.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/cms/jfs/t20866/188/1820494858/93297/96d8e591/5b35d150Nfb881d7b.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/cms/jfs/t20866/188/1820494858/93297/96d8e591/5b35d150Nfb881d7b.jpg\"}]', '荣耀Play 全网通 4GB+64GB 幻夜黑 GT游戏加速 AI芯片 全面屏游戏手机 双卡双待'),
(14, 'Note9', 8999.00, '三星', '2101', 11210.00, '4512', '[{\"id\":2, \"url\":\"http://res.samsungeshop.com.cn/resources/2018/9/11/15366540528318522_570X570.jpg\"}]', 'http://res.samsungeshop.com.cn/resources/2018/9/11/15366540528318522_570X570.jpg', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t27223/294/116831888/2337116/ed974433/5b8563fbN827f11d5.jpg\"}]', '智能 S Pen、海量存储8G+512G、4000mAh大容量电池'),
(15, '盖乐世 A9 Star Lite', 1999.00, '三星', '9564', 2499.00, '8954', '[{\"id\":2, \"url\":\"http://res.samsungeshop.com.cn/resources/2018/6/2/15278704537512520_570X570.jpg\"}]', 'http://res.samsungeshop.com.cn/resources/2018/6/2/15278704537512520_570X570.jpg', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t21721/319/841126132/3370264/e963421c/5b19478fN1a71d6f0.jpg\"}]', '身临其境 多彩世界、前置2400万像素 “亮”丽美颜、双摄再现 深邃之美'),
(16, 'Note8', 6988.00, '三星', '3', 8599.00, '8957', '[{\"id\":2, \"url\":\"http://res.samsungeshop.com.cn/resources/2017/9/25/15063262024762790_570X570.jpg\"}]', 'http://res.samsungeshop.com.cn/resources/2017/9/25/15063262024762790_570X570.jpg', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t27223/294/116831888/2337116/ed974433/5b8563fbN827f11d5.jpg\"}]', '6GB大运行内存、智能双摄、IP68级防尘防水、息屏提醒'),
(18, 'iphone8', 5099.00, '苹果', '2123', 5099.00, '5566', '[{\"id\":1, \"url\":\"https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone8/plus/iphone8-plus-select-2017?wid=234&hei=330&fmt=png-alpha&.v=1503618522714\"}]', 'https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone8/plus/iphone8-plus-select-2017?wid=234&hei=330&fmt=png-alpha&.v=1503618522714', '[{\"id\":\"1\",\"url\":\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t9307/332/1187929069/366519/d59e5816/59b860b4N53f06414.jpg\"},{\"id\":\"2\",\"url\":\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t7588/251/2988288263/387035/bd138c8e/59b860a6Nd4f9bfe9.jpg\"},{\"id\":\"3\",\"url\":\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t8272/117/1357509823/961160/da713bae/59b860a6N27a4b1fc.jpg\"},{\"id\":\"4\",\"url\":\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t8530/168/1400118121/589091/28a11eff/59b860b0N753797da.jpg\"}]', '5.5 英寸显示屏'),
(19, 'iphonexs', 8699.00, '苹果', '8699', 12222.00, '212', '[{\"id\":1, \"url\":\"https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xs/iphone-xs-max-select-2018-group?wid=289&hei=491&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1536616752354\"}]', 'https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xs/iphone-xs-max-select-2018-group?wid=289&hei=491&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1536616752354', '[{\"id\":\"1\",\"url\":\"https://img30.360buyimg.com/cms/jfs/t1/4626/32/3475/220504/5b997365E80a1373f/279c244f12161cb3.jpg\"},{\"id\":\"2\",\"url\":\"https://img12.360buyimg.com/cms/jfs/t1/3397/21/3533/236322/5b99759aE73795787/f782e04a140c8f16.jpg\"},{\"id\":\"3\",\"url\":\"https://img11.360buyimg.com/cms/jfs/t1/5274/3/3465/245167/5b997365E16b81bc9/93e07e40f3af5e62.jpg\"},{\"id\":\"4\",\"url\":\"https://img30.360buyimg.com/cms/jfs/t1/2322/11/3524/269574/5b997365E26f81a7a/e01fc9486da9eda1.jpg\"}]', '\r\n突破性的双镜头系统。 这款在全世界广受欢迎的相机，正在将摄影领入新纪元。创新的感光元件、图像信号处理器和神经网络引擎默契协作，让你拍出的照片一张比一张出彩'),
(20, 'iphonexr', 6499.00, '苹果', '6499', 1212.00, '331', '[{\"id\":1, \"url\":\"https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-select-static-201809_GEO_CN?wid=756&hei=472&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1536451409425\"}]', 'https://store.storeimages.cdn-apple.com/8755/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-select-static-201809_GEO_CN?wid=756&hei=472&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1536451409425', '[{\"id\":\"1\",\"url\":\"https://img14.360buyimg.com/cms/jfs/t1/3232/17/3505/166696/5b997bf1E382f4a2c/b9854b5b9a9fc950.jpg\"},{\"id\":\"2\",\"url\":\"https://img14.360buyimg.com/cms/jfs/t1/367/12/3793/205864/5b997bf2E833e701a/0b7d6a51a5ff0781.jpg\"},{\"id\":\"3\",\"url\":\"https://img14.360buyimg.com/cms/jfs/t1/5501/9/3441/151755/5b997bf1E4ba7648e/3a3e32f714518dbd.jpg\"},{\"id\":\"4\",\"url\":\"https://img11.360buyimg.com/cms/jfs/t1/5544/7/3467/204032/5b997bf1Ef261a506/4d26ef3e87b3f2ea.jpg\"}]', '全新 Liquid 视网膜显示屏，是 iPhone 迄今最先进的 LCD 屏。此外，更有识别速度进一步提升的面容 ID、iPhone 史上最智能最强大的芯片，以及支持景深控制功能的突破性摄像头系统。iPhone XR，怎么看，都满是亮点。'),
(21, 'OnePlus 6', 3199.00, '一加', '3200', 3199.00, '7897', '[{\"id\":1, \"url\":\"https://image01.oneplus.cn/shop/201807/05/1921/da71f98cd8531fbf83e1ec2b868c10d9.jpg\"}]', 'https://image01.oneplus.cn/shop/201807/05/1921/da71f98cd8531fbf83e1ec2b868c10d9.jpg', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t23926/165/2350072663/4601771/78bc812b/5b7bc24cN68d8548c.jpg\"}]', '全新 OnePlus 6 搭载骁龙™ 845，性能比上一代提升 30%。最高 8GB 四通道 LPDDR4X 大内存+256GB UFS2.1 双通道超大闪存*，App 运行更流畅。令人羡慕的强悍配置之外，还对 50 余款热门游戏进行特别优化，让你的游戏体验，更畅快，更尽兴'),
(22, '一加OnePlus 5', 2199.00, '一加', '10', 2199.00, '12342', '[{\"id\":1,\"url\":\"https://image01.oneplus.cn/ebp/201706/17/1202/99221ac82845113af2d037955adcf04a.png\"}]', 'https://img14.360buyimg.com/n0/jfs/t26602/337/711702057/94056/24431f7b/5bb70e47N15590c4f.jpg', '[{\"id\":\"1\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t15091/149/133428094/289315/8e1f10e3/5a24df5bN9a495e1d.jpg\"},{\"id\":\"2\",\"url\":\"http://img20.360buyimg.com/vc/jfs/t14416/127/1766210680/884298/ffb54d5d/5a56cae1N8a59a824.jpg\"}]', '用过，才知道什么叫流畅\r\n月岩灰搭载 64 GB /128GB 存储，薄荷金搭载 64GB 存储，星辰黑搭载 128 GB 存储，均为 UFS 2.1 双通道存储。相比 UFS2.0，UFS 2.1 的带宽速度快了将近一倍。');

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户表id',
  `commodity_id` int(11) DEFAULT NULL COMMENT '关联商品表id',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_status` varchar(255) DEFAULT NULL COMMENT '0: 未付款，1：付款发货中，2：订单完成',
  `order_total` varchar(255) DEFAULT NULL COMMENT '订单总价',
  `order_size` int(11) DEFAULT NULL COMMENT '订单商品的购买数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_order`
--

INSERT INTO `shop_order` (`id`, `user_id`, `commodity_id`, `order_number`, `order_status`, `order_total`, `order_size`) VALUES
(163, 15, 21, '1556433484000', '1', '3199', 1),
(162, 15, 22, '1556433484000', '1', '2199', 1),
(161, 15, 22, '1555732322000', '1', '2199', 1),
(160, 15, 22, '1555727842000', '1', '4398', 2);

-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(11) DEFAULT NULL COMMENT '用户名',
  `user_pwd` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `user_nicname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `user_addres` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `user_icons` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_money` varchar(255) DEFAULT '9999999' COMMENT '账户余额',
  `user_truename` varchar(255) DEFAULT NULL COMMENT '用户的真实姓名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`id`, `user_name`, `user_pwd`, `user_nicname`, `user_addres`, `user_icons`, `user_money`, `user_truename`) VALUES
(14, '15155145354', 'fc51c4612ee06de1b3a9c9223f465434', 'bmy', '安徽 合肥市 蜀山区博奥丽苑', NULL, '9991212', '刘兵'),
(15, '18756790673', 'e10adc3949ba59abbe56e057f20f883e', '1111', '重庆 铜梁县 二坪镇ZxZxZxZxZx', NULL, '9982606', '111'),
(16, '18756790673', 'e10adc3949ba59abbe56e057f20f883e', '1111', NULL, NULL, '9999999', NULL),
(17, '15781595526', 'e10adc3949ba59abbe56e057f20f883e', '54681', NULL, NULL, '9999999', NULL),
(18, '18756426541', 'e10adc3949ba59abbe56e057f20f883e', '12313', NULL, NULL, '9999999', NULL),
(19, '18756790673', '4297f44b13955235245b2497399d7a93', '爱仕达所', NULL, NULL, '9999999', NULL),
(20, '18756790673', '4297f44b13955235245b2497399d7a93', '爱仕达所', NULL, NULL, '9999999', NULL),
(21, '18756790614', '4297f44b13955235245b2497399d7a93', '花样百出', NULL, NULL, '9999999', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_commodity`
--
ALTER TABLE `shop_commodity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- 使用表AUTO_INCREMENT `shop_commodity`
--
ALTER TABLE `shop_commodity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- 使用表AUTO_INCREMENT `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
