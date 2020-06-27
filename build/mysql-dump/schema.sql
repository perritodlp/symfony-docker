use evertec;
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(80) NOT NULL,
  `customer_email` varchar(120) NOT NULL,
  `customer_mobile` varchar(40) NOT NULL,
  `net` decimal NULL,
  `tax` decimal NULL,
  `is_paid` boolean DEFAULT false,
  `is_approved` boolean DEFAULT false,
  `amount` decimal NULL,
  `total` decimal NULL,
  `customer_id` int(8) NOT NULL, 
  `payment_method_id` int(4) NOT NULL,
  `product_id` int(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(256) NOT NULL,
  `product_description` varchar(256) DEFAULT NULL,
  `product_reference` varchar(40) DEFAULT NULL,
  `product_value` varchar(20) NOT NULL,
  `product_image` varchar(120) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_reference`, `product_value`, `product_image`) VALUES (1, 'Colección de Mini Autos Rally', 'Colección completa de Mini Autos Rally', '28264', '112900', 'coleccion-de-mini-autos-rally-.jpg');
INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_reference`, `product_value`, `product_image`) VALUES (2, 'Mini autos Rally de colección - Dodge GTS', 'Replicas originales a escala 1:36', '28255', '12900', 'coleccion-de-mini-autos-rally-.jpg');
INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_reference`, `product_value`, `product_image`) VALUES (3, 'mini-autos-rally-de-coleccion-honda-integra-street-fighter', 'Replicas originales a escala 1:36', '28257', '12900', 'mini-autos-rally-de-coleccion-honda-integra-street-fighter.jpg');
INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_reference`, `product_value`, `product_image`) VALUES (4, 'Mini autos Rally de colección - Lexus IS Street Fighter', 'Replicas originales a escala 1:36', '28260', '12900', 'mini-autos-rally-de-coleccion-lexus-is-street-fighter-.jpg');
INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_reference`, `product_value`, `product_image`) VALUES (5, 'Mini autos Rally de colección - Lotus Exige R - GT', 'Replicas originales a escala 1:36', '28263', '12900', 'mini-autos-rally-de-coleccion-lotus-exige-r-gt.jpg');

DROP TABLE IF EXISTS `payment_attempt`;
CREATE TABLE `payment_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(8) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method_id` int(4) NOT NULL,
  `source_url` varchar(256) DEFAULT NULL,
  `success_return_url` varchar(256) DEFAULT NULL,
  `error_return_url` varchar(256) DEFAULT NULL,
  `external_reference` varchar(256) DEFAULT NULL,
  `request_id` int(8) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `payment_response`;
CREATE TABLE `payment_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_attempt_id` int(11) NOT NULL,
  `operation_code` varchar(4) DEFAULT NULL,
  `status_code` varchar(40) DEFAULT NULL,
  `status_info` varchar(120) DEFAULT NULL,
  `additional_info` varchar(256) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;