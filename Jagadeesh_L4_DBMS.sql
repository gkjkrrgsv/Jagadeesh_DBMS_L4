Create Database if not exists `order-directory` ;
use `order-directory`;

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);



INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `order` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO `rating` VALUES(1,101,4);
INSERT INTO `rating` VALUES(2,102,3);
INSERT INTO `rating` VALUES(3,103,1);
INSERT INTO `rating` VALUES(4,104,2);
INSERT INTO `rating` VALUES(5,105,4);
INSERT INTO `rating` VALUES(6,106,3);
INSERT INTO `rating` VALUES(7,107,4);
INSERT INTO `rating` VALUES(8,108,4);
INSERT INTO `rating` VALUES(9,109,3);
INSERT INTO `rating` VALUES(10,110,5);
INSERT INTO `rating` VALUES(11,111,3);
INSERT INTO `rating` VALUES(12,112,4);
INSERT INTO `rating` VALUES(13,113,2);
INSERT INTO `rating` VALUES(14,114,1);
INSERT INTO `rating` VALUES(15,115,1);
INSERT INTO `rating` VALUES(16,116,0);


-- Q4. - Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

SELECT
    C.CUS_GENDER,
    COUNT(DISTINCT O.CUS_ID) AS TOTAL_CUSTOMERS
FROM
    customer C
    JOIN `order` O ON C.CUS_ID = O.CUS_ID
WHERE
    O.ORD_AMOUNT >= 3000
GROUP BY
    C.CUS_GENDER;

//Q5
SELECT
    O.ORD_ID,
    P.PRO_NAME,
    O.ORD_AMOUNT,
    O.ORD_DATE
FROM
    `order` O
    JOIN supplier_pricing SP ON O.PRICING_ID = SP.PRICING_ID
    JOIN product P ON SP.PRO_ID = P.PRO_ID
WHERE
    O.CUS_ID = 2;

-- Q6 Display the Supplier details who can supply more than one product

SELECT
    S.*
FROM
    supplier S
WHERE
    S.SUPP_ID IN (
        SELECT
            SP.SUPP_ID
        FROM
            supplier_pricing SP
        GROUP BY
            SP.SUPP_ID
        HAVING
            COUNT(DISTINCT SP.PRO_ID) > 1
    );

-- Q7 Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT
    C.CAT_ID,
    C.CAT_NAME,
    P.PRO_NAME,
    SP.SUPP_PRICE
FROM
    category C
    JOIN product P ON C.CAT_ID = P.CAT_ID
    JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
WHERE
    SP.SUPP_PRICE = (
        SELECT
            MIN(SUPP_PRICE)
        FROM
            supplier_pricing SP2
        WHERE
            SP2.PRO_ID = P.PRO_ID
    );


-- Q8 Display the Id and Name of the Product ordered after “2021-10-05”
SELECT
    P.PRO_ID,
    P.PRO_NAME,
    O.ORD_DATE
FROM
    product P
    JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
    JOIN `order` O ON SP.PRICING_ID = O.PRICING_ID
WHERE
    O.ORD_DATE > '2021-10-05';


-- Q9 Display customer name and gender whose names start or end with character 'A'

SELECT
    C.CUS_NAME,
    C.CUS_GENDER
FROM
    customer C
WHERE
    C.CUS_NAME LIKE 'A%' OR C.CUS_NAME LIKE '%A';

-- Q10 Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
-- Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
-- Service” else print “Poor Service”. Note that there should be one rating per supplier.

CREATE DEFINER=`root`@`localhost` PROCEDURE `rating_proc`()
BEGIN
    SELECT
        report.supp_id,
        report.supp_name,
        report.Average,
        CASE
            WHEN report.Average = 5 THEN 'Excellent Service'
            WHEN report.Average > 4 THEN 'Good Service'
            WHEN report.Average > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM (
        SELECT
            final.supp_id,
            supplier.supp_name,
            final.Average
        FROM (
            SELECT
                test2.supp_id,
                SUM(test2.rat_ratstars) / COUNT(test2.rat_ratstars) AS Average
            FROM (
                SELECT
                    supplier_pricing.supp_id,
                    test.ORD_ID,
                    test.RAT_RATSTARS
                FROM supplier_pricing
                INNER JOIN (
                    SELECT
                        `order`.pricing_id,
                        rating.ORD_ID,
                        rating.RAT_RATSTARS
                    FROM `order`
                    INNER JOIN rating ON rating.`ord_id` = `order`.ord_id
                ) AS test ON test.pricing_id = supplier_pricing.pricing_id
            ) AS test2
            GROUP BY test2.supp_id
        ) AS final
        INNER JOIN supplier ON final.supp_id = supplier.supp_id
    ) AS report
END;

