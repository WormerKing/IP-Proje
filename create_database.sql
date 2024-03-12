/* 
Author = wormer
License = GPL-3
Date = 2024-03-7
*/

-- Create database

drop database `Backend_Project`;
CREATE DATABASE `Backend_Project` CHARACTER SET utf8 COLLATE utf8_general_ci;

-- create tables
-- #################################################################################################
-- create users
CREATE TABLE `Backend_Project`.`users` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`email` VARCHAR(50) NOT NULL ,
	`name` VARCHAR(50) NOT NULL ,
	`surname` VARCHAR(50) NOT NULL ,
	`password` VARCHAR(50) NOT NULL , 
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`), 
	UNIQUE (`email`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create brands
CREATE TABLE `Backend_Project`.`brands` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`title` VARCHAR(50) NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create services
CREATE TABLE `Backend_Project`.`services` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`title` VARCHAR(50) NOT NULL ,
	`url` VARCHAR(50) NOT NULL ,
	`description` TEXT NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create references
CREATE TABLE `Backend_Project`.`references` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`title` VARCHAR(50) NOT NULL ,
	`description` TEXT NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ####################################################################################################

-- create settings
CREATE TABLE `Backend_Project`.`settings` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`company_name` VARCHAR(50) NOT NULL ,
	`adress` VARCHAR(100) NOT NULL ,
	`about_us` TEXT NOT NULL ,
	`slogan` VARCHAR(100) NOT NULL ,
	`mission` TEXT NOT NULL ,
	`vision` TEXT NOT NULL ,
	`img_url` VARCHAR(50) NOT NULL , 
	`mobile_img_url` VARCHAR(50) NOT NULL ,
	`favicon` VARCHAR(50) NOT NULL ,
	`phone_one` VARCHAR(50) NOT NULL ,
	`phone_two` VARCHAR(50) NOT NULL ,
	`email` VARCHAR(50) NOT NULL ,
	`facebook` VARCHAR(50) NOT NULL , 
	`twitter` VARCHAR(50) NOT NULL , 
	`instagram` VARCHAR(50) NOT NULL , 
	`linkedin` VARCHAR(50) NOT NULL , 
	`is_active` BOOLEAN NOT NULL , 
	`gsm_one` VARCHAR(50) NOT NULL , 
	`gsm_two` VARCHAR(50) NOT NULL , 
	`created_at` TIMESTAMP NOT NULL , 
	PRIMARY KEY (`id`), UNIQUE (`email`)
) ENGINE = InnoDB;

-- ###################################################################################################

-- create products
CREATE TABLE `Backend_Project`.`products` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`title` VARCHAR(50) NOT NULL ,
	`description` TEXT NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create testimanials
CREATE TABLE `Backend_Project`.`testimanials` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`title` VARCHAR(50) NOT NULL ,
	`description` TEXT NOT NULL ,
	`full_name` VARCHAR(100) NOT NULL ,
	`company` VARCHAR(100) NOT NULL ,
	`img_url` VARCHAR(50) NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create product_images
CREATE TABLE `Backend_Project`.`product_images` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`product_id` INT NOT NULL ,
	`rank` INT NOT NULL ,
	`img_url` VARCHAR(50) NOT NULL ,
	`is_cover` BOOLEAN NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- #################################################################################################
-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- #################################################################################################

-- create logs tables
-- create users
CREATE TABLE `Backend_Project`.`users_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`user_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_img_url` VARCHAR(50),
	`before_email` VARCHAR(50),
	`before_name` VARCHAR(50),
	`before_surname` VARCHAR(50),
	`before_password` VARCHAR(50), 
	`before_is_active` BOOLEAN,
	`after_img_url` VARCHAR(50),
	`after_email` VARCHAR(50),
	`after_name` VARCHAR(50),
	`after_surname` VARCHAR(50),
	`after_password` VARCHAR(50), 
	`after_is_active` BOOLEAN,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create brands
CREATE TABLE `Backend_Project`.`brands_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`brand_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_img_url` VARCHAR(50),
	`before_title` VARCHAR(50),
	`before_rank` INT,
	`before_is_active` BOOLEAN,
	`after_img_url` VARCHAR(50),
	`after_title` VARCHAR(50),
	`after_rank` INT,
	`after_is_active` BOOLEAN,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create services
CREATE TABLE `Backend_Project`.`services_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`service_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_img_url` VARCHAR(50) ,
	`before_title` VARCHAR(50) ,
	`before_url` VARCHAR(50) ,
	`before_description` TEXT ,
	`before_rank` INT ,
	`before_is_active` BOOLEAN ,
	`after_img_url` VARCHAR(50) ,
	`after_title` VARCHAR(50) ,
	`after_url` VARCHAR(50) ,
	`after_description` TEXT ,
	`after_rank` INT ,
	`after_is_active` BOOLEAN ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create references
CREATE TABLE `Backend_Project`.`references_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`reference_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_img_url` VARCHAR(50) ,
	`before_title` VARCHAR(50) ,
	`before_description` TEXT ,
	`before_rank` INT ,
	`before_is_active` BOOLEAN ,
	`after_img_url` VARCHAR(50) ,
	`after_title` VARCHAR(50) ,
	`after_description` TEXT ,
	`after_rank` INT ,
	`after_is_active` BOOLEAN ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ####################################################################################################

-- create settings
CREATE TABLE `Backend_Project`.`settings_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`setting_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_company_name` VARCHAR(50) ,
	`before_adress` VARCHAR(100) ,
	`before_about_us` TEXT ,
	`before_slogan` VARCHAR(100) ,
	`before_mission` TEXT ,
	`before_vision` TEXT ,
	`before_img_url` VARCHAR(50) , 
	`before_mobile_img_url` VARCHAR(50) ,
	`before_favicon` VARCHAR(50) ,
	`before_phone_one` VARCHAR(50) ,
	`before_phone_two` VARCHAR(50) ,
	`before_email` VARCHAR(50) ,
	`before_facebook` VARCHAR(50) , 
	`before_twitter` VARCHAR(50) , 
	`before_instagram` VARCHAR(50) , 
	`before_linkedin` VARCHAR(50) , 
	`before_is_active` BOOLEAN , 
	`before_gsm_one` VARCHAR(50) , 
	`before_gsm_two` VARCHAR(50) ,
	`after_company_name` VARCHAR(50) ,
	`after_adress` VARCHAR(100) ,
	`after_about_us` TEXT ,
	`after_slogan` VARCHAR(100) ,
	`after_mission` TEXT ,
	`after_vision` TEXT ,
	`after_img_url` VARCHAR(50) , 
	`after_mobile_img_url` VARCHAR(50) ,
	`after_favicon` VARCHAR(50) ,
	`after_phone_one` VARCHAR(50) ,
	`after_phone_two` VARCHAR(50) ,
	`after_email` VARCHAR(50) ,
	`after_facebook` VARCHAR(50) , 
	`after_twitter` VARCHAR(50) , 
	`after_instagram` VARCHAR(50) , 
	`after_linkedin` VARCHAR(50) , 
	`after_is_active` BOOLEAN , 
	`after_gsm_one` VARCHAR(50) , 
	`after_gsm_two` VARCHAR(50) , 
	`created_at` TIMESTAMP NOT NULL , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ###################################################################################################

-- create products
CREATE TABLE `Backend_Project`.`products_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`img_url` VARCHAR(50) NOT NULL ,
	`title` VARCHAR(50) NOT NULL ,
	`description` TEXT NOT NULL ,
	`rank` INT NOT NULL ,
	`is_active` BOOLEAN NOT NULL ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create testimanials
CREATE TABLE `Backend_Project`.`testimanials_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`testimanial_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_title` VARCHAR(50) ,
	`before_description` TEXT ,
	`before_full_name` VARCHAR(100) ,
	`before_company` VARCHAR(100) ,
	`before_img_url` VARCHAR(50) ,
	`before_rank` INT ,
	`before_is_active` BOOLEAN ,
	`after_title` VARCHAR(50) ,
	`after_description` TEXT ,
	`after_full_name` VARCHAR(100) ,
	`after_company` VARCHAR(100) ,
	`after_img_url` VARCHAR(50) ,
	`after_rank` INT ,
	`after_is_active` BOOLEAN ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################

-- create product_images
CREATE TABLE `Backend_Project`.`product_images_logs` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`product_image_id` INT,
	`trigger` VARCHAR(15) NOT NULL,
	`before_product_id` INT ,
	`before_rank` INT ,
	`before_img_url` VARCHAR(50) ,
	`before_is_cover` BOOLEAN ,
	`before_is_active` BOOLEAN ,
	`after_product_id` INT ,
	`after_rank` INT ,
	`after_img_url` VARCHAR(50) ,
	`after_is_cover` BOOLEAN ,
	`after_is_active` BOOLEAN ,
	`created_at` TIMESTAMP NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- ##################################################################################################
-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ##################################################################################################

-- create triggers

-- users_logs insert
CREATE TRIGGER `Backend_Project`.`trg_users_insert` AFTER INSERT ON `users` for each row
insert into `Backend_Project`.`users_logs`(
	`trigger`,
	user_id,
	after_img_url,
	after_email,
	after_name,
	after_surname,
	after_password,
	after_is_active
) 

values(
		'inserted',
		NEW.id,
		NEW.img_url,
		NEW.email,
		NEW.name,
		NEW.surname,
		NEW.password,
		NEW.is_active
);

-- users_logs update

CREATE TRIGGER `Backend_Project`.`trg_users_update` AFTER UPDATE ON `users` for each row
insert into `Backend_Project`.`users_logs` 
values(
	OLD.id,
	'updated',
	OLD.img_url,
	OLD.email,
	OLD.name,
	OLD.surname,
	OLD.password,
	OLD.is_active,
	NEW.img_url,
	NEW.email,
	NEW.name,
	NEW.surname,
	NEW.password,
	NEW.is_active
);

-- users_logs delete

CREATE TRIGGER `Backend_Project`.`trg_users_delete` AFTER DELETE ON `users` for each row
insert into `Backend_Project`.`users_logs`(
	user_id,
	`trigger`,
	before_img_url,
	before_email,
	before_name,
	before_surname,
	before_password,
	before_is_active
)
values(
	OLD.id,
	'updated',
	OLD.img_url,
	OLD.email,
	OLD.name,
	OLD.surname,
	OLD.password,
	OLD.is_active
);

-- brands_logs insert
CREATE TRIGGER `Backend_Project`.`trg_brands_insert` AFTER INSERT ON `brands` for each row
insert into `Backend_Project`.`brands_logs`(
	`trigger`,
	brand_id,
	after_img_url,
	after_title,
	after_rank,
	after_is_active
) 

values(
		'inserted',
		NEW.id,
		NEW.img_url,
		NEW.title,
		NEW.rank,
		NEW.is_active
);

-- brands_logs update
CREATE TRIGGER `Backend_Project`.`trg_brands_update` AFTER UPDATE ON `brands` for each row
insert into `Backend_Project`.`brands_logs` 

values(
		NEW.id,
		`updated`,
		OLD.img_url,
		OLD.title,
		OLD.rank,
		OLD.is_active,
		NEW.img_url,
		NEW.title,
		NEW.rank,
		NEW.is_active
);

-- brands_logs delete
CREATE TRIGGER `Backend_Project`.`trg_brands_delete` AFTER DELETE ON `brands` for each row
insert into `Backend_Project`.`brands_logs`(
	`trigger`,
	brand_id,
	before_img_url,
	before_title,
	before_rank,
	before_is_active
) 

values(
		'deleted',
		OLD.id,
		OLD.img_url,
		OLD.title,
		OLD.rank,
		OLD.is_active
);

-- products_logs insert
CREATE TRIGGER `Backend_Project`.`trg_products_insert` AFTER INSERT ON `products` for each row
insert into `Backend_Project`.`products_logs`(
	brand_id,
	`trigger`,
	after_img_url,
	after_title,
	after_rank,
	after_is_active
) 

values(
	NEW.id,
	'inserted',
	NEW.img_url,
	NEW.title,
	NEW.rank,
	NEW.is_active
);

-- products_logs update
CREATE TRIGGER `Backend_Project`.`trg_products_update` AFTER UPDATE ON `products` for each row
insert into `Backend_Project`.`products_logs` 

values(
	OLD.id,
	'updated',
	OLD.img_url,
	OLD.title,
	OLD.rank,
	OLD.is_active,
	NEW.img_url,
	NEW.title,
	NEW.rank,
	NEW.is_active
);

-- product_logs delete
CREATE TRIGGER `Backend_Project`.`trg_products_delete` AFTER DELETE ON `products` for each row
insert into `Backend_Project`.`products_logs`(
	product_id,
	`trigger`,
	before_img_url,
	before_title,
	before_rank,
	before_is_active
)

values(
	OLD.id,
	'updated',
	OLD.img_url,
	OLD.title,
	OLD.rank,
	OLD.is_active
);

-- product_images_logs insert
CREATE TRIGGER `Backend_Project`.`trg_product_images_insert` AFTER INSERT ON `product_images` for each row
insert into `Backend_Project`.`product_images_logs`(
	product_image_id,
	`trigger`,
	after_product_id,
	after_rank,
	after_img_url,
	after_is_cover,
	after_is_active
)

values(
	NEW.id,
	'insert',
	NEW.product_id,
	NEW.rank,
	NEW.img_url,
	NEW.is_cover,
	NEW.is_active
);

-- product_images_logs update
CREATE TRIGGER `Backend_Project`.`trg_product_images_update` AFTER UPDATE ON `product_images` for each row
insert into `Backend_Project`.`product_images_logs`

values(
	NEW.id,
	'update',
	OLD.product_id,
	OLD.rank,
	OLD.img_url,
	OLD.is_cover,
	OLD.is_active,
	NEW.product_id,
	NEW.rank,
	NEW.img_url,
	NEW.is_cover,
	NEW.is_active
);

-- product_images_logs delete
CREATE TRIGGER `Backend_Project`.`trg_product_images_delete` AFTER DELETE ON `product_images` for each row
insert into `Backend_Project`.`product_images_logs`(
	product_image_id,
	`trigger`,
	before_product_id,
	before_rank,
	before_img_url,
	before_is_cover,
	before_is_active
)

values(
	OLD.id,
	'delete',
	OLD.product_id,
	OLD.rank,
	OLD.img_url,
	OLD.is_cover,
	OLD.is_active
);

-- references_logs insert
CREATE TRIGGER `Backend_Project`.`trg_references_insert` AFTER INSERT ON `references` for each row
insert into `Backend_Project`.`references_logs`(
	reference_id,
	`trigger`,
	after_img_url,
	after_title,
	after_description,
	after_rank,
	after_is_active
)

values(
	NEW.id,
	'inserted',
	NEW.img_url,
	NEW.title,
	NEW.description,
	NEW.rank,
	NEW.is_active
);

-- references_logs update
CREATE TRIGGER `Backend_Project`.`trg_references_update` AFTER UPDATE ON `references` for each row
insert into `Backend_Project`.`references_logs`

values(
	NEW.id,
	'inserted',
	OLD.img_url,
	OLD.title,
	OLD.description,
	OLD.rank,
	OLD.is_active,
	NEW.img_url,
	NEW.title,
	NEW.description,
	NEW.rank,
	NEW.is_active
);

-- references_logs delete
CREATE TRIGGER `Backend_Project`.`trg_references_delete` AFTER DELETE ON `references` for each row
insert into `Backend_Project`.`references_logs`(
	reference_id,
	`trigger`,
	before_img_url,
	before_title,
	before_description,
	before_rank,
	before_is_active
)

values(
	OLD.id,
	'deleted',
	OLD.img_url,
	OLD.title,
	OLD.description,
	OLD.rank,
	OLD.is_active
);

-- services_logs insert
CREATE TRIGGER `Backend_Project`.`trg_services_insert` AFTER INSERT ON `services` for each row
insert into `Backend_Project`.`services_logs`(
	service_id,
	`trigger`,
	after_img_url,
	after_title,
	after_url,
	after_description,
	after_rank,
	after_is_active
)

values(
	NEW.id,
	'inserted',
	NEW.img_url,
	NEW.title,
	NEW.url,
	NEW.description,
	NEW.rank,
	NEW.is_active
);

-- services_logs update
CREATE TRIGGER `Backend_Project`.`trg_services_update` AFTER UPDATE ON `services` for each row
insert into `Backend_Project`.`services_logs`

values(
	NEW.id,
	'updated',
	OLD.img_url,
	OLD.title,
	OLD.url,
	OLD.description,
	OLD.rank,
	OLD.is_active,
	NEW.img_url,
	NEW.title,
	NEW.url,
	NEW.description,
	NEW.rank,
	NEW.is_active
);

-- services_logs delete
CREATE TRIGGER `Backend_Project`.`trg_services_delete` AFTER DELETE ON `services` for each row
insert into `Backend_Project`.`services_logs`(
	service_id,
	`trigger`,
	before_img_url,
	before_title,
	before_url,
	before_description,
	before_rank,
	before_is_active
)

values(
	OLD.id,
	'deleted',
	OLD.img_url,
	OLD.title,
	OLD.url,
	OLD.description,
	OLD.rank,
	OLD.is_active
);

-- settings_logs insert
CREATE TRIGGER `Backend_Project`.`trg_settings_insert` AFTER INSERT ON `settings` for each row
insert into `Backend_Project`.`settings_logs`(
	setting_id,
	`trigger`,
	after_company_name,
	after_adress,
	after_about_us,
	after_slogan,
	after_mission,
	after_vision,
	after_img_url,
	after_mobile_img_url,
	after_favicon,
	after_phone_one,
	after_phone_two,
	after_email,
	after_facebook,
	after_twitter,
	after_instagram,
	after_linkedin,
	after_is_active,
	after_gsm_one,
	after_gsm_two	
)

values(
	NEW.id,
	'inserted',
	NEW.company_name,
	NEW.adress,
	NEW.about_us,
	NEW.slogan,
	NEW.mission,
	NEW.vision,
	NEW.img_url,
	NEW.mobile_img_url,
	NEW.favicon,
	NEW.phone_one,
	NEW.phone_two,
	NEW.email,
	NEW.facebook,
	NEW.twitter,
	NEW.instagram,
	NEW.linkedin,
	NEW.is_active,
	NEW.gsm_one,
	NEW.gsm_two
);

-- setting_logs update
CREATE TRIGGER `Backend_Project`.`trg_settings_update` AFTER UPDATE ON `settings` for each row
insert into `Backend_Project`.`settings_logs`

values(
	NEW.id,
	'updated',
	OLD.company_name,
	OLD.adress,
	OLD.about_us,
	OLD.slogan,
	OLD.mission,
	OLD.vision,
	OLD.img_url,
	OLD.mobile_img_url,
	OLD.favicon,
	OLD.phone_one,
	OLD.phone_two,
	OLD.email,
	OLD.facebook,
	OLD.twitter,
	OLD.instagram,
	OLD.linkedin,
	OLD.is_active,
	OLD.gsm_one,
	OLD.gsm_two,
	NEW.company_name,
	NEW.adress,
	NEW.about_us,
	NEW.slogan,
	NEW.mission,
	NEW.vision,
	NEW.img_url,
	NEW.mobile_img_url,
	NEW.favicon,
	NEW.phone_one,
	NEW.phone_two,
	NEW.email,
	NEW.facebook,
	NEW.twitter,
	NEW.instagram,
	NEW.linkedin,
	NEW.is_active,
	NEW.gsm_one,
	NEW.gsm_two
);

-- settings_logs delete
CREATE TRIGGER `Backend_Project`.`trg_settings_delete` AFTER DELETE ON `settings` for each row
insert into `Backend_Project`.`settings_logs`(
	setting_id,
	`trigger`,
	before_company_name,
	before_adress,
	before_about_us,
	before_slogan,
	before_mission,
	before_vision,
	before_img_url,
	before_mobile_img_url,
	before_favicon,
	before_phone_one,
	before_phone_two,
	before_email,
	before_facebook,
	before_twitter,
	before_instagram,
	before_linkedin,
	before_is_active,
	before_gsm_one,
	before_gsm_two	
)

values(
	OLD.id,
	'deleted',
	OLD.company_name,
	OLD.adress,
	OLD.about_us,
	OLD.slogan,
	OLD.mission,
	OLD.vision,
	OLD.img_url,
	OLD.mobile_img_url,
	OLD.favicon,
	OLD.phone_one,
	OLD.phone_two,
	OLD.email,
	OLD.facebook,
	OLD.twitter,
	OLD.instagram,
	OLD.linkedin,
	OLD.is_active,
	OLD.gsm_one,
	OLD.gsm_two
);

-- testiminals_logs insert
CREATE TRIGGER `Backend_Project`.`trg_testiminals_insert` AFTER INSERT ON `testimanials` for each row
insert into `Backend_Project`.`testimanials_logs`(
	testimanial_id,
	`trigger`,
	after_title,
	after_description,
	after_full_name,
	after_company,
	after_img_url,
	after_rank,
	after_is_active
)

values(
	NEW.id,
	'inserted',
	NEW.title,
	NEW.description,
	NEW.full_name,
	NEW.company,
	NEW.img_url,
	NEW.rank,
	NEW.is_active
);

-- testiminals_logs update
CREATE TRIGGER `Backend_Project`.`trg_testiminals_update` AFTER UPDATE ON `testimanials` for each row
insert into `Backend_Project`.`testimanials_logs`

values(
	NEW.id,
	'updated',
	OLD.title,
	OLD.description,
	OLD.full_name,
	OLD.company,
	OLD.img_url,
	OLD.rank,
	OLD.is_active,
	NEW.title,
	NEW.description,
	NEW.full_name,
	NEW.company,
	NEW.img_url,
	NEW.rank,
	NEW.is_active
);

-- testiminals_logs delete
CREATE TRIGGER `Backend_Project`.`trg_testiminals_delete` AFTER DELETE ON `testimanials` for each row
insert into `Backend_Project`.`testimanials_logs`(
	testimanial_id,
	`trigger`,
	before_title,
	before_description,
	before_full_name,
	before_company,
	before_img_url,
	before_rank,
	before_is_active
)

values(
	OLD.id,
	'deleted',
	OLD.title,
	OLD.description,
	OLD.full_name,
	OLD.company,
	OLD.img_url,
	OLD.rank,
	OLD.is_active
);
