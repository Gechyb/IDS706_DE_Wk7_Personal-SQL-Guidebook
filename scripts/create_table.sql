/*
  Name: Sample Database classicmodels
  Link: http://www.mysqltutorial.org/mysql-sample-database.aspx
*/

/* Create the database in terminal: */
-- sqlite3 classicmodels.db

/* Drop existing tables  */
DROP TABLE IF EXISTS productlines;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS offices;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers; 
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderdetails;

/* Create the tables */
/* Product Lines */
CREATE TABLE productlines (
  productLine TEXT PRIMARY KEY,
  textDescription TEXT,
  htmlDescription TEXT,
  image BLOB
);

/* Products */
CREATE TABLE products (
  productCode TEXT PRIMARY KEY,
  productName TEXT NOT NULL,
  productLine TEXT NOT NULL,
  productScale TEXT NOT NULL,
  productVendor TEXT NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock INTEGER NOT NULL,
  buyPrice REAL NOT NULL,
  MSRP REAL NOT NULL,
  FOREIGN KEY (productLine) REFERENCES productlines (productLine)
);

/* Offices */
CREATE TABLE offices (
  officeCode TEXT PRIMARY KEY,
  city TEXT NOT NULL,
  phone TEXT NOT NULL,
  addressLine1 TEXT NOT NULL,
  addressLine2 TEXT,
  state TEXT,
  country TEXT NOT NULL,
  postalCode TEXT NOT NULL,
  territory TEXT NOT NULL
);

/* Employees */
CREATE TABLE employees (
  employeeNumber INTEGER PRIMARY KEY,
  lastName TEXT NOT NULL,
  firstName TEXT NOT NULL,
  extension TEXT NOT NULL,
  email TEXT NOT NULL,
  officeCode TEXT NOT NULL,
  reportsTo INTEGER,
  jobTitle TEXT NOT NULL,
  FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber),
  FOREIGN KEY (officeCode) REFERENCES offices (officeCode)
);

/* Customers */
CREATE TABLE customers (
  customerNumber INTEGER PRIMARY KEY,
  customerName TEXT NOT NULL,
  contactLastName TEXT NOT NULL,
  contactFirstName TEXT NOT NULL,
  phone TEXT NOT NULL,
  addressLine1 TEXT NOT NULL,
  addressLine2 TEXT,
  city TEXT NOT NULL,
  state TEXT,
  postalCode TEXT,
  country TEXT NOT NULL,
  salesRepEmployeeNumber INTEGER,
  creditLimit REAL,
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)
);

/* Payments */
CREATE TABLE payments (
  customerNumber INTEGER,
  checkNumber TEXT NOT NULL,
  paymentDate TEXT NOT NULL,   -- store as ISO8601 string YYYY-MM-DD
  amount REAL NOT NULL,
  PRIMARY KEY (customerNumber, checkNumber),
  FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);

/* Orders */
CREATE TABLE orders (
  orderNumber INTEGER PRIMARY KEY,
  orderDate TEXT NOT NULL,
  requiredDate TEXT NOT NULL,
  shippedDate TEXT,
  status TEXT NOT NULL,
  comments TEXT,
  customerNumber INTEGER NOT NULL,
  FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
);

/* Order Details */
CREATE TABLE orderdetails (
  orderNumber INTEGER,
  productCode TEXT NOT NULL,
  quantityOrdered INTEGER NOT NULL,
  priceEach REAL NOT NULL,
  orderLineNumber INTEGER NOT NULL,
  PRIMARY KEY (orderNumber, productCode),
  FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
  FOREIGN KEY (productCode) REFERENCES products (productCode)
);

/* Inserting data  */
INSERT INTO productlines (productLine, textDescription, htmlDescription, image) VALUES
('Classic Cars','Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL),
('Motorcycles','Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.',NULL,NULL),
('Planes','Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.',NULL,NULL),
('Ships','The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.',NULL,NULL),
('Trains','Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.',NULL,NULL),
('Trucks and Buses','The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.',NULL,NULL),
('Vintage Cars','Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL);

INSERT INTO products (
  productCode, productName, productLine, productScale, productVendor,
  productDescription, quantityInStock, buyPrice, MSRP
) VALUES
('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast',
 'Replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. Delicate due to precise scale.',
 7933, 48.81, 95.70),

('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations',
 'Turnable wheels, steering, detailed interior and engine, opening hood, trunk, and doors.',
 7305, 98.58, 214.30),

('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics',
 'Moto Guzzi logos, saddle bags, steering, suspension, dual exhaust, two-tone paint with chrome.',
 6625, 68.99, 118.94),

('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast',
 'Harley logos, detachable rear wheelie bar, authentic graphics, rotating tires, detailed v-twin engine.',
 5582, 91.02, 193.66),

('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics',
 'Turnable wheels, steering, interior, detailed engine, opening hood, trunk, doors.',
 3252, 85.68, 136.00),

('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design',
 'Hood, doors, trunk open to reveal detailed interior. Steering wheel turns wheels.',
 68, 95.34, 194.57),

('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions',
 '30 windows, skylights, working steering system, original logos.',
 1579, 77.90, 136.67),

('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries',
 'Official logos, chrome accents, leather seats, dual exhaust, rotating wheels, baked enamel finish.',
 9997, 66.27, 150.62),

('S12_3380','1968 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions',
 'Detailed interior and exterior, opening hood, trunk, doors. Color black.',
 9123, 75.16, 117.44),

('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Studio M Art Models',
 'Detailed 1970 Plymouth Cuda model. Accepted as one of the fastest 1970s muscle cars.',
 5663, 31.92, 79.80),

('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics',
 'Opening hood, trunk, detailed engine, spoiler, tinted windows, baked enamel finish.',
 3975, 83.51, 141.54),

('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics',
 'Opening engine cover, trunk, doors, fuel filler cap. Color black.',
 8693, 60.62, 102.74),

('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','Red Start Diecast',
 'Replica of UH-60L Black Hawk Helicopter. Rotating rotor blades and wheels.',
 5330, 77.27, 157.69),

('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','Welly Diecast Productions',
 '1:18 replica with opening doors, hood, detailed engine, tufted upholstery.',
 2724, 86.70, 170.00),

('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','1:18','Autoart Studio Design',
 'Grille-mounted chrome horn, louvered hood, fold-down rumble seat, chrome spare, wired engine.',
 9354, 58.48, 127.13),

('S18_2581','P-51-D Mustang','Planes','1:72','Gearbox Collectibles',
 'Diecast model airplane with retractable wheels and display stand.',
 992, 49.00, 84.48),

('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','1:18','Welly Diecast Productions',
 'Detailed with chrome accents, logos, baked enamel finish.',
 4357, 24.23, 60.57),

('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','1:18','Red Start Diecast',
 'Opening and closing doors, color red, Indy 500 edition.',
 8164, 56.76, 132.00),

('S18_3029','1999 Yamaha Speed Boat','Ships','1:18','Min Lin Diecast',
 'Replica with wood and metal parts, rigging, pilot house, anchors, three masts.',
 4259, 51.61, 86.02),

('S18_3259','Collectable Wooden Train','Trains','1:18','Carousel DieCast Legends',
 'Handcrafted wooden train set with two additional carts, fully assembled.',
 6450, 67.56, 100.84);


INSERT INTO offices (
  officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory
) VALUES
('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),
('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA'),
('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),
('4','Paris','+33 14 723 4404','43 Rue Jouffroy D''abbans',NULL,NULL,'France','75017','EMEA'),
('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan'),
('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2',NULL,'Australia','NSW 2010','APAC'),
('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA');

INSERT INTO employees (
  employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle
) VALUES
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing'),
(1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com','6',1056,'Sales Manager (APAC)'),
(1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com','4',1056,'Sale Manager (EMEA)'),
(1143,'Bow','Anthony','x5428','abow@classicmodelcars.com','1',1056,'Sales Manager (NA)'),
(1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com','1',1143,'Sales Rep'),
(1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com','1',1143,'Sales Rep'),
(1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','2',1143,'Sales Rep'),
(1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com','2',1143,'Sales Rep'),
(1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','3',1143,'Sales Rep'),
(1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com','3',1143,'Sales Rep'),
(1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com','4',1102,'Sales Rep'),
(1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','4',1102,'Sales Rep'),
(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4',1102,'Sales Rep'),
(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','7',1102,'Sales Rep'),
(1504,'Jones','Barry','x102','bjones@classicmodelcars.com','7',1102,'Sales Rep'),
(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','6',1088,'Sales Rep'),
(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','6',1088,'Sales Rep'),
(1619,'King','Tom','x103','tking@classicmodelcars.com','6',1088,'Sales Rep'),
(1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com','5',1056,'Sales Rep'),
(1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com','5',1621,'Sales Rep'),
(1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com','4',1102,'Sales Rep');

INSERT INTO customers (
  customerNumber, customerName, contactLastName, contactFirstName,
  phone, addressLine1, addressLine2, city, state, postalCode,
  country, salesRepEmployeeNumber, creditLimit
) VALUES
(103,'Atelier graphique','Schmitt','Carine','40.32.2555','54, rue Royale',NULL,'Nantes',NULL,'44000','France',1370,21000.00),
(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,71800.00),
(114,'Australian Collectors, Co.','Ferguson','Peter','03 9520 4555','636 St Kilda Road','Level 3','Melbourne','Victoria','3004','Australia',1611,117300.00),
(119,'La Rochelle Gifts','Labrune','Janine','40.67.8555','67, rue des Cinquante Otages',NULL,'Nantes',NULL,'44000','France',1370,118200.00),
(121,'Baane Mini Imports','Bergulfsen','Jonas','07-98 9555','Erling Skakkes gate 78',NULL,'Stavern',NULL,'4110','Norway',1504,81700.00),
(124,'Mini Gifts Distributors Ltd.','Nelson','Susan','4155551450','5677 Strong St.',NULL,'San Rafael','CA','97562','USA',1165,210500.00),
(125,'Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek','(26) 642-7555','ul. Filtrowa 68',NULL,'Warszawa',NULL,'01-012','Poland',NULL,0.00),
(128,'Blauer See Auto, Co.','Keitel','Roland','+49 69 66 90 2555','Lyonerstr. 34',NULL,'Frankfurt',NULL,'60528','Germany',1504,59700.00),
(129,'Mini Wheels Co.','Murphy','Julie','6505555787','5557 North Pendale Street',NULL,'San Francisco','CA','94217','USA',1165,64600.00),
(131,'Land of Toys Inc.','Lee','Kwai','2125557818','897 Long Airport Avenue',NULL,'NYC','NY','10022','USA',1323,114900.00),
(141,'Euro+ Shopping Channel','Freyre','Diego','(91) 555 94 44','C/ Moralzarzal, 86',NULL,'Madrid',NULL,'28034','Spain',1370,227600.00),
(144,'Volvo Model Replicas, Co','Berglund','Christina','0921-12 3555','Berguvsvägen 8',NULL,'Luleå',NULL,'S-958 22','Sweden',1504,53100.00),
(145,'Danish Wholesale Imports','Petersen','Jytte','31 12 3555','Vinbæltet 34',NULL,'Kobenhavn',NULL,'1734','Denmark',1401,83400.00),
(146,'Saveley & Henriot, Co.','Saveley','Mary','78.32.5555','2, rue du Commerce',NULL,'Lyon',NULL,'69004','France',1337,123900.00),
(148,'Dragon Souveniers, Ltd.','Natividad','Eric','+65 221 7555','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore',NULL,'079903','Singapore',1621,103800.00),
(151,'Muscle Machine Inc','Young','Jeff','2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA',1286,138500.00),
(157,'Diecast Classics Inc.','Leong','Kelvin','2155551555','7586 Pompton St.',NULL,'Allentown','PA','70267','USA',1216,100600.00),
(161,'Technics Stores Inc.','Hashimoto','Juri','6505556809','9408 Furth Circle',NULL,'Burlingame','CA','94217','USA',1165,84600.00),
(166,'Handji Gifts& Co','Victorino','Wendy','+65 224 1555','106 Linden Road Sandown','2nd Floor','Singapore',NULL,'069045','Singapore',1612,97900.00),
(167,'Herkku Gifts','Oeztan','Veysel','+47 2267 3215','Brehmen St. 121','PR 334 Sentrum','Bergen',NULL,'N 5804','Norway',1504,96800.00);

INSERT INTO orders (
  orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber
) VALUES
(10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363),
(10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128),
(10102,'2003-01-10','2003-01-18','2003-01-14','Shipped',NULL,181),
(10103,'2003-01-29','2003-02-07','2003-02-02','Shipped',NULL,121),
(10104,'2003-01-31','2003-02-09','2003-02-01','Shipped',NULL,141),
(10105,'2003-02-11','2003-02-21','2003-02-12','Shipped',NULL,145),
(10106,'2003-02-17','2003-02-24','2003-02-21','Shipped',NULL,278),
(10107,'2003-02-24','2003-03-03','2003-02-26','Shipped','Difficult to negotiate with customer. We need more marketing materials',131),
(10108,'2003-03-03','2003-03-12','2003-03-08','Shipped',NULL,385),
(10109,'2003-03-10','2003-03-19','2003-03-11','Shipped','Customer requested that FedEx Ground is used for this shipping',486),
(10110,'2003-03-18','2003-03-24','2003-03-20','Shipped',NULL,187),
(10111,'2003-03-25','2003-03-31','2003-03-30','Shipped',NULL,129),
(10112,'2003-03-24','2003-04-03','2003-03-29','Shipped','Customer requested that ad materials be included in the shipment',144),
(10113,'2003-03-26','2003-04-02','2003-03-27','Shipped',NULL,124),
(10114,'2003-04-01','2003-04-07','2003-04-02','Shipped',NULL,172),
(10115,'2003-04-04','2003-04-12','2003-04-07','Shipped',NULL,424),
(10116,'2003-04-11','2003-04-19','2003-04-13','Shipped',NULL,381),
(10117,'2003-04-16','2003-04-24','2003-04-17','Cancelled','Customer called to cancel. The warehouse was notified in time.',148),
(10118,'2003-04-21','2003-04-29','2003-04-26','Resolved','This order was disputed, but resolved. Customer didn''t like the colors.',216),
(10119,'2003-04-28','2003-05-05','2003-05-02','On Hold','Credit limit exceeded. Order will ship when payment is received.',382);

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
(103,'HQ336336','2004-10-19',6066.78),
(103,'JM555205','2003-06-05',14571.44),
(112,'BO864823','2004-12-17',14191.12),
(112,'HQ55022','2003-06-06',32641.98),
(114,'GG31455','2003-05-20',45864.03),
(114,'MA765515','2004-12-15',82261.22),
(119,'DB933704','2004-11-14',19501.82),
(119,'LN373447','2004-08-08',47924.19),
(121,'DB889831','2003-02-16',50218.95),
(121,'KI831359','2004-11-04',17876.32),
(124,'AE215433','2005-03-05',101244.59),
(124,'LF217299','2004-03-26',43369.30),
(128,'DI925118','2003-01-28',10549.01),
(128,'FH668230','2004-03-24',33820.62),
(129,'DM826140','2004-12-08',26248.78),
(131,'MA724562','2004-12-02',50025.35),
(141,'HJ32686','2004-01-30',59830.55),
(141,'ID10962','2004-12-31',116208.40),
(144,'IR846303','2004-12-12',36005.71),
(145,'JJ246391','2003-02-20',53959.21);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) VALUES
(10100, 'S10_1678', 30, 95.70, 1),
(10100, 'S10_2016', 50, 81.35, 2),

(10101, 'S10_4698', 22, 195.00, 1),
(10101, 'S12_1099', 15, 187.55, 2),

(10102, 'S12_1108', 40, 136.00, 1),

(10103, 'S12_2823', 25, 99.45, 1),
(10103, 'S12_3990', 18, 175.00, 2),

(10104, 'S18_1097', 20, 105.00, 1),

(10105, 'S18_1749', 36, 155.00, 1),

(10106, 'S18_2248', 28, 120.00, 1),
(10106, 'S18_2319', 12, 140.00, 2),

(10107, 'S18_3232', 30, 85.00, 1),

(10108, 'S18_4409', 45, 75.50, 1),

(10109, 'S24_1628', 60, 112.50, 1),

(10110, 'S24_1937', 48, 64.00, 1),

(10111, 'S24_2022', 32, 98.00, 1),

(10112, 'S24_2766', 18, 142.00, 1),

(10113, 'S24_2887', 40, 75.25, 1),
(10113, 'S24_3191', 25, 105.00, 2);

