delete from  customer_product_wishlist;
delete from  role_permission;
delete from  user_role;
delete from  permissions;
delete from  roles;
delete from  users;
delete from  posts;
delete from  promotions;
delete from  rating;

delete from  sale_products;
delete from  sales;

delete from  product_tag;
delete from  category_tag;
delete from  order_items;
delete from  orders;
delete from  payments;
delete from  customers;
delete from  addresses;
delete from  products;
delete from  categories;
delete from  tags;
delete from  units;
delete from  producers;

insert into tags (id, name) values
(1, 'tag_1'),
(2, 'tag_2'),
(3, 'tag_3'),
(4, 'tag_4'),
(5, 'tag_5')
;

insert into units (id, name) values
(1, 'unit_1'),
(2, 'unit_2'),
(3, 'unit_3'),
(4, 'unit_4'),
(5, 'unit_5')
;

insert into producers (id, name, description) values
(1, 'producer_1','descriptor_1'),
(2, 'producer_2','descriptor_2'),
(3, 'producer_3','descriptor_3'),
(4, 'producer_4','descriptor_4'),
(5, 'producer_5','descriptor_5')
;


INSERT INTO permissions (id, name) VALUES
(1, 'MANAGE_CATEGORIES'),
(2, 'MANAGE_PRODUCTS'),
(3, 'MANAGE_ORDERS'),
(4, 'MANAGE_CUSTOMERS'),
(5, 'MANAGE_PAYMENT_SYSTEMS'),
(6, 'MANAGE_USERS'),
(7, 'MANAGE_ROLES'),
(8, 'MANAGE_PERMISSIONS'),
(9, 'MANAGE_SETTINGS'),
(10, 'MANAGE_POSTS'),
(11, 'MANAGE_DASHBOARD'),
(12, 'MANAGE_PROMOTIONS')
;

INSERT INTO roles (id, name) VALUES
(1, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_CMS_ADMIN'),
(4, 'ROLE_USER')
;

INSERT INTO users (id, email, password, name) VALUES
(1, 'pi-ls@mail.ru', '$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi', 'Super Admin');

insert into role_permission(role_id, perm_id) values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,9),(2,11),
(3,1),(3,2),(3,11)
;

insert into user_role(user_id, role_id) values
(1,1),(1,2),(1,3),(1,4);

insert into categories(id, name, disp_order,disabled, parent_cat_id) values
(1,'Flowers',1,false,null),
(2,'Toys',2,false,null),
(3,'Birds',3,false,1)
;

INSERT INTO products (id,cat_id,unit_id,sku,name,description,image_url,price,disabled,created_on) VALUES
 (1,1,1,'P1001','Quilling Toy 1','Quilling Toy 1','1.png','430.00',false,now()),
 (2,2,2,'P1002','Quilling Toy 2','Quilling Toy 2','1.png','490.00',false,now()),
 (3,3,3,'P1003','Quilling Toy 3','Quilling Toy 3','1.png','400.00',false,now()),
 (4,1,1,'P1004','Quilling Toy 4','Quilling Toy 4','1.png','430.00',false,now()),
 (5,2,2,'P1005','Quilling Toy 5','Quilling Toy 5','1.png','750.00',false,now()),
 (6,3,3,'P1006','Quilling Toy 6','Quilling Toy 6','1.png','350.00',false,now()),
 (7,1,3,'P1007','Quilling Toy 7','Quilling Toy 7','1.png','220.00',false,now()),
 (8,2,2,'P1008','Quilling Toy 8','Quilling Toy 8','1.png','120.00',false,now()),
 (9,3,1,'P1009','Quilling Toy 9','Quilling Toy 9','1.png','150.00',false,now()),
 (10,1,1,'P1010','Quilling Toy 10','Quilling Toy 10','1.png','460.00',false,now()),
 (11,2,1,'P1011','Quilling Toy 11','Quilling Toy 11','1.png','440.00',false,now()),
 (12,3,1,'P1012','Quilling Toy 12','Quilling Toy 12','1.png','450.00',false,now()),
 (13,1,1,'P1013','Quilling Toy 13','Quilling Toy 13','1.png','470.00',false,now()),
 (14,2,3,'P1014','Quilling Toy 14','Quilling Toy 14','1.png','250.00',false,now()),
 (15,3,1,'P1015','Quilling Toy 15','Quilling Toy 15','1.png','450.00',false,now()),
 (16,1,2,'P1016','Quilling Toy 16','Quilling Toy 16','1.png','150.00',false,now()),
 (17,2,1,'P1017','Quilling Toy 17','Quilling Toy 17','1.png','450.00',false,now()),
 (18,3,1,'P1018','Quilling Toy 18','Quilling Toy 18','1.png','450.00',false,now()),
 (19,1,1,'P1019','Quilling Toy 19','Quilling Toy 19','1.png','400.00',false,now()),
 (20,2,1,'P1020','Quilling Toy 20','Quilling Toy 20','1.png','450.00',false,now()),
 (21,3,3,'P1021','Quilling Toy 21','Quilling Toy 21','1.png','450.00',false,now()),
 (22,1,1,'P1022','Quilling Toy 22','Quilling Toy 22','1.png','550.00',false,now()),
 (23,2,2,'P1023','Quilling Toy 23','Quilling Toy 23','1.png','450.00',false,now()),
 (24,3,1,'P1024','Quilling Toy 24','Quilling Toy 24','1.png','450.00',false,now()),
 (25,1,3,'P1025','Quilling Toy 25','Quilling Toy 25','1.png','250.00',false,now())
;

INSERT INTO customers (id,firstname,lastname,email,phone,password,created_on, enabled, subscribe)
VALUES
  (1,'Siva','K','pi-ls@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, true),
  (2,'Siva1','K','pi-ls-1@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (3,'Siva2','K','pi-ls-2@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (4,'Siva3','K','pi-ls-3@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (5,'Siva4','K','pi-ls-4@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (6,'Siva5','K','pi-ls-5@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (7,'Siva6','K','pi-ls-6@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (8,'Siva7','K','pi-ls-7@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (9,'Siva8','K','pi-ls-8@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (10,'Siva9','K','pi-ls-9@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false),
  (11,'Siva10','K','pi-ls-10@mail.ru','999999999','$2a$10$dYp/P1HXW181/0/Eqwadt.4oeSz0R/20bVL0AKL06ZKFPTyLnMDNi',now(), true, false)
  ;

insert into addresses (id, address_line1, address_line2, city, state, zip_code, country) values
(1, 'Hitech City', 'Cyberabad', 'Hyderabad', 'TS', '500088', 'IN');

insert into payments (id, cc_number, cvv, amount) values
(1, '1111111111111111', '123', 430.00);

insert into orders (id, order_number, cust_id, billing_addr_id, delivery_addr_id, payment_id, status, created_on) values
(1, '14477374319271', 1, 1, 1, 1, 'NEW', now()),
(2, '14477374319272', 1, 1, 1, 1, 'NEW', now()),
(3, '14477374319273', 1, 1, 1, 1, 'NEW', now()),
(4, '14477374319274', 1, 1, 1, 1, 'COMPLETED', now()),
(5, '14477374319275', 1, 1, 1, 1, 'NEW', now()),
(6, '14477374319276', 1, 1, 1, 1, 'NEW', now()),
(7, '14477374319277', 1, 1, 1, 1, 'NEW', now()),
(8, '14477374319278', 1, 1, 1, 1, 'NEW', now()),
(9, '14477374319279', 1, 1, 1, 1, 'NEW', now()),
(10, '144773743192710', 1, 1, 1, 1, 'NEW', now()),
(11, '144773743192711', 1, 1, 1, 1, 'NEW', now())
;

insert into order_items (id, order_id, price, product_id, quantity) values
(1,1, 430.00, 1, 1);
insert into product_tag(product_id, tag_id) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,3)
;

insert into category_tag(category_id, tag_id) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,3)
;

insert into posts(id, content, created_on, description, img_title, title) values
(1, '<p><sub><em><strong>sdfsdfsdfswdfadsfsdaggdkgj;dflghjldfhgldfg<img alt="" src="https://localhost:9443/img/user6-128x128.jpg" style="float:right; height:128px; width:128px" />sdf</strong></em></sub></p>
<p><iframe align="middle" frameborder="0" height="360" scrolling="no" src="https://www.youtube.com/embed/8pBkz_MBx00" width="640" allowfullscreen></iframe></p>', now(), 'description2', 'cat-97.jpg', 'title'),
(2, '<p><sub><em><strong>sdfsdfsdfswdfadsfsdaggdkgj;dflghjldfhgldfg<img alt="" src="https://localhost:9443/img/user6-128x128.jpg" style="float:right; height:128px; width:128px" />sdf</strong></em></sub></p>
<p><iframe align="middle" frameborder="0" height="360" scrolling="no" src="https://www.youtube.com/embed/8pBkz_MBx00" width="640"></iframe></p>', now(), 'description3', 'Adopt-a-cat-or-kitten-from-RSPCA.jpg', 'titl3')
;


insert into sales(id, begin_date, end_date, name, promo_code) values
(1,now(),now() + INTERVAL '3 DAY','name sale 1', 'sale1')
;

insert into sale_products(id, discount_price, product_id, sale_id) values
(1,20,1,1),
(2,250,2,1),
(3,30,3,1),
(4,40,4,1),
(5,50,5,1),
(6,60,6,1)
;

ALTER SEQUENCE addresses_id_seq RESTART WITH 100;
ALTER SEQUENCE categories_id_seq RESTART WITH 100;
ALTER SEQUENCE customers_id_seq RESTART WITH 100;
ALTER SEQUENCE order_items_id_seq RESTART WITH 100;
ALTER SEQUENCE orders_id_seq RESTART WITH 100;
ALTER SEQUENCE payments_id_seq RESTART WITH 100;
ALTER SEQUENCE permissions_id_seq RESTART WITH 100;
ALTER SEQUENCE products_id_seq RESTART WITH 100;
ALTER SEQUENCE roles_id_seq RESTART WITH 100;
ALTER SEQUENCE tags_id_seq RESTART WITH 100;
ALTER SEQUENCE units_id_seq RESTART WITH 100;
ALTER SEQUENCE users_id_seq RESTART WITH 100;
ALTER SEQUENCE producers_id_seq RESTART WITH 100;
ALTER SEQUENCE posts_id_seq RESTART WITH 100;
ALTER SEQUENCE promotions_id_seq RESTART WITH 100;
ALTER SEQUENCE sales_id_seq RESTART WITH 100;
ALTER SEQUENCE sale_products_id_seq RESTART WITH 100;