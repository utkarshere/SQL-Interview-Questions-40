/* Airbnb
Find the total number of available beds per hosts' nationality.
Output the nationality along with the corresponding total number of available beds. Sort records by the total available beds in descending order.
*/

CREATE TABLE airbnb_apartments(host_id int,apartment_id varchar(5),apartment_type varchar(10),n_beds int,n_bedrooms int,country varchar(20),city varchar(20));
INSERT INTO airbnb_apartments VALUES
(0,'A1','Room',1,1,'USA','NewYork'),
(0,'A2','Room',1,1,'USA','NewJersey'),
(0,'A3','Room',1,1,'USA','NewJersey'),
(1,'A4','Apartment',2,1,'USA','Houston'),
(1,'A5','Apartment',2,1,'USA','LasVegas'),
(3,'A7','Penthouse',3,3,'China','Tianjin'),
(3,'A8','Penthouse',5,5,'China','Beijing'),
(4,'A9','Apartment',2,1,'Mali','Bamako'),
(5,'A10','Room',3,1,'Mali','Segou');

CREATE TABLE airbnb_hosts(host_id int,nationality  varchar(15),gender varchar(5),age int);
INSERT INTO airbnb_hosts VALUES
(0,'USA','M',28),
(1,'USA','F',29),
(2,'China','F',31),
(3,'China','M',24),
(4,'Mali','M',30),
(5,'Mali','F',30);
	
SELECT *
FROM airbnb_apartments;

SELECT *
FROM airbnb_hosts
