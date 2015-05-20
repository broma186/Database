

DROP TABLE containing;
DROP TABLE product;
DROP TABLE shopping_list;
DROP TABLE customer;
DROP TABLE employee cascade constraints;
DROP TABLE department cascade constraints;




CREATE TABLE department
       (dnumber         INT          PRIMARY KEY,
        dname           VARCHAR2(15) NOT NULL UNIQUE,
        dcontact_number CHAR(9)     NOT NULL UNIQUE,
        number_of_employees INT      NOT NULL,
        mgrssn          CHAR(9)      NOT NULL,
        mgrstartdate    DATE);


INSERT INTO department VALUES
        (1,'Produce','112392348', 0,'123456789', TO_DATE('22-05-1988','DD-MM-YYYY'));
INSERT INTO department VALUES
        (2,'Butchery','124356779', 0,'987654321', TO_DATE('01-01-1995','DD-MM-YYYY'));
INSERT INTO department VALUES
        (3,'Grocery','138556110', 0,'888665555', TO_DATE('19-06-1981','DD-MM-YYYY'));
INSERT INTO department VALUES
        (4,'Chilled Foods','148224661', 0,'111100000', TO_DATE('31-12-2004','DD-MM-YYYY'));
INSERT INTO department VALUES
        (5,'Liquor','158545766', 0,'158345766', TO_DATE('31-12-2004','DD-MM-YYYY'));




CREATE TABLE employee
        (ssn      CHAR(9)       PRIMARY KEY,
        fname    VARCHAR2(10)  NOT NULL,
        minit    CHAR,
        lname    VARCHAR2(20)  NOT NULL,
        bdate    DATE,
        area  VARCHAR2(20),
        sex      CHAR,
        salary   NUMBER(6),
        hours    NUMBER(2),
        superssn CHAR(9)
        CONSTRAINT superssn_cnst REFERENCES employee(ssn) DISABLE,      
        dno      INT           NOT NULL
        CONSTRAINT dno_cnst REFERENCES department(dnumber) DISABLE);

ALTER TABLE employee ENABLE CONSTRAINT dno_cnst;




        INSERT INTO employee VALUES
        ('123456789','Tim','L','Jones',TO_DATE('24-10-1992','DD-MM-YYYY'),
        'Mornington','M',45000, 40, NULL, 1);
        INSERT INTO employee VALUES
        ('987688888','Rose','F','Petersond',TO_DATE('05-05-1989','DD-MM-YYYY'),
        'Maori Hill','F', 10000, 15,'123456789', 1);        
        INSERT INTO employee VALUES
        ('333445555','Earl','V','Vonstrozzenburger',TO_DATE('16-09-1977','DD-MM-YYYY'),
        'North Dunedin','M',35000, 40,'123456789', 1);
        INSERT INTO employee VALUES
        ('987654321','Pete','G','Mcgee',TO_DATE('20-09-1965','DD-MM-YYYY'),
        'South Dunedin','M',45000, 40, NULL,2);
        INSERT INTO employee VALUES
        ('223691415','Doug','M','Glatt',TO_DATE('03-04-1983','DD-MM-YYYY'),
        'North Dunedin','M',35000, 40, '987654321',2);
        INSERT INTO employee VALUES
        ('239715567','Katie','S','Margaret',TO_DATE('01-07-1995','DD-MM-YYYY'),
        'North Dunedin','F',13000, 20,'987654321', 2);
        INSERT INTO employee VALUES
        ('888665555','Tom','C','Johnson',TO_DATE('02-06-1991','DD-MM-YYYY'),
        'Roslyn','M',45000, 40, NULL,3);
        INSERT INTO employee VALUES
        ('303012889','Jessica','B','Stevens',TO_DATE('19-11-1998','DD-MM-YYYY'),
        'North East Valley','F', 9000, 12,'888665555', 3);
        INSERT INTO employee VALUES
        ('887722669','Sophie','R','Smith',TO_DATE('05-06-1991','DD-MM-YYYY'),
        'Pine Hill','F', 9000, 40,'888665555',3);
        INSERT INTO employee VALUES
        ('111100000','James','F','Marshall',TO_DATE('03-07-1994','DD-MM-YYYY'),
        'South Dunedin','M',45000, 40, NULL,4);
        INSERT INTO employee VALUES
        ('999887777','Alicia','J','Zelaya',TO_DATE('19-07-1968','DD-MM-YYYY'),
        'Caversham','M',25000, 40, '111100000',4);
        INSERT INTO employee VALUES
        ('666884444','Ramesh','K','Narayan',TO_DATE('15-09-1962','DD-MM-YYYY'),
        'Mornington','M', 35000, 40,'111100000',4);
        INSERT INTO employee VALUES
        ('158345766','Joyce','A','English',TO_DATE('31-07-1972','DD-MM-YYYY'),
        'Central Dunedin','M',35000,40,NULL,5);
        INSERT INTO employee VALUES
        ('453453453','Ahmad','V','Jabbar',TO_DATE('29-03-1969','DD-MM-YYYY'),
        'Central Dunedin','M',35000,40,'158345766',5);
        INSERT INTO employee VALUES
        ('992134455','James','E','Irnbru',TO_DATE('10-11-1937','DD-MM-YYYY'),
        'Central Dunedin','M',35000,40,'158345766',5);

ALTER TABLE employee ENABLE CONSTRAINT superssn_cnst;



CREATE TABLE customer
        (ssn             CHAR(9) PRIMARY KEY,
         fname           VARCHAR2(10) NOT NULL,
         minit           CHAR,
         lname           VARCHAR2(20) NOT NULL,
         ccontact_number CHAR(10) NOT NULL UNIQUE,
         area            VARCHAR2(20),
         sex             CHAR);

         
         INSERT INTO customer VALUES ('345876567','Rupert','P','Princeton','0271815678',
                'Roslyn','M');
         INSERT INTO customer VALUES ('119982732','John','R','Bert','0275642231',
                'North Dunedin','M');  
         INSERT INTO customer VALUES ('453428890','Joanne','G','Rutherford','0224351677',
                'South Dunedin','F');
         INSERT INTO customer VALUES ('556674390','Sarah','L', 'Edwards', '0221556783',
                'Mornington', 'F');
       
   
CREATE TABLE shopping_list
       (shopping_date DATE  PRIMARY KEY,
        num_products  CHAR(12),
        ssn           CHAR(9)   NOT NULL REFERENCES customer(ssn) ON DELETE SET NULL);

        INSERT INTO shopping_list VALUES
        (TO_DATE('16-05-2014, 5:34 P.M.', 'DD-MM-YYYY, HH:MI P.M.'),4,'345876567');

        INSERT INTO shopping_list VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'),8,'345876567');

        INSERT INTO shopping_list VALUES
        (TO_DATE('14-06-2014, 7:10 A.M.', 'DD-MM-YYYY, HH:MI A.M.'),3,'119982732');

        INSERT INTO shopping_list VALUES
        (TO_DATE('2-07-2014, 12:39 P.M.', 'DD-MM-YYYY, HH:MI A.M.'),2,'453428890');

        INSERT INTO shopping_list VALUES
        (TO_DATE('22-08-2014, 3.35 P.M.', 'DD-MM-YYYY, HH:MI A.M.'),5,'556674390');



 CREATE TABLE product
        (productid      CHAR(4)       PRIMARY KEY,
         product_name   VARCHAR(20)   NOT NULL,
         price          NUMBER(8, 2),
         dno            INT           NOT NULL REFERENCES department(dnumber) ON DELETE CASCADE);  

        INSERT INTO product VALUES(1000, 'Flyspray', 7.50, 3);
        INSERT INTO product VALUES(1001, 'Chocolate Cake', 5.30, 3);
        INSERT INTO product VALUES(1002, 'Frozen Pizza', 8.50, 4);
        INSERT INTO product VALUES(1003, '6 Pack Beer', 14.00, 5);
        INSERT INTO product VALUES(1004, 'Avocado', 2.00, 1);
        INSERT INTO product VALUES(1005, 'Stawberries 1kg', 6.99, 1);
        INSERT INTO product VALUES(1006, 'Lettuce', 3.49, 1);
        INSERT INTO product VALUES(1007, 'Carrots 1kg', 5.99, 1);
        INSERT INTO product VALUES(1008, 'Chicken Breasts', 13.99, 2);
        INSERT INTO product VALUES(1009, 'Rump Steak', 5.99, 2);
        INSERT INTO product VALUES(1010, 'Pork Sausages 1kg', 9.99, 2);
        INSERT INTO product VALUES(1011, 'Ice Cream', 3.29, 4);
        INSERT INTO product VALUES(1012, 'Hash Browns', 8.50, 4);
        INSERT INTO product VALUES(1013, 'Noodles', 3.50, 3);
        INSERT INTO product VALUES(1014, 'Spagetti', 2.99, 3);
        INSERT INTO product VALUES(1015, 'Beef Jerkey', 4.50, 3);
        INSERT INTO product VALUES(1016, 'Tortillas', 4.99, 3);
        INSERT INTO product VALUES(1017, 'Tomato Sauce', 3.49, 3);
        INSERT INTO product VALUES(1018, 'Ajax Spray and Wipe', 4.00, 3);
        INSERT INTO product VALUES(1019, 'Nutella', 5.30, 3);
        INSERT INTO product VALUES(1020, 'Olive Oil', 4.49, 3);
        INSERT INTO product VALUES(1021, 'Butter', 5.99, 4);
        INSERT INTO product VALUES(1022, 'Yogurt', 4.99, 4);
        INSERT INTO product VALUES(1023, 'Bread', 2.99, 3);
        INSERT INTO product VALUES(1024, 'Cookies', 4.50, 3);
        INSERT INTO product VALUES(1025, 'Doughnut', 3.50, 3);
        INSERT INTO product VALUES(1026, 'Pasta Sauce', 3.00, 3);
        INSERT INTO product VALUES(1027, 'Tea Towels', 2.89, 3);
        INSERT INTO product VALUES(1028, 'Dish Cloth', 2.00, 3);
        INSERT INTO product VALUES(1029, 'Container', 5.50, 3);
        INSERT INTO product VALUES(1030, 'Coke 1.5l', 1.80, 3);

        
        

CREATE TABLE containing
       (shopping_date DATE     REFERENCES shopping_list(shopping_date) ON DELETE CASCADE,
        productid     CHAR(4)  REFERENCES product(productid) ON DELETE CASCADE,
        quantity      INT      NOT NULL,
        PRIMARY KEY(shopping_date, productid));

        INSERT INTO containing VALUES
        (TO_DATE('16-05-2014, 5:34 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1016, 1);

        INSERT INTO containing VALUES
        (TO_DATE('16-05-2014, 5:34 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1008, 1);

        INSERT INTO containing VALUES
        (TO_DATE('16-05-2014, 5:34 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1004, 2);

        
        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1000, 1);
        
        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1007, 1);

        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1017, 1);

        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1018, 1);

        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1029, 2);

        INSERT INTO containing VALUES
        (TO_DATE('20-05-2014, 10:54 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1030, 2);


        INSERT INTO containing VALUES
        (TO_DATE('14-06-2014, 7:10 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1024, 1);

        INSERT INTO containing VALUES
        (TO_DATE('14-06-2014, 7:10 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1025, 1);

        INSERT INTO containing VALUES
        (TO_DATE('14-06-2014, 7:10 A.M.', 'DD-MM-YYYY, HH:MI A.M.'), 1030, 1);
        

        INSERT INTO containing VALUES
        (TO_DATE('2-07-2014, 12:39 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1012, 2);


        INSERT INTO containing VALUES
        (TO_DATE('22-08-2014, 3:35 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1019, 1);

        INSERT INTO containing VALUES
        (TO_DATE('22-08-2014, 3:35 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1027, 1);

        INSERT INTO containing VALUES
        (TO_DATE('22-08-2014, 3:35 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1011, 1);

        INSERT INTO containing VALUES
        (TO_DATE('22-08-2014, 3:35 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1006, 1);

        INSERT INTO containing VALUES
        (TO_DATE('22-08-2014, 3:35 P.M.', 'DD-MM-YYYY, HH:MI P.M.'), 1003, 1);




COMMIT;        

      
        

        
       


        
        
