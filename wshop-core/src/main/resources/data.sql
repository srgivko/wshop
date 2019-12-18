delete from  customer_product_wishlist;
delete from  role_permission;
delete from  user_role;
delete from  permissions;
delete from  roles;
delete from  users;
delete from  posts;
delete from  promotions;
delete from  rating;
delete from  product_image_urls;
delete from  subscribers;

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

-- CATEGORIES
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (15, '', false, null, 'Древесные материалы', null, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (16, '', false, null, 'Пиломатериалы', 15, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (17, '', false, null, 'Фанера, ДВП', 15, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (18, '', false, null, 'Лакокрасочные материалы', null, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (19, '', false, null, 'Грунтовки', 18, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (20, '', false, null, 'Краски', 18, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (21, '', false, null, 'Метизы и крепеж', null, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (22, '', false, null, 'Метрический крепеж', 21, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (23, '', false, null, 'Саморезы и дюбели', 21, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (24, '', false, null, 'Строительные смеси', null, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (25, '', false, null, 'Шпатлевка', 24, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (26, '', false, null, 'Штукатурка', 24, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (27, '', false, null, 'Электротовары', null, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (28, '', false, null, 'Кабели, провода', 27, '');
INSERT INTO public.categories (id, description, disabled, disp_order, name, parent_cat_id, image_url) VALUES (29, '', false, null, 'Расходные материалы', 27, '');
-- /CATEGORIES

-- UNITS
INSERT INTO public.units (id, name) VALUES (15, 'шт.');
INSERT INTO public.units (id, name) VALUES (16, 'уп.');
INSERT INTO public.units (id, name) VALUES (17, 'м.п.');
-- /UNITS

-- PRODUCERS
INSERT INTO public.producers (id, description, name) VALUES (15, 'ООО «Илмакс» – это один из ключевых производителей сухих строительных смесей Республики Беларусь. По объему продаж входит в тройку крупнейших производителей Республики Беларусь.', 'Ilmax');
INSERT INTO public.producers (id, description, name) VALUES (16, 'Сухие строительные смеси и материалы для отделки стен Ceresit. Проверенное качество для профессионалов!', 'Ceresit');
INSERT INTO public.producers (id, description, name) VALUES (17, 'В настоящее время ИООО «Кондор» является одним из лидеров по производству водно-дисперсионных ЛКМ в Республике Беларусь.', 'Condor');
INSERT INTO public.producers (id, description, name) VALUES (18, '«КНАУФ» - это комплексные решения, до мельчайших деталей продуманные, идеально гармоничные системы для строительства. Их отличительные признаки: инновационность, энергетическая эффективность, экономичность, надежность и красивый дизайн.', 'KNAUF');
INSERT INTO public.producers (id, description, name) VALUES (19, 'Самым крупным изготовителем лакокрасочной продукции в Польше и во многих державах центральной и восточной Европы считается компания «Sniezka»', 'Sniezka');
INSERT INTO public.producers (id, description, name) VALUES (20, 'В Беларуси продукция Caparol представлена с 1996 года, продвижением которой занимается широкая дилерская сеть торговых партнеров. ', 'Caparol');
INSERT INTO public.producers (id, description, name) VALUES (21, '"Тех Креп" является крупнейшим поставщиком метизной продукции в России. Осуществляются поставки крепежа на Украину, в Беларусь и Казахстан.', 'Tech-Krep');
INSERT INTO public.producers (id, description, name) VALUES (22, 'ЗАО «ЕКТ групп» — торговая компания, специализирующаяся на поставках высококачественного крепежа, ручного инструмента, строительного оборудования, садово-огородного инвентаря, а также электро-, бензо- и пневмоинструмента.', 'ЕКТ');
INSERT INTO public.producers (id, description, name) VALUES (23, 'ACRYL-PUTZ® is a well-established company on the Polish market that offers gypsum putty compounds for a variety of uses.', 'Acryl-Putz');
INSERT INTO public.producers (id, description, name) VALUES (24, 'Предприятие ОАО БЕЛГИПС - это единственный производитель в Республике Беларусь строительных материалов из гипса и  является лидером  на рынке строительных материалов как в Республике, так и за ее пределами.', 'BELGIPS');
INSERT INTO public.producers (id, description, name) VALUES (25, 'Lux (ООО "Тайфун", Республика Беларусь) Сухие строительные смеси торговой марки "LUX" производятся ПТ ООО "Тайфун". Предприятие создано в 1999 году. ', 'LUX');
-- /PRODUCERS

-- PRODUCTS
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (15, '2019-12-13 12:42:07.796000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок нестроганный применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Брусок 3-го сорта. Цена указана за штуку длиной 3 м. Производитель РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Использование бруска в строительстве очень распространено, учитывая его невысокую стоимость и экологичность.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Если за бруском из дерева правильно ухаживать, он может служить длительное время, сохраняя свои качества. Они во многом определяются исходным качеством сырья и технологией производства.</span></span></p>
', false, 'Брусок нестроганный 50х25х3000 мм. 3-й сорт. РБ.', 2.83, 'SKU001', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (16, '2019-12-13 12:43:51.997000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок нестроганный применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Брусок 3-го сорта. Цена указана за штуку длиной 3 м. Производитель РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Использование бруска в строительстве очень распространено, учитывая его невысокую стоимость и экологичность.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Если за бруском из дерева правильно ухаживать, он может служить длительное время, сохраняя свои качества. Они во многом определяются исходным качеством сырья и технологией производства.</span></span></p>
', false, 'Брусок нестроганный 50х30х3000 мм. 3-й сорт. РБ.', 3.22, 'SKU002', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (17, '2019-12-13 12:47:00.059000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок нестроганный применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Брусок 3-го сорта. Цена указана за штуку длиной 3 м. Производитель РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Использование бруска в строительстве очень распространено, учитывая его невысокую стоимость и экологичность.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Если за бруском из дерева правильно ухаживать, он может служить длительное время, сохраняя свои качества. Они во многом определяются исходным качеством сырья и технологией производства.</span></span></p>
', false, 'Брусок нестроганный 50х40х3000 мм. 3-й сорт. РБ.', 3.76, 'SKU003', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (18, '2019-12-13 12:49:00.222000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок нестроганный применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Брусок 3-го сорта. Цена указана за штуку длиной 3 м. Производитель РБ.</span></span></p>
', false, 'Брусок нестроганный 50х50х3000 мм. 3-й сорт. РБ.', 4.25, 'SKU004', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (51, '2019-12-13 13:57:24.455000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпилька резьбовая представляет собой металлический стержень, с нанесенной по всей длине резьбой. Используется целиком или нарезается на мерные заготовки. Имеет широкое применение в строительстве и ремонте. Изготовлена из стали и оцинкована.</span></span></p>
', false, 'Шпилька резьбовая оцинкованная М12 х 1000 мм.', 3.94, 'SKU037', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (52, '2019-12-13 13:58:17.178000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Гайка шестигранная используется в резьбовых соединениях. Изготовлена из углеродистой конструкционной стали и оцинкована.</span></span></p>
', false, 'Гайка М10 шестигранная.', 0.14, 'SKU038', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (19, '2019-12-13 12:53:26.176000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок нестроганный применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Брусок 3-го сорта. Цена указана за штуку длиной 3 м. Производитель РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Если за брусом из дерева правильно ухаживать, он может служить длительное время, сохраняя свои качества. Они во многом определяются исходным качеством сырья и технологией производства.</span></span></p>
', false, 'Брус нестроганный 100х50х3000 мм. 3-й сорт. РБ.', 6.57, 'SKU005', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (20, '2019-12-13 12:54:54.658000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок строганный из сосны или ели технической сушки применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Цена указана за штуку длиной 3 м. 1-й сорт. Производитель РБ.</span></span></p>
', false, 'Брусок строганный технической сушки 20х40х3000 мм. 1-й сорт. РБ.', 2.44, 'SKU006', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (21, '2019-12-13 12:55:53.916000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок строганный из сосны или ели технической сушки применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Цена указана за штуку длиной 3 м. 1-й сорт. Производитель РБ.</span></span></p>
', false, 'Брусок строганный технической сушки 30х40х3000 мм. 1-й сорт. РБ.', 3.25, 'SKU007', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (22, '2019-12-13 12:58:37.419000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Брусок строганный из сосны или ели технической сушки применяется при монтаже гипсокартонных систем вместо металлического профиля, в качестве обрешетки и т.д. К положительным свойствам бруска можно отнести его легкость, прочность, низкий коэффициент температурного расширения и удобство в работе. Цена указана за штуку длиной 3 м. 1-й сорт. Производитель РБ.</span></span></p>
', false, 'Брусок строганный технической сушки 30х50х3000 мм. 1-й сорт. РБ.', 4.18, 'SKU008', 16, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (23, '2019-12-13 13:05:06.737000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера березовая, нешлифованная. Сорт 4/4. Данный тип фанеры (ФК) применяется для внутренних работ, т.к. имеет начальный уровень водостойкости. Не содержит фенола. Размер листа 1,525 х 1,525 м. Толщина 8 мм. Производство РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Все сорта фанеры имеют только одно отличие &ndash; это их внешний вид. Физические и механические свойства высшего сорта ничем не отличаются от низшего.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера сорта 4/4 не подвергается шлифованию, на ее поверхности могут присутствовать сучки и червоточины в неограниченном количестве. Также возможны незначительные дефекты кромок.</span></span></p>
', false, 'Фанера. Толщина 8 мм. 1,525м х 1,525м. Водостойкая. ФК. Республика Беларусь.', 21.30, 'SKU009', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (24, '2019-12-13 13:06:22.112000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера березовая, нешлифованная. Сорт 4/4. Данный тип фанеры (ФК) применяется для внутренних работ, т.к. имеет начальный уровень водостойкости. Не содержит фенола. Размер листа 1,525 х 1,525 м. Толщина 10 мм. Производство РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Все сорта фанеры имеют только одно отличие &ndash; это их внешний вид. Физические и механические свойства высшего сорта ничем не отличаются от низшего.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера сорта 4/4 не подвергается шлифованию, на ее поверхности могут присутствовать сучки и червоточины в неограниченном количестве. Также возможны незначительные дефекты кромок.</span></span></p>
', false, 'Фанера. Толщина 10 мм. 1,525м х 1,525м. Водостойкая. ФК. Республика Беларусь.', 25.17, 'SKU010', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (25, '2019-12-13 13:07:28.116000', '<p style="text-align:left"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="background-color:#ffffff">Фанера березовая, нешлифованная. Сорт 4/4. Данный тип фанеры (ФК) применяется для внутренних работ, т.к. имеет начальный уровень водостойкости. Не содержит фенола. Размер листа 1,525 х 1,525 м. Толщина 12 мм. Производство РБ.</span></span></span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Все сорта фанеры имеют только одно отличие &ndash; это их внешний вид. Физические и механические свойства высшего сорта ничем не отличаются от низшего.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера сорта 4/4 не подвергается шлифованию, на ее поверхности могут присутствовать сучки и червоточины в неограниченном количестве. Также возможны незначительные дефекты кромок.</span></span></p>
', false, 'Фанера. Толщина 12 мм. 1,525м х 1,525м. Водостойкая. ФК. Республика Беларусь.', 23.32, 'SKU0011', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (26, '2019-12-13 13:08:47.796000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера березовая, нешлифованная. Сорт 4/4. Данный тип фанеры (ФК) применяется для внутренних работ, т.к. имеет начальный уровень водостойкости. Не содержит фенола. Размер листа 1,525 х 1,525 м. Толщина 15 мм. Производство РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Все сорта фанеры имеют только одно отличие &ndash; это их внешний вид. Физические и механические свойства высшего сорта ничем не отличаются от низшего.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера сорта 4/4 не подвергается шлифованию, на ее поверхности могут присутствовать сучки и червоточины в неограниченном количестве. Также возможны незначительные дефекты кромок.</span></span></p>
', false, 'Фанера. Толщина 15 мм. 1,525м х 1,525м. Водостойкая. ФК. Республика Беларусь.', 30.23, 'SKU012', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (27, '2019-12-13 13:09:56.453000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера из шпона ольхи/березы. Нешлифованная. Сорт 4/4. Данный тип фанеры (ФК) применяется для внутренних работ, т.к. имеет начальный уровень водостойкости. Не содержит фенола. Размер листа 1,525 х 1,525 м. Толщина 18 мм. Производство РБ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Все сорта фанеры имеют только одно отличие &ndash; это их внешний вид. Физические и механические свойства высшего сорта ничем не отличаются от низшего.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Фанера сорта 4/4 не подвергается шлифованию, на ее поверхности могут присутствовать сучки и червоточины в неограниченном количестве. Также возможны незначительные дефекты кромок.</span></span></p>
', false, 'Фанера. Толщина 18 мм. 1,525м х 1,525м. Водостойкая. ФК. Республика Беларусь.', 35.17, 'SKU013', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (28, '2019-12-13 13:11:36.930000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Древесно-волокнистые плита (ДВП). Размер 2,05х0,72м.Толщина 2,5 мм. Используется для облицовки каркасных перегородок, стен, потолков жилых зданий. Также можно использовать в качестве укрывочного материала для защиты плитки или паркета от повреждений. Производство РБ.</span></span></p>
', false, 'ДВП. Толщина 2,5мм. Размер 2,05х0,72м. РБ.', 3.80, 'SKU014', 17, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (29, '2019-12-13 13:14:37.700000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax 4120 предназначен для грунтования минеральных оснований: бетон; цементные, цементно-известковые, гипсовые штукатурки, кирпич и блоки из ячеистого бетона, гипсокартонные и гипсоволокнистые листы, цементные и гипсовые стяжки перед укладкой последующих покрытий: клеевых и ремонтных растворов, штукатурок, шпатлевок, красок, стяжек, самонивелирующихся растворов, а также для защиты от проникновения грибка и образования высолов. Применяется для наружных и внутренних работ. Концентрат 1:1.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Ilmax</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых и чистовых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">5 л/100 м&sup2;</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Плотность:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1000 кг/м&sup3;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">2...3 часа</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><br />
<span style="font-family:Times New Roman,serif"><span style="font-size:medium">Приготовление раствора</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax 4120 является концентратом. Перед приготовлением раствора грунт тщательно перемешивается и смешивается с водой в соотношении 1:1. Для приготовления использовать чистую воду (t=+10&hellip;+25&deg;C).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Условия применения</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Во время выполнения работ и высыхания ilmax 4120 поверхность следует предохранять от воздействия прямых солнечных лучей, атмосферных осадков и других неблагоприятных факторов окружающей среды. Температура окружающей среды и основания должна быть в диапазоне +5&hellip;+25&deg;С.</span></span></p>

<div id="gtx-trans" style="left:320px; position:absolute; top:100px">
<div class="gtx-trans-icon">&nbsp;</div>
</div>
', false, 'Грунтовка укрепляющая. ilmax 4120. Концентрат 1:1. РБ. 5л.', 13.90, 'SKU015', 19, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (30, '2019-12-13 13:18:27.006000', '<p style="text-align:left"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="background-color:#ffffff">ilmax 4120 предназначен для грунтования минеральных оснований: бетон; цементные, цементно-известковые, гипсовые штукатурки, кирпич и блоки из ячеистого бетона, гипсокартонные и гипсоволокнистые листы, цементные и гипсовые стяжки перед укладкой последующих покрытий: клеевых и ремонтных растворов, штукатурок, шпатлевок, красок, стяжек, самонивелирующихся растворов, а также для защиты от проникновения грибка и образования высолов. Применяется для наружных и внутренних работ. Концентрат 1:1.</span></span></span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Ilmax</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых и чистовых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">10 л/200 м&sup2;</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Плотность:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1000 кг/м&sup3;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">2...3 часа</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Приготовление раствора</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax 4120 является концентратом. Перед приготовлением раствора грунт тщательно перемешивается и смешивается с водой в соотношении 1:1. Для приготовления использовать чистую воду (t=+10&hellip;+25&deg;C).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Условия применения</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Во время выполнения работ и высыхания ilmax 4120 поверхность следует предохранять от воздействия прямых солнечных лучей, атмосферных осадков и других неблагоприятных факторов окружающей среды. Температура окружающей среды и основания должна быть в диапазоне +5&hellip;+25&deg;С.</span></span></p>
', false, 'Грунтовка укрепляющая. ilmax 4120. Концентрат 1:1. РБ. 10л.', 22.74, 'SKU016', 19, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (31, '2019-12-13 13:23:47.961000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Грунтовка Ceresit CT-17 желтая используется, в основном, для черновых работ. Обладает высокой проникающей способностью, повышает поверхностную прочность, снижает впитывающую способность основания, связывает остаточную пыль, предотвращает пересыхание растворных смесей в тонком слое, повышает адгезию материалов к основанию,повышает растекаемость нивелирующих смесей. В среднем, 5л укрывает 75 м. кв. в один слой. Концентрат 1:1.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Ceresit</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от 0,05 до 0,25 л/м&sup2;</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Плотность:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 1000 кг/м&sup3;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 4 часов</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><br />
&nbsp;</p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Водно-дисперсионная акриловая грунтовка для поверхностного усиления основания</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">поверхностно усиливает основание</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">уменьшает гигроскопичность основания</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">для внутренних и наружных работ</span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Область применения:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ceresit CT 17 ProfiGrunt применяется для поверхностного укрепления и пропитки пористых, непрочных и сильновпитывающих минеральных оснований (легкий бетон, штукатурка, гипсовые и кирпичные поверхности) внутри и снаружи зданий перед укладкой керамической плитки, приклеиванием теплоизоляционных плит, шпатлеванием, оштукатуриванием, окраской, устройством самонивелирующихся цементных покрытий на полах.</span></span></p>

<div id="gtx-trans" style="left:1596px; position:absolute; top:716px">
<div class="gtx-trans-icon">&nbsp;</div>
</div>
', false, 'Ceresit CT-17. РБ. Глубоко-проникающая (желтая). 5л.', 17.40, 'SKU017', 19, 16, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (32, '2019-12-13 13:25:00.120000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Грунтовка Ceresit CT-17 желтая используется, в основном, для черновых работ. Обладает высокой проникающей способностью, повышает поверхностную прочность, снижает впитывающую способность основания, связывает остаточную пыль, предотвращает пересыхание растворных смесей в тонком слое, повышает адгезию материалов к основанию,повышает растекаемость нивелирующих смесей. В один слой 10л укрывает в среднем 150 м. кв. Концентрат 1:1.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Ceresit</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от 0,05 до 0,25 л/м&sup2;</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Плотность:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 1000 кг/м&sup3;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 4 часов</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Водно-дисперсионная акриловая грунтовка для поверхностного усиления основания</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">поверхностно усиливает основание</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">уменьшает гигроскопичность основания</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">для внутренних и наружных работ</span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Область применения:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ceresit CT 17 ProfiGrunt применяется для поверхностного укрепления и пропитки пористых, непрочных и сильновпитывающих минеральных оснований (легкий бетон, штукатурка, гипсовые и кирпичные поверхности) внутри и снаружи зданий перед укладкой керамической плитки, приклеиванием теплоизоляционных плит, шпатлеванием, оштукатуриванием, окраской, устройством самонивелирующихся цементных покрытий на полах.</span></span></p>
', false, 'Ceresit CT-17. РБ. Глубоко-проникающая (желтая). 10л.', 27.84, 'SKU018', 19, 16, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (33, '2019-12-13 13:30:55.420000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Грунтовка Condor предназначена для обработки впитывающих оснований перед креплением керамических и каменных плиток, нанесением штукатурок, шпатлевок, самовыравнивающихся смесей для пола и т.д. При внутренних и наружных работах. Концентрат. Белого цвета. Средний расход: 2л - на 20 м.кв. Цена за канистру.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Condor</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых и чистовых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">от 0,03 до 0,1 кг/м&sup2;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Основания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">штукатурка</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +30 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 12 часов</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Назначение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Для грунтования пористых минеральных и деревянных поверхностей под покраску, оклейку обоями, облицовку керамической плиткой, под нанесение декоративной штукатурки, для наружных и внутренних работ.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Разбавление:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Для грунтования нормально впитывающих поверхностей разбавить чистой холодной водой в соотношении 1:3, для слабо впитывающих (гипсокартон, древесина) &ndash; 1:2.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Нанесение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Наносить кистью, валиком или распылителем при температуре основания и окружающего воздуха не ниже + 5&ordm;С и не выше + 30&ordm;С. Не допускается производить работы во время дождя, тумана, измороси! Проблемные (осыпающиеся) поверхности грунтовать дважды с интервалом не менее чем 6 ч.</span></span></p>
', false, 'Грунтовка Condor. Белая. РБ. 2л.', 9.26, 'SKU019', 19, 17, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (34, '2019-12-13 13:32:14.128000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Грунтовка Condor предназначена для обработки впитывающих оснований перед креплением керамических и каменных плиток, нанесением штукатурок, шпатлевок, самовыравнивающихся смесей для пола и т.д. При внутренних и наружных работах. Концентрат. Белого цвета. Средний расход: 5л - на 150 м.кв. Цена за канистру.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Condor</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">для черновых и чистовых работ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Применение</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">внутри и снаружи помещений</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">от 0,03 до 0,1 кг/м&sup2;</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Основания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">штукатурка</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +30 &deg;C</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Время высыхания:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">около 12 часов</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Глубоко проникает и закрепляет осыпающиеся поверхности.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Снижает впитывающую способность окрашиваемых оснований, увеличивает адгезию (сцепляемость) последующего слоя краски с основанием и уменьшает ее расход.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Не содержит органических растворителей.</span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Разбавление:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Для грунтования нормально впитывающих поверхностей разбавить чистой холодной водой в соотношении 1:3, для слабо впитывающих (гипсокартон, древесина) &ndash; 1:2.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Нанесение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Наносить кистью, валиком или распылителем при температуре основания и окружающего воздуха не ниже + 5&ordm;С и не выше + 30&ordm;С. Не допускается производить работы во время дождя, тумана, измороси! Проблемные (осыпающиеся) поверхности грунтовать дважды с интервалом не менее чем 6 ч.</span></span></p>
', false, 'Грунтовка Condor. Белая. РБ. 5л.', 21.16, 'SKU020', 19, 17, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (35, '2019-12-13 13:35:27.656000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Предназначена для обработки основания в целях укрепления поверхности, снижения ее впитываемости и улучшения адгезии финишного покрытия (шпаклевки, краски, обои, облицовочной плитки и т.п.).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применяется для обработки:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсокартонных и гипосволокнистых листов;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых и цементных штукатурок;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых пазогребневых плит;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">стыков ГКЛ, ГКЛВ со снятой фаской перед их заделкой гипсовыми шпаклевками;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых и цементных стяжек.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Подходит для внутренних и наружных работ.</span></span></p>
	</li>
</ul>
', false, 'Грунтовка глубокого проникновения KNAUF TIEFENGRUND. 5 кг.', 19.16, 'SKU021', 19, 18, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (36, '2019-12-13 13:36:37.913000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Предназначена для обработки основания в целях укрепления поверхности, снижения ее впитываемости и улучшения адгезии финишного покрытия (шпаклевки, краски, обои, облицовочной плитки и т.п.).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применяется для обработки:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсокартонных и гипосволокнистых листов;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых и цементных штукатурок;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых пазогребневых плит;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">стыков ГКЛ, ГКЛВ со снятой фаской перед их заделкой гипсовыми шпаклевками;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовых и цементных стяжек.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Подходит для внутренних и наружных работ.</span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Технические характеристики</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход: 0,1 кг/м2;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">время высыхания: 3 часа;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">цвет: белый;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">морозостойкость (опционально): 5 циклов;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">упаковка: ведро с герметичной крышкой (без запайки пленкой) 10 кг;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">срок хранения: 12 мес. в неповрежденной упаковке.</span></span></p>
	</li>
</ul>
', false, 'Грунтовка глубокого проникновения KNAUF TIEFENGRUND. 10 кг.', 22.32, 'SKU022', 19, 18, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (37, '2019-12-13 13:39:04.725000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">SNIEZKA EKO &mdash; это одна из самых популярных акриловых красок. Образует матовое покрытие. Предназначена для покраски стен и потолков из цементных, известково-цементных, гипсовых и гипсокартонных оснований. Применяется внутри жилых, общественных и промышленных помещений. Не моющаяся. Средний расход: 1л - 10 м.кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Sniezka</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">акриловая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">до 13 м&sup2;/л на один слой</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">1 л</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Sniezka EKO предназначена для декоративно-защитной покраски стен и потолков из цементных, известково-цементных, гипсовых, гипсокартонных, деревянных и древесных материалов внутри жилых, общественных, промышленных и инвентарских помещений.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Срок гарантии 12 месяцев с даты выпуска.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производство Sniezka-ПОЛЬША.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура при нанесении - от +5 &deg;С до+25 &deg;С.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Не допускать замерзания!</span></span></p>

<div id="gtx-trans" style="left:1593px; position:absolute; top:486px">
<div class="gtx-trans-icon">&nbsp;</div>
</div>
', false, 'Sniezka EKO. Польша. 1 литр.', 15.00, 'SKU023', 20, 19, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (38, '2019-12-13 13:39:59.470000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">NIEZKA EKO &mdash; это одна из самых популярных акриловых красок. Образует матовое покрытие. Предназначена для покраски стен и потолков из цементных, известково-цементных, гипсовых и гипсокартонных оснований. Применяется внутри жилых, общественных и промышленных помещений. Не моющаяся. Средний расход: 3л - 30 м.кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Sniezka</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">акриловая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">до 13 м&sup2;/л на один слой</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">3 л</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Sniezka EKO предназначена для декоративно-защитной покраски стен и потолков из цементных, известково-цементных, гипсовых, гипсокартонных, деревянных и древесных материалов внутри жилых, общественных, промышленных и инвентарских помещений.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Срок гарантии 12 месяцев с даты выпуска.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производство Sniezka-ПОЛЬША.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура при нанесении - от +5 &deg;С до+25 &deg;С.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Не допускать замерзания!</span></span></p>
', false, 'Sniezka EKO. Польша. 3 литра.', 13.85, 'SKU024', 20, 19, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (53, '2019-12-13 14:01:11.329000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Данный саморез предназначен для крепления металлических профилей между собой. В пачке 400 шт. Цена за пачку.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Саморез</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">9,5 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Назначение:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">профиль к профилю</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр резьбы:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">3,5мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Саморез 3.5*9,5. Острый. РФ. 400 ШТ.', 6.73, 'SKU039', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (39, '2019-12-13 13:41:09.301000', '<p style="text-align:left"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="background-color:#ffffff">SNIEZKA MAX - это качественная латексная краска. Отличается сильной кроющей способностью и белизной покрытия. Образует матовое покрытие. Эта краска моющаяся, т.е. не боится влажной уборки. Предназначена для покраски известково-цементных и гипсовых штукатурок, бетонных и гипсокартонных основ внутри помещений. Средний расход: 1л - 10 м. кв. в один слой.</span></span></span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Condor</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">водно-дисперсионная</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">до 12 м&sup2;/л при однослойном нанесении</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">10 л</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Краска &laquo;Sniezka Max White latex Teflon&raquo; предназначена для декоративной покраски стен и потолков во влажных помещениях. Внутри помещений из цементных , цементно-известковых, известковых, гипсовых растворов, гипсокартонных плит, деревянных или древесностружечных плит, а также обоев, в том числе из стекловолокна,кирпича, камня и гипсокартонных плит внутри помещений.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дает эстетические матовые пористые покрытия, стойкие к смыванию и полностью паро- и газопроницаемые, что позволяет стенам &laquo;дышать&raquo;.</span></span></p>
', false, 'Sniezka MAX. Польша. 1 литр. ', 8.65, 'SKU025', 20, 19, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (40, '2019-12-13 13:42:26.142000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">SNIEZKA MAX - это качественная латексная краска. Отличается сильной кроющей способностью и белизной покрытия. Образует матовое покрытие. Эта краска моющаяся, т.е. не боится влажной уборки. Предназначена для покраски известково-цементных и гипсовых штукатурок, бетонных и гипсокартонных основ внутри помещений. Средний расход: 5л - 50 м. кв. в один слой.</span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Краска&nbsp;&laquo;Sniezka Max White latex Teflon&raquo;&nbsp;предназначена для декоративной покраски стен и потолков во влажных помещениях. Внутри помещений из цементных , цементно-известковых, известковых, гипсовых растворов, гипсокартонных плит, деревянных или древесностружечных плит, а также обоев, в том числе из стекловолокна,кирпича, камня и гипсокартонных плит внутри помещений.</span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дает эстетические матовые пористые покрытия, стойкие к смыванию и полностью паро- и газопроницаемые, что позволяет стенам &laquo;дышать&raquo;.</span></span></span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства</span></span><span style="font-family:Times New Roman,serif"><span style="font-size:medium">&nbsp;&laquo;Sniezka Max White latex Teflon&raquo;:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">прочность на смывание</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">высока укрываемость</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">обеспечивает дыхание стен</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">экономичная</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">белоснежная</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">матовая</span></span></span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Состав:</span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Стирено-акриловая смола, вода, пигменты и наполнители, вспомогательные вещества.</span></span></span></span></p>
', false, 'Sniezka MAX. Польша. 5 литров.', 37.58, 'SKU026', 20, 19, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (41, '2019-12-13 13:43:25.990000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Condor Raumweiss подходит для окраски стен и потолков внутри жилых и административных помещений с нормальной влажностью. Обладает повышенной укрывистостью. Поверхности под покраску: новые или ранее оштукатуренные, окрашенные водно-дисперсионными красками, зашпатлеванные из бетона, газобетона, кирпича, асбоцемента, гипсокартонных плит, ДСП.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Condor</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Назначение:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">интерьерная</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">акриловая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">8,6-10 м2/л на один слой</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Степень блеска:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">матовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Цвет:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">белая</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства:</span></span></p>

<ol>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Обладает повышенной укрывистостью.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Удобна в нанесении, легко раскатывается, не брызгает.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">После высыхания образует равномерное, совершенно матовое покрытие.</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Обладает хорошей устойчивостью к истиранию и выдерживает легкую влажную уборку.</span></span></p>
	</li>
</ol>
', false, 'Condor Raumweiss. Высокоукрывистая краска для внутренних работ. 15кг. РБ.', 49.42, 'SKU027', 20, 17, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (42, '2019-12-13 13:44:42.719000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Condor Ekofest &ndash; белая матовая водно-дисперсионная краска с высокой укрывистостью и адгезией к основанию. Применяется для окраски стен и потолков в помещениях, эксплуатируемых в условиях повышенной влажности, где в результате воздействия влаги возможно поражение поверхностей грибком или плесенью, а также помещений, нуждающихся в систематической интенсивной влажной уборке (ванные, кухни, столовые, бытовые помещения и т.д.). Рекомендована для окраски детских комнат, а также школьных и дошкольных учреждений. Средний расход &ndash; 11 м2/л. Производитель РБ.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Sniezka</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">акриловая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">до 14 м&sup2;/л на один слой</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-color:#000000; border-style:solid; width:296px">
			<p><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-color:#000000; border-style:solid; width:297px">
			<p><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">1 л</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Свойства:</span></span></span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Белая матовая водно-дисперсионная краска с высокой укрывистостью и адгезией к основанию.</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">После высыхания образует равномерное покрытие, устойчивое к воздействию влаги и многократному мытью.</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Содержит эффективный антисептик, который предотвращает появление грибка и плесени на окрашенной поверхности.</span></span></span></span></p>
	</li>
</ul>
', false, 'Condor Ekofest. Краска для кухни и ванной. РБ. 15кг.', 96.81, 'SKU028', 20, 17, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (54, '2019-12-13 14:02:23.510000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шуруп самонарезающий по металлу LN 3.5*11 Knauf предназначен для крепления металлических профилей или листовых деталей (толщина до 0,7 мм) друг с другом. Упаковка 1000 шт.</span></span></p>
', false, 'Саморез KNAUF LN 3.5*11. Острый. Упаковка 1000 штук.', 28.21, 'SKU040', 23, 18, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (55, '2019-12-13 14:03:18.836000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель 6*40. Нахлест. Используется для прижимного монтажа. В пачке 200 шт. Цена за пачку.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6*40 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр дюбеля:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6 мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Дюбель 6*40. РФ. Нахлест. Пачка 200 шт.', 6.61, 'SKU041', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (43, '2019-12-13 13:45:58.674000', '<p style="text-align:left"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="background-color:#ffffff">Caparol Samtex 7 E.L.F. &ndash; шелковисто-матовая латексная краска для внутренних поверхностей, подвергающихся большим нагрузкам. Для создания гладких, очень прочных, устойчивых к истиранию и хорошо сохраняющих структуру внутренних покрытий с шелковисто-матовой поверхностью. Устойчивая к истиранию и особо пригодна для поверхностей, которые подвергаются большим нагрузкам, хорошо моется. Тонкослойная и превосходно подходит для покрытия структурных, рельефных, тисненных обоев, стеклообоев, хорошо подчеркивает структуру шелковисто-матовым эффектом.,</span></span></span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Sniezka</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">латексная</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">около 130 мл/м&sup2; на один слой</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5 л</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><strong><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:large">Область применения:</span></span></span></strong></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">В школах, больницах, детских садах, в офисных зданиях, ресторанах, холлах и т.д.</span></span></span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><strong><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:large">Свойства:</span></span></span></strong></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Водоразбавляема, экологична, не имеет сильного запаха.<br />
Свободная от растворителей и без вредных выделений ( E.L.F.).<br />
Имеет высокую степень белизны.<br />
Хорошая укрывистость.<br />
Способна к диффузии.<br />
Устойчива к воздействию водных дезинфекционных и бытовых чистящих средств.<br />
Легка в применении.<br />
Износостойкая (2-й класс влажного истирания).</span></span></span></span></span></span></p>
', false, 'Caparol Samtex 7 E.L.F. В. 1. 5л. (Германия).', 98.00, 'SKU029', 20, 20, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (44, '2019-12-13 13:49:28.500000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">CapaSilan износостойкая минерально-матовая интерьерная краска без растворителей и минимальными эмиссиями с превосходными свойствами. Предназначена для нанесения с соблюдением установленных санитарных норм, а также в качестве ремонтного покрытия на акустических системах и штукатурках.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Caparol</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">интерьерная</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Основа:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">силиконовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">около 140 мл/м&sup2; на один слой</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Степень блеска:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">матовая</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Цвет:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">белая</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Объем:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">2,5 л</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><strong><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:large">Область применения:</span></span></span></strong><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">&nbsp;</span></span></span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Для больниц, домов престарелых, гостиниц, кафе/ресторанов, офисов, школ и детских садов, а также для жилищного строительства.</span></span></span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><strong><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:large">Свойства:</span></span></span></strong></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="font-family:Times New Roman,serif"><span style="font-size:medium"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">С минимальными эмиссиями, без растворителей.<br />
Без активных мелящихся и матирующих субстанций.<br />
Длительное время раскрытия &ndash; нанесение без видимых следов стыковки отдельных участков.<br />
Высокая паропроницаемость.<br />
Sd-значение &lt; 0,1 м.<br />
Оптимальная раскатка.<br />
Легко наносится.<br />
Водоразбавляемая.</span></span></span></span></span></span></p>
', false, 'Краска Caparol Capasilan E.L.F. B. 1. 2,5л (Германия). ', 64.96, 'SKU030', 20, 20, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (45, '2019-12-13 13:51:01.273000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпилька резьбовая представляет собой металлический стержень, с нанесенной по всей длине резьбой. Используется целиком или нарезается на мерные заготовки. Имеет широкое применение в строительстве и ремонте. Изготовлена из стали и оцинкована.</span></span></p>
', false, 'Шпилька резьбовая оцинкованная М8 х 1000 мм.', 1.97, 'SKU031', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (46, '2019-12-13 13:52:14.954000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпилька резьбовая представляет собой металлический стержень, с нанесенной по всей длине резьбой. Используется целиком или нарезается на мерные заготовки. Имеет широкое применение в строительстве и ремонте. Изготовлена из стали и оцинкована.</span></span></p>
', false, 'Шпилька резьбовая оцинкованная М8 х 2000 мм.', 3.67, 'SKU032', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (47, '2019-12-13 13:53:10.777000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпилька резьбовая представляет собой металлический стержень, с нанесенной по всей длине резьбой. Используется целиком или нарезается на мерные заготовки. Имеет широкое применение в строительстве и ремонте. Изготовлена из стали и оцинкована.</span></span></p>
', false, 'Шпилька резьбовая оцинкованная М10 х 2000 мм.', 4.87, 'SKU033', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (48, '2019-12-13 13:54:12.016000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Гайка шестигранная используется в резьбовых соединениях. Изготовлена из углеродистой конструкционной стали и оцинкована.</span></span></p>
', false, 'Гайка М8 шестигранная.', 0.12, 'SKU034', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (49, '2019-12-13 13:55:28.942000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Гайка шестигранная используется в резьбовых соединениях. Изготовлена из углеродистой конструкционной стали и оцинкована.</span></span></p>
', false, 'Гайка М12 шестигранная.', 0.16, 'SKU035', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (50, '2019-12-13 13:56:22.734000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Гайка шестигранная используется в резьбовых соединениях. Изготовлена из углеродистой конструкционной стали и оцинкована.</span></span></p>
', false, 'Гайка М14 шестигранная.', 0.28, 'SKU036', 22, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (56, '2019-12-13 14:04:29.809000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:large">Дюбель 6*60. Нахлест. Используется для прижимного монтажа. В пачке 200 шт. Цена за пачку.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6*60 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр дюбеля:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6 мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Дюбель 6*60. РФ. Нахлест. Пачка 200 шт.', 8.35, 'SKU042', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (57, '2019-12-13 14:06:48.040000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель-гвоздь 6*40 ЕКТ состоит из полипропиленового распорного дюбеля и оцинкованного гвоздя с винтовой нарезкой. Дюбель имеет предохранитель, препятствующий преждевременному распиранию при забивании гвоздя, а также обратную резьбу в хвостовой части, не позволяющую вывинчиваться дюбелю вместе с гвоздем. Стопорный бортик дюбеля предотвращает его проваливание в отверстие. Распорная часть дюбеля состоит из двух сегментов. На шляпке гвоздя крестовой шлиц, позволяющий осуществлять демонтаж или юстировку конструкции. В пачке 200 штук. Цена за пачку. Производитель РБ.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">ЕКТ</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">40 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр дюбеля:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6 мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Дюбель 6*40 ЕКТ. Нахлест. Пачка 200 штук. РБ.', 7.22, 'SKU043', 23, 22, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (58, '2019-12-13 14:07:54.181000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Предназначен для крепления металлических профилей между собой. В пачке 1000 шт. Цена за пачку.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Саморез</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">9,5 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Назначение:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсокартон к профилю</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр резьбы:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">3,5мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><br />
&nbsp;</p>
', false, 'Саморез 3.5*9,5. Со сверлом. РФ. 1000шт.', 13.18, 'SKU044', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (59, '2019-12-13 14:08:55.897000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Саморез 4.2*13. Прессшайба. 200 шт. С его помощью металлические профили крепятся между собой. За счет широкой шляпки, так называемой пресс-шайбы, работать с саморезом удобней и соединение становится надежней.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Саморез</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">13 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Назначение:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">профиль к профилю</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр резьбы:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">3,5мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Саморез 4.2*13. РФ. Прессшайба. Острый. 200 ШТ.', 4.96, 'SKU045', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (60, '2019-12-13 14:10:06.653000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель 6*40 металлический применяется для очень надежного крепления профилей к основаниям. В пачке 100 шт. Цена за пачку.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вид:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Дюбель</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Tech-Krep</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Длина:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6*40 мм</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Диаметр дюбеля:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">6 мм</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
', false, 'Дюбель 6*40 металлический. РФ. Пачка 100 штук.', 19.60, 'SKU046', 23, 21, 16);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (61, '2019-12-13 14:21:10.215000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax 6405 предназначена для стартового выравнивания шероховатостей, неровностей, заделки стыков гипсокартонных листов с использованием армирующей ленты, заполнения царапин, трещин, выбоин и других дефектов с целью получения ровной и гладкой поверхности стен и потолков. Используется по минеральным поверхностям из цементных, цементно-известковых и гипсовых штукатурок, бетона. Рекомендуется для внутренних работ в сухих помещениях с их последующей отделкой финишными шпатлевками или оклейкой обоями. Можно наносить в несколько слоев. Средний расход: мешок 15 кг - 15 м. кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">1,2 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Условия применения:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Во время выполнения работ и высыхания раствора поверхность следует предохранять от воздействия прямых солнечных лучей, атмосферных осадков и других неблагоприятных факторов окружающей среды. Температура окружающей среды и основания должна быть в диапазоне +5&hellip;+25&deg;С. Дальнейшие отделочные работы рекомендуется проводить не ранее чем через 2 суток.</span></span></p>
', false, 'Шпатлёвка стартовая ilmax 6405 15кг (РБ)', 8.40, 'SKU047', 25, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (62, '2019-12-13 14:23:01.139000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ilmax 6400 предназначена для финишного выравнивания шероховатостей, неровностей, заполнения царапин, трещин, выбоин и других дефектов с целью получения идеально ровной и гладкой поверхности. Используется по минеральным поверхностям из бетона, цементных и цементно-известковых штукатурок, влагостойкого гипсокартона. Рекомендуется для наружных и внутренних работ с их последующей отделкой.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Сухая смесь постепенно добавляется в воду (0,34&hellip;0,40 л воды на 1 кг сухой смеси) и тщательно размешивается миксером до получения однородной массы без комков. Для приготовления использовать чистую воду (t=+10&hellip;+25&deg;C). Через 5 минут раствор повторно перемешивается, после чего он готов к применению. Время использования раствора не более 2 часов.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Во время выполнения работ и высыхания раствора поверхность следует предохранять от воздействия прямых солнечных лучей, атмосферных осадков и других неблагоприятных факторов окружающей среды. Температура окружающей среды и основания должна быть в диапазоне +5&hellip;+25&deg;С. Дальнейшие отделочные работы рекомендуется проводить не ранее чем через 3 суток.</span></span></p>
', false, 'Шпатлевка цементная белая ilmax 6400. РБ. 20 кг.', 14.50, 'SKU048', 25, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (63, '2019-12-13 14:27:01.185000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ACRYL-PUTZ старт-финиш РБ 15 кг &ndash; белая шпатлёвка. Высыхает в течение короткого времени, легко шлифуется. Стены и потолки после применения шпатлёвочной массы получают гладкую, лёгкую для окрашивания поверхность. Шпатлёвка применяется, в основном, для отделочных и ремонтных работ внутри помещений. Особенно рекомендуется для шпатлевания гипсокартонных плит с армировочной лентой, нивелирования неровностей и трещин на поверхности штукатурок. Благодаря новой формуле может применяться как финишная шпатлёвка. Расход: мешок 15 кг - 15 м. кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Acryl-Putz</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">около 1 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Цена на пакет смеси примерно такая же, как и отдельно на стартовый или финишный раствор. При этом можно сэкономить примерно 50% от цены материала за счет того, что выравнивание производится в один слой вместо двух.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основные преимущества для проведения ремонта при помощи этой шпатлевки в следующем:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">совсем не сложный в нанесении раствор;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">возможность работать в один слой, что экономит ресурсы;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">можно не дожидаться высыхания, а работать мокрым по мокрому;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">рецептура отделочного материала позволяет заделывать выемки и трещинки до 3 см;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">используется и профессионалами, и новичками.</span></span></p>
	</li>
</ul>
', false, 'ACRYL-PUTZ ST15 Plus. Старт-финиш. РБ. 15 кг.', 10.93, 'SKU049', 25, 23, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (64, '2019-12-13 14:28:10.905000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">ACRYL-PUTZ старт-финиш РП 20 кг &ndash; отличается от указанной выше ACRYL-PUTZ РБ более высокими показателями адгезии, сцепления с поверхностью и твердостью после высыхания. Также она больше подходит при необходимости последующей окраски поверхности. Расход: мешок 20 кг - 20 м. кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Acryl-Putz</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">около 1 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Материал позволяет устранить все недостатки обрабатываемых стен и потолка. Перечислим свойства данного вида продукции:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">быстрое высыхание;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">образование гладкой поверхности;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">безупречная адгезия;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">отсутствие признаков усадки в период эксплуатации.</span></span></p>
	</li>
</ul>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Готовый слой шпатлёвки легко шлифуется и не трескается даже в том случае, если он достаточно толстый. Продукция может применяться перед оклейкой стен обоями.</span></span></p>
', false, 'ACRYL-PUTZ ST10. Старт-финиш. Польша. 20 кг.', 15.87, 'SKU050', 25, 23, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (65, '2019-12-13 14:29:56.001000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка &laquo;Тайфун Мастер&raquo; №33 применяется для окончательного выравнивания поверхностей внутри помещений выполненных из гипсокартонных (ГКП) и гипсоволокнистых (ГВП) плит, а также гипсовых, известково-цементных, цементных штукатурок и бетона. Состав может применяться для заделки выбоин, сколов на поверхности, для заполнения швов в стыках ГКП и ГВП. Средний расход: мешок 15 кг - 15 м. кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Тайфун Мастер</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">около 1 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Коэффициент паропроницаемости:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">не менее 0,03 мг/м&middot;ч&middot;Па</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Способ приготовления:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">В предварительно подготовленную ёмкость налить чистую воду и засыпать сухую смесь &laquo;Тайфун Мастер&raquo; №33 в ориентировочной пропорции 15кг состава на 6,5 - 7,5 литра воды. Применение каких-либо добавок не допускается. Вымешивать состав до однородной массы мешалкой корзиночного типа (миксером). По истечении 5 минут повторно перемешать. Полученный состав сохраняет свои свойства в течение 60 минут.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Нанесение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка наносится на поверхность основания слоем толщиной 0,2-3,0 мм при помощи металлического шпателя. После высыхания Поверхность необходимо обработать мелкозернистой наждачной бумагой.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ориентировочный расход сухой смеси составляет прим. 0,9-1,1 кг/м2. Фактический расход зависит от характера поверхности и опыта рабочего.</span></span></p>
', false, 'Шпатлевка Тайфун-Мастер 33. РБ, 15 кг.', 11.02, 'SKU051', 25, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (66, '2019-12-13 14:31:49.787000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка Ceresit CT 29 - полимерминеральная сухая шпатлёвочная масса для ремонта, выравнивания и оштукатуривания цементно-известковых, бетонных, цементно-песчаных, кирпичных оснований. Применяется для стен и потолков при проведении внутренних и наружных работ. Так же может применяться при устройстве систем утепления с применением пенополистирольных или минераловатных плит; для заполнения выбоин, трещин, локальных участков отвалившейся штукатурки, а так же нанесения штукатурного слоя толщиной слоя от 2 до 20 мм за 1 проход</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ceresit</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">цементно-полимерная</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">снаружи помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">1,8 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Вес:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">25 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основные свойства CT 29:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка обладает высокой адгезией к минеральным основаниям.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Состав армируется микроволокнами.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка Ceresit ct 29 паропроницаема, пластична и удобна в работе.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Одинаково хорошо подходит для наружных и внутренних работ.</span></span></p>
', false, 'Ceresit CT-29. Шпатлёвка полиминеральная цементная. 25 кг, РБ.', 12.62, 'SKU052', 25, 16, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (86, '2019-12-13 15:03:22.741000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Коробка установочная для гипсокартона 400В IP20. Глубина 47 мм, ширина 68 мм. Синий или черный цвет. Предназначена для установки розеток, выключателей и других электроустановочных изделий во время проведения отделочных работ. Данная коробка предназначена для установки в гипсокартонные конструкции. Производство РФ.</span></span></p>
', false, 'Коробка монтажная (для гипсокартона) с шурупами. РФ.', 0.49, 'SKU072', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (67, '2019-12-13 14:33:22.784000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка для внутренних работ Ceresit CT-126, РБ. 20 кг. По своим качествам очень похожа на Акрил-Путц польского производства, т.е. по сути является нашим аналогом польского товара. Средний расход: мешок 20 кг - 20 м. кв. в один слой.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ceresit</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">1,0-1,1 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +35 &deg;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Коэффициент паропроницаемости:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">не менее 0,03 мг/м&middot;ч&middot;Па</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шпатлёвка Ceresit CT 126 предназначена для высококачественной подготовки бетонных, цементно-известковых, цементно-песчаных, кирпичных, гипсовых и др. оснований под отделку. Толщина слоя за одно нанесение до 10 мм. После высыхания поверхности Ceresit CT 126 может быть окрашена или оклеена обоями. Нельзя применять для ремонта полов и в помещениях с повышенной влажно- стью. Для заполнения больших трещин, отверстий, крепления электропроводки, шпатлевания глубоких швов, подготовки оснований под облицовку необходимо использовать полимерминеральную шпатлевку Ceresit CT 29 или быстротвердеющую смесь Ceresit CХ 5.</span></span></p>
', false, 'Ceresit CT-126, РБ. Шпатлёвка гипсовая. 20 кг.', 14.80, 'SKU053', 25, 16, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (68, '2019-12-13 14:35:13.834000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Используется внутри помещений для поверхностного шпаклевания гипсокартонных и гипсоволокистых листов, пазогребневых плит, гипсовых и цементных штукатурок, бетонных поверхностей слоем от 0,2 до 5 мм.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Производитель:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Knauf</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Основа</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">гипсовая</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение: </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">внутри помещений</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">около 1 кг/м&sup2; на 1 мм толщины слоя</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Температура применения:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5&hellip;+25&deg;С &deg;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Коэффициент паропроницаемости:</span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">не менее 0,03 мг/м&middot;ч&middot;Па</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Технические характеристики:</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расход: 1 кг/м2;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Толщина слоя: минимальная 0,2 мм, максимальная: 5 мм;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Прочность: на сжатие: не менее 2,0 МПа, на изгиб: не менее 1,0 МПа;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">размер зерна: 0,15 мм;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">упаковка: бумажный мешок 25 кг;</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">срок хранения 6 месяцев в неповрежденной упаковке.</span></span></p>
	</li>
</ul>
', false, 'Шпаклевка гипсовая КНАУФ Ротбанд Финиш. 25кг. РФ.', 18.14, 'SKU054', 25, 18, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (69, '2019-12-13 14:38:08.793000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Растворная смесь сухая штукатурная для выполнения внутренних работ с толщиной наносимого покрытия более 5 мм на цементно-известковом вяжущем, марки по прочности М25, мар&shy;ки по консистенции К1, группы по сохраняемости подвижности St-4, 223/30 СТБ 1307-2012 РСС, штукатурная В (более 5 мм), цементно-известковая</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Красносельскстройматериалы</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">цементная</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1,6-2,0 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +30 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">25 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Область применения:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Смесь предназначена для выравнивания стен из бетона, ячеистого бето&shy;на, кирпича под последующую отделку шпатлевкой или оклейку обоями. Может применяться как на больших поверхностях, так и для местного ремонта. Подходит для поверхностей с небольшой прочностью, может использоваться для выполнения работ, как во влажных, так и в сухих помещениях.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Внимание! Растворная штукатурная смесь не предназначена для использования на гипсовых поверхностях, а также для предохранения каменных и кирпичных кладок от увлажнения грунтовыми водами.</span></span></p>
', false, 'Цементная штукатурка Ёжик 25 кг 223/06 (РБ) для внутренних работ', 4.32, 'SKU055', 26, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (70, '2019-12-13 14:39:10.093000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Цементная штукатурка Ceresit предназначена для ремонта и выравнивания цементно-известковых, цементно-песчаных, бетонных и кирпичных оснований, на стенах и потолках, внутри и снаружи зданий. Цементная штукатурка Ceresit применяется для заполнения выбоин, трещин, участков отвалившейся штукатурки, а также для выравнивания поверхностей и нанесения штукатурных покрытий при толщине слоя 5-20 мм за один проход. Средний расход: при слое 1 см мешок 25 кг - 1 м.кв.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Ceresit</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">цементная</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри и снаружи помещений</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1,5 - 1,8 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">25 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Смесь для ремонта, оштукатуривания и выравнивания минеральных оснований.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Свойства</span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">пластична и удобна в работе</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">армирована микроволокнами</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">паропроницаемая</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">морозостойкая</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">для внутренних и наружных работ</span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">для ручного и механизированного нанесения</span></span></p>
	</li>
</ul>
', false, 'Штукатурка цементная Ceresit 25кг (РБ)', 5.85, 'SKU056', 26, 16, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (83, '2019-12-13 15:00:05.471000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод многожильный ПВС 3х6 предназначен для соединения бытового оборудования (нестационарное присоединение) к электросети. Примеры использования: используют как провод для удлинителя (при производстве удлинителей или удлинительных шнуров), присоединение к электросети холодильников, садовых машин.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод гибкий ПВС конструктивно состоит из жил, состоящих из скрученной медной проволоки, покрытых изоляцией из ПВХ пластиката. Жилы соединяются и защищаются от внешних повреждений общей оболочкой ПВХ.</span></span></p>
', false, 'Провод ПВС 3х6,0. Цена за м.п.', 4.52, 'SKU069', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (71, '2019-12-13 14:40:30.999000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Штукатурка лёгкая цементная ilmax paromax применяется для оштукатуривания минеральных поверхностей: кирпичной кладки, бетонных оснований, цементных и цементно-известковых штукатурок, блоков из ячеистого бетона и других минеральных оснований. Отлично подходит для лёгких бетонов, паропроницаема, содержит микроволокна для повышения стойкости к образованию трещин. Мешок 20 кг. Производитель РБ.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">ilmax</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">цементная</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри и снаружи помещений</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1,1 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-30 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">20 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Растворная смесь сухая, штукатурная, для выполнения наружных и внутренних работ, с толщиной наносимого покрытия более 5 мм, на цементном вяжущем, средняя плотность 1100 кг/м3, марки по прочности М50, марки по морозостойкости F50, марки по подвижности Пк2, группы по сохраняемости подвижности St-4: РСС, штукатурная НВ (более 5 мм), цементная, 1100, М50, F50, Пк2, St-4 &quot;ilmax paromax штукатурка легкая&quot; СТБ 1307-2012.</span></span></p>
', false, 'Штукатурка цементная лёгкая ilmax paromax. 20 кг. РБ.', 10.00, 'SKU057', 26, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (72, '2019-12-13 14:41:49.002000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Штукатурка цементно-известковая ilmax thermo теплая стена применяется для оштукатуривания газосиликатных и керамзитобетонных блоков, кладки из кирпича, цементных и цементно-известковых штукатурок, бетонных оснований. Для внутренних и наружных работ. После дополнительной обработки финишного слоя имеет готовый декоративный вид - фактура &quot;камешковая&quot;. Можно наносить в несколько слоев. Белого цвета. Производитель РБ.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">ilmax</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">цементно-известковая</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри и снаружи помещений</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">0,4 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">3-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">12 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Растворная смесь сухая штукатурная, для выполнения наружных и внутренних работ, с толщиной наносимого покрытия более 5 мм, на смешанных вяжущих, марки по прочности М25, марки по морозостойкости F50, марки по подвижности Пк3, группы по сохраняемости подвижности St-4: РСС, штукатурная НВ (более 5 мм), цементно-известковая, М25, F50, Пк3, St-4 &quot;ilmax thermo теплая стена 3D&quot; СТБ 1307-2012.</span></span></p>
', false, 'Штукатурка цементно-известк. ilmax thermo теплая стена. Белая. 12 кг.', 34.20, 'SKU058', 26, 15, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (73, '2019-12-13 14:42:48.645000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Ротбанд - универсальная гипсовая сухая штукатурная смесь с добавками, обеспечивающими повышенную адгезию. Она предназначена для штукатурки вручную стен и потолков с любым типом поверхности (бетон, кирпич, пенополистирол и т.п.) внутри помещений с нормальной влажностью, включая кухни. Продукция Ротбанд высокого качества. В продаже Rotband - одна из наиболее популярных гипсовых штукатурок. Средний расход: при слое 1 см мешок 10 кг - 1 м.кв. Купить можно оптом и в розницу, цены указаны на сайте.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Knauf</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">гипсовая</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри помещений</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">0,85 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Толщина слоя:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">5-25 мм</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">10 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Описание:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Универсальная сухая штукатурная смесь на основе гипса с полимерными добавками, обеспечивающими повышенную адгезию.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Гипсовые сухие смеси могут быть различного цвета, от белого до серого и даже до розового. Это объясняется наличием природных примесей в гипсовом камне.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Цвет смеси никак не влияет на ее характеристики.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Применение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Предназначена для высококачественного оштукатуривания потолков и стен с обычным твердым основанием, например, таких как, бетон, кирпич, цементная штукатурка, а так же поверхностей из пенополистирола, ЦСП.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Особенно рекомендуется для гладких бетонных потолочных и стеновых поверхностей.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Можно использовать для отделки помещений с нормальной влажностью, а также в кухнях и ванных.</span></span></p>
', false, 'Штукатурка гипсовая Knauf Rotband 10кг (РФ)', 6.94, 'SKU059', 26, 18, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (74, '2019-12-13 14:45:06.530000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">BELGIPS PLASTER &ndash; легкая гипсовая штукатурка для ручного нанесения используемая под дальнейшую финишную отделку: перед финишным шпаклеванием, наклейкой обоев, облицовкой керамической плиткой и др. Эта штукатурка относится к экономичным базовым штукатуркам. Легкая в использовании, с меньшим расходом в сравнении с цементной штукатуркой. Используется для отделки помещений с нормальной влажностью, а также в кухнях и ванных комнатах с покрытием, обеспечивающим защиту от увлажнения. производитель РБ.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">БЕЛГИПС</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">гипсовая</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри помещений </span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">0,1 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">+5...+30 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">30 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><br />
&nbsp;</p>
', false, 'Штукатурка гипсовая BELGIPS PLASTER. РБ. 30 кг.', 10.53, 'SKU060', 26, 24, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (75, '2019-12-13 14:47:49.679000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Штукатурка Люкс Modern. РБ. 30 кг. Защитно-отделочная гипсовая штукатурка ручного нанесения предназначена для выравнивания и подготовки под последующую отделку поверхностей из кирпича, бетона, газосиликатных блоков с нормальным температурно-влажностным режимом эксплуатации.</span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">LUX</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">гипсовая</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри помещений </span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">30 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small"><strong>Расход:</strong></span></span></span><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">&nbsp;Ориентировочный расход сухой смеси на 1 мм толщины слоя составляет 1,0-1,2 кг/м</span></span></span><span style="color:#000000"><sup><span style="font-family:Times New Roman,serif"><span style="font-size:x-small">2</span></span></sup></span><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">. Фактический расход зависит от характера поверхности и опыта рабочего.</span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small"><strong>Инструмент:&nbsp;</strong></span></span></span><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">Пластмассовая ёмкость, миксер, кельма,&nbsp;терка, штукатурное правило, губчатая терка, шпатель.</span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small"><strong>Транспортирование и хранение:</strong></span></span></span><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">&nbsp;Способ транспортирования и хранения должен обеспечивать защиту штукатурного состава &quot; MODERN&quot; от атмосферных осадков и сохранность упаковки от механических повреждений.</span></span></span></span></p>

<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small"><strong>Требования безопасности:</strong></span></span></span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">к работам по приготовлению и применению состава не следует допускать лиц, имеющих заболевания кожных покровов, глаз и дыхательных путей;</span></span></span></span></p>
	</li>
	<li>
	<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:Times New Roman,serif"><span style="font-size:small">в процессе работы обязательно применять средства индивидуальной защиты органов дыхания, кожных покровов и глаз.</span></span></span></span></p>
	</li>
</ul>
', false, 'Штукатурка гипсовая LUX Modern 30кг (РБ) для ручного нанесения', 11.92, 'SKU061', 26, 25, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (76, '2019-12-13 14:48:55.141000', '<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Штукатурка гипсовая Тайфун-Мастер 20 применяется для оштукатуривания поверхностей в сухих помещениях (все помещения, кроме ванной и т. д.). Перед штукатурными работами поверхность должна быть очищена от пыли и иных загрязнений и загрунтована. Можно купить оптом, также осуществляется продажа в розницу. Средний расход: при слое 1 см мешок 30 кг - 3 м. кв.</span></span></span></span></p>

<table>
	<tbody>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Производитель:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">Тайфун Мастер</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Назначение:</span></span></span><span style="font-family:Times New Roman,serif"> </span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">гипсовая</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Применение:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">внутри помещений</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Расход:</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">1,0-1,2 кг/м&sup2; на 1 мм толщины слоя</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Температура применения:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">от +5 до +25 &ordm;C</span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">Толщина слоя:</span></span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="background-color:#ffffff"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small"><span style="background-color:#ffffff">5-20 мм</span></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:296px">
			<p style="text-align:left"><span style="color:#666666"><span style="font-family:PT Sans,serif"><span style="font-size:small">Вес:</span></span></span></p>
			</td>
			<td style="border-bottom:1px solid #000000; border-left:1px solid #000000; border-right:1px solid #000000; border-top:1px solid #000000; width:297px">
			<p style="text-align:left"><span style="color:#000000"><span style="font-family:PT Sans,serif"><span style="font-size:small">30 кг</span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Область применения:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Штукатурный состав &laquo;Тайфун Мастер&raquo; №20 (20 м.н.)применяется для выравни&shy;вания поверхностей потолков, стен и перегородок из различных мате&shy;риалов внутри помещений с нормальным температурно-влажностным режимом эксплуатации. Применение состава &laquo;Тайфун Мастер&raquo; №20 позволяет отказаться от шпатлевания поверхностей перед нанесением декоративных покрытий (обоев, декоративных штукатурок).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Нанесение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Состав наносится на подготовленное основание ручным или механизированным способом с последующим выравниванием правилом. Мелкие дефекты корректируются после начала схватывания (поверхность смачивается водой, затирается и заглаживается).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Транспортирование и хранение:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Штукатурный состав &laquo;Тайфун Мастер&raquo; №20 (20м.н.) должен транспортироваться и храниться в заводской упаковке, в сухих условиях.</span></span></p>
', false, 'Штукатурка гипсовая Тайфун-Мастер 20 30кг (РБ)', 13.06, 'SKU062', 26, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (77, '2019-12-13 14:52:23.225000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель ШВВП предназначен для изготовления шнуров удлинителей, присоединения приборов микроклимата и личной гигиены, электропаяльников, светильников, кухонных электромеханических приборов, радиоэлектронной аппаратуры, стиральных машин, холодильников и других подобных приборов (эксплуатируемых в жилых или административных помещениях) к электрическим сетям.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Шнуры марки ШВВП предназначены для присоединения приборов личной гигиены и микроклимата, электропаяльников, светильников, кухонных электромеханических приборов, радиоэлектронной аппаратуры, стиральных машин, холодильников и других подобных приборов, эксплуатируемых в жилых и административных помещениях. Также для изготовления шнуров удлинительных на напряжение до 380 В для систем 380/380 В. Шнур не распространяет горение.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Конструкция шввп 2х0.75:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">1. Шнур с медными многопроволочными параллельно уложенными жилами, с изоляцией из поливинилхлоридного пластиката;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">2. Разделительное основание обеспечивает разделение жил без повреждения изоляции и оголения жил;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">3. Поверхность изоляции жил имеет различный цвет: красный - черный.</span></span></p>
', false, 'Провод ШВВП 2х0,75. Цена за м.п.', 0.49, 'SKU063', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (84, '2019-12-13 15:01:01.504000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Центральная медная жила 1.0 мм, экран усиленный, состоит из двух слоёв фольги и медно-оловянной оплётки, коэффициент экранирования от 60 дБ. Оболочка проводника сделана из PEG-диэлектрика, наружная из ПВХ, диаметр кабеля 6,6 мм, кг. Может передавать все виды телесигналов &mdash; эфир, кабельное, цифровое и спутниковое.</span></span></p>
', false, 'Кабель телевизионный с центральной медной жилой. SAT90-CU. Цена за м.п.', 0.88, 'SKU070', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (78, '2019-12-13 14:53:57.640000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель КССПВ предназначается для станционной прокладки внутри зданий, станций, сооружений, в аппаратуре и эксплуатации в структурированных кабельных системах связи, в частотном диапазоне до 100 МГц при температуре от -30&deg;C до +60 &deg;C. Монтаж и прокладка могут осуществляться при температуре от -10&deg;C до +60&deg;C.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">У неэкранированной витой пары UTP отсутствует защитный экран вокруг отдельной пары. Также каждый кабель имеет свою категорию: </span></span></p>

<p style="text-align:left">&bull; <span style="font-family:Times New Roman,serif"><span style="font-size:medium">CAT5 - 4-х парный кабель, использовался при построении локальных сетей и для прокладки телефонных линий, поддерживает скорость до 100 Мбит/с при использовании 2 пар (полоса частот 100 МГц). </span></span></p>

<p style="text-align:left">&bull; <span style="font-family:Times New Roman,serif"><span style="font-size:medium">CAT5e - усовершенсвованный вид кабеля категории 5 (CAT5) состоит из 4-х пар. Скорость передачи данных состовляет до 100 Мбит/с при испольховании 2-х пар и до 1000 Мбит/с при использовании 4-х пар. Данная категория является самой распространённой и используется для построения компьютерных сетей (полоса частот 125 МГц)</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Конструкция кабеля КССПВ:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">- Токопроводящая жила представляет собой мягкую медную проволоку диаметром 0,52 мм;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">- Изоляция жилы выполнена из полиэтилена (ПЭ);</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">- Сердечник - изолированные жилы, скрученные в пары с определенными шагами скрутки. Пары скручены в сердечник;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">- Оболочка из поливинилхлоридного пластиката (ПВХ).</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Механические и электрические параметры:</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Растягивающее усилие при монтаже должно составлять не более 85Н;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Радиус изгиба - не менее 10-ти диаметров кабеля;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Электрическое сопротивление постоянному току токопроводящей жилы - не более 96 Ом/км;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Электрическое сопротивление изоляции - не более 150 МОм;</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Рабочая емкость при частоте от 0,8 до 1,0 кГц - не более 56 нФ/км.</span></span></p>
', false, 'Провод КССПВ 4х2х0,52. Цена за м.п.', 0.67, 'SKU064', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (79, '2019-12-13 14:54:52.025000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод ВВГнг 2х1,5. Цена за метр. Количество жил - 2. Сечение - 1,5 мм.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель ВВГнг (он же &mdash; силовой провод ВВГнг) &mdash; кабель с медными однопроволочными токопроводящими жилами, с изоляцией из ПВХ-пластиката, нераспространяющего горение. Применяется для передачи и распределения электроэнергии, что происходит на стационарных установках, которые имеют частоту электротока 50 Гц и номинальное напряжение до 660 или 1000В.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Сфера применения данного электропровода крайне обширна &mdash; он может размещаться в сухих и влажных помещениях, на большой высоте, в воде и так далее. Особенностью данного подвида кабеля является ещё и то, что он не распространяет горения.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расшифровка названия кабеля такова: &laquo;винил-винил-голый&raquo;. Первые два слова указывают на два слоя поливинилхлорида, что используются в качестве оболочки для одной или нескольких медных жил, входящих в состав кабеля, последнее слово обозначает отсутствие соответствующего защитного покроя. Ну а &laquo;нг&raquo; означает, что кабель, в случае возникновения пожароопасной ситуации, не будет распространять горение.</span></span></p>
', false, 'Провод ВВГнг 2х1,5 ГОСТ. Цена за м.п.', 0.79, 'SKU065', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (80, '2019-12-13 14:56:41.256000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод ВВГнг 3х2,5. Цена за метр. Количество жил - 3. Сечение - 2,5 мм.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель ВВГнг (он же &mdash; силовой провод ВВГнг) &mdash; кабель с медными однопроволочными токопроводящими жилами, с изоляцией из ПВХ-пластиката, нераспространяющего горение. Применяется для передачи и распределения электроэнергии, что происходит на стационарных установках, которые имеют частоту электротока 50 Гц и номинальное напряжение до 660 или 1000В.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Сфера применения данного электропровода крайне обширна &mdash; он может размещаться в сухих и влажных помещениях, на большой высоте, в воде и так далее. Особенностью данного подвида кабеля является ещё и то, что он не распространяет горения.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расшифровка названия кабеля такова: &laquo;винил-винил-голый&raquo;. Первые два слова указывают на два слоя поливинилхлорида, что используются в качестве оболочки для одной или нескольких медных жил, входящих в состав кабеля, последнее слово обозначает отсутствие соответствующего защитного покроя. Ну а &laquo;нг&raquo; означает, что кабель, в случае возникновения пожароопасной ситуации, не будет распространять горение.</span></span></p>
', false, 'Провод ВВГнг 3х2,5 ГОСТ. Цена за м.п.', 1.60, 'SKU066', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (81, '2019-12-13 14:57:46.435000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод ВВГ 3х1,5. Цена за метр. Количество жил - 3. Сечение - 1,5 мм.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель ВВГ (он же &mdash; силовой провод ВВГ) &mdash; кабель с медными однопроволочными токопроводящими жилами, с изоляцией из ПВХ-пластиката. Применяется для передачи и распределения электроэнергии, что происходит на стационарных установках, которые имеют частоту электротока 50 Гц и номинальное напряжение до 660 или 1000В.</span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Сфера применения данного электропровода крайне обширна &mdash; он может размещаться в сухих и влажных помещениях, на большой высоте, в воде и так далее. </span></span></p>

<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Расшифровка названия кабеля такова: &laquo;винил-винил-голый&raquo;. Первые два слова указывают на два слоя поливинилхлорида, что используются в качестве оболочки для одной или нескольких медных жил, входящих в состав кабеля, последнее слово обозначает отсутствие соответствующего защитного покроя. Ну а &laquo;нг&raquo; означает, что кабель, в случае возникновения пожароопасной ситуации, не будет распространять горение.</span></span></p>
', false, 'Провод ВВГ 3х1,5 ГОСТ. Цена за м.п.', 1.09, 'SKU067', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (82, '2019-12-13 14:58:52.743000', '<p><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Провод ВВГнг 3х6 состоит из трех медных токопроводящих жил круглой формы сечением 6 мм&sup2;. Изоляция жил выполнена из поливинилхлоридного пластиката (ПВХ). Оболочка кабеля выполнена из ПВХ пластиката пониженной горючести (нг). Медный кабель ВВГнг 3х6 используют для передачи и распределения электроэнергии в стационарных установках на номинальное переменное напряжение 660В и 1000В частоты 50Гц. Применяют кабель для прокладки в сухих и влажных производственных помещениях, на специальных кабельных эстакадах, в блоках, а также для прокладки на открытом воздухе.</span></span></p>
', false, 'Провод ВВГнг 3х6 ГОСТ. Цена за м.п.', 4.01, 'SKU068', 28, null, 17);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (85, '2019-12-13 15:02:30.269000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Коробка установочная, усиленная, для подштукатурного монтажа с шурупами 400В IP20. Глубина 40 мм, диаметр 60 мм. Температура плавления более 850 &deg;C. Предназначена для установки розеток, выключателей, а также других электроустановочных изделий во время отделочных работ. Поверхности в которые можно монтировать данную коробку: бетон, блок, кирпич, штукатурка. Производство РФ.</span></span></p>
', false, 'Коробка монтажная с шурупами. РФ.', 0.37, 'SKU071', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (87, '2019-12-13 15:04:07.082000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Изолента ПВХ применяется для изоляции проводов и других электротехнических элементов, строительных и хозяйственных нужд, бытовых целей, &quot;первой помощи&quot; сантехнике и других потребностей. Обладает способностью тянуться. Рулон: 19мм х 20м. Чёрного цвета.</span></span></p>
', false, 'Изолента ПВХ чёрная 19мм х 20м.', 1.97, 'SKU073', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (88, '2019-12-13 15:05:16.254000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Изолента ПВХ применяется для изоляции проводов и других электротехнических элементов, строительных и хозяйственных нужд, бытовых целей, &quot;первой помощи&quot; сантехнике и других потребностей. Обладает способностью тянуться. Рулон: 19мм х 20м. Белого цвета.</span></span></p>
', false, 'Изолента ПВХ белая 19мм х 20м.', 1.97, 'SKU074', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (89, '2019-12-13 15:06:12.482000', '<p><span style="font-family:Times New Roman,serif"><span style="font-size:medium">HPX52100 - профессиональная изоляционная лента для электроизоляции, укрепления, защиты и ремонта электрики. Лента отличается эластичностью и способностью восстанавливать форму после растяжения. Благодаря этому жгутированные провода плотнее упакованы и не смещаются при вибрации &ndash; устраняется риск повреждения проводки (пробои) с течением времени. Огнеупорная, не горит. Ширина 19 мм. В рулоне 20 м. Цвет черный. Производитель Бельгия.</span></span></p>
', false, 'Изоляционная лента HPX 52100 (VDE-стандарт) 19мм х 20м. Черная. Бельгия.', 6.19, 'SKU075', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (90, '2019-12-13 15:07:21.292000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель-канал предназначен для прокладки информационных, силовых и слаботочных электрических коммуникаций открытого типа в офисных и жилых помещениях, производственных и административных зданиях, медицинских учреждениях, при новом строительстве и при реконструкции.</span></span></p>
', false, 'Кабельный канал 25х16 (120) 220тм. Цена за штуку 2 метра.', 2.41, 'SKU076', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (91, '2019-12-13 15:08:16.366000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель-канал предназначен для прокладки информационных, силовых и слаботочных электрических коммуникаций открытого типа в офисных и жилых помещениях, производственных и административных зданиях, медицинских учреждениях, при новом строительстве и при реконструкции.</span></span></p>
', false, 'Кабельный канал 40х25 (60) 220тм. Цена за штуку 2 метра.', 3.60, 'SKU077', 29, null, 15);
INSERT INTO public.products (id, created_on, description, disabled, name, price, sku, cat_id, producer_id, unit_id) VALUES (92, '2019-12-13 15:09:25.203000', '<p style="text-align:left"><span style="font-family:Times New Roman,serif"><span style="font-size:medium">Кабель-канал предназначен для прокладки информационных, силовых и слаботочных электрических коммуникаций открытого типа в офисных и жилых помещениях, производственных и административных зданиях, медицинских учреждениях, при новом строительстве и при реконструкции.</span></span></p>
', false, 'Кабельный канал 15х10 (200) 220тм. Цена за штуку 2 метра.', 1.39, 'SKU078', 29, null, 15);
-- /PRODUCTS

-- PRODUCT_IMAGE_URLS
INSERT INTO product_image_urls (product_id, image_url) VALUES
(15,'pm/pr1/decf0fc3.jpeg'),
(15,'pm/f2e4a4bf25ec1048bb921553029e094c.jpeg'),
(15,'pm/pr2/62c4.jpeg'),
(16,'pm/pr2/62c4.jpeg'),
(17,'pm/f2e4a4bf25ec1048bb921553029e094c.jpeg'),
(18,'pm/pr4/1edfa29a895bddaff.jpeg'),
(51,'mk/pr7/1e42ffc4968ae47eb7ea8df2f34a5566.jpeg'),
(52,'mk/pr8/37b44c79725cded1a892092d65b93077.jpeg'),
(19,'pm/pr5/cd0f50b4abe5e8.jpeg'),
(20,'pm/pr6/8666f95c8e0f.jpeg'),
(21,'pm/pr7/edf28daa9a6292a0d.jpeg'),
(22,'pm/pr8/5f28deb2f3419b11d1d8f2dc2dae510c.jpeg'),
(23,'fd/pr1/fedab8659e9f5c1a0dcabcde240c3e4d.jpeg'),
(24,'fd/pr2/b39b5e89b6a8423d43cbe4b42318edf7.jpeg'),
(25,'fd/pr3/61204c4a8d81a486f28f2b4d243b5ecc.jpeg'),
(26,'fd/pr4/e977e8e1c52fa625042952e7d2f30f6b.jpeg'),
(27,'fd/pr5/da2ebbf4913749eda2bdf5ef17d43d24.jpeg'),
(28,'fd/89bb391d0f648362a84c695227543daa.jpeg'),
(29,'gr/95.png'),
(30,'gr/pr2/0e5.png'),
(31,'gr/pr3/c.jpeg'),
(32,'gr/pr4/95.jpeg'),
(33,'gr/pr5/2222.jpeg'),
(34,'gr/pr6/2222.jpeg'),
(35,'gr/pr7/77.jpeg'),
(36,'gr/pr8/5556.jpeg'),
(37,'kr/pr1/1.png'),
(38,'kr/pr2/2.jpeg'),
(53,'sd/pr1/3c90075478466458e0ee473998e7042d.jpeg'),
(39,'kr/pr3/3.jpeg'),
(40,'kr/pr4/4.jpeg'),
(41,'kr/pr5/5.png'),
(42,'kr/pr6/6.jpeg'),
(54,'sd/pr2/def1c863c1b6ee37908461b9c6be3a4d.jpeg'),
(55,'sd/pr3/fe2ade65f284130cf774da20434d3e45.jpeg'),
(43,'kr/pr7/7.jpeg'),
(44,'kr/pr8/8.jpeg'),
(45,'mk/pr1/d67172a435226ef0986cad475d3a23b0.jpeg'),
(46,'mk/pr2/1230204be17145ae703871636db64c7f.jpeg'),
(47,'mk/f301e4aebc8fd1882de42dc250382be9.jpeg'),
(48,'mk/pr4/9d1a713c1b89822ec65f8e5a0e05c95f.jpeg'),
(49,'mk/pr5/083f484dcd7bcb1e245e5f7f154057c9.jpeg'),
(50,'mk/pr6/5829d71d9f8fc438c14b82fd75e8855b.jpeg'),
(56,'sd/pr4/d86d310fb5bd83712abc058f562b5c73.jpeg'),
(57,'sd/cd2e38c25aba15204014c4abc3775ed7.jpeg'),
(58,'sd/pr6/85b9d3c10b49941bbe548c7a912a05dd.jpeg'),
(59,'sd/pr7/872a79a37ddf79b53c1ab2e2db34fd53.jpeg'),
(60,'sd/pr8/95181be6d9a5163bd70a530646668f71.jpeg'),
(61,'sh/4f0287ae.png'),
(62,'sh/pr2/d1d9da30.jpeg'),
(63,'sh/pr3/e3a.jpeg'),
(64,'sh/pr4/a5011.jpeg'),
(65,'sh/pr5/e91a3.jpeg'),
(66,'sh/pr6/333b67.jpeg'),
(86,'rasxod/pr2/7508b4cde5c138296d7b4fc93c22c993.jpeg'),
(67,'sh/pr7/0bc090.jpeg'),
(68,'sh/pr8/7c255d08826.jpeg'),
(69,'shtykatyrka/131c1e06a98a4d23b59c346247a3e4d1.jpeg'),
(70,'shtykatyrka/pr2/22225.png'),
(83,'cabels/pr7/9e9cd864069c1d0179efd9c767511ad2.jpeg'),
(71,'shtykatyrka/pr3/шт3.png'),
(72,'shtykatyrka/pr4/f5479fe3f8b5.jpeg'),
(73,'shtykatyrka/pr5/2ae5bb.jpeg'),
(74,'shtykatyrka/pr6/4e3e2dadc84.jpeg'),
(75,'shtykatyrka/pr7/47e0d.jpeg'),
(76,'shtykatyrka/pr8/f70ff8.jpeg'),
(77,'cabels/pr1/f08504b6e56a81c691630151102b0004.jpeg'),
(84,'cabels/pr8/46f1b0661a9eaa8861e91d7bba2aa4ad.jpeg'),
(78,'cabels/pr2/ff82546ece9042bdec4d37f379d8c8b6.jpeg'),
(79,'cabels/pr3/ea7bb3a8fc4d82eb0f65ccad43363531.jpeg'),
(80,'cabels/pr4/113b8d5a74b5ee051b6071878631175e.jpeg'),
(81,'cabels/pr5/e7c41ec81c71909ccfd3dff54514d9d2.jpeg'),
(82,'cabels/pr6/91f5ebf1bd2dfd3fd21254ce82a1c5a3.jpeg'),
(85,'rasxod/pr1/94c52be2bd42c5e43e8ab442102e5542.jpeg'),
(87,'rasxod/pr3/59b05612594ffb1012008a2773ba02de.jpeg'),
(88,'rasxod/pr4/ce9a23de95ed24f3a4d8e333fd1f129c.jpeg'),
(89,'rasxod/pr5/636b02a4185512d653b40dfe5b399d04.jpeg'),
(90,'rasxod/pr6/e2fbf2a6c6914fad157cd37f404df433.jpeg'),
(91,'rasxod/pr7/813107a82d8e1c38e2c218b829acc7dc.jpeg'),
(92,'rasxod/pr8/e5975b9372858f7575520ca9d843e650.jpeg');
-- /PRODUCT_IMAGE_URLS

-- SALES
INSERT INTO public.sales (id, begin_date, end_date, name) VALUES (15, now(), now() + '3 DAY', 'Распродажа краски');
-- /SALES

-- SALES PRODUCTS
INSERT INTO public.sale_products (id, discount_price, product_id, sale_id) VALUES (15, 32.00, 41, 15);
INSERT INTO public.sale_products (id, discount_price, product_id, sale_id) VALUES (16, 72.00, 42, 15);
INSERT INTO public.sale_products (id, discount_price, product_id, sale_id) VALUES (17, 32.00, 40, 15);
-- /SALES PRODUCTS

-- TAGS
INSERT INTO public.tags (id, name) VALUES (1, 'Краски');
INSERT INTO public.tags (id, name) VALUES (2, 'Лакокрасочные материалы');
-- /TAGS

-- PRODUCT_TAGS
INSERT INTO public.product_tag (product_id, tag_id) VALUES (37, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (41, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (42, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (43, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (44, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (64, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (38, 2);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (38, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (39, 2);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (39, 1);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (40, 2);
INSERT INTO public.product_tag (product_id, tag_id) VALUES (40, 1);
-- /PRODUCT_TAGS

-- CUSTOMERS
INSERT INTO public.customers (id, activation_code, created_on, email, enabled, firstname, lastname, password, phone) VALUES (15, null, '2019-12-13 17:29:48.427000', 'pi-ls@mail.ru', true, 'test', 'test', '$2a$10$OJTUydhmit/Fc3x4m92HT.h83XlEctgmG9vMCEcKg2jtTQQx1r3wu', 'test');
-- /CUSTOMERS

-- DELIVERY(ADDRESSES)
INSERT INTO public.addresses (id, address_line1, address_line2, city, country, state, zip_code)
VALUES
(15, 'test', 'test', 'test', 'test', 'test', 'test'),
(16, 'test', 'test', 'test', 'test', 'test', 'test');
-- /DELIVERY(ADDRESSES)

-- PAYMENTS
INSERT INTO public.payments (id, amount, cc_number, cvv) VALUES (15, 105.76, 'test', 'test');
-- /PAYMENTS

-- ORDER
INSERT INTO public.orders (id, created_on, order_number, status, billing_addr_id, cust_id, delivery_addr_id, payment_id) VALUES (15, now(), '1576322141351', 'NEW', 15, 15, 16, 15);
-- /ORDER

-- ORDER_ITEMS
INSERT INTO public.order_items (id, price, quantity, order_id, product_id) VALUES (15, 32.00, 1, 15, 41);
INSERT INTO public.order_items (id, price, quantity, order_id, product_id) VALUES (16, 3.76, 1, 15, 17);
INSERT INTO public.order_items (id, price, quantity, order_id, product_id) VALUES (17, 72.00, 1, 15, 42);
-- /ORDER_ITEMS

-- ORDER_ITEMS
INSERT INTO public.subscribers (email, remove_code, subscribed_on) VALUES ('pi-ls@mail.ru', 'abcdsaw', now());
-- /ORDER_ITEMS

-- POSTS
INSERT INTO public.posts (id, content, created_on, description, img_title, title) VALUES (15, '<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/VRZVQVUO4PU" width="640"></iframe></p>
', '2019-12-18 04:01:33.000000', 'Fork from https://javascript.info/bind', 'user6-128x128.jpg', 'Title');
-- /POSTS

-- SEQUENCE
ALTER SEQUENCE addresses_id_seq RESTART WITH 17;
ALTER SEQUENCE categories_id_seq RESTART WITH 30;
ALTER SEQUENCE customers_id_seq RESTART WITH 15;
ALTER SEQUENCE order_items_id_seq RESTART WITH 18;
ALTER SEQUENCE orders_id_seq RESTART WITH 16;
ALTER SEQUENCE payments_id_seq RESTART WITH 16;
ALTER SEQUENCE permissions_id_seq RESTART WITH 13;
ALTER SEQUENCE products_id_seq RESTART WITH 93;
ALTER SEQUENCE roles_id_seq RESTART WITH 5;
ALTER SEQUENCE tags_id_seq RESTART WITH 15;
ALTER SEQUENCE units_id_seq RESTART WITH 18;
ALTER SEQUENCE users_id_seq RESTART WITH 2;
ALTER SEQUENCE producers_id_seq RESTART WITH 26;
ALTER SEQUENCE posts_id_seq RESTART WITH 16;
ALTER SEQUENCE promotions_id_seq RESTART WITH 15;
ALTER SEQUENCE sales_id_seq RESTART WITH 16;
ALTER SEQUENCE sale_products_id_seq RESTART WITH 18;
-- /SEQUENCE