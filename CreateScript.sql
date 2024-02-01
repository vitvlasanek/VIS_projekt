CREATE TABLE `User` (
  `address` int,
  `employed` int,
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int,
  `password_hash` VARCHAR(64) NOT NULL
);

CREATE TABLE `Role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `Restaurant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `address` int,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `MenuInRestaurant` (
  `menu` int,
  `restaurant` int
);

CREATE TABLE `Menu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255),
  `picture` varchar(255)
);

CREATE TABLE `Item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `menu` int,
  `name` varchar(255) NOT NULL,
  `description` varchar(255),
  `picture` varchar(255),
  `price` int
);

CREATE TABLE `ShoppingCart` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user` int
);

CREATE TABLE `Order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `restaurant` int,
  `address` int,
  `customer` int,
  `driver` int,
  `delivery` int,
  `payment` int,
  `paid` bool DEFAULT 0,
  `created_at` datetime DEFAULT (now())
);

CREATE TABLE `Address` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `street` varchar(255),
  `number` int NOT NULL,
  `postcode` int NOT NULL
);

CREATE TABLE `ItemsInOrder` (
  `order` int,
  `item` int,
  `count` int NOT NULL
);

CREATE TABLE `ItemsInCart` (
  `item` int,
  `cart` int,
  `count` int NOT NULL
);

CREATE TABLE `DeliveryType` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` number
);

CREATE TABLE `PaymentType` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` number
);

ALTER TABLE `User` ADD FOREIGN KEY (`address`) REFERENCES `Address` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`employed`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`role`) REFERENCES `Role` (`id`);

ALTER TABLE `Restaurant` ADD FOREIGN KEY (`address`) REFERENCES `Address` (`id`);

ALTER TABLE `MenuInRestaurant` ADD FOREIGN KEY (`menu`) REFERENCES `Menu` (`id`);

ALTER TABLE `MenuInRestaurant` ADD FOREIGN KEY (`restaurant`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `Item` ADD FOREIGN KEY (`menu`) REFERENCES `Menu` (`id`);

ALTER TABLE `ShoppingCart` ADD FOREIGN KEY (`user`) REFERENCES `User` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`restaurant`) REFERENCES `Restaurant` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`address`) REFERENCES `Address` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`customer`) REFERENCES `User` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`driver`) REFERENCES `User` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`delivery`) REFERENCES `DeliveryType` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`payment`) REFERENCES `PaymentType` (`id`);

ALTER TABLE `ItemsInOrder` ADD FOREIGN KEY (`order`) REFERENCES `Order` (`id`);

ALTER TABLE `ItemsInOrder` ADD FOREIGN KEY (`item`) REFERENCES `Item` (`id`);

ALTER TABLE `ItemsInCart` ADD FOREIGN KEY (`item`) REFERENCES `Item` (`id`);

ALTER TABLE `ItemsInCart` ADD FOREIGN KEY (`cart`) REFERENCES `ShoppingCart` (`id`);
